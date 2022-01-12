import 'package:easy_doctor/src/models/personal_list_model.dart';
import 'package:easy_doctor/src/ui/views/personal_list/forms/update_personal_list_form.dart';
import 'package:easy_doctor/src/ui/views/personal_list_item/personal_list_item_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PersonalListListItem extends StatefulWidget {
  const PersonalListListItem({Key? key, required this.listItem})
      : super(key: key);

  final PersonalListModel listItem;

  @override
  State<StatefulWidget> createState() => _PersonalListListItemState();
}

class _PersonalListListItemState extends State<PersonalListListItem> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        alignment: Alignment.center,
        child: InkWell(
          onLongPress: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => UpdatePersonalListForm(
                  model: widget.listItem,
                ),
              ),
            );
          },
          onTap: () async {
            await Navigator.push(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) => PersonalListItemView(
                  list: widget.listItem,
                ),
              ),
            );
          },
          child: ListTile(
            title: Text(widget.listItem.description),
            trailing: widget.listItem.items.isNotEmpty
                ? const Icon(Icons.arrow_forward_ios_outlined)
                : null,
            subtitle: Text(widget.listItem.description),
          ),
        ),
      ),
    );
  }
}
