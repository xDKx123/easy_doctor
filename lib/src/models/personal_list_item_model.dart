import 'package:easy_doctor/src/models/id.dart';
import 'package:equatable/equatable.dart';

class PersonalListItemModel extends Equatable {
  const PersonalListItemModel({
    this.id,
    required this.name,
    required this.completed,
    required this.deadline,
    required this.description,
  });

  final PersonalListItemID? id;
  final String name;
  final bool completed;
  final DateTime deadline;
  final String description;
  //final TimestampsModel timestamps;

  PersonalListItemModel copyWith({
    final PersonalListItemID? id,
    final String? name,
    final bool? completed,
    final DateTime? deadline,
    final String? description,
  }) {
    return PersonalListItemModel(
      id: id ?? this.id,
      name: name ?? this.name,
      completed: completed ?? this.completed,
      deadline: deadline ?? this.deadline,
      description: description ?? this.description,
    );
  }

  @override
  List<Object?> get props => <Object>[name, completed, deadline];
}

class PersonalListItemID extends ID {
  const PersonalListItemID(String id) : super(id);
}
