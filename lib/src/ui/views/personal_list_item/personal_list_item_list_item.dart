import 'package:easy_doctor/src/models/personal_list_item_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'forms/update_personal_list_item_form.dart';

class PersonalListItemListItem extends StatefulWidget {
  const PersonalListItemListItem({Key? key, required this.listItem})
      : super(key: key);

  final PersonalListItemModel listItem;

  @override
  State<StatefulWidget> createState() => _PersonalListItemListItemState();
}

class _PersonalListItemListItemState extends State<PersonalListItemListItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        alignment: Alignment.center,
        child: InkWell(
          onTap: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => UpdatePersonalListItemForm(
                  model: widget.listItem,
                ),
              ),
            );
          },
          child: ListTile(
            title: Text(widget.listItem.name),
            subtitle: Text(widget.listItem.description),
            trailing: Checkbox(
              value: widget.listItem.completed,
              onChanged: (bool? value) {},
            ),
          ),
        ),
      ),
    );
  }
}
