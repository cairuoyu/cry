import 'package:cry/generated/l10n.dart';
import 'package:flutter/material.dart';

import 'cry_button.dart';

class CryButtons {
  CryButtons._();

  static add(context, onPressed, {showLabel: true}) => CryButton(label: showLabel ? S.of(context).add : null, iconData: Icons.add, onPressed: onPressed);

  static delete(context, onPressed, {showLabel: true}) => CryButton(label: showLabel ? S.of(context).delete : null, iconData: Icons.delete, onPressed: onPressed);

  static edit(context, onPressed, {showLabel: true}) => CryButton(label: showLabel ? S.of(context).edit : null, iconData: Icons.edit, onPressed: onPressed);

  static query(context, onPressed, {showLabel: true}) => CryButton(label: showLabel ? S.of(context).query : null, iconData: Icons.search, onPressed: onPressed);

  static reset(context, onPressed, {showLabel: true}) => CryButton(label: showLabel ? S.of(context).reset : null, iconData: Icons.refresh, onPressed: onPressed);

  static save(context, onPressed, {showLabel: true}) => CryButton(label: showLabel ? S.of(context).save : null, iconData: Icons.save, onPressed: onPressed);

  static cancel(context, onPressed, {showLabel: true}) => CryButton(label: showLabel ? S.of(context).cancel : null, iconData: Icons.cancel, onPressed: onPressed);

  static commit(context, onPressed, {showLabel: true}) => CryButton(label: showLabel ? S.of(context).commit : null, iconData: Icons.done, onPressed: onPressed);
}
