part of 'connectivity_bloc.dart';

abstract class ConnectivityEvent extends Equatable {
  const ConnectivityEvent();
}

class ConnectivityEmit extends ConnectivityEvent {
  const ConnectivityEmit();

  @override
  List<Object?> get props => [];
}

class ConnectivityChange extends ConnectivityEvent {
  const ConnectivityChange({required this.connectivity});

  final ConnectivityResult connectivity;

  @override
  List<Object?> get props => [];
}
