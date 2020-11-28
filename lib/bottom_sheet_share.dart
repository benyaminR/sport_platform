import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void onButtonPressedShare(context) {
  showModalBottomSheet(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(30),
          topRight: const Radius.circular(30),
        ),
      ),
      backgroundColor: Color(0xFF141416),
      context: context,
      builder: (context) {
        return Container(
          // height: MediaQuery.of(context).size.height,
          // width: MediaQuery.of(context).size.width,

          child: Container(
            height: 180,
            child: _buildBottomNavigationMenu(context),
          ),
        );
      });
}

Column _buildBottomNavigationMenu(context) {
  return Column(
    children: <Widget>[
      ListTile(
        leading: Icon(Icons.add_ic_call_rounded, size: 40.0, color: Colors.white),
        title: Text("WhatsApp", style: TextStyle(fontSize: 20.0, color: Colors.white),),
        onTap: () => _selectItem("WhatsApp", context),
      ),
      ListTile(
        leading: Icon(Icons.face, size: 40.0, color: Colors.white),
        title: Text("Facebook", style: TextStyle(fontSize: 20.0, color: Colors.white),),
        onTap: () => _selectItem("Facebook", context),
      ),
      ListTile(
        leading: Icon(Icons.mail_rounded, size: 40.0, color: Colors.white),
        title: Text("E-Mail", style: TextStyle(fontSize: 20.0, color: Colors.white),),
        onTap: () => _selectItem("E-Mail", context),
      ),
    ],
  );
}

void _selectItem(String name, context) {
  Navigator.pop(context);
  print(name);
}
