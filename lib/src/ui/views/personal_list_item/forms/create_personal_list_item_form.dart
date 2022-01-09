import 'package:easy_doctor/src/blocs/personal_list_items_bloc/personal_list_items_bloc.dart';
import 'package:easy_doctor/src/models/personal_list_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreatePersonalListItemForm extends StatefulWidget {
  const CreatePersonalListItemForm({Key? key, required this.listID})
      : super(key: key);

  final PersonalListID listID;

  @override
  State<StatefulWidget> createState() {
    return _CreatePersonalListItemFormState();
  }
}

class _CreatePersonalListItemFormState
    extends State<CreatePersonalListItemForm> {
  late CreatePersonalListItemData _createPersonalListItemData;

  @override
  void initState() {
    _createPersonalListItemData =
        CreatePersonalListItemData(listID: widget.listID);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget textInput(
        {required String hintText, required ValueChanged<String>? onChanged}) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: TextFormField(
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintText: hintText,
          ),
          onChanged: onChanged,
        ),
      );
    }

    Widget _showCupertinoModalPopup() {
      return Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: TextFormField(
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintText: 'Deadline',
          ),
          //onChanged: onChanged,
          onTap: () {
            showCupertinoModalPopup(
              context: context,
              builder: (BuildContext context) {
                return CupertinoDatePicker(
                  onDateTimeChanged: (DateTime value) {
                    _createPersonalListItemData.deadline = value;
                  },
                );
              },
            );
          },
        ),
      );
      //return showCupertinoModalPopup(context: context, builder: builder)
    }

    Widget buildMainContext() {
      return SliverList(
        delegate: SliverChildListDelegate([
          textInput(
            hintText: 'List name',
            onChanged: (String value) => setState(() {
              _createPersonalListItemData.name = value;
            }),
          ),
          textInput(
            hintText: 'Description',
            onChanged: (String value) =>
                _createPersonalListItemData.description = value,
          ),
          _showCupertinoModalPopup(),
        ]),
      );
    }

    List<Widget>? actions() {
      if (_createPersonalListItemData.name.isNotEmpty) {
        return <Widget>[
          IconButton(
            onPressed: () async {
              BlocProvider.of<PersonalListItemsBloc>(context).add(
                CreatePersonalListItem(
                    name: _createPersonalListItemData.name,
                    description: _createPersonalListItemData.description,
                    listID: _createPersonalListItemData.listID,
                    deadline: _createPersonalListItemData.deadline),
              );
            },
            icon: const Icon(Icons.done),
          ),
        ];
      }
    }

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            flexibleSpace: const FlexibleSpaceBar(
              title: Text('Create list'),
            ),
            actions: actions(),
          ),
          buildMainContext(),
        ],
      ),
    );
  }
}

class CreatePersonalListItemData {
  CreatePersonalListItemData(
      {this.name = '', this.description = '', required this.listID});
  String name;
  String description;
  DateTime? deadline;
  PersonalListID listID;
}
