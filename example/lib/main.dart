import 'package:cry/cry_image_upload.dart';
import 'package:cry/cry_button.dart';
import 'package:cry/cry_tree_table.dart';
import 'package:cry/form/cry_input.dart';
import 'package:cry/form/cry_select.dart';
import 'package:cry/form1/cry_input.dart' as cryInput1;
import 'package:cry/form1/cry_select.dart' as crySelect1;
import 'package:cry/vo/select_option_vo.dart';
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
            DemoForm(),
            DemoImageUpload(),
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

class DemoForm extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var input = CryInput(label: 'testInput');
    var input1 = cryInput1.CryInput(label: 'testInput1');
    var select = CrySelect(
      label: 'testSelect',
      dataList: [
        SelectOptionVO(label: '1', value: 'a'),
        SelectOptionVO(label: '2', value: 'b'),
      ],
    );
    var select1 = crySelect1.CrySelect(
      label: 'testSelect1',
      dataList: [
        SelectOptionVO(label: '1', value: 'a'),
        SelectOptionVO(label: '2', value: 'b'),
      ],
    );
    return Column(
      children: [
        input,
        select,
        input1,
        select1,
      ],
    );
  }
}

class DemoImageUpload extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var imageUpload = CryImageUpload(
      updateAreaSize: 200,
      updateAreaDefault: Icon(Icons.person, size: 200),
      onUpload: (imageBytes) {
        print('onUpload');
      },
    );
    return imageUpload;
  }
}

