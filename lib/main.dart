import 'package:flutter/material.dart';
import 'transformview.dart';

void main() => runApp(const AppVariada());

class AppVariada extends StatelessWidget {
  const AppVariada({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Actividad 5 U2",
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff2447e5),
          title: Text("Pageview Martin Cobos",
              textScaleFactor: 1.05, style: TextStyle(color: Colors.amber)),
        ),
        body: const PP(),
      ),
    );
  }
}
