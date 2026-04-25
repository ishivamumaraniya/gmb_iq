import 'package:equatable/equatable.dart';

enum ConnectivityStatus { initial, connected, disconnected }

class ConnectivityState extends Equatable {
  final ConnectivityStatus status;

  const ConnectivityState({this.status = ConnectivityStatus.initial});

  @override
  List<Object> get props => [status];

  ConnectivityState copyWith({ConnectivityStatus? status}) {
    return ConnectivityState(status: status ?? this.status);
  }
}
