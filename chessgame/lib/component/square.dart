import 'package:my_app/component/piece.dart';
import 'package:flutter/material.dart';

class Square extends StatelessWidget {
  final bool isWhite;
  final ChessPiece? piece;
  const Square({super.key, required this.isWhite, required this.piece});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: isWhite ? Colors.grey[400] : Colors.grey[600],
      child: piece != null
          ? Image.asset(
              piece!.imagePath,
              color: piece!.isWhite
                  ? Color.fromRGBO(224, 255, 255, 1)
                  : Color.fromRGBO(54, 69, 79, 1),
            )
          : null,
    );
  }
}
