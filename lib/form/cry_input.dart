/// @author: cairuoyu
/// @homepage: http://cairuoyu.com
/// @github: https://github.com/cairuoyu/cry、https://github.com/cairuoyu/flutter_admin
/// @date: 2021/6/21
/// @version: 1.0
/// @description:

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'cry_form_field.dart';

class CryInput extends CryFormField {
  CryInput({
    Key? key,
    double? width,
    double? padding,
    double? contentPadding,
    int? maxLines,
    String? label,
    String? value,
    ValueChanged? onChange,
    FormFieldSetter<String>? onSaved,
    FormFieldValidator<String>? validator,
    bool? enable,
    bool required = false,
    List<TextInputFormatter>? inputFormatters,
  }) : super(
          key: key,
          width: width,
          padding: padding,
          builder: (CryFormFieldState state) {
            return TextFormField(
              maxLines: maxLines,
              decoration: InputDecoration(
                enabled: enable ?? true,
                labelText: label,
                contentPadding: EdgeInsets.symmetric(horizontal: contentPadding ?? 10),
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
                if (required && v!.isEmpty) {
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
