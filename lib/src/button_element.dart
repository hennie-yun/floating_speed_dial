import 'package:flutter/cupertino.dart';

import 'circle_button_data.dart';
import 'circle_diagonal_line_painter.dart';
import 'inside_button_elements.dart';

class CircleMenu extends StatelessWidget {
  final Color circleColor;
  final Color borderColor;
  final double borderWidth;
  final double size;
  final double buttonSize;
  final double iconSize;
  final String centerIconPath;
  final List<CircleButtonData> buttons;

  const CircleMenu({
    Key? key,
    this.circleColor = const Color(0xFFE6E2DB),
    this.borderColor = const Color(0xFFE7E6E4),
    this.borderWidth = 1.0,
    this.size = 300.0,
    this.buttonSize = 56.0,
    this.iconSize = 24.0,
    this.centerIconPath = 'assets/images/icon.png', //might be differ
    required this.buttons,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      bottom: 0, // Position the menu slightly below the bottom of the screen
      child: Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          color: circleColor,
          shape: BoxShape.circle,
          border: Border.all(color: borderColor, width: borderWidth),
        ),
        child: Stack(
          alignment: Alignment.center,
          children: [
            CustomPaint(
              size: Size(size, size),
              painter: CircleDiagonalLinePainter(
                lineColor: borderColor,
                lineWidth: borderWidth,
              ),
            ),
            // Circle buttons
            for (var button in buttons)
              Positioned(
                top: button.position == ButtonPosition.top ? 33 : null,
                bottom: button.position == ButtonPosition.bottom ? 33 : null,
                left: button.position == ButtonPosition.left ? 33 : null,
                right: button.position == ButtonPosition.right ? 33 : null,
                child: CircleButton(
                  imagePath: button.imagePath,
                  label: button.label,
                  movePage: button.movePage,

                ),
              ),
            // Center icon
            Container(
              width: buttonSize * 1.8,
              height: buttonSize * 1.8,
              decoration: BoxDecoration(
                color: Color(0xFF373430),
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Container(
                  width: buttonSize * 0.8,
                  height: buttonSize * 0.8,
                  decoration: BoxDecoration(
                    color: circleColor,
                    shape: BoxShape.circle,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop(); //center icon always close
                    },
                    child: Image.asset(
                      centerIconPath,
                      width: iconSize,
                      height: iconSize,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
