enum AuthStatus { initial, loading, success, failure }

class AuthState {
  final AuthStatus status;
  final Map<String, dynamic>? data;
  final String? error;

  const AuthState({this.status = AuthStatus.initial, this.data, this.error});

  AuthState copyWith({
    AuthStatus? status,
    Map<String, dynamic>? data,
    String? error,
  }) {
    return AuthState(
      status: status ?? this.status,
      data: data ?? this.data,
      error: error ?? this.error,
    );
  }
}
