import 'package:easy_doctor/src/models/timestamp_model.dart';
import 'package:equatable/equatable.dart';

class TimestampsModel extends Equatable {
  const TimestampsModel({required this.updatedAt, required this.createdAt});

  final TimestampModel createdAt;
  final TimestampModel updatedAt;

  TimestampsModel copyWith(
      {final TimestampModel? createdAt, final TimestampModel? updatedAt}) {
    return TimestampsModel(
        updatedAt: updatedAt ?? this.createdAt,
        createdAt: createdAt ?? this.createdAt);
  }

  @override
  List<Object?> get props => <Object?>[createdAt, updatedAt];
}
