import 'package:flutter/material.dart';

class Windialog{

  static void showWinDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
  shape: RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(16.0),
  ),
  backgroundColor: Colors.white,
  title: const Text(
    'Bingo!',
    style: TextStyle(
      fontSize: 24.0,
      fontWeight: FontWeight.bold,
      color: Colors.green, // Change color as needed
    ),
  ),
  content:const Column(
    mainAxisSize: MainAxisSize.min,
    children: [
      Icon(
        Icons.star,
        size: 48.0,
        color: Colors.yellow, // Change color as needed
      ),
      SizedBox(height: 16.0),
      Text(
        'Congratulations!',
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
          color: Colors.blue, // Change color as needed
        ),
      ),
      SizedBox(height: 8.0),
      Text(
        'You are the winner!',
      ),
    ],
  ),
  actions: <Widget>[
    TextButton(
      onPressed: (){
      },
      child: const Text(
        'OK',
        style: TextStyle(
          fontSize: 18.0,
          fontWeight: FontWeight.bold,
          color: Colors.blue, // Change color as needed
        ),
      ),
    ),
  ],
);
      },
    );
  }

  



}