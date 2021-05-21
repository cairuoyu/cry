import 'dart:io';

import 'package:cry/cry.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CryUtils {
  static OverlayEntry? loadingOE;


  static void message(String message, {int duration = 2}) {
    if (!kIsWeb && Platform.isWindows) {
      ScaffoldMessenger.of(Cry.context).hideCurrentSnackBar();
      ScaffoldMessenger.of(Cry.context).showSnackBar(SnackBar(
        content: Text(message),
      ));
    } else {
      Fluttertoast.showToast(
        msg: message,
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.red,
        textColor: Colors.white,
        fontSize: 16.0,
      );
    }
  }

  static void loading({bool tapClose = false}) {
    if (loadingOE != null) {
      return;
    }
    var child = Container(
        child: tapClose
            ? InkWell(
                child: Center(child: CircularProgressIndicator()),
                onTap: () => loaded(),
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
        decoration: new BoxDecoration(
          color: Colors.transparent,
        ));
    loadingOE = OverlayEntry(builder: (c) => child);

    Overlay.of(Cry.context)!.insert(loadingOE!);
  }

  static void loaded() {
    if (loadingOE == null) {
      return;
    }
    loadingOE!.remove();
    loadingOE = null;
  }
}
