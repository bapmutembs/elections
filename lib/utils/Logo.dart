import 'package:flutter/material.dart';

class Logo {
  var path = "images/logo/logo.png";

  Container logo(double? width, double? height) {
    return Container(
      padding: const EdgeInsets.only(top: 50),
      child: Image.asset(
        path,
        width: (width != null) ? width : 100,
        height: (height != null) ? height : 100,
      ),
    );
  }
}
