import 'package:character_ui/models/character.dart';
import 'package:character_ui/pages/character_detail_screen.dart';
import 'package:character_ui/styleguide.dart';
import 'package:flutter/material.dart';

class CharacterWidget extends StatelessWidget {
  final Character character;
  final PageController pageController;
  final int currentPage;

  const CharacterWidget(
      {Key key, this.character, this.currentPage, this.pageController})
      : super(key: key);

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
                CharacterDetailScreen(character: character),
          ),
        );
      },
      // Stack: childrenのウィジェットを積み重ねる（z軸方向に）
      child: AnimatedBuilder(
        animation: pageController,
        builder: (context, child) {
          double value = 1;
          if (pageController.position.haveDimensions) {
            value = pageController.page - currentPage;
            value = (1 - (value.abs() * 0.6)).clamp(0, 1);

            if (currentPage == 0) print("aaa ${value}");
          }
          return Stack(
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
                    tag: "background-${character.name}",
                    child: Container(
                      height: 0.6 * screenHeight,
                      width: 0.9 * screenWidth,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: character.colors,
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
                  tag: "image-${character.name}",
                  child: Image.asset(
                    character.imagePath,
                    height: screenHeight * 0.6 * value,
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
                      tag: 'name-${character.name}',
                      child: Material(
                        color: Colors.transparent,
                        child: Container(
                          child: Text(character.name, style: AppTheme.heading),
                        ),
                      ),
                    ),
                    Text("Tap to  Read more", style: AppTheme.subHeading),
                  ],
                ),
              )
            ],
          );
        },
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
