import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'cry_input.dart';

class CryInputNum extends CryInput {
  CryInputNum({
    Key key,
    double width,
    String label,
    String labelText,
    num value,
    bool enable,
    ValueChanged onChange,
    FormFieldSetter<num> onSaved,
    FormFieldValidator<String> validator,
    bool border = false,
  }) : super(
          key: key,
          border: border,
          width: width,
          label: label,
          labelText: labelText,
          value: value?.toString(),
          enable: enable,
          onChange: onChange,
          onSaved: (String v) {
            onSaved((v == null || v.length == 0) ? 0 : num.parse(v));
          },
          validator: validator,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly,
          ],
        );
}
