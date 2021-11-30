import 'package:easy_doctor/src/mock/all_chats_mock.dart';
import 'package:easy_doctor/src/mock/chat_message_mock.dart';
import 'package:easy_doctor/src/models/chat.dart';
import 'package:easy_doctor/src/models/chat_message.dart';
import 'package:easy_doctor/src/models/user.dart';

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
