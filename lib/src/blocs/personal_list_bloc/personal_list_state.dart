part of 'personal_list_bloc.dart';

abstract class PersonalListState extends Equatable {
  const PersonalListState();
}

class PersonalListLoading extends PersonalListState {
  const PersonalListLoading();

  @override
  List<Object?> get props => <Object>[];
}

class PersonalListLoaded extends PersonalListState {
  const PersonalListLoaded({required this.items});

  final List<PersonalListModel> items;

  @override
  List<Object?> get props => <Object>[];
}

class PersonalListNotLoaded extends PersonalListState {
  const PersonalListNotLoaded();

  @override
  List<Object?> get props => <Object>[];
}

class PersonalListFailed extends PersonalListState {
  const PersonalListFailed({required this.error});

  final String error;

  @override
  List<Object?> get props => <Object>[error];
}
