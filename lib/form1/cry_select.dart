import 'package:cry/vo/select_option_vo.dart';
import 'package:flutter/material.dart';
import 'cry_from_field.dart';

class CrySelect extends CryFormField {
  CrySelect({
    Key? key,
    String? label,
    String? value,
    ValueChanged? onChange,
    FormFieldSetter? onSaved,
    List<SelectOptionVO> dataList = const [],
  }) : super(
          key: key,
          label: label,
          builder: (CryFormFieldState state) {
            return DropdownButtonFormField<String>(
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                border: OutlineInputBorder(),
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
              onSaved: (v) {
                if (onSaved != null) {
                  onSaved(v);
                }
              },
            );
          },
        );
}
