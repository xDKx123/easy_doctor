import 'package:easy_doctor/src/blocs/personal_list_bloc/personal_list_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CreatePersonalListForm extends StatefulWidget {
  const CreatePersonalListForm({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _CreatePersonalListFormState();
  }
}

class _CreatePersonalListFormState extends State<CreatePersonalListForm> {
  late PersonalListFormData _personalListForm;

  @override
  void initState() {
    _personalListForm = PersonalListFormData();
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

    Widget buildMainContext() {
      return SliverList(
        delegate: SliverChildListDelegate([
          textInput(
            hintText: 'List name',
            onChanged: (String value) => setState(() {
              _personalListForm.name = value;
            }),
          ),
          textInput(
            hintText: 'Description',
            onChanged: (String value) => _personalListForm.description = value,
          )
        ]),
      );
    }

    List<Widget>? actions() {
      if (_personalListForm.name.isNotEmpty) {
        return <Widget>[
          IconButton(
            onPressed: () async {
              BlocProvider.of<PersonalListBloc>(context).add(
                CreatePersonalList(
                    name: _personalListForm.name,
                    description: _personalListForm.description),
              );
            },
            icon: const Icon(Icons.done),
          ),
        ];
      }
    }

    return BlocConsumer<PersonalListBloc, PersonalListState>(
      listener: (BuildContext context, PersonalListState state) {
        if (state is PersonalListFailed) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(SnackBar(
              content: Text(state.error),
              backgroundColor: Colors.red,
            ));
        } else if (state is PersonalListSuccess) {
          ScaffoldMessenger.of(context)
            ..hideCurrentSnackBar()
            ..showSnackBar(const SnackBar(
              content: Text('Success'),
              backgroundColor: Colors.green,
            ));
          Navigator.pop(context);
        }
      },
      builder: (BuildContext context, PersonalListState state) {
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
      },
    );
  }
}

class PersonalListFormData {
  PersonalListFormData({this.name = '', this.description = ''});

  String name;
  String description;
}
