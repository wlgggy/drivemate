import 'package:drivemate/ui/widget/sized_widget.dart';
import 'package:flutter/material.dart';

class Control extends StatefulWidget {
  const Control ({super.key});

  @override
  State<StatefulWidget> createState() => ControlState();
}

class  ControlState extends State<Control> {
  @override
  Widget build(BuildContext context) {
    return Material(child: FullSizedBox());
  }
}
