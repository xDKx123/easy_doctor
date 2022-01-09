import 'package:bloc/bloc.dart';
import 'package:easy_doctor/src/models/chat_message_model.dart';
import 'package:easy_doctor/src/models/user_model.dart';
import 'package:easy_doctor/src/repositories/chat_repository.dart';
import 'package:easy_doctor/src/utils/logger.dart';
import 'package:equatable/equatable.dart';
import 'package:logger/logger.dart';

part 'chat_messages_event.dart';
part 'chat_messages_state.dart';

class ChatMessagesBloc extends Bloc<ChatMessagesEvent, ChatMessagesState> {
  ChatMessagesBloc({required this.chatRepository})
      : super(const ChatMessagesNotLoaded()) {
    on<ChatMessagesEvent>(
        (ChatMessagesEvent event, Emitter<ChatMessagesState> emit) async {
      if (event is LoadChatMessages) {
        await _onLoadChatMessages(event, emit);
      }
      if (event is LoadAdditionalMessages) {
        await _onLoadAdditionalMessages(event, emit);
      }
    });
  }

  final ChatRepository chatRepository;
  final Logger _logger = CustomLogger().getLogger();

  Future<void> _onLoadChatMessages(
      LoadChatMessages event, Emitter<ChatMessagesState> emit) async {
    emit(const ChatMessagesLoading());
    try {
      final List<ChatMessageModel> chatMessages =
          await chatRepository.listChatMessages(userID: event.userID);

      emit(ChatMessagesLoaded(chatMessages: chatMessages));
    } catch (e) {
      _logger.e(e);
      emit(const ChatMessagesNotLoaded());
    }
  }

  Future<void> _onLoadAdditionalMessages(
      LoadAdditionalMessages event, Emitter<ChatMessagesState> emit) async {
    emit(const ChatMessagesAdditionalLoading());
    try {
      final List<ChatMessageModel> chatMessages =
          await chatRepository.listChatMessages(userID: event.userID);

      emit(ChatMessagesAdditionalLoaded(chatMessages: chatMessages));
    } catch (e) {
      _logger.e(e);
      emit(const ChatMessagesNotLoaded());
    }
  }
}
