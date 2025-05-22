enum ChessPieceType { pawn, rook, knight, bishop, queen, king }

class ChessPiece {
  final ChessPieceType type;
  final bool isWhite;
  final String imagePath;
  ChessPiece({
    required this.type,
    required this.isWhite,
    required this.imagePath,
  });
}

String getImagePath(ChessPieceType type, bool isWhite) {
  String color = isWhite ? 'w' : 'b';
  switch (type) {
    case ChessPieceType.pawn:
      return 'assets/images/pawn.png';
    case ChessPieceType.rook:
      return 'assets/images/rook.png';
    case ChessPieceType.knight:
      return 'assets/images/knight.png';
    case ChessPieceType.bishop:
      return 'assets/images/bishop.png';
    case ChessPieceType.queen:
      return 'assets/images/queen.png';
    case ChessPieceType.king:
      return 'assets/images/king.png';
  }
}
