part of 'personal_list_bloc.dart';

abstract class PersonalListEvent extends Equatable {
  const PersonalListEvent();
}

class LoadPersonalList extends PersonalListEvent {
  const LoadPersonalList();

  @override
  List<Object?> get props => <Object>[];
}

class CreatePersonalList extends PersonalListEvent {
  const CreatePersonalList({required this.name, required this.description});

  final String name;
  final String description;

  @override
  List<Object?> get props => <Object>[name, description];
}

class UpdatePersonalList extends PersonalListEvent {
  const UpdatePersonalList(
      {required this.id, required this.name, required this.description});

  final PersonalListID id;
  final String name;
  final String description;

  @override
  List<Object?> get props => <Object>[id, name, description];
}

class RemovePersonalList extends PersonalListEvent {
  const RemovePersonalList({required this.id});

  final PersonalListID id;

  @override
  List<Object?> get props => <Object>[id];
}
