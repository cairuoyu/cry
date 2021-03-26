import 'package:cry/cry_buttons.dart';
import 'package:cry/vo/select_option_vo.dart';
import 'package:flutter/material.dart';
import 'package:cry/form/cry_checkbox.dart';
import 'package:cry/form/cry_input.dart';
import 'package:cry/form/cry_select.dart';
import 'package:cry/form/cry_select_custom_widget.dart';
import 'package:cry/form/cry_select_date.dart';
import 'package:cry/form1/cry_input.dart' as cryInput1;
import 'package:cry/form1/cry_select.dart' as crySelect1;

class DemoForm extends StatefulWidget {
  @override
  _DemoFormState createState() => _DemoFormState();
}

class _DemoFormState extends State<DemoForm> {
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  String testValue1 = '1';
  bool testValue2 = true;

  @override
  Widget build(BuildContext context) {
    var input = CryInput(
      label: 'testInput',
      value: testValue1,
      onSaved: (v) {
        this.testValue1 = v!;
      },
    );
    var input1 = CryInput(label: 'testInput', width: 400);
    var input2 = cryInput1.CryInput(label: 'testInput1');
    var dateSelect = CrySelectDate(
      context,
      width: 300,
      label: 'testSelectDate',
    );
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
    var checkbox1 = CryCheckbox('checkboxTestLabel', this.testValue2, (v) {
      this.testValue2 = v!;
    });
    var checkbox2 = CryCheckbox('checkboxTestLabel', false, (v) {});
    var reset = CryButtons.reset(context, () {
      this.testValue2 = true;
      formKey.currentState?.reset();
      setState(() {});
    });
    var save = CryButtons.save(context, () {
      print('save');
      formKey.currentState?.save();
      print(testValue1);
      print(testValue2);
    });
    ButtonBar bb = ButtonBar(children: [reset, save]);
    var cw = CrySelectCustomWidget(
      context,
      width: 400,
      label: '自定义',
      initialValue: 'v',
      initialValueLabel: 'vl',
      onSaved: (v) {
        print('onSave');
        print(v);
      },
      popWidget: ButtonBar(
        children: [
          CryButtons.save(context, () {
            Navigator.pop(context, 'save');
          }),
          CryButtons.cancel(context, () {
            Navigator.pop(context, 'cancel');
          })
        ],
      ),
      getValue: (v) {
        return '$v-value';
      },
      getValueLabel: (v) {
        return '$v-valueLabel';
      },
    );
    var form = Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          cw,
          Divider(height: 20, color: Colors.amber),
          bb,
          input,
          input1,
          Wrap(children: [checkbox1, checkbox2]),
          checkbox1,
          checkbox2,
          select,
          dateSelect,
          Wrap(
            children: [
              input2,
              select1,
            ],
          ),
        ],
      ),
    );
    var result = SingleChildScrollView(
      child: form,
    );
    return result;
  }
}
