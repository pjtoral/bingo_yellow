import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData bingoTheme = ThemeData(
  textTheme: title,
);

Color getColorForLetter(int index) {
  switch (index) {
    case 0:
      return Colors.red;
    case 1:
      return Colors.green;
    case 2:
      return Colors.blue;
    case 3:
      return Colors.orange;
    case 4:
      return Colors.purple;
    default:
      return Colors.black;
  }
}

TextTheme title = TextTheme(
  displayLarge: TextStyle(
    fontSize: 50,
    fontFamily: 'Prociono',
    fontWeight: FontWeight
        .bold, // Replace 'YourFunFont' with the name of your desired font
    color: const Color.fromARGB(255, 255, 119, 109), // Red color
    shadows: [
      Shadow(
        color: Colors.black.withOpacity(1), // Shadow color
        offset: const Offset(3, 3), // Shadow offset
        blurRadius: 0, // Shadow blur radius
      ),
    ],
  ),
  displayMedium: TextStyle(
    fontSize: 16,
    fontWeight: FontWeight.bold,
    fontFamily:
        'Lato', // Replace 'YourFunFont' with the name of your desired font
    color: Colors.red, // Red color
    shadows: [
      Shadow(
        color: Colors.black.withOpacity(0.5), // Shadow color
        offset: Offset(2, 2), // Shadow offset
        blurRadius: 4, // Shadow blur radius
      ),
    ],
  ),
);
