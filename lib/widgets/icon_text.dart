import 'package:flutter/material.dart';

class IconWithText extends StatelessWidget {
  //  Declare variables
  final Icon iconName;
  final String textName;

  const IconWithText({Key key, this.iconName, this.textName}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          iconName,
          SizedBox(
            width: 5.0,
          ),
          Text(textName),
        ],
      ),
    );
  }
}
