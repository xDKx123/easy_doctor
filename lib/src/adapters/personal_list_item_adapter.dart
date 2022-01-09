import 'package:easy_doctor/src/models/personal_list_item_model.dart';

class PersonalListItemAdapter {
  const PersonalListItemAdapter();

  static PersonalListItemModel fromMap(Map<String, dynamic> map) {
    return PersonalListItemModel(
      id: map['id'] != null ? PersonalListItemID(map['id']) : null,
      name: map['name'],
      deadline: map['deadline'],
      completed: map['completed'],
      description: map['description'],
    );
  }

  static Map<String, dynamic> toMap(PersonalListItemModel model) {
    return <String, dynamic>{
      'id': model.id?.toString(),
      'name': model.name,
      'deadline': model.deadline.toString(),
      'completed': model.completed,
      'description': model.description,
    };
  }
}
