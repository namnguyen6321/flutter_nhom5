import 'package:my_app/component/piece.dart';
import 'package:flutter/material.dart';

class Square extends StatelessWidget {
  final bool isWhite;
  final ChessPiece? piece;
  final bool isSelected;
  final bool isValidMove;
  final void Function()? onTap;
  const Square({
    super.key,
    required this.isWhite,
    required this.piece,
    required this.isSelected,
    required this.onTap,
    required this.isValidMove,
  });

  @override
  Widget build(BuildContext context) {
    Color? squareColor;
    // Nếu được chọn, bàn cờ chuyển màu xanh
    if (isSelected) {
      squareColor = Colors.green;
    } else if (isValidMove) {
      squareColor = Colors.green[300];
    } else {
      squareColor = isWhite ? Colors.grey[400] : Colors.grey[600];
    }
    // Nếu không nó sẽ là màu mặc định trắng hoặc xám

    return GestureDetector(
      onTap: onTap,
      child: Container(
        color: squareColor,
        child: piece != null
            ? Image.asset(
                piece!.imagePath,
                color: piece!.isWhite
                    ? const Color.fromRGBO(224, 255, 255, 1)
                    : const Color.fromRGBO(54, 69, 79, 1),
              )
            : null,
      ),
    );
  }
}

