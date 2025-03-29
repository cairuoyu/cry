/// @author: cairuoyu
/// @homepage: http://cairuoyu.com
/// @github: https://github.com/cairuoyu/cry、https://github.com/cairuoyu/flutter_admin
/// @date: 2021/6/21
/// @version: 1.0
/// @description:

import 'package:cry/widgets1.dart';
import 'package:flutter/material.dart';


class CryInput extends CryFormField {
  CryInput({
    Key? key,
    double? width,
    String? label,
    double? labelWidth,
    String? value,
    ValueChanged? onChange,
    FormFieldSetter? onSaved,
    FormFieldValidator<String>? validator,
    bool? enable,
  }) : super(
          key: key,
          width: width,
          label: label,
          labelWidth: labelWidth,
          builder: (state) {
            return TextFormField(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                border: OutlineInputBorder(),
                enabled: enable ?? true,
              ),
              controller: TextEditingController(text: value),
              onChanged: (v) {
                if (onChange != null) {
                  onChange(v);
                }
              },
              onSaved: (v) {
                if (onSaved != null) {
                  onSaved(v);
                }
              },
              validator: validator,
            );
          },
        );
}
