part of 'connectivity_bloc.dart';

abstract class ConnectivityState extends Equatable {
  const ConnectivityState();
}

class ConnectivityInitial extends ConnectivityState {
  @override
  List<Object> get props => [];
}

class ConnectivityConnected extends ConnectivityState {
  @override
  List<Object?> get props => [];

  @override
  String toString() {
    return 'ConnectivityConnected';
  }
}

class ConnectivityDisconnected extends ConnectivityState {
  @override
  List<Object?> get props => [];

  @override
  String toString() {
    return 'ConnectivityDisconnected';
  }
}

class ConnectivityFail extends ConnectivityState {
  const ConnectivityFail({required this.error});

  final String error;

  @override
  List<Object?> get props => [];

  @override
  String toString() {
    return '"ConnectivityFail": {"error": $error}';
  }
}
