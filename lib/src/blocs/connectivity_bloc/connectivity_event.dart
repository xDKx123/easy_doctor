part of 'connectivity_bloc.dart';

abstract class ConnectivityEvent extends Equatable {
  const ConnectivityEvent();
}

class ConnectivityEmit extends ConnectivityEvent {
  const ConnectivityEmit();

  @override
  List<Object?> get props => [];
}
