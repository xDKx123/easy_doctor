import 'package:easy_doctor/src/mock/all_chats_mock.dart';
import 'package:easy_doctor/src/mock/chat_message_mock.dart';
import 'package:easy_doctor/src/models/chat_message_model.dart';
import 'package:easy_doctor/src/models/chat_model.dart';
import 'package:easy_doctor/src/models/user_model.dart';

class ChatRepository {
  const ChatRepository();

  Future<List<ChatModel>> listAllChats() async {
    return allChatsMock;
  }

  Future<List<ChatMessageModel>> listChatMessages(
      {required UserID userID}) async {
    return chatMessagesMock;
  }
}
