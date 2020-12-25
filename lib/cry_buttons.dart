import 'package:cry/generated/l10n.dart';
import 'package:flutter/material.dart';

import 'cry_button.dart';

class CryButtons {
  CryButtons._();

  static add(context, onPressed) => CryButton(label: S.of(context).add, iconData: Icons.add, onPressed: onPressed);

  static delete(context, onPressed) => CryButton(label: S.of(context).delete, iconData: Icons.delete, onPressed: onPressed);

  static edit(context, onPressed) => CryButton(label: S.of(context).edit, iconData: Icons.edit, onPressed: onPressed);

  static query(context, onPressed) => CryButton(label: S.of(context).query, iconData: Icons.search, onPressed: onPressed);

  static reset(context, onPressed) => CryButton(label: S.of(context).reset, iconData: Icons.refresh, onPressed: onPressed);

  static save(context, onPressed) => CryButton(label: S.of(context).save, iconData: Icons.save, onPressed: onPressed);

  static cancel(context, onPressed) => CryButton(label: S.of(context).cancel, iconData: Icons.cancel, onPressed: onPressed);

  static commit(context, onPressed) => CryButton(label: S.of(context).commit, iconData: Icons.done, onPressed: onPressed);
}
