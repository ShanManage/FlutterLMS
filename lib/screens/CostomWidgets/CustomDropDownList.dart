import 'package:flutter/material.dart';

class CustomDropDownList extends StatefulWidget {
  List<DropdownMenuItem<String>> _list;
  String dropdownValue;
  String lable;
  CustomDropDownList(@required this._list, this.dropdownValue, this.lable);

  @override
  _CustomDropDownListState createState() => _CustomDropDownListState();
}

class _CustomDropDownListState extends State<CustomDropDownList> {
  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField(
      decoration: InputDecoration(
          contentPadding: EdgeInsets.fromLTRB(0, 5.5, 0, 0),
          labelStyle: TextStyle(),
          labelText: this.widget.lable,
          border: OutlineInputBorder()),
      items: this.widget._list,
      value: this.widget.dropdownValue,
      onChanged: (value) {
        setState(() {
          this.widget.dropdownValue = value;
        });
      },
    );
  }
}
