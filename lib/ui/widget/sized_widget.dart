import 'package:flutter/cupertino.dart';

class FullSizedBox extends SizedBox {
  const FullSizedBox({super.key, super.child})
    : super(height: double.infinity, width: double.infinity);
}

class FullHeight extends SizedBox {
  const FullHeight({super.key, super.child, super.width})
    : super(height: double.infinity);
}
