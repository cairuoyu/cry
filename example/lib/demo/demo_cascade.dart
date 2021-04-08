import 'package:cry/cry_cascade.dart';
import 'package:cry/data/location.dart';
import 'package:flutter/material.dart';

class DeomCascade extends StatefulWidget {
  @override
  _DeomCascadeState createState() => _DeomCascadeState();
}

class _DeomCascadeState extends State<DeomCascade> {
  @override
  Widget build(BuildContext context) {
    return CryCascade(
      data: pca,
      title: '中国',
    );
  }
}
