import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sport_platform/features/authentication/presentation/bloc/authentication/controller.dart';


//Startseite ist ein View und dort fügt man dann die "Baukasten"-Views ein (--> Komponenten)

//steuert Komponenten

void main() => runApp(new BewertungView());

class BewertungView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: new MyHomePage(),
    );
  }
}


class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  //Fields in a Widget subclass are always marked "final".

  static final String title = 'Flutter Demo Home Page';

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}


//State == Model

class _MyHomePageState extends State<MyHomePage> {
  final Controller _con = Controller.con;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    );
  }
}


