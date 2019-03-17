import 'package:flutter/material.dart';

class ProductTitle extends StatelessWidget {
    final String title;
    final double fontSize;
    final FontWeight fontWeight;

    ProductTitle(this.title, this.fontSize, this.fontWeight);

    @override
    Widget build(BuildContext context) {
        return Text(
            title,
            style: TextStyle(
                fontSize: fontSize,
                fontWeight: fontWeight,
                fontFamily: 'Oswald',
            ),
        );
    }
}
