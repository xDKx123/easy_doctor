import 'package:bloc/bloc.dart';
import 'package:easy_doctor/src/models/chat_model.dart';
import 'package:easy_doctor/src/repositories/chat_repository.dart';
import 'package:easy_doctor/src/utils/logger.dart';
import 'package:equatable/equatable.dart';
import 'package:logger/logger.dart';

part 'all_chat_event.dart';
part 'all_chat_state.dart';

class AllChatBloc extends Bloc<AllChatEvent, AllChatState> {
  AllChatBloc({required this.chatRepository})
      : super(const AllChatNotLoaded()) {
    on<AllChatEvent>((AllChatEvent event, Emitter<AllChatState> emit) async {
      if (event is LoadAllChat) {
        await _onLoadAllChat(event, emit);
      } else if (event is RefreshAllChat) {
        await _onRefreshAllChat(event, emit);
      } else if (event is LoadAdditionalAllChat) {
        await _onLoadMoreAllChat(event, emit);
      }
    });
  }

  final ChatRepository chatRepository;
  final Logger _logger = CustomLogger().getLogger();

  Future<void> _onLoadAllChat(
      LoadAllChat event, Emitter<AllChatState> emit) async {
    emit(const AllChatLoading());
    try {
      final List<ChatModel> chats = await chatRepository.listAllChats();

      emit(AllChatLoaded(chats: chats));
    } catch (e) {
      _logger.e(e);
      emit(AllChatNotLoaded(message: e.toString()));
    }
  }

  Future<void> _onRefreshAllChat(
      RefreshAllChat event, Emitter<AllChatState> emit) async {}

  Future<void> _onLoadMoreAllChat(
      LoadAdditionalAllChat event, Emitter<AllChatState> emit) async {}
}
