import 'package:easy_doctor/src/models/id.dart';
import 'package:easy_doctor/src/models/personal_list_item_model.dart';
import 'package:easy_doctor/src/models/timestamps_model.dart';
import 'package:equatable/equatable.dart';

class PersonalListModel extends Equatable {
  PersonalListModel({
    this.id,
    required this.name,
    required this.items,
    required this.description,
    //  required this.timestamps,
  });

  final PersonalListID? id;
  final String name;
  final List<PersonalListItemModel> items;
  final String description;
  //final TimestampsModel? timestamps;

  PersonalListModel copyWith({
    final PersonalListID? id,
    final String? name,
    final List<PersonalListItemModel>? items,
    final String? description,
    final TimestampsModel? timestamps,
  }) {
    return PersonalListModel(
      id: id ?? this.id,
      name: name ?? this.name,
      items: items ?? this.items,
      description: description ?? this.description,
      //timestamps: timestamps ?? this.timestamps,
    );
  }

  @override
  List<Object?> get props => <Object>[name, items];
}

class PersonalListID extends ID {
  const PersonalListID(String id) : super(id);
}
