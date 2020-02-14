import 'package:character_ui/models/character.dart';
import 'package:character_ui/pages/character_detail_screen.dart';
import 'package:character_ui/styleguide.dart';
import 'package:flutter/material.dart';

class CharacterWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    // InkWell: タップできる長方形領域
    return InkWell(
      onTap: () {
        // Navigator: ページ遷移できる
        // pushメソッドで進む遷移
        // popメソッドで戻る
        // of ページビルドのコンテキストを指定する
        Navigator.of(context).push(
          // PageRouteBuilder: Route Object
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 350),
            pageBuilder: (context, _, __) =>
                CharacterDetailScreen(character: characters[0]),
          ),
        );
      },
      // Stack: childrenのウィジェットを積み重ねる（z軸方向に）
      child: Stack(
        children: [
          // Align: 寄せる方向を指定できるウィジェット
          Align(
            // Alignment(0, 0)のように数字でも指定できる
            alignment: Alignment.bottomCenter,
            // ClipPath: パスを使用してクリップできるウィジェット
            // その他のクリップウィジェット
            // ClipOval: 円形にくり抜く
            // ClipRRect: 角丸に切り抜く（borderRadiusで角丸オブジェクトを指定する）
            child: ClipPath(
              clipper: CharacterCardBackgroundClipper(),
              child: Hero(
                tag: "background-${characters[0].name}",
                child: Container(
                  height: 0.6 * screenHeight,
                  width: 0.9 * screenWidth,
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                        colors: characters[0].colors,
                        begin: Alignment.topRight,
                        end: Alignment.bottomLeft),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment(0, -0.5),
            child: Hero(
              tag: "image-${characters[0].name}",
              child: Image.asset(
                characters[0].imagePath,
                height: screenHeight * 0.5,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 48, right: 16, bottom: 16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                Hero(
                  tag: 'name-${characters[0].name}',
                  child: Material(
                    color: Colors.transparent,
                    child: Container(
                      child: Text(characters[0].name, style: AppTheme.heading),
                    ),
                  ),
                ),
                Text("Tap to  Read more", style: AppTheme.subHeading),
              ],
            ),
          )
        ],
      ),
    );
  }
}

// カスタムパスクラス
class CharacterCardBackgroundClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();
    double curveDistance = 40;

    path.moveTo(0, size.height * 0.4); // 左端上
    path.lineTo(0, size.height - curveDistance); // 左下
    path.quadraticBezierTo(1, size.height - 1, 0 + curveDistance, size.height);
    path.lineTo(size.width - curveDistance, size.height); // 右下
    path.quadraticBezierTo(size.width + 1, size.height - 1, size.width,
        size.height - curveDistance);
    path.lineTo(size.width, 0 + curveDistance); // 右上
    path.quadraticBezierTo(size.width - 1, 0, size.width - curveDistance - 5,
        0 + curveDistance / 3);
    path.lineTo(curveDistance, size.height * 0.29); // 左上
    path.quadraticBezierTo(1, (size.height * 0.30) + 10, 0, size.height * 0.4);
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return true;
  }
}
