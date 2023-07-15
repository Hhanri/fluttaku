import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluttaku/core/config/theme.dart';
import 'package:fluttaku/core/presentation/widgets/movie_aspect_ratio.dart';
import 'package:flutter/material.dart';

class CoverWidget extends StatelessWidget {
  final String imageUrl;
  final int? rating;
  final bool isAiring;
  final EdgeInsets? padding;
  const CoverWidget({
    Key? key,
    required this.imageUrl,
    required this.rating,
    required this.isAiring,
    this.padding
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return CachedNetworkImage(
      imageUrl: imageUrl,
      imageBuilder: (context, image) {
        return MovieAspectRatio(
          child: Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: MyTheme.defaultBorderRadius,
              boxShadow: MyTheme.boxShadow,
              image: DecorationImage(image: image, fit: BoxFit.cover)
            ),
            margin: padding,
            child: Stack(
              fit: StackFit.loose,
              children: [
                if (isAiring) Positioned(
                  bottom: 0,
                  left: 0,
                  child: CustomPaint(
                    painter: _AiringIndicator(
                      bigRadius: 10,
                      smallRadius: 8
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  //alignment: Alignment.bottomRight,
                  child: Container(
                    decoration: const BoxDecoration(
                      color: MyColors.primaryColor,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(MyTheme.defaultRadiusValue)
                      )
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
                    child: Text(
                      "${((rating ?? 0) / 10)} ★",
                      style: MyTextStyle.ratingStyle,
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}

class _AiringIndicator extends CustomPainter {
  final double bigRadius;
  final double smallRadius;
  _AiringIndicator({
    this.bigRadius = 10,
    this.smallRadius = 8
  });

  @override
  void paint(Canvas canvas, Size size) {
    final paint1 = Paint()
      ..color = Colors.green
      ..style = PaintingStyle.fill;

    final paint2 = Paint()
      ..color = Colors.lightGreenAccent
      ..style = PaintingStyle.fill;

    canvas.drawCircle(Offset(bigRadius, -bigRadius), bigRadius, paint1);
    canvas.drawCircle(Offset(bigRadius, -bigRadius), smallRadius, paint2);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
