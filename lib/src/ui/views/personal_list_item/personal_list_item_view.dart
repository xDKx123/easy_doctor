import 'package:easy_doctor/src/blocs/personal_list_bloc/personal_list_bloc.dart';
import 'package:easy_doctor/src/blocs/personal_list_items_bloc/personal_list_items_bloc.dart';
import 'package:easy_doctor/src/models/personal_list_model.dart';
import 'package:easy_doctor/src/ui/views/personal_list_item/personal_list_item_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PersonalListItemView extends StatefulWidget {
  const PersonalListItemView({Key? key, required this.list}) : super(key: key);

  final PersonalListModel list;

  @override
  State<StatefulWidget> createState() => _PersonalListItemViewState();
}

class _PersonalListItemViewState extends State<PersonalListItemView> {
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: BlocConsumer<PersonalListItemsBloc, PersonalListItemsState>(
        listener: (BuildContext context, PersonalListItemsState state) {
          if (state is PersonalListItemsFailed) {
            ScaffoldMessenger.of(context)
              ..hideCurrentSnackBar()
              ..showSnackBar(SnackBar(
                content: Text(state.error),
                backgroundColor: Colors.red,
              ));
          }
        },
        builder: (BuildContext context, PersonalListItemsState state) {
          return PersonalListItemList(
            list: widget.list,
            isLoading: state is PersonalListLoading,
            errorMessage: state is PersonalListItemsFailed ? state.error : null,
          );
        },
      ),
    );
  }
}
