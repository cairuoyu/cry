import 'package:flutter/material.dart';

class CrySelectCustomWidget<T> extends FormField<String> {
  CrySelectCustomWidget(
    BuildContext context, {
    Key key,
    double width,
    String label,
    String value,
    String valueLabel,
    ValueChanged onChange,
    FormFieldSetter onSaved,
    Function getValueLabel,
    Function getValue,
    Widget popWidget,
  }) : super(
          key: key,
          onSaved: onSaved,
          builder: (FormFieldState<String> field) {
            return TextField(
              controller: TextEditingController(
                text: valueLabel,
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => popWidget),
                ).then((res) {
                  valueLabel = getValueLabel(res);
                  value = getValue(res);
                  field.didChange(value);
                });
              },
              decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(horizontal: 10),
                labelText: label,
              ),
            );
          },
        );
}
