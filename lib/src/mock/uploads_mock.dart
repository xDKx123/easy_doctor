import 'package:easy_doctor/src/mock/timestamps_mock.dart';
import 'package:easy_doctor/src/models/upload_model.dart';

List<UploadModel> listUploadsMock = <UploadModel>[
  UploadModel(
      id: UploadID('1'),
      data: 'https://picsum.photos/250?image=9',
      fileName: 'testFile1',
      fileExtension: 'png',
      timestamps: timestampsModelMock),
  UploadModel(
      id: UploadID('2'),
      data: 'https://picsum.photos/250?image=9',
      fileName: 'testFile1',
      fileExtension: 'png',
      timestamps: timestampsModelMock),
  UploadModel(
      id: UploadID('3'),
      data: 'https://picsum.photos/250?image=9',
      fileName: 'testFile1',
      fileExtension: 'png',
      timestamps: timestampsModelMock),
];
