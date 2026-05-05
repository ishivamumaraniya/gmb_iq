import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../../core/constants/api_constants.dart';
import '../../../../core/storage/hive_setup.dart';
import '../repository/auth_repository.dart';
import '../views/scan_and_found/found_accounts/found_accounts_state.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository;

  AuthCubit({required AuthRepository authRepository})
    : _authRepository = authRepository,
      super(const AuthState()) {
    _initialize();
  }

  static bool _isInitialized = false;

  void _initialize() {
    if (_isInitialized) return;

    final signIn = GoogleSignIn.instance;
    signIn.initialize(clientId: ApiConstants.googleClientId);

    signIn.authenticationEvents.listen((GoogleSignInAuthenticationEvent event) {
      if (event is GoogleSignInAuthenticationEventSignIn) {
        if (event.user != null) {
          _handleSignInSuccess(event.user!);
        }
      }
    });

    _isInitialized = true;
  }

  Future<void> _handleSignInSuccess(GoogleSignInAccount googleUser) async {
    emit(state.copyWith(status: AuthStatus.loading));
    try {
      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final String? token = googleAuth.idToken;

      if (token == null) {
        emit(
          state.copyWith(
            status: AuthStatus.failure,
            error: 'Failed to retrieve authentication token',
          ),
        );
        return;
      }

      final String deviceId = HiveSetup.deviceId;
      final response = await _authRepository.loginWithGoogle(
        token: token,
        deviceId: deviceId,
      );

      if (response != null) {
        emit(
          state.copyWith(
            status: AuthStatus.success,
            step: AuthStep.scanning,
            data: response,
          ),
        );
      } else {
        emit(
          state.copyWith(
            status: AuthStatus.failure,
            error: 'Invalid response from server',
          ),
        );
      }
    } catch (e) {
      emit(state.copyWith(status: AuthStatus.failure, error: e.toString()));
    }
  }

  void updateStep(AuthStep step, {List<LocationData>? syncedLocations}) {
    emit(state.copyWith(step: step, syncedLocations: syncedLocations));
  }
}
