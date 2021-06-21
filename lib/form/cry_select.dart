/// @author: cairuoyu
/// @homepage: http://cairuoyu.com
/// @github: https://github.com/cairuoyu/cry、https://github.com/cairuoyu/flutter_admin
/// @date: 2021/6/21
/// @version: 1.0
/// @description:

import 'package:cry/vo/select_option_vo.dart';
import 'package:flutter/material.dart';
import 'cry_form_field.dart';

class CrySelect extends CryFormField {
  CrySelect({
    Key? key,
    double? width,
    String? label,
    String? value,
    ValueChanged? onChange,
    FormFieldSetter? onSaved,
    List<SelectOptionVO> dataList = const [],
  }) : super(
          key: key,
          width: width,
          builder: (CryFormFieldState state) {
            return DropdownButtonFormField<String>(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                labelText: label,
              ),
              value: value,
              items: dataList.map((v) {
                return DropdownMenuItem<String>(
                  value: v.value as String?,
                  child: Text(v.label!),
                );
              }).toList(),
              onChanged: (v) {
                value = v;
                if (onChange != null) {
                  onChange(v);
                }
                state.didChange();
              },
              onSaved: onSaved,
            );
          },
        );
}
