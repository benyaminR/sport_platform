import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void onButtonPressedAddMedia(context) {
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
            height: 150,
            child: _buildBottomNavigationMenu(context),
          ),
        );
      });
}

Column _buildBottomNavigationMenu(context) {
  return Column(
    children: <Widget>[
      ListTile(
        leading: Icon(Icons.camera_rounded, size: 40.0, color: Colors.white),
        title: Text("Story", style: TextStyle(fontSize: 20.0, color: Colors.white),),
        onTap: () => _selectItem("Story", context),
      ),
      ListTile(
        leading: Icon(Icons.photo_library_outlined, size: 40.0, color: Colors.white),
        title: Text("Post", style: TextStyle(fontSize: 20.0, color: Colors.white),),
        onTap: () => _selectItem("Post", context),
      ),
    ],
  );
}

void _selectItem(String name, context) {
  Navigator.pop(context);
  print(name);
}
