import 'package:flutter/material.dart';

class IconDescriptionWidget extends StatelessWidget {
   IconDescriptionWidget({Key? key, required this.icon, required this.value1, this.value2}) : super(key: key);

  IconData icon;
  int value1;
  int ?value2;

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    double iconSize = screenWidth /14;
    double fontSize = screenWidth /18;
    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Icon(
            icon,
            size: iconSize,
          ),
        ),
        Text(
          value2 != null? '${value1} - ${value2}': '${value1}',
          style: TextStyle(
            fontSize: fontSize,
          ),
        ),
      ],
    );
  }
}
