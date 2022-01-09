import 'package:easy_doctor/src/models/id.dart';
import 'package:easy_doctor/src/models/timestamps_model.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/foundation.dart';

class UserModel extends Equatable {
  const UserModel(
      {required this.id,
      required this.email,
      required this.name,
      required this.surname,
      required this.status,
      required this.profileImageUrl,
      required this.timestamps});

  final UserID id;
  final String email;
  final String name;
  final String surname;
  final UserStatus status;
  final String profileImageUrl;
  final TimestampsModel timestamps;

  UserModel copyWith(
      {final UserID? id,
      final String? email,
      final String? name,
      final String? surname,
      final UserStatus? status,
      final String? profileImageUrl,
      final TimestampsModel? timestamps}) {
    return UserModel(
        id: id ?? this.id,
        email: email ?? this.email,
        name: name ?? this.name,
        surname: surname ?? this.surname,
        status: status ?? this.status,
        profileImageUrl: profileImageUrl ?? this.profileImageUrl,
        timestamps: timestamps ?? this.timestamps);
  }

  @override
  List<Object?> get props =>
      [id, email, name, surname, status, profileImageUrl, timestamps];
}

class UserID extends ID {
  const UserID(String id) : super(id);
}

enum UserStatus { user, doctor, unknown }

extension UserStatusExtension on UserStatus {
  String enumToString() {
    return describeEnum(this);
  }

  static UserStatus fromString(String value) {
    return UserStatus.values.firstWhere(
        (element) => element.enumToString() == value,
        orElse: () => UserStatus.unknown);
  }
}
