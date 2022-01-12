import 'package:easy_doctor/src/models/personal_list_item_model.dart';
import 'package:easy_doctor/src/models/personal_list_model.dart';

class PersonalListAdapter {
  const PersonalListAdapter();

  static PersonalListModel fromMap(Map<String, dynamic> map) {
    return PersonalListModel(
      id: map['id'] != null ? PersonalListID(map['id'].toString()) : null,
      name: map['name'],
      items: <PersonalListItemModel>[],
      description: map['description'],
    );
  }

  static Map<String, dynamic> toMap(PersonalListModel model) {
    return <String, dynamic>{
      'id': model.id?.toString(),
      'name': model.name,
      'description': model.description,
    };
  }
}
