import 'package:easy_doctor/src/mock/timestamps_mock.dart';
import 'package:easy_doctor/src/mock/user_mock.dart';
import 'package:easy_doctor/src/models/chat_message.dart';
import 'package:easy_doctor/src/models/upload.dart';

List<ChatMessageModel> chatMessagesMock = <ChatMessageModel>[
  ChatMessageModel(
    id: ChatMessageID('1'),
    interlocutor: userMock.id,
    message:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed at tellus malesuada, tincidunt sem nec, interdum lectus. Proin ut tempus orci. Pellentesque erat lectus, ultricies sed interdum quis, laoreet vel purus. Aenean vel vulputate justo. Morbi ullamcorper, diam in varius rhoncus, ligula ante ultricies tortor, lobortis pellentesque risus leo nec urna. In eu sapien velit. Quisque varius rhoncus mi non dapibus. Aliquam vitae libero libero.',
    uploads: <UploadModel>[],
    timestamps: timestampsModelMock,
  ),
  ChatMessageModel(
    id: ChatMessageID('2'),
    interlocutor: userMock.id,
    message: 'Test message',
    uploads: <UploadModel>[],
    timestamps: timestampsModelMock,
  ),
  ChatMessageModel(
    id: ChatMessageID('3'),
    interlocutor: userMock.id,
    message: 'Test message',
    uploads: <UploadModel>[],
    timestamps: timestampsModelMock,
  ),
  ChatMessageModel(
    id: ChatMessageID('4'),
    interlocutor: userMock.id,
    message: 'Test message',
    uploads: <UploadModel>[],
    timestamps: timestampsModelMock,
  ),
  ChatMessageModel(
    id: ChatMessageID('1'),
    interlocutor: userMock.id,
    message: 'Lorem ipsum',
    uploads: <UploadModel>[],
    timestamps: timestampsModelMock,
  ),
  ChatMessageModel(
    id: ChatMessageID('1'),
    interlocutor: userMock.id,
    message: 'Lorem ipsum',
    uploads: <UploadModel>[],
    timestamps: timestampsModelMock,
  ),
  ChatMessageModel(
    id: ChatMessageID('2'),
    interlocutor: userMock.id,
    message: 'Lorem ipsum',
    uploads: <UploadModel>[],
    timestamps: timestampsModelMock,
  ),
  ChatMessageModel(
    id: ChatMessageID('2'),
    interlocutor: userMock.id,
    message: 'Lorem ipsum',
    uploads: <UploadModel>[],
    timestamps: timestampsModelMock,
  ),
  ChatMessageModel(
    id: ChatMessageID('1'),
    interlocutor: userMock.id,
    message: 'Lorem ipsum',
    uploads: <UploadModel>[],
    timestamps: timestampsModelMock,
  ),
  ChatMessageModel(
    id: ChatMessageID('1'),
    interlocutor: userMock.id,
    message: 'Lorem ipsum',
    uploads: <UploadModel>[],
    timestamps: timestampsModelMock,
  ),
  ChatMessageModel(
    id: ChatMessageID('1'),
    interlocutor: userMock.id,
    message: 'Lorem ipsum',
    uploads: <UploadModel>[],
    timestamps: timestampsModelMock,
  ),
  ChatMessageModel(
    id: ChatMessageID('1'),
    interlocutor: userMock.id,
    message: 'Lorem ipsum',
    uploads: <UploadModel>[],
    timestamps: timestampsModelMock,
  ),
];
