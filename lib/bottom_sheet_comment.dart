import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sport_platform/utils/components/profile_picture.dart';

void onButtonPressedComment(context) {
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
            height: 400,
            child: _buildBottomNavigationMenu(context),
          ),
        );
      });
}

SafeArea _buildBottomNavigationMenu(context) {
  final String _bildbeschreibung =
      "Ich habe seit über 10 Jahren Berufserfahrung gesammelt im Bereich Sport und bin jetzt bereit dafür dieses Wissen auch an meine Kunden weiterzugeben. Ich hoffe du lernst etwas neues für dich selbst.";

  return SafeArea(
    child: SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Row(
                children: [
                  ProfilePicture(url: 'null', size: 20.0,),
                  Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Stella",
                          style: TextStyle(
                            fontSize: 15,
                            color: Color(0xFFFFFFFF),
                          ),
                        ),
                        Text(
                          "Berlin, Deutschland",
                          style: TextStyle(
                            fontSize: 10,
                            color: Color(0xFF707070),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 150,
                  ),
                  Icon(Icons.star, size: 25.0, color: Colors.white),
                  Icon(Icons.star, size: 25.0, color: Colors.white),
                  Icon(Icons.star, size: 25.0, color: Colors.white),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(top: 16.0),
                child: Text(
                  _bildbeschreibung,
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF707070),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Padding(
                padding: EdgeInsets.only(top: 16.0),
                child: Text(
                  _bildbeschreibung,
                  style: TextStyle(
                    fontSize: 14,
                    color: Color(0xFF707070),
                  ),
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Kommentiere hier...',
                  hintStyle: new TextStyle(
                    color: Color(0xFF707070),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Color(0xFF707070)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}

void _selectItem(String name, context) {
  Navigator.pop(context);
  print(name);
}
