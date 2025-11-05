import 'package:flutter/material.dart';
import '../theme.dart';

class BubblesBackground extends StatelessWidget {
  final Widget child;
  const BubblesBackground({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Positioned(left: -120, top: -40, child: _circle(220)),
        Positioned(right: -90, top: 40, child: _circle(160)),
        Positioned(left: -80, bottom: -60, child: _circle(260)),
        Positioned(right: -60, bottom: 80, child: _circle(200)),
        child,
      ],
    );
  }

  Widget _circle(double size) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: AppColors.circle,
        shape: BoxShape.circle,
      ),
    );
  }
}
