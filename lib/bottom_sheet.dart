import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BottomSheet extends StatefulWidget {
  _BottomSheetState createState() => _BottomSheetState();
}

class _BottomSheetState extends State<BottomSheet> {
  String _selectedItem = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
                child: Text("Show"), onPressed: () => _onButtonPressed()),
            Text(
              _selectedItem,
              style: TextStyle(
                fontSize: 30,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _onButtonPressed() {
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Container(
            color: Color(0xFF737373),
            height: 300,
            child: Container(
              child: _buildBottomNavigationMenu(),
              decoration: BoxDecoration(
                color: Theme.of(context).canvasColor,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(30),
                  topRight: const Radius.circular(30),
                ),
              ),
            ),
          );
        });
  }

  Column _buildBottomNavigationMenu() {
    return Column(
      children: <Widget>[
        ListTile(
          leading: Icon(Icons.ac_unit),
          title: Text("Cooling"),
          onTap: () => _selectItem("Cooling"),
        ),
        ListTile(
          leading: Icon(Icons.accessibility_new),
          title: Text("People"),
          onTap: () => _selectItem("People"),
        ),
        ListTile(
          leading: Icon(Icons.assessment),
          title: Text("Stats"),
          onTap: () => _selectItem("Stats"),
        ),
      ],
    );
  }

  void _selectItem(String name) {
    Navigator.pop(context);
    setState(() {
      _selectedItem = name;
    });
  }
}
