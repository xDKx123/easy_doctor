import 'package:easy_doctor/src/blocs/personal_list_bloc/personal_list_bloc.dart';
import 'package:easy_doctor/src/models/personal_list_model.dart';
import 'package:easy_doctor/src/ui/views/personal_list/forms/create_personal_list_form.dart';
import 'package:easy_doctor/src/ui/views/personal_list/personal_list_list_item.dart';
import 'package:easy_doctor/src/ui/widgets/app_drawer/app_drawer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PersonalListList extends StatefulWidget {
  const PersonalListList(
      {Key? key,
      required this.items,
      required this.isLoading,
      this.errorMessage})
      : super(key: key);

  final List<PersonalListModel> items;
  final bool isLoading;
  final String? errorMessage;

  @override
  State<StatefulWidget> createState() => _PersonalListListState();
}

class _PersonalListListState extends State<PersonalListList> {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    Widget buildMainContext() {
      if (widget.isLoading) {
        return const SliverFillRemaining(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }

      if (widget.items.isEmpty) {
        return const SliverFillRemaining(
            child: Center(
          child: Text('No items to display'),
        ));
      }

      return SliverList(
        delegate: SliverChildBuilderDelegate(
          (BuildContext context, int index) {
            return Card(
              color: Theme.of(context).scaffoldBackgroundColor,
              margin: const EdgeInsets.fromLTRB(15, 0, 15, 5),
              child: Container(
                //color: Colors.blue[100 * (index % 9 + 1)],
                alignment: Alignment.center,
                child: PersonalListListItem(
                  listItem: widget.items.elementAt(index),
                ),
              ),
            );
          },
          childCount: widget.items.length, // 1000 list items
        ),
      );
    }

    return Scaffold(
      key: _drawerKey,
      body: RefreshIndicator(
        onRefresh: () async {
          BlocProvider.of<PersonalListBloc>(context)
              .add(const LoadPersonalList());
        },
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              pinned: true,
              flexibleSpace: const FlexibleSpaceBar(
                title: Text('Lists'),
              ),
              automaticallyImplyLeading: false,
              leading: IconButton(
                onPressed: () {
                  _drawerKey.currentState!.openDrawer();
                },
                icon: const Icon(Icons.menu),
              ),
            ),
            buildMainContext(),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () async {
          await Navigator.push(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) => const CreatePersonalListForm(),
            ),
          );

          BlocProvider.of<PersonalListBloc>(context)
              .add(const LoadPersonalList());
        },
        label: const Text('Add new list'),
      ),
      drawer: const AppDrawer(),
    );
  }
}
