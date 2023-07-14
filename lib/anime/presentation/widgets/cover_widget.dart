import 'package:cached_network_image/cached_network_image.dart';
import 'package:fluttaku/core/config/theme.dart';
import 'package:flutter/material.dart';

class CoverWidget extends StatelessWidget {
  final String imageUrl;
  final int? rating;
  final bool isAiring;
  const CoverWidget({
    Key? key,
    required this.imageUrl,
    required this.rating,
    required this.isAiring
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        borderRadius: MyTheme.defaultBorderRadius,
        boxShadow: MyTheme.boxShadow
      ),
      margin: MyTheme.defaultPadding,
      child: Stack(
        fit: StackFit.loose,
        children: [
          CachedNetworkImage(
            imageUrl: imageUrl,
            fit: BoxFit.fitHeight,
          ),
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
                color: Colors.pinkAccent,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(MyTheme.radiusValue)
                )
              ),
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
              child: Text(
                "${((rating ?? 0) / 10)} ★",
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                  fontWeight: FontWeight.w700
                ),
              ),
            ),
          )
        ],
      ),
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
