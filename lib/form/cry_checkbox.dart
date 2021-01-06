import 'package:flutter/material.dart';

class CryCheckbox extends StatefulWidget {
  final String label;
  final bool value;
  final ValueChanged<bool> onChanged;

  CryCheckbox(this.label, this.value, this.onChanged);

  @override
  _CryCheckboxState createState() => _CryCheckboxState();
}

class _CryCheckboxState extends State<CryCheckbox> {
  bool _value;

  @override
  void initState() {
    _value = widget.value;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var result = Container(
      padding: EdgeInsets.all(20),
      child: Wrap(
        children: [
          Text(widget.label),
          Checkbox(
            value: _value,
            onChanged: (v) {
              this._value = v;
              widget.onChanged(v);
              setState(() {});
            },
          ),
        ],
      ),
    );
    return result;
  }
}
