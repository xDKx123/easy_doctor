import 'package:easy_doctor/src/models/personal_list_item_model.dart';
import 'package:easy_doctor/src/models/personal_list_model.dart';
import 'package:easy_doctor/src/repositories/personal_list_item_repository.dart';
import 'package:easy_doctor/src/repositories/personal_list_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('integration test', () async {
    final PersonalListModel list = PersonalListModel(name: 'new list', items: [], description: 'new description');

    final List<PersonalListModel> allPersonalLists =  await PersonalListRepository().listPersonalLists();

    final PersonalListModel newList = await PersonalListRepository().createPersonalList(list);

    final List<PersonalListModel> allPersonalLists2 =  await PersonalListRepository().listPersonalLists();

    expect(list.name, equals(newList.name));
    expect(list.description, equals(newList.description));
    expect(newList.id, isNotNull);
    expect(allPersonalLists.length + 1, equals(allPersonalLists2.length));

    final PersonalListModel listToUpdate = newList.copyWith(name: 'new list name 2', description: 'new description 2');

    final PersonalListModel updatedList = await PersonalListRepository().updatePersonalList(listToUpdate);

    expect(listToUpdate.id, equals(updatedList.id));
    expect(listToUpdate.name, equals(updatedList.name));
    expect(listToUpdate.description, equals(updatedList.description));

    await PersonalListRepository().removePersonalList(updatedList.id!);

    final List<PersonalListModel> allPersonalLists3 =  await PersonalListRepository().listPersonalLists();
    expect(allPersonalLists.length, equals(allPersonalLists3.length));
  });

  test('integration test list with items', () async {
    final PersonalListModel list = PersonalListModel(name: 'new list', items: [], description: 'new description');

    final PersonalListModel newList = await PersonalListRepository().createPersonalList(list);

    final List<PersonalListItemModel> listItems = await PersonalListItemRepository().listPersonalListItems(newList.id!);
    final PersonalListItemModel listItem = PersonalListItemModel(name: 'new item', completed: false, deadline: DateTime.now().toUtc(), description: 'new list item');
    final PersonalListItemModel createdListItem = await PersonalListItemRepository().createPersonalListItem(listItem, newList.id!);
    final List<PersonalListItemModel> listItemsAfterInsert = await PersonalListItemRepository().listPersonalListItems(newList.id!);
    expect(listItems.length + 1, equals(listItemsAfterInsert.length));
    expect(listItem.name, createdListItem.name);
    expect(listItem.description, createdListItem.description);
    //expect(listItem.deadline, createdListItem.deadline);
    expect(listItem.completed, createdListItem.completed);
    expect(createdListItem.id, isNotNull);

    final PersonalListItemModel listItemToUpdate = createdListItem.copyWith(name: 'update list item 2', description: 'update list item 2', deadline: DateTime.now().toUtc(), completed: true);
    final PersonalListItemModel updatedListItem = await PersonalListItemRepository().updatePersonalListItem(listItemToUpdate);
    expect(listItemToUpdate.id, equals(updatedListItem.id));
    expect(listItemToUpdate.name, equals(updatedListItem.name));
    expect(listItemToUpdate.description, equals(updatedListItem.description));
    //expect(listItemToUpdate.deadline, equals(updatedListItem.deadline));
    expect(listItemToUpdate.completed, equals(updatedListItem.completed));

    expect(updatedListItem.id, equals(createdListItem.id));
    expect(updatedListItem.name, isNot(equals(createdListItem.name)));
    expect(updatedListItem.description, isNot(equals(createdListItem.description)));
    //expect(updatedListItem.deadline, isNot(equals(createdListItem.deadline)));
    expect(updatedListItem.completed, isNot(equals(createdListItem.completed)));


    //We want this to fail because list with items cannot be deleted;
    try {
      await PersonalListRepository().removePersonalList(newList.id!);
    } catch (e) {
      expect(e.toString(), Exception('409').toString());
    }

    await PersonalListItemRepository().removePersonalListItem(createdListItem.id!);

    //Should not crash;
    await PersonalListRepository().removePersonalList(newList.id!);
  });
}