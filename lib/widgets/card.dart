import 'package:flutter/material.dart';

class CardInfo extends StatelessWidget {
  // Declare variables
  final String cardName;
  final int cardNumber;

  CardInfo({@required this.cardName, this.cardNumber});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 130,
      width: 110,
      child: Card(
        color: Colors.tealAccent.withOpacity(.75),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15.0),
        ),
        margin: EdgeInsets.all(0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Text(
              cardNumber.toString(),
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 30,
              ),
            ),
            Text(cardName),
          ],
        ),
      ),
    );
  }
}
