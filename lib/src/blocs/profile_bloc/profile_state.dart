part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();
}

class ProfileLoading extends ProfileState {
  @override
  List<Object?> get props => [];
}

class ProfileLoaded extends ProfileState {
  const ProfileLoaded({required this.user});

  final UserModel user;

  @override
  List<Object?> get props => [user];
}

class ProfileNotLoaded extends ProfileState {
  const ProfileNotLoaded({this.message});

  final String? message;

  @override
  List<Object?> get props => [];
}
