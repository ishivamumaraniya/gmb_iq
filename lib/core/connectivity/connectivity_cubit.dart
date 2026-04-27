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

  ConnectivityCubit() : super(const ConnectivityState()) {}

  Future<void> checkConnectivity() async {
    bool hasInternet = await _performInternetCheck();

    emit(state.copyWith(status: hasInternet ? ConnectivityStatus.connected : ConnectivityStatus.disconnected));

    _startConnectionListener();
  }

  Future<bool> _performInternetCheck() async {
    bool hasInternet = await _connectionChecker.hasConnection;

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
        bool hasInternet = await _connectionChecker.hasConnection;
        emit(state.copyWith(status: hasInternet ? ConnectivityStatus.connected : ConnectivityStatus.disconnected));
      } else {
        bool hasInternet = await _connectionChecker.hasConnection;
        if (!hasInternet) {
          emit(state.copyWith(status: ConnectivityStatus.disconnected));
        } else {
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
