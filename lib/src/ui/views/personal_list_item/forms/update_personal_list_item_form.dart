import 'package:easy_doctor/src/blocs/personal_list_items_bloc/personal_list_items_bloc.dart';
import 'package:easy_doctor/src/models/personal_list_item_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UpdatePersonalListItemForm extends StatefulWidget {
  const UpdatePersonalListItemForm({Key? key, required this.model})
      : super(key: key);

  final PersonalListItemModel model;

  @override
  State<StatefulWidget> createState() {
    return _UpdatePersonalListItemFormState();
  }
}

class _UpdatePersonalListItemFormState
    extends State<UpdatePersonalListItemForm> {
  late UpdatePersonalListItemData _updatePersonalListItemData;
  late TextEditingController _deadlineTextController;

  @override
  void initState() {
    super.initState();
    _updatePersonalListItemData = UpdatePersonalListItemData(
      id: widget.model.id!,
      name: widget.model.name,
      deadline: widget.model.deadline,
      description: widget.model.description,
      completed: widget.model.completed,
    );
    _deadlineTextController =
        TextEditingController(text: widget.model.deadline.toString());
  }

  @override
  void dispose() {
    _deadlineTextController.dispose();
    super.dispose();
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
                    _updatePersonalListItemData.deadline ?? DateTime.now(),
                firstDate: DateTime(2015),
                lastDate: DateTime(2101));

            setState(() {
              _updatePersonalListItemData.deadline = deadline;
              _deadlineTextController.text = deadline?.toString() ?? '';
              //_deadlineTextController.clear();
            });
          },
        ),
      );
    }

    Widget _buildMainContext() {
      return SliverList(
        delegate: SliverChildListDelegate([
          _textInput(
            hintText: 'List name',
            initialValue: _updatePersonalListItemData.name,
            onChanged: (String value) => setState(() {
              _updatePersonalListItemData.name = value;
            }),
          ),
          _textInput(
            hintText: 'Description',
            initialValue: _updatePersonalListItemData.description,
            onChanged: (String value) =>
                _updatePersonalListItemData.description = value,
          ),
          _showDatePicker(),
        ]),
      );
    }

    List<Widget>? _actions() {
      if (_updatePersonalListItemData.name != widget.model.name ||
          _updatePersonalListItemData.description != widget.model.description ||
          _updatePersonalListItemData.deadline != widget.model.deadline &&
              _updatePersonalListItemData.deadline != null) {
        return <Widget>[
          IconButton(
            onPressed: () async {
              BlocProvider.of<PersonalListItemsBloc>(context).add(
                UpdatePersonalListItem(
                  name: _updatePersonalListItemData.name,
                  description: _updatePersonalListItemData.description,
                  id: _updatePersonalListItemData.id,
                  deadline: _updatePersonalListItemData.deadline!,
                  completed: _updatePersonalListItemData.completed,
                ),
              );
            },
            icon: const Icon(Icons.done),
          ),
        ];
      }
    }

    Widget? _floatingActionButton() {
      return FloatingActionButton.extended(
        onPressed: () async {
          BlocProvider.of<PersonalListItemsBloc>(context).add(
            RemovePersonalListItem(id: widget.model.id!),
          );
        },
        label: const Text('Remove'),
      );
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
                  title: Text('Update list'),
                ),
                actions: _actions(),
              ),
              _buildMainContext(),
            ],
          ),
          floatingActionButton: _floatingActionButton(),
        );
      },
    );
  }
}

class UpdatePersonalListItemData {
  UpdatePersonalListItemData({
    required this.id,
    required this.name,
    required this.description,
    this.deadline,
    required this.completed,
  });

  late PersonalListItemID id;
  late String name;
  late String description;
  late DateTime? deadline;
  late bool completed;
}
