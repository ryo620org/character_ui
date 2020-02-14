import 'package:character_ui/pages/character_listing_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // MaterialApp: アプリのルートとなるウィジェット
    return MaterialApp(
        title: 'Irasutoya Character UI',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
          primaryColor: Colors.white,
          canvasColor: Colors.white,
          appBarTheme: AppBarTheme(
            elevation: 0,
            color: Colors.white,
          ),
        ),
        routes: {
          '/': (context) => CharacterListingScreen(),
        },
        // homeプロパティに最初に表示するページのウィジェットを指定する
        // このウィジェットはScaffoldを使用する
        // home: CharacterListingScreen(),
        // homeを指定せず、ルート名を指定して初期ページを表示させることもできる
        initialRoute: '/');
  }
}
