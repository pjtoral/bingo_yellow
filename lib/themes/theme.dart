import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

ThemeData bingoTheme = ThemeData(
  textTheme: title,
  buttonTheme: buttons,
  elevatedButtonTheme: elevateBTN,
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
    case 5:
      return Colors.green;
    case 6:
      return Colors.indigo;
    case 7:
      return const Color.fromARGB(255, 255, 195, 56);
    case 8:
      return Colors.greenAccent;
    default:
      return Colors.black;
  }
}

ElevatedButtonThemeData elevateBTN = ElevatedButtonThemeData(
  style: ButtonStyle(
    shadowColor:
        MaterialStateProperty.all<Color>(Colors.blue), // Example shadow color
    textStyle: MaterialStateProperty.all<TextStyle>(
        const TextStyle(fontSize: 16)), // Example text style
    backgroundColor: MaterialStateProperty.all<Color>(
        const Color.fromARGB(255, 67, 154, 70)), // Example background color
    padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
        const EdgeInsets.all(16)), // Example padding
    // Add other properties as needed
  ),
);
mixin value {}
ButtonThemeData buttons = const ButtonThemeData();

//Text Theme
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
    fontSize: 25,
    fontWeight: FontWeight.bold,
    fontFamily:
        'Lato', // Replace 'YourFunFont' with the name of your desired font
    color: const Color(0xFFFF6A48), // Red color
    shadows: [
      Shadow(
        color: Colors.black.withOpacity(1), // Shadow color
        offset: const Offset(1, 1), // Shadow offset
        blurRadius: 0, // Shadow blur radius
      ),
    ],
  ),
  displaySmall: TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    fontFamily:
        'Lato', // Replace 'YourFunFont' with the name of your desired font
    color: const Color.fromARGB(255, 246, 246, 246), // Red color
    shadows: [
      Shadow(
        color: Colors.black.withOpacity(1), // Shadow color
        offset: const Offset(1, 1), // Shadow offset
        blurRadius: 0, // Shadow blur radius
      ),
    ],
  ),
);
