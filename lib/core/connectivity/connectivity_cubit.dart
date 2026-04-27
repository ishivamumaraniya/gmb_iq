import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'connectivity_state.dart';

class ConnectivityCubit extends Cubit<ConnectivityState> {
  final Connectivity _connectivity = Connectivity();
  final InternetConnectionChecker _connectionChecker = InternetConnectionChecker.createInstance();
  StreamSubscription? _connectivitySubscription;
  bool _isListenerActive = false;

  ConnectivityCubit() : super(const ConnectivityState()) {
    // We don't start the listener automatically in constructor to give SplashScreen control
  }

  Future<void> checkConnectivity() async {
    // Initial check with a small retry logic for warm-up
    bool hasInternet = await _performInternetCheck();

    emit(state.copyWith(status: hasInternet ? ConnectivityStatus.connected : ConnectivityStatus.disconnected));

    // Start listener if not already active
    _startConnectionListener();
  }

  Future<bool> _performInternetCheck() async {
    bool hasInternet = await _connectionChecker.hasConnection;

    // If it says no internet, try once more after a short delay (warm-up phase)
    if (!hasInternet) {
      await Future.delayed(const Duration(milliseconds: 500));
      hasInternet = await _connectionChecker.hasConnection;
    }
    return hasInternet;
  }

  void _startConnectionListener() {
    if (_isListenerActive) return;
    _isListenerActive = true;

    _connectivitySubscription = _connectivity.onConnectivityChanged.listen((results) async {
      bool hasConnection = results.any((result) => result != ConnectivityResult.none);

      if (hasConnection) {
        // Double check with actual internet access
        bool hasInternet = await _connectionChecker.hasConnection;
        emit(state.copyWith(status: hasInternet ? ConnectivityStatus.connected : ConnectivityStatus.disconnected));
      } else {
        // Even if results say 'none', double check one last time before committing to 'disconnected'
        bool hasInternet = await _connectionChecker.hasConnection;
        if (!hasInternet) {
          emit(state.copyWith(status: ConnectivityStatus.disconnected));
        } else {
          // It reported none but internet is actually working
          emit(state.copyWith(status: ConnectivityStatus.connected));
        }
      }
    });
  }

  @override
  Future<void> close() {
    _connectivitySubscription?.cancel();
    return super.close();
  }
}
