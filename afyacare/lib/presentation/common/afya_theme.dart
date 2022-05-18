import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


class AfyaTheme {

  static TextTheme lightTextTheme = TextTheme(
    //  this is for normal body text
    bodyText1: GoogleFonts.openSans(
      fontSize: 12.0,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),
    bodyText2: GoogleFonts.openSans(
      fontSize: 10.0,
      fontWeight: FontWeight.w700,
      color: Colors.black.withOpacity(0.7),
    ),
    
    headline1: GoogleFonts.openSans(
      fontSize: 32.0,
      fontWeight: FontWeight.bold,
      color: Colors.black,
      
    ),
    // this is headline font name of doctor in doctor's patient history 
    headline2: GoogleFonts.openSans(
      fontSize: 26.0,
      fontWeight: FontWeight.w700,
      color: Colors.black,
    ),

    // this is headline font for normal text 
    headline3: GoogleFonts.openSans(
      fontSize: 16.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    headline6: GoogleFonts.openSans(
      fontSize: 20.0,
      fontWeight: FontWeight.w600,
      color: Colors.black,
    ),
    // for button text
    button: GoogleFonts.openSans(
      fontSize: 18.0,
      color: Color(0xFFFFF9F9)
    )

    

  );

 

  static ThemeData light() {
    return ThemeData(
      brightness: Brightness.light,
      checkboxTheme: CheckboxThemeData(
        fillColor: MaterialStateColor.resolveWith(
              (states) {
            return Colors.green;
          },
        ),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        foregroundColor: Colors.green,
        backgroundColor: Colors.black,
      ),
      // this is for selected nav bar
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        selectedItemColor: Colors.green,
      ),
      textTheme: lightTextTheme,

      // for normal bottom nav bar
      bottomAppBarTheme: BottomAppBarTheme(
        color: Color(0xFF9AA1B8),
      )
    );
  }

  
}
