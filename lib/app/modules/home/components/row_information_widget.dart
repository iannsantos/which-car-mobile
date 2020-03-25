import 'package:flutter/material.dart';

class RowInformationWidget extends StatelessWidget {
  final String label;
  final String text;

  const RowInformationWidget({Key key, this.label, this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Text(
          '$label: ',
          style: TextStyle(
            fontSize: 24,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          '$text',
          style: TextStyle(
            color: Colors.white70,
            fontSize: 24,
          ),
        ),
      ],
    );
  }
}
