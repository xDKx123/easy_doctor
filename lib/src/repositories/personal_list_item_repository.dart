import 'package:easy_doctor/src/adapters/personal_list_item_adapter.dart';
import 'package:easy_doctor/src/graphQl/graphql.dart';
import 'package:easy_doctor/src/graphQl/request_routes/personal_list_item_requests.dart';
import 'package:easy_doctor/src/mock/personal_list_item_mock.dart';
import 'package:easy_doctor/src/models/personal_list_item_model.dart';
import 'package:easy_doctor/src/models/personal_list_model.dart';

class PersonalListItemRepository {
  Future<List<PersonalListItemModel>> listPersonalListItems(
      PersonalListID listItemID) async {
    return personalListItemsMock;
    try {
      final Map<String, dynamic> response = await RestRequest.postRequest(
          request: '/getListItems',
          body: <String, dynamic>{
            'id': listItemID.toString(),
          });

      return List<Map<String, dynamic>>.from(response['lists'])
          .map((Map<String, dynamic> element) =>
              PersonalListItemAdapter.fromMap(element))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updatePersonalListItem(PersonalListItemModel model) async {
    try {
      await RestRequest.postRequest(
          request: updatePersonalListItemRequest,
          body: PersonalListItemAdapter.toMap(model));
    } catch (e) {
      rethrow;
    }
  }

  Future<void> createPersonalListItem(PersonalListItemModel model) async {
    try {
      Map<String, dynamic> response = await RestRequest.postRequest(
        request: createPersonalListItemRequest,
        body: PersonalListItemAdapter.toMap(model),
      );

      //return PersonalListItemAdapter.fromMap(response);
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
