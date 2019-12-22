import 'package:animals_app/pages/character_detail_screen.dart';
import 'package:animals_app/styleguide.dart';
import 'package:flutter/material.dart';
import 'package:animals_app/models/character.dart';

class CharacterWidget extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;

    // TODO: implement build
    return InkWell(
      onTap: () {
        Navigator.push(context, PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 350),
          pageBuilder: (context, _, __) => CharacterDetailScreen(character: characters[0])
        ));
      },
      child: Stack(
          children: [
            Align(
              alignment: Alignment.bottomCenter,
              child: ClipPath(
                clipper: CharacterCardBackgroundClipper(),
                child: Container(
                  height: 0.6 * screenHeight,
                  width: 0.9 * screenWidth ,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: characters[0].colors,
                          begin: Alignment.topRight,
                          end: Alignment.bottomLeft
                      )
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment(0, -0.5),
              child: Image.asset(
                characters[0].imagePath,
                height: screenHeight * 0.55,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 48, right: 16, bottom: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Text(characters[0].name, style: AppTheme.heading,),
                  Text("Tap To read more", style: AppTheme.subHeading,)
                ],
              ),
            )
          ]
      ),
    );
  }
}


class CharacterCardBackgroundClipper extends CustomClipper<Path>{
  @override
  Path getClip(Size size) {
    Path path = Path();
    double curveDistance = 40;

    path.moveTo(0, size.height * 0.4);
    path.lineTo(0, size.height - curveDistance);
    path.quadraticBezierTo(1, size.height - 1, 0 + curveDistance, size.height);
    path.lineTo(size.width - curveDistance, size.height);
    path.quadraticBezierTo(size.width + 1, size.height - 1, size.width, size.height - curveDistance);
    path.lineTo(size.width, 0 + curveDistance);
    path.quadraticBezierTo(size.width - 1, 0, size.width - curveDistance - 5, 0 + curveDistance / 3);
    path.lineTo(curveDistance, size.height * 0.29);
    path.quadraticBezierTo(1, (size.height * 0.30) + 10, 0, size.height * 0.4);

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    return true;
  }
  
}