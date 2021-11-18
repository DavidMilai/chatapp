import 'package:flutter/material.dart';

class CircularMaterialSpinner extends StatelessWidget {
  final bool loading;
  final double height, strokeWidth, width;
  final Widget child;
  final color;

  CircularMaterialSpinner(
      {this.color,
      required this.loading,
      this.height = 25,
      this.width = 25,
      required this.child,
      this.strokeWidth = 4.0});

  @override
  Widget build(BuildContext context) {
    if (loading) {
      return Center(
        child: SizedBox(
          height: height,
          width: width,
          child: CircularProgressIndicator(
              strokeWidth: strokeWidth,
              valueColor: (color != null)
                  ? AlwaysStoppedAnimation<Color>(color)
                  : AlwaysStoppedAnimation<Color>(
                      Theme.of(context).accentColor)),
        ),
      );
    } else {
      return Container(
        child: child,
      );
    }
  }
}
