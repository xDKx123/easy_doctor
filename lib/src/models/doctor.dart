/*
import 'package:easy_doctor/src/models/id.dart';
import 'package:equatable/equatable.dart';

class Doctor extends Equatable {
  const Doctor(
      {required this.id,
      required this.email,
      required this.name,
      required this.surname});

  final DoctorID id;
  final String email;
  final String name;
  final String surname;

  Doctor copyWith(
      {final DoctorID? id,
      final String? email,
      final String? name,
      final String? surname}) {
    return Doctor(
        id: id ?? this.id,
        email: email ?? this.email,
        name: name ?? this.name,
        surname: surname ?? this.surname);
  }

  @override
  List<Object?> get props => [];
}

class DoctorID extends ID {
  const DoctorID(String id) : super(id);
}
*/
