part of 'personal_list_items_bloc.dart';

abstract class PersonalListItemsEvent extends Equatable {
  const PersonalListItemsEvent();
}

class LoadPersonalListItems extends PersonalListItemsEvent {
  const LoadPersonalListItems({required this.list});

  final PersonalListModel list;

  @override
  List<Object?> get props => <Object>[];
}

class UpdatePersonalListItem extends PersonalListItemsEvent {
  const UpdatePersonalListItem(
      {required this.id,
      required this.name,
      required this.description,
      this.deadline});

  final PersonalListItemID id;
  final String name;
  final String description;
  final DateTime? deadline;

  @override
  List<Object?> get props => <Object>[id, name, description];
}

class CreatePersonalListItem extends PersonalListItemsEvent {
  const CreatePersonalListItem(
      {required this.name,
      required this.description,
      this.deadline,
      required this.listID});

  final String name;
  final DateTime? deadline;
  final String description;
  final PersonalListID listID;

  @override
  List<Object?> get props => <Object>[name, description];
}

class RemovePersonalListItem extends PersonalListItemsEvent {
  const RemovePersonalListItem({required this.id});

  final PersonalListItemID id;

  @override
  List<Object?> get props => <Object>[id];
}
