import 'package:flutter/material.dart';

class P3Theme {
  static const Color darkBg = Color(0xFF040A14);
  static const Color darkBgSecondary = Color(0xFF091627);
  static const Color cardBg = Color(0xDC0B1D33);
  static const Color cardBorder = Color(0xFF183B63);

  static const Color cyanElectric = Color(0xFF00D2FF);
  static const Color cyanGlow = Color(0xFF00F0FF);
  static const Color bluePrimary = Color(0xFF0077E6);
  static const Color blueDark = Color(0xFF052B52);
  static const Color accentYellow = Color(0xFFFFDE00);

  static const Color textLight = Color(0xFFF0F6FF);
  static const Color textMuted = Color(0xFF8DA8C7);

  static List<BoxShadow> neonGlow({
    Color color = cyanElectric,
    double blur = 12,
  }) {
    return [
      BoxShadow(
        color: color.withValues(alpha: 0.35),
        blurRadius: blur,
        spreadRadius: 1,
      ),
    ];
  }
}

class P3BackgroundWrapper extends StatelessWidget {
  final Widget child;

  const P3BackgroundWrapper({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF03070F), Color(0xFF071424), Color(0xFF030812)],
            ),
          ),
        ),

        Positioned.fill(
          child: Opacity(
            opacity: 0.20,
            child: Image.asset(
              'assets/bg_P3.jpg',
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return const SizedBox();
              },
            ),
          ),
        ),

        Positioned.fill(
          child: Container(
            decoration: BoxDecoration(
              gradient: RadialGradient(
                center: Alignment.center,
                radius: 1.2,
                colors: [
                  Colors.transparent,
                  Colors.black.withValues(alpha: 0.65),
                ],
              ),
            ),
          ),
        ),

        SafeArea(child: child),
      ],
    );
  }
}
