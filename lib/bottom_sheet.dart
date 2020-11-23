import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void onButtonPressed(context) {
  showModalBottomSheet(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
        topLeft: const Radius.circular(30),
        topRight: const Radius.circular(30),
      )),
      context: context,
      builder: (context) {
        return Container(
          // height: MediaQuery.of(context).size.height,
          // width: MediaQuery.of(context).size.width,

          child: Container(
            height: 300,
            child: _buildBottomNavigationMenu(context),
          ),
        );
      });
}

Column _buildBottomNavigationMenu(context) {
  return Column(
    children: <Widget>[
      ListTile(
        leading: Icon(Icons.mail),
        title: Text("E-Mail"),
        onTap: () => _selectItem("E-Mail", context),
      ),
      ListTile(
        leading: Icon(Icons.accessibility_new),
        title: Text("People"),
        onTap: () => _selectItem("People", context),
      ),
      ListTile(
        leading: Icon(Icons.assessment),
        title: Text("Stats"),
        onTap: () => _selectItem("Stats", context),
      ),
    ],
  );
}

void _selectItem(String name, context) {
  Navigator.pop(context);
  print(name);
}
