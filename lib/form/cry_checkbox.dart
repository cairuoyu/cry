import 'package:flutter/material.dart';

class CryCheckbox extends StatelessWidget {
  final String label;
  final bool value;
  final ValueChanged<bool> onChanged;

  CryCheckbox(this.label, this.value, this.onChanged);

  @override
  Widget build(BuildContext context) {
    var result = Container(
      padding: EdgeInsets.all(20),
      child: Row(
        children: [
          Text(label),
          Checkbox(value: value, onChanged: (v) {
            onChanged(v);
          }),
        ],
      ),
    );
    return result;
  }
}
