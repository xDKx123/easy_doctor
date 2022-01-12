import 'package:easy_doctor/src/blocs/personal_list_items_bloc/personal_list_items_bloc.dart';
import 'package:easy_doctor/src/models/personal_list_model.dart';
import 'package:easy_doctor/src/ui/views/personal_list_item/forms/create_personal_list_item_form.dart';
import 'package:easy_doctor/src/ui/views/personal_list_item/personal_list_item_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PersonalListItemList extends StatefulWidget {
  const PersonalListItemList(
      {Key? key,
      required this.list,
      required this.isLoading,
      this.errorMessage})
      : super(key: key);

  final PersonalListModel list;
  final bool isLoading;
  final String? errorMessage;

  @override
  State<StatefulWidget> createState() => _PersonalListItemListState();
}

class _PersonalListItemListState extends State<PersonalListItemList> {
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

      if (widget.list.items.isEmpty) {
        return const SliverFillRemaining(
          child: Center(
            child: Text('No items to display'),
          ),
        );
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
                child: PersonalListItemListItem(
                  listItem: widget.list.items.elementAt(index),
                ),
              ),
            );
          },
          childCount: widget.list.items.length, // 1000 list items
        ),
      );
    }

    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          BlocProvider.of<PersonalListItemsBloc>(context)
              .add(LoadPersonalListItems(list: widget.list));
        },
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(widget.list.name),
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
              builder: (BuildContext context) => CreatePersonalListItemForm(
                listID: widget.list.id!,
              ),
            ),
          );

          BlocProvider.of<PersonalListItemsBloc>(context)
              .add(LoadPersonalListItems(list: widget.list));
        },
        label: const Text('Add new list item'),
      ),
    );
  }
}
