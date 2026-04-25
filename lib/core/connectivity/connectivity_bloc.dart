import 'dart:async';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'connectivity_event.dart';
import 'connectivity_state.dart';

class ConnectivityBloc extends Bloc<ConnectivityEvent, ConnectivityState> {
  final Connectivity _connectivity = Connectivity();
  final InternetConnectionChecker _connectionChecker = InternetConnectionChecker.createInstance();
  StreamSubscription? _connectivitySubscription;

  ConnectivityBloc() : super(const ConnectivityState()) {
    on<ConnectivityChanged>(_onConnectivityChanged);
    on<CheckConnectivity>(_onCheckConnectivity);

    _connectivitySubscription = _connectivity.onConnectivityChanged.listen((results) async {
      // Check if any of the connectivity results indicate a connection
      bool hasConnection = results.any((result) => result != ConnectivityResult.none);

      if (hasConnection) {
        // Double check with actual internet access
        bool hasInternet = await _connectionChecker.hasConnection;
        add(ConnectivityChanged(hasInternet));
      } else {
        add(const ConnectivityChanged(false));
      }
    });

    // Initial check
    add(CheckConnectivity());
  }

  Future<void> _onConnectivityChanged(ConnectivityChanged event, Emitter<ConnectivityState> emit) async {
    emit(state.copyWith(status: event.isConnected ? ConnectivityStatus.connected : ConnectivityStatus.disconnected));
  }

  Future<void> _onCheckConnectivity(CheckConnectivity event, Emitter<ConnectivityState> emit) async {
    bool hasInternet = await _connectionChecker.hasConnection;
    emit(state.copyWith(status: hasInternet ? ConnectivityStatus.connected : ConnectivityStatus.disconnected));
  }

  @override
  Future<void> close() {
    _connectivitySubscription?.cancel();
    return super.close();
  }
}
