import 'package:easy_doctor/src/mock/user_mock.dart';
import 'package:easy_doctor/src/models/chat_model.dart';

List<ChatModel> allChatsMock = <ChatModel>[
  ChatModel(id: ChatID('1'), interlocutor: userMock, chatMessages: []),
  ChatModel(id: ChatID('2'), interlocutor: userMock, chatMessages: []),
  ChatModel(id: ChatID('3'), interlocutor: userMock, chatMessages: []),
  ChatModel(id: ChatID('4'), interlocutor: userMock, chatMessages: []),
  ChatModel(id: ChatID('5'), interlocutor: userMock, chatMessages: []),
];
