import 'package:cry/model.dart';
import 'package:cry/utils.dart';
import 'package:cry/vo.dart';
import 'package:cry/data.dart';
import 'package:cry/widgets.dart';
import 'package:cry/widgets1.dart' as form1;
import 'package:flutter/material.dart';

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
      LoggerUtil.info('save');
      formKey.currentState?.save();
      LoggerUtil.info(testValue1);
      LoggerUtil.info(testValue2);
    });
    OverflowBar bb = OverflowBar(children: [reset, save]);
    var cw = CrySelectCustomWidget(
      context,
      width: 400,
      label: '自定义弹窗',
      initialValue: 'v',
      initialValueLabel: 'vl',
      onSaved: (v) {
        LoggerUtil.info('onSave');
        LoggerUtil.info(v);
      },
      popWidget: OverflowBar(
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
    var form1Input = form1.CryInput(label: 'form1Input');
    var form1Select = form1.CrySelect(
      label: 'form1Select',
      dataList: [
        SelectOptionVO(label: '1', value: 'a'),
        SelectOptionVO(label: '2', value: 'b'),
      ],
    );
    var form1SelectDate = form1.CrySelectDate(context, label: 'form1SelectDate');
    var data = pca.map((e) => CascadeModel.fromMap(e)).toList();
    var cascade = CrySelectCustomWidget(
      context,
      label: '级联',
      key: UniqueKey(),
      popWidget: CryCascade(
        data: data,
        title: '中国',
      ),
      getValue: (List<CascadeModel> v) => v.map((e) => e.name).toList().join(','),
      getValueLabel: (List<CascadeModel> v) => v.map((e) => e.name).toList().join(','),
      onSaved: (v) {
        LoggerUtil.info('cascade--onSave:$v');
      },
    );
    var form = Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          bb,
          Divider(height: 20, color: Colors.amber),
          cascade,
          cw,
          input,
          input1,
          Wrap(children: [checkbox1, checkbox2]),
          checkbox1,
          checkbox2,
          select,
          dateSelect,
          Wrap(
            children: [
              form1Input,
              form1Select,
              form1SelectDate,
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
