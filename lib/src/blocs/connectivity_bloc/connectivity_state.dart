part of 'connectivity_bloc.dart';

abstract class ConnectivityState extends Equatable {
  const ConnectivityState();
}

class ConnectivityConnected extends ConnectivityState {
  const ConnectivityConnected();

  @override
  List<Object?> get props => [];

  @override
  String toString() {
    return 'ConnectivityConnected';
  }
}

class ConnectivityDisconnected extends ConnectivityState {
  const ConnectivityDisconnected();

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

class ConnectivityUnknown extends ConnectivityState {
  const ConnectivityUnknown();

  @override
  List<Object?> get props => <Object?>[];
}
