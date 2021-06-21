/// @author: cairuoyu
/// @homepage: http://cairuoyu.com
/// @github: https://github.com/cairuoyu/cry、https://github.com/cairuoyu/flutter_admin
/// @date: 2021/6/21
/// @version: 1.0
/// @description:

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'cry_input.dart';

class CryInputNum extends CryInput {
  CryInputNum({
    Key? key,
    double? width,
    String? label,
    num? value,
    bool? enable,
    ValueChanged? onChange,
    FormFieldSetter<num>? onSaved,
    FormFieldValidator<String>? validator,
  }) : super(
          key: key,
          width: width,
          label: label,
          value: value?.toString(),
          enable: enable,
          onChange: onChange,
          onSaved: (String? v) {
            onSaved!((v == null || v.length == 0) ? 0 : num.parse(v));
          },
          validator: validator,
          inputFormatters: <TextInputFormatter>[
            FilteringTextInputFormatter.digitsOnly,
          ],
        );
}
