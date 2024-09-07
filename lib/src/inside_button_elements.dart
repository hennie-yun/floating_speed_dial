import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CircleButton extends StatelessWidget {
  final String imagePath;
  final String label;
  final String movePage;
  final double size;
  final Color imageColor;
  final double imageSize;
  final TextStyle labelStyle;
  final EdgeInsetsGeometry padding;
  final VoidCallback? onTap;

  const CircleButton({
    required this.imagePath,
    required this.label,
    required this.movePage,
    this.size = 56.0, // Default size of the button
    this.imageColor = const Color(0xff373430), // Default color for the image
    this.imageSize = 24.0, // Default size for the image
    this.labelStyle = const TextStyle(
      fontSize: 10,
      color: Color(0xFF373430),
    ), // Default text style
    this.padding = const EdgeInsets.all(8.0), // Default padding
    this.onTap, // Callback when button is tapped
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size,
      width: size,
      child: GestureDetector(
        onTap: onTap ?? () {},
        child: Padding(
          padding: padding,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                imagePath,
                color: imageColor,
                width: imageSize,
                height: imageSize,
              ),
              SizedBox(height: 4),
              Material(
                type: MaterialType.transparency,
                child: Text(
                  label,
                  style: labelStyle,
                  overflow: TextOverflow.visible,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}