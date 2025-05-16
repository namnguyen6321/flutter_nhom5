import 'package:my_app/component/piece.dart';
import 'package:flutter/material.dart';

class Square extends StatelessWidget {
  final bool isWhite;
  final ChessPiece? piece;
  final bool isSelected;
  final bool isValidMove;
  final bool isAttackMove; // THÊM: phân biệt nước ăn quân
  final void Function()? onTap;

  const Square({
    super.key,
    required this.isWhite,
    required this.piece,
    required this.isSelected,
    required this.onTap,
    required this.isValidMove,
    this.isAttackMove = false, // mặc định false nếu không truyền
  });

  @override
  Widget build(BuildContext context) {
    Color baseColor = isWhite ? Color(0xFFF0D9B5) : Color(0xFFB58863);

    Color squareColor = baseColor;

    if (isSelected) {
      squareColor = const Color.fromRGBO(178, 34, 34, 0.8); // đỏ chọn quân
    }

    return GestureDetector(
      onTap: onTap,
      child: Stack(
        children: [
          // Ô bàn cờ
          Container(color: squareColor),

          // Highlight nước đi hợp lệ (vòng tròn)
          if (isValidMove && !isAttackMove)
            Center(
              child: Container(
                width: 20,
                height: 20,
                decoration: const BoxDecoration(
                  color: Color.fromRGBO(144, 238, 144, 0.8), // xanh lá nhạt
                  shape: BoxShape.circle,
                ),
              ),
            ),

          // Highlight ô có thể ăn quân
          if (isAttackMove)
            Container(
              color: const Color.fromRGBO(220, 20, 60, 0.7), // đỏ tươi ăn quân
            ),

          // Quân cờ
          if (piece != null)
            Center(
              child: Image.asset(
                piece!.imagePath,
                color: piece!.isWhite
                    ? const Color.fromRGBO(139, 0, 0, 1) // đỏ đậm
                    : const Color.fromRGBO(250, 250, 210, 1), // vàng nhạt
              ),
            ),
        ],
      ),
    );
  }
}
