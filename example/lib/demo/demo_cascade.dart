import 'package:cry/cry_cascade.dart';
import 'package:cry/data/location.dart';
import 'package:cry/form/index.dart';
import 'package:flutter/material.dart';

class DeomCascade extends StatefulWidget {
  @override
  _DeomCascadeState createState() => _DeomCascadeState();
}

class _DeomCascadeState extends State<DeomCascade> {
  @override
  Widget build(BuildContext context) {
    var result = CrySelectCustomWidget(
      context,
      popWidget: CryCascade(
        data: pca,
        title: '中国',
      ),
      getValue: (v) => v['code'],
      getValueLabel: (v) => v['name'],
    );
    return result;
  }
}
