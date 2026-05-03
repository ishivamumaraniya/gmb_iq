import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import '../../../../core/constants/api_constants.dart';
import '../../../../core/storage/hive_setup.dart';
import '../data/auth_repository.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository;
  final GoogleSignIn _googleSignIn;

  AuthCubit({AuthRepository? authRepository})
    : _authRepository = authRepository ?? AuthRepository(),
      _googleSignIn = GoogleSignIn.instance,
      super(const AuthState()) {
    _googleSignIn.initialize(
      clientId: ApiConstants.googleClientId,
      scopes: ['email', 'https://www.googleapis.com/auth/userinfo.profile'],
    );
  }

  Future<void> loginWithGoogle() async {
    emit(state.copyWith(status: AuthStatus.loading));
    try {
      final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
      if (googleUser == null) {
        // The user canceled the sign-in
        emit(
          state.copyWith(
            status: AuthStatus.failure,
            error: 'Sign in aborted by user',
          ),
        );
        return;
      }

      final GoogleSignInAuthentication googleAuth =
          await googleUser.authentication;
      final String? token = googleAuth.idToken;

      if (token == null) {
        emit(
          state.copyWith(
            status: AuthStatus.failure,
            error: 'Failed to retrieve authentication token from Google',
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
        emit(state.copyWith(status: AuthStatus.success, data: response));
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
}
