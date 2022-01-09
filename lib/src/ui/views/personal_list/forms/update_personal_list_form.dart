import 'package:easy_doctor/src/blocs/personal_list_bloc/personal_list_bloc.dart';
import 'package:easy_doctor/src/models/personal_list_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdatePersonalListForm extends StatefulWidget {
  const UpdatePersonalListForm({Key? key, required this.model})
      : super(key: key);

  final PersonalListModel model;

  @override
  State<StatefulWidget> createState() {
    return _UpdatePersonalListFormState();
  }
}

class _UpdatePersonalListFormState extends State<UpdatePersonalListForm> {
  late EditPersonalListFormData _editPersonalListForm;

  @override
  void initState() {
    _editPersonalListForm = EditPersonalListFormData(
      id: widget.model.id!,
      name: widget.model.name,
      description: widget.model.description,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget _textInput(
        {required String hintText,
        required String initialValue,
        required ValueChanged<String>? onChanged}) {
      return Padding(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: TextFormField(
          initialValue: initialValue,
          decoration: InputDecoration(
            border: const OutlineInputBorder(),
            hintText: hintText,
          ),
          onChanged: onChanged,
        ),
      );
    }

    Widget _buildMainContext() {
      return SliverList(
        delegate: SliverChildListDelegate([
          _textInput(
            hintText: 'List name',
            initialValue: _editPersonalListForm.name,
            onChanged: (String value) => setState(() {
              _editPersonalListForm.name = value;
            }),
          ),
          _textInput(
            hintText: 'Description',
            initialValue: _editPersonalListForm.name,
            onChanged: (String value) => setState(() {
              _editPersonalListForm.description = value;
            }),
          )
        ]),
      );
    }

    List<Widget>? _actions() {
      if (_editPersonalListForm.name != widget.model.name ||
          _editPersonalListForm.description != widget.model.description) {
        return <Widget>[
          IconButton(
            onPressed: () async {
              BlocProvider.of<PersonalListBloc>(context).add(
                UpdatePersonalList(
                  id: _editPersonalListForm.id,
                  name: _editPersonalListForm.name,
                  description: _editPersonalListForm.description,
                ),
              );
            },
            icon: const Icon(Icons.done),
          ),
        ];
      }
    }

    Widget? _floatingActionButton() {
      if (widget.model.items.isEmpty) {
        return FloatingActionButton.extended(
          onPressed: () async {
            BlocProvider.of<PersonalListBloc>(context).add(
              RemovePersonalList(id: widget.model.id!),
            );
          },
          label: const Text('Remove'),
        );
      }
    }

    return Scaffold(
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
            pinned: true,
            flexibleSpace: const FlexibleSpaceBar(
              title: Text('Update list'),
            ),
            actions: _actions(),
          ),
          _buildMainContext(),
        ],
      ),
      floatingActionButton: _floatingActionButton(),
    );
  }
}

class EditPersonalListFormData {
  EditPersonalListFormData(
      {required this.id, required this.name, required this.description});

  late PersonalListID id;
  late String name;
  late String description;
}
