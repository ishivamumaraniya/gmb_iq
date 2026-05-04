import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:google_sign_in_web/google_sign_in_web.dart';
import 'package:google_sign_in_platform_interface/google_sign_in_platform_interface.dart';

import '../../../../core/constants/api_constants.dart';
import '../../../../core/storage/hive_setup.dart';
import '../data/auth_repository.dart';
import 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final AuthRepository _authRepository;
  final GoogleSignIn _gSignIn = GoogleSignIn.instance;
  final GoogleSignInPlugin _gWeb = GoogleSignInPlugin();

  final List<String> _scopes = [
    'https://www.googleapis.com/auth/business.manage',
    'https://www.googleapis.com/auth/contacts.readonly',
  ];

  AuthCubit({AuthRepository? authRepository})
    : _authRepository = authRepository ?? AuthRepository(),
      super(const AuthState()) {
    _initialize();
  }

  static bool _isInitialized = false;

  void _initialize() {
    if (_isInitialized) return;

    if (kIsWeb) {
      _gWeb.init(const InitParameters(clientId: ApiConstants.googleClientId));

      _gWeb.authenticationEvents.listen((event) {
        if (event is AuthenticationEventSignIn) {
          _handleWebSignInSuccess(event);
        }
      });

      _gWeb.attemptLightweightAuthentication(
        const AttemptLightweightAuthenticationParameters(),
      );
    }

    _isInitialized = true;
  }

  Future<void> _handleWebSignInSuccess(AuthenticationEventSignIn event) async {
    emit(state.copyWith(status: AuthStatus.loading));
    try {
      final String? token = event.authenticationTokens.idToken;

      if (token == null) {
        emit(
          state.copyWith(
            status: AuthStatus.failure,
            error: 'Failed to retrieve ID token',
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

  Future<void> signOut() async {
    try {
      if (kIsWeb) {
        await _gWeb.signOut(const SignOutParams());
      } else {
        await _gSignIn.signOut();
      }
      emit(const AuthState(status: AuthStatus.initial));
    } catch (e) {
      emit(
        state.copyWith(
          status: AuthStatus.failure,
          error: 'Sign out failed: ${e.toString()}',
        ),
      );
    }
  }
}
