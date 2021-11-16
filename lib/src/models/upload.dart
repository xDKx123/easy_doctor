import 'package:easy_doctor/src/models/id.dart';
import 'package:easy_doctor/src/models/timestamps.dart';
import 'package:equatable/equatable.dart';

class UploadModel extends Equatable {
  const UploadModel(
      {required this.id,
      required this.data,
      required this.fileName,
      required this.fileExtension,
      required this.timestamps});

  final UploadID id;
  final String data;
  final String fileName;
  final String fileExtension;
  final TimestampsModel timestamps;

  UploadModel copyWith({
    final UploadID? id,
    final String? data,
    final String? fileName,
    final String? fileExtension,
    final TimestampsModel? timestamps,
  }) {
    return UploadModel(
        id: id ?? this.id,
        data: data ?? this.data,
        fileName: fileName ?? this.fileName,
        fileExtension: fileExtension ?? this.fileExtension,
        timestamps: timestamps ?? this.timestamps);
  }

  @override
  // TODO: implement props
  List<Object?> get props => <Object?>[id, data, fileName, timestamps];
}

class UploadID extends ID {
  const UploadID(String id) : super(id);
}
