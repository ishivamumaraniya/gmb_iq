import '../views/scan_and_found/found_accounts/found_accounts_state.dart';

enum AuthStatus { initial, loading, success, failure }
enum AuthStep { login, scanning, foundAccounts, syncComplete }

class AuthState {
  final AuthStatus status;
  final AuthStep step;
  final Map<String, dynamic>? data;
  final String? error;
  final List<LocationData> syncedLocations;

  const AuthState({
    this.status = AuthStatus.initial,
    this.step = AuthStep.login,
    this.data,
    this.error,
    this.syncedLocations = const [],
  });

  AuthState copyWith({
    AuthStatus? status,
    AuthStep? step,
    Map<String, dynamic>? data,
    String? error,
    List<LocationData>? syncedLocations,
  }) {
    return AuthState(
      status: status ?? this.status,
      step: step ?? this.step,
      data: data ?? this.data,
      error: error ?? this.error,
      syncedLocations: syncedLocations ?? this.syncedLocations,
    );
  }
}
