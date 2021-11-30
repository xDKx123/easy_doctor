import 'package:easy_doctor/src/blocs/all_chat_bloc/all_chat_bloc.dart';
import 'package:easy_doctor/src/ui/views/chat/all_chat/all_chat_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AllChatView extends StatefulWidget {
  const AllChatView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _AllChatViewState();
}

class _AllChatViewState extends State<AllChatView> {
  @override
  Widget build(BuildContext context) {
    if (BlocProvider.of<AllChatBloc>(context).state is AllChatNotLoaded) {
      BlocProvider.of<AllChatBloc>(context).add(const LoadAllChat());
    }

    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: BlocConsumer<AllChatBloc, AllChatState>(
        listener: (BuildContext context, AllChatState state) {},
        builder: (BuildContext context, AllChatState state) {
          return AllChatList(
            chats: state is AllChatLoaded ? state.chats : [],
            isLoading: state is AllChatLoading,
            errorMessage: null,
          );
        },
      ),
    );
  }
}
