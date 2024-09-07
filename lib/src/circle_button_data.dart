class CircleButtonData {
  final String imagePath;
  final String label;
  final String movePage;
  final ButtonPosition position;

  CircleButtonData({
    required this.imagePath,
    required this.label,
    required this.movePage,
    required this.position,
  });
}

enum ButtonPosition {
  top,
  bottom,
  left,
  right,
}