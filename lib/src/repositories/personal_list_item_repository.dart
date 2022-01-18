import 'package:easy_doctor/src/adapters/personal_list_item_adapter.dart';
import 'package:easy_doctor/src/graphQl/graphql.dart';
import 'package:easy_doctor/src/graphQl/request_routes/personal_list_item_requests.dart';
import 'package:easy_doctor/src/models/personal_list_item_model.dart';
import 'package:easy_doctor/src/models/personal_list_model.dart';

class PersonalListItemRepository {
  Future<List<PersonalListItemModel>> listPersonalListItems(
      PersonalListID listItemID) async {
    //return personalListItemsMock;
    try {
      final Map<String, dynamic> response = await RestRequest.postRequest(
          request: listPersonalListItemsRequest,
          body: <String, dynamic>{
            'task_list_id': listItemID.toString(),
          });

      return List<Map<String, dynamic>>.from(response['tasks'])
          .map((Map<String, dynamic> element) =>
              PersonalListItemAdapter.fromMap(element))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<PersonalListItemModel> updatePersonalListItem(PersonalListItemModel model) async {
    try {
      final Map<String, dynamic> response = await RestRequest.postRequest(
          request: updatePersonalListItemRequest,
          body: PersonalListItemAdapter.toMap(model));

      return PersonalListItemAdapter.fromMap(response['tasks']);
    } catch (e) {
      rethrow;
    }
  }

  Future<PersonalListItemModel> createPersonalListItem(
      PersonalListItemModel model, PersonalListID listID) async {
    try {
      final Map<String, dynamic> map = PersonalListItemAdapter.toMap(model);
      map.addAll(<String, String>{'task_list_fk': listID.toString()});

      final Map<String, dynamic> response = await RestRequest.postRequest(
        request: createPersonalListItemRequest,
        body: map,
      );

      return PersonalListItemAdapter.fromMap(response['tasks']);

    } catch (e) {
      rethrow;
    }
  }

  Future<void> removePersonalListItem(PersonalListItemID id) async {
    try {
      Map<String, dynamic> response = await RestRequest.postRequest(
        request: removePersonalListItemRequest,
        body: <String, dynamic>{
          'id': id.toString(),
        },
      );

      //return PersonalListItemAdapter.fromMap(response['item']);
    } catch (e) {
      rethrow;
    }
  }
}
