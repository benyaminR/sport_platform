import 'package:flutter/material.dart';
import 'package:sport_platform/container.dart';

void main() {
  configureDependencies();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  MyApp({this.title});

  final Widget title;

  @override
  MyAppState createState() => new MyAppState();
}

class MyAppState extends State<MyApp> {
  var buttonText = ["E-Mail", "Facebook", "Apple", "Google", "ohne Anmeldung"];
  var routes = [
    "EMailRoute()",
    "FacebookRoute()",
    "AppleRoute()",
    "GoogleRoute()",
    "OhneAnmeldungRoute()"
  ];

  List<Widget> routes2 = [];
  // routes2.add(EMailRoute());

  List<Widget> listGenerator() {
    List<Widget> list = [];

    for (var x = 0; x < buttonText.length; x++) {
      list.add(Padding(
        padding:
            const EdgeInsets.only(left: 8.0, top: 8.0, right: 8.0, bottom: 8.0),
        child: ElevatedButton(
          child: new Text(
            "${buttonText[x]}",
            textAlign: TextAlign.start,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => OhneAnmeldungRoute()), //routes[x]
            );
          },
        ),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return new MaterialApp(
      home: new Scaffold(
        appBar: new AppBar(
          title: widget.title,
        ),
        body: SingleChildScrollView(
          child: new Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: listGenerator()),
        ),
        backgroundColor: Colors.black,
      ),
    );
  }
}

// class EMailLogin extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Text('Cool App!'),
//       ),
//     );
//   }
// }
//
// class GoogleMailLogin extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Text('Cool App!'),
//       ),
//     );
//   }
// }
//
// class FacebookLogin extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Text('Cool App!'),
//       ),
//     );
//   }
// }
//
// class AppleIdLogin extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Text('Cool App!'),
//       ),
//     );
//   }
// }

class OhneAnmeldungRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Second Route"),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text('Go back!'),
        ),
      ),
    );
  }
}
