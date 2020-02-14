import 'package:flutter/material.dart';

class AppTheme {
  static const TextStyle display1 = TextStyle(
    fontFamily: 'Halis',
    color: Colors.black,
    fontSize: 32,
    fontWeight: FontWeight.w700,
    // letterSpacing: 1.1,
  );

  static const TextStyle display2 = TextStyle(
    fontFamily: 'Halis',
    color: Colors.black,
    fontSize: 24,
    fontWeight: FontWeight.normal,
    letterSpacing: 1.1,
  );

  static final TextStyle heading = TextStyle(
    fontFamily: 'Halis',
    color: Colors.white.withOpacity(0.8),
    fontSize: 34,
    fontWeight: FontWeight.w800,
    letterSpacing: 1.2,
  );

  static final TextStyle subHeading = TextStyle(
    inherit: true,
    fontFamily: 'Halis',
    color: Colors.white.withOpacity(0.8),
    fontSize: 24,
    fontWeight: FontWeight.w500,
  );
}
