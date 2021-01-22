import 'package:date_format/date_format.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiver/strings.dart';

import 'cry_form_field.dart';

class CrySelectDate extends CryFormField {
  CrySelectDate({
    Key key,
    double width,
    String value,
    String label,
    double labelWidth,
    String labelText,
    ValueChanged onChange,
    FormFieldSetter onSaved,
    BuildContext context,
    bool border = false,
  }) : super(
          key: key,
          border: border,
          width: width,
          label: label,
          labelWidth: labelWidth,
          builder: (CryFormFieldState state) {
            return TextFormField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                labelText: labelText,
                border: border == null || border == false ? null : OutlineInputBorder(),
              ),
              controller: TextEditingController(text: value),
              onChanged: (v) {
                if (onChange != null) {
                  onChange(v);
                }
              },
              onTap: () async {
                DateTime valueDt = isBlank(value) ? DateTime.now() : DateTime.parse(value);
                final DateTime picked = await showDatePicker(
                  context: context,
                  initialDate: valueDt,
                  firstDate: DateTime(1900, 1),
                  lastDate: DateTime(2101, 12),
                );
                if (picked != null) {
                  value = formatDate(picked, [yyyy, '-', mm, '-', dd]);
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
