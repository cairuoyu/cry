import 'package:flutter/material.dart';
import 'cry_form_field.dart';

class CrySelect extends CryFormField {
  CrySelect({
    Key key,
    double width,
    String label,
    String value,
    ValueChanged onChange,
    FormFieldSetter onSaved,
    Map<String, dynamic> dataList = const {},
    bool border = false,
  }) : super(
          key: key,
          border: border,
          label: label,
          width: width,
          builder: (CryFormFieldState state) {
            return DropdownButtonFormField<String>(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                // labelText: border == null || border == false ? null : label,
                border: border == null || border == false ? null : OutlineInputBorder(),
              ),
              value: value,
              items: dataList.keys.map((k) {
                return DropdownMenuItem<String>(
                  value: k,
                  child: Text(dataList[k]),
                );
              }).toList(),
              onChanged: (v) {
                value = v;
                if (onChange != null) {
                  onChange(v);
                }
                state.didChange();
              },
              onSaved: (v) {
                if (onSaved != null) {
                  onSaved(v);
                }
              },
            );
          },
        );
}
