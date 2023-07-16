import 'package:fluttaku/core/config/theme.dart';
import 'package:flutter/material.dart';

abstract class GradientShaderMask extends ShaderMask {
  final Gradient gradient;

  GradientShaderMask({super.key, required this.gradient, required super.child}) : super(
    shaderCallback: (bounds) {
      return gradient.createShader(bounds);
    },
    blendMode: BlendMode.srcATop,
  );
}

class WhiteGradientShaderMask extends GradientShaderMask {
  WhiteGradientShaderMask({
    super.key,
    required super.child
  }) : super(
    gradient: const LinearGradient(
      colors: [Colors.transparent, Colors.white54, Colors.white],
      begin: Alignment.topCenter,
      end: Alignment.bottomCenter,
      stops: [0, 0.45, 1],
    )
  );
}

class BackgroundGradientShaderMask extends GradientShaderMask {
  final List<double> stops;
  BackgroundGradientShaderMask({
    super.key,
    required super.child,
    this.stops = const [0, 0.45, 1]
  }) : super(
      gradient: LinearGradient(
        colors: [Colors.transparent, MyColors.backgroundColor.withOpacity(0.54), MyColors.backgroundColor],
        begin: Alignment.topCenter,
        end: Alignment.bottomCenter,
        stops: stops,
      )
  );
}