import 'package:flutter/material.dart';

class DeadPiece extends StatelessWidget {
  final String imagePath;
  final bool isWhite;
  const DeadPiece({
    super.key,
    required this.imagePath,
    required this.isWhite,
  });

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      imagePath,
      color: isWhite
          ? Color.fromRGBO(139, 0, 0, 1)
          : const Color.fromRGBO(250, 250, 210, 1),
    );
  }
}
