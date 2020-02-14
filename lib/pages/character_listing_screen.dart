import 'package:character_ui/widgets/character_widget.dart';
import 'package:character_ui/styleguide.dart';
import 'package:flutter/material.dart';

class CharacterListingScreen extends StatefulWidget {
  @override
  _CharacterListingScreenState createState() => _CharacterListingScreenState();
}

class _CharacterListingScreenState extends State<CharacterListingScreen> {
  @override
  Widget build(BuildContext context) {
    // Scaffold: ページの核となるウィジェット
    return Scaffold(
      // Scaffoldのヘッダーとなるウィジェット
      appBar: AppBar(
        // leading: AppBarの左端にある一つのアイコンを指定
        // IconButton: アイコンをボタン化することができる
        // onPressedに、押下時の関数を登録できる
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios),
          onPressed: () {
            print("戻るボタンを押した");
          },
        ),
        // actions: AppBarの右端にある最大3つのアイコンを指定する
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              print("検索ボタンを押した");
            },
          ),
        ],
      ),
      // body: Scaffoldにおけるメインコンテンツとなるエリア
      // SafeArea: iPhoneXなどの縦長端末における場合、適切な位置にコンテンツ領域を確保してくれる
      body: SafeArea(
        // Padding: 上下左右にスペーサーを入れたい場合に使用するウィジェット
        child: Padding(
          // padding に EdgeInsetsクラスを使ったスペーサーを指定する
          // const を使うと別の箇所で再利用されるので良い
          padding: const EdgeInsets.only(bottom: 16.0),
          // Column: childrenに指定したウィジェットを縦積みできる
          child: Column(
            // 縦積みの場合crossAxisは水平方向、水平方向における詰め方を決める（cssのjustify-contentと一緒
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(left: 32, top: 8),
                // RichText: 複数のスタイルを別々に当てたい文字列に対して使うウィジェット
                // TextSpanオブジェクトをtextプロパティに使用する
                // テキスト系のまとめ
                // [Widget Object] = Text([String Object], style: [TextStyle Object])
                // [Widget Object] = RichText(text: [InlineSpan Object])
                // [InlineSpan Object] = TextSpan(text: [String Object], style: [TextStyle Object])
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'The Legend of Zelda',
                        style: AppTheme.display1,
                      ),
                      TextSpan(text: '\n'),
                      TextSpan(
                        text: 'Character Introduction',
                        style: AppTheme.display2,
                      ),
                    ],
                  ),
                ),
              ),
              // Expanded: 拡大して配置する（ColumnやRowと併用する
              // flexプロパティを使うと拡大率を固定できる
              Expanded(
                child: CharacterWidget(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
