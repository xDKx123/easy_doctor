import 'package:easy_doctor/src/blocs/personal_list_bloc/personal_list_bloc.dart';
import 'package:easy_doctor/src/models/personal_list_model.dart';
import 'package:easy_doctor/src/ui/views/personal_list/personal_list_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PersonalListView extends StatefulWidget {
  const PersonalListView({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _PersonalListViewState();
}

class _PersonalListViewState extends State<PersonalListView> {
  @override
  Widget build(BuildContext context) {
    if (BlocProvider.of<PersonalListBloc>(context).state
        is PersonalListNotLoaded) {
      BlocProvider.of<PersonalListBloc>(context).add(const LoadPersonalList());
    }

    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: BlocConsumer<PersonalListBloc, PersonalListState>(
        listener: (BuildContext context, PersonalListState state) {},
        builder: (BuildContext context, PersonalListState state) {
          return PersonalListList(
            items: state is PersonalListLoaded
                ? state.items
                : <PersonalListModel>[],
            isLoading: state is PersonalListLoading,
            errorMessage: null,
          );
        },
      ),
    );
  }
}
