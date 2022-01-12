part of 'personal_list_items_bloc.dart';

abstract class PersonalListItemsState extends Equatable {
  const PersonalListItemsState();
}

class PersonalListItemsLoading extends PersonalListItemsState {
  const PersonalListItemsLoading();

  @override
  List<Object?> get props => <Object>[];
}

class PersonalListItemsLoaded extends PersonalListItemsState {
  const PersonalListItemsLoaded({required this.items});

  final List<PersonalListItemModel> items;

  @override
  List<Object?> get props => <Object>[items];
}

class PersonalListItemsNotLoaded extends PersonalListItemsState {
  const PersonalListItemsNotLoaded();

  @override
  List<Object?> get props => <Object>[];
}

class PersonalListItemsFailed extends PersonalListItemsState {
  const PersonalListItemsFailed({required this.error});

  final String error;

  @override
  List<Object?> get props => <Object>[error];
}

class PersonalListItemsSuccess extends PersonalListItemsState {
  const PersonalListItemsSuccess();

  @override
  List<Object?> get props => <Object>[];
}
