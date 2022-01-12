import 'package:easy_doctor/src/adapters/personal_list_adapter.dart';
import 'package:easy_doctor/src/graphQl/graphql.dart';
import 'package:easy_doctor/src/graphQl/request_routes/personal_list_requests.dart';
import 'package:easy_doctor/src/models/personal_list_model.dart';

class PersonalListRepository {
  Future<List<PersonalListModel>> listPersonalLists() async {
    //return personalListMock;
    try {
      final Map<String, dynamic> response =
          await RestRequest.postRequest(request: listPersonalListsRequest);

      return List<Map<String, dynamic>>.from(response['tasks'])
          .map((Map<String, dynamic> element) =>
              PersonalListAdapter.fromMap(element))
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  Future<void> createPersonalList(PersonalListModel model) async {
    try {
      RestRequest.postRequest(
        request: createPersonalListRequest,
        body: PersonalListAdapter.toMap(model),
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> updatePersonalList(PersonalListModel model) async {
    try {
      RestRequest.postRequest(
        request: updatePersonalListRequest,
        body: PersonalListAdapter.toMap(model),
      );
    } catch (e) {
      rethrow;
    }
  }

  Future<void> removePersonalList(PersonalListID id) async {
    try {
      RestRequest.postRequest(
        request: deletePersonalListRequest,
        body: <String, String>{
          'id': id.toString(),
        },
      );
    } catch (e) {
      rethrow;
    }
  }
}
