import 'package:flutter/material.dart';

class CrySelectCustomWidget<T> extends FormField<T> {
  CrySelectCustomWidget(
    BuildContext context, {
    Key key,
    double width,
    double padding,
    String label,
    T value,
    String valueLabel,
    ValueChanged onChange,
    FormFieldSetter<T> onSaved,
    Function getValueLabel,
    Function getValue,
    Widget popWidget,
  }) : super(
          key: key,
          initialValue: value,
          onSaved: onSaved,
          builder: (FormFieldState<T> field) {
            return Container(
              padding: EdgeInsets.all(padding ?? 20.0),
              width: width ?? double.infinity,
              child: TextField(
                readOnly: true,
                controller: TextEditingController(
                  text: valueLabel,
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => popWidget),
                  ).then((res) {
                    if (res == null) {
                      return;
                    }
                    valueLabel = getValueLabel(res);
                    value = getValue(res);
                    field.didChange(value);
                  });
                },
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.symmetric(horizontal: 10),
                  labelText: label,
                ),
              ),
            );
          },
        );
}
