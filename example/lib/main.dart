import 'package:cry/cry_button.dart';
import 'package:flutter/material.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cry Demo',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key}) : super(key: key);

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cry Demo Home Page'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            DemoButton(),
          ],
        ),
      ),
    );
  }
}

class DemoButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var button = CryButton(
      iconData: Icons.save,
      label: 'testButton',
      onPressed: () {
        print('testButton');
      },
    );
    return button;
  }
}
