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
  late TextEditingController _deadlineTextController;

  @override
  void initState() {
    _createPersonalListItemData =
        CreatePersonalListItemData(listID: widget.listID);
    _deadlineTextController = TextEditingController(text: '');
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

    Widget _showDatePicker() {
      return Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: TextFormField(
          controller: _deadlineTextController,
          decoration: const InputDecoration(
            border: OutlineInputBorder(),
            hintText: 'Deadline',
          ),
          showCursor: true,
          readOnly: true,
          onTap: () async {
            final DateTime? deadline = await showDatePicker(
                context: context,
                initialDate:
                    _createPersonalListItemData.deadline ?? DateTime.now(),
                firstDate: DateTime(2015),
                lastDate: DateTime(2101));

            setState(() {
              _createPersonalListItemData.deadline = deadline;
              _deadlineTextController.text = deadline?.toString() ?? '';
              //_deadlineTextController.clear();
            });
          },
        ),
      );
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
          _showDatePicker(),
        ]),
      );
    }

    List<Widget>? actions() {
      if (_createPersonalListItemData.name.isNotEmpty &&
          _createPersonalListItemData.deadline != null) {
        return <Widget>[
          IconButton(
            onPressed: () async {
              BlocProvider.of<PersonalListItemsBloc>(context).add(
                CreatePersonalListItem(
                    name: _createPersonalListItemData.name,
                    description: _createPersonalListItemData.description,
                    listID: _createPersonalListItemData.listID,
                    deadline: _createPersonalListItemData.deadline!),
              );
            },
            icon: const Icon(Icons.done),
          ),
        ];
      }
    }

    return BlocConsumer<PersonalListItemsBloc, PersonalListItemsState>(
      listener: (BuildContext context, PersonalListItemsState state) {
        if (state is PersonalListItemsFailed) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
              content: Text(state.error),
              backgroundColor: Colors.red,
            ));
        } else if (state is PersonalListItemsSuccess) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(const SnackBar(
              content: Text('Success'),
              backgroundColor: Colors.green,
            ));
          Navigator.pop(context);
        }
      },
      builder: (BuildContext context, PersonalListItemsState state) {
        return Scaffold(
          body: CustomScrollView(
            slivers: <Widget>[
              SliverAppBar(
                pinned: true,
                flexibleSpace: const FlexibleSpaceBar(
                  title: Text('Create list item'),
                ),
                actions: actions(),
              ),
              buildMainContext(),
            ],
          ),
        );
      },
    );
  }
}

class CreatePersonalListItemData {
  CreatePersonalListItemData(
      {this.name = '',
      this.description = '',
      this.deadline,
      required this.listID});
  String name;
  String description;
  DateTime? deadline;
  PersonalListID listID;
}
