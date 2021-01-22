import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'cry_form_field.dart';

class CryInput extends CryFormField {
  CryInput({
    Key key,
    double width,
    double padding,
    double contentPadding,
    int maxLines,
    String label,
    double labelWidth,
    String labelText,
    String value,
    ValueChanged onChange,
    FormFieldSetter<String> onSaved,
    FormFieldValidator<String> validator,
    bool enable,
    List<TextInputFormatter> inputFormatters,
    bool required = false,
    bool border = false,
  }) : super(
          key: key,
          border: border,
          width: width,
          padding: padding,
          label: label,
          labelWidth: labelWidth,
          builder: (CryFormFieldState state) {
            return TextFormField(
              maxLines: maxLines,
              decoration: InputDecoration(
                enabled: enable ?? true,
                labelText: labelText,
                contentPadding:
                    border == null || border == false ? EdgeInsets.symmetric(horizontal: contentPadding ?? 10) : EdgeInsets.symmetric(horizontal: 10),
                border: border == null || border == false ? null : OutlineInputBorder(),
              ),
              controller: TextEditingController(text: value),
              inputFormatters: inputFormatters ?? [],
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
              validator: (v) {
                if (required && v.isEmpty) {
                  return '必填';
                }
                if (validator != null) {
                  return validator(v);
                }
                return null;
              },
            );
          },
        );
}
