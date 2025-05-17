import 'package:my_app/component/dead_piece.dart';
import 'package:my_app/component/piece.dart';
import 'package:my_app/component/square.dart';
import 'package:flutter/material.dart';
import 'package:my_app/method/helper.dart';

class Gameboard extends StatefulWidget {
  const Gameboard({super.key});

  @override
  State<Gameboard> createState() => _GameboardState();
}

class _GameboardState extends State<Gameboard> {
  late List<List<ChessPiece?>> board;
  bool isWhiteTurn = true; // true: trắng, false: đen
  ChessPiece? selectedPiece;
  //Chỉ số hàng của quân cờ được chọn trên bàn cờ mặc định -1 nếu k có quân cờ nào được chọn
  int selectedRow = -1;
  //Chỉ số cột của quân cờ được chọn trên bàn cờ mặc định -1 nếu k có quân cờ nào được chọn
  int selectedCol = -1;
  //Tạo danh sách nước đi hợp lệ của quân cờ được chọn
  //Mỗi nước đi là danh sách của 2 phần tử cột, hàng
  //Danh sách quân cờ trắng bị ăn
  List<ChessPiece> whitePiecesTaken = [];
  //Danh sách quân cờ đen bị ăn
  List<ChessPiece> blackPiecesTaken = [];
  List<List<int>> validMoves = [];
  //Vị trí khởi đầu của vua
  List<int> whiteKingPosition = [7, 4];
  List<int> blackKingPosition = [0, 4];
  bool checkStatus = false;
  @override
  void initState() {
    super.initState();
    _initializeBoard();
  }

//Khởi tạo bàn cờ trống
  void _initializeBoard() {
    List<List<ChessPiece?>> newBoard =
        List.generate(8, (index) => List.generate(8, (index) => null));
    // Đặt tốt
    for (int i = 0; i < 8; i++) {
      newBoard[1][i] = ChessPiece(
          type: ChessPieceType.pawn,
          isWhite: false,
          imagePath: 'assets/images/pawn.png');
    }
    for (int i = 0; i < 8; i++) {
      newBoard[6][i] = ChessPiece(
          type: ChessPieceType.pawn,
          isWhite: true,
          imagePath: 'assets/images/pawn.png');
    }
    //Đặt xe
    newBoard[0][0] = ChessPiece(
        type: ChessPieceType.rook,
        isWhite: false,
        imagePath: 'assets/images/rook.png');
    newBoard[0][7] = ChessPiece(
        type: ChessPieceType.rook,
        isWhite: false,
        imagePath: 'assets/images/rook.png');
    newBoard[7][0] = ChessPiece(
        type: ChessPieceType.rook,
        isWhite: true,
        imagePath: 'assets/images/rook.png');
    newBoard[7][7] = ChessPiece(
        type: ChessPieceType.rook,
        isWhite: true,
        imagePath: 'assets/images/rook.png');
    //Đặt mã
    newBoard[0][1] = ChessPiece(
        type: ChessPieceType.knight,
        isWhite: false,
        imagePath: 'assets/images/knight.png');
    newBoard[0][6] = ChessPiece(
        type: ChessPieceType.knight,
        isWhite: false,
        imagePath: 'assets/images/knight.png');
    newBoard[7][1] = ChessPiece(
        type: ChessPieceType.knight,
        isWhite: true,
        imagePath: 'assets/images/knight.png');
    newBoard[7][6] = ChessPiece(
        type: ChessPieceType.knight,
        isWhite: true,
        imagePath: 'assets/images/knight.png');
    //Đặt tượng
    newBoard[0][2] = ChessPiece(
        type: ChessPieceType.bishop,
        isWhite: false,
        imagePath: 'assets/images/bishop.png');
    newBoard[0][5] = ChessPiece(
        type: ChessPieceType.bishop,
        isWhite: false,
        imagePath: 'assets/images/bishop.png');
    newBoard[7][2] = ChessPiece(
        type: ChessPieceType.bishop,
        isWhite: true,
        imagePath: 'assets/images/bishop.png');
    newBoard[7][5] = ChessPiece(
        type: ChessPieceType.bishop,
        isWhite: true,
        imagePath: 'assets/images/bishop.png');

    //Đặt hậu
    newBoard[0][3] = ChessPiece(
        type: ChessPieceType.queen,
        isWhite: false,
        imagePath: 'assets/images/queen.png');
    newBoard[7][3] = ChessPiece(
        type: ChessPieceType.queen,
        isWhite: true,
        imagePath: 'assets/images/queen.png');

    //Đặt vua
    newBoard[0][4] = ChessPiece(
        type: ChessPieceType.king,
        isWhite: false,
        imagePath: 'assets/images/king.png');
    newBoard[7][4] = ChessPiece(
        type: ChessPieceType.king,
        isWhite: true,
        imagePath: 'assets/images/king.png');
    board = newBoard;
  }

// Người chơi chọn quân cờ
  void pieceSelected(int row, int col) {
    // Nếu đang chọn quân và nhấn vào nước đi hợp lệ => di chuyển
    if (selectedPiece != null &&
        validMoves.any((element) => element[0] == row && element[1] == col)) {
      movePiece(row, col);
    }
    // Nếu nhấn vào quân mình (đúng lượt) thì chọn quân
    else if (board[row][col] != null &&
        board[row][col]!.isWhite == isWhiteTurn) {
      setState(() {
        selectedPiece = board[row][col];
        selectedRow = row;
        selectedCol = col;
        validMoves = calculateRealValidMoves(
            selectedRow, selectedCol, selectedPiece, true);
      });
    }
  }

  // Tính toán nước đi ban đầu hợp lệ
  List<List<int>> calculateRawValidMoves(int row, int col, ChessPiece? piece) {
    List<List<int>> candidateMoves = [];
    if (piece == null) {
      return [];
    }
    //Mỗi hướng đi sẽ phụ thuộc màu sắc của nó
    int direction = piece!.isWhite ? -1 : 1;
    switch (piece.type) {
      case ChessPieceType.pawn:
        //Tốt có thể di chuyển về phía trước nếu ô đó trống
        if (isInBoard(row + direction, col) &&
            board[row + direction][col] == null) {
          candidateMoves.add([row + direction, col]);
        }

        //Tốt có thể đi 2 ô nếu ở hàng xuất phát
        if ((row == 1 && !piece.isWhite) || (row == 6 && piece.isWhite)) {
          if (isInBoard(row + 2 * direction, col) &&
              board[row + direction][col] == null &&
              board[row + 2 * direction][col] == null) {
            candidateMoves.add([row + 2 * direction, col]);
          }
        }

        //Tốt có thể ăn chéo trái
        if (isInBoard(row + direction, col - 1) &&
            board[row + direction][col - 1] != null &&
            board[row + direction][col - 1]!.isWhite != piece.isWhite) {
          candidateMoves.add([row + direction, col - 1]);
        }

        //Tốt có thể ăn chéo phải
        if (isInBoard(row + direction, col + 1) &&
            board[row + direction][col + 1] != null &&
            board[row + direction][col + 1]!.isWhite != piece.isWhite) {
          candidateMoves.add([row + direction, col + 1]);
        }
        break;

      case ChessPieceType.rook:
        //Xe có thể đi theo hướng ngang và dọc
        var directions = [
          [-1, 0], //lên
          [1, 0], //xuống
          [0, -1], //Trái
          [0, 1], //Phải
        ];
        for (var direction in directions) {
          var i = 1;
          while (true) {
            var newRow = row + i * direction[0];
            var newCol = col + i * direction[1];
            if (!isInBoard(newRow, newCol)) {
              break;
            }
            if (board[newRow][newCol] != null) {
              if (board[newRow][newCol]!.isWhite != piece.isWhite) {
                candidateMoves.add([newRow, newCol]);
              }
              break;
            }
            candidateMoves.add([newRow, newCol]);
            i++;
          }
        }
        break;
      case ChessPieceType.knight:
        //Mã đi theo hình chữ L
        var knightMoves = [
          [-2, -1],
          [-2, 1],
          [-1, -2],
          [-1, 2],
          [1, -2],
          [1, 2],
          [2, -1],
          [2, 1],
        ];
        for (var move in knightMoves) {
          var newRow = row + move[0];
          var newCol = col + move[1];
          if (!isInBoard(newRow, newCol)) {
            continue;
          }
          if (board[newRow][newCol] != null) {
            if (board[newRow][newCol]!.isWhite != piece.isWhite) {
              candidateMoves.add([newRow, newCol]);
            }
            continue;
          }
          candidateMoves.add([newRow, newCol]);
        }
        break;
      case ChessPieceType.bishop:
        //Tượng có thể đi chéo
        var directions = [
          [-1, -1],
          [-1, 1],
          [1, -1],
          [1, 1],
        ];
        for (var direction in directions) {
          var i = 1;
          while (true) {
            var newRow = row + i * direction[0];
            var newCol = col + i * direction[1];
            if (!isInBoard(newRow, newCol)) {
              break;
            }
            if (board[newRow][newCol] != null) {
              if (board[newRow][newCol]!.isWhite != piece.isWhite) {
                candidateMoves.add([newRow, newCol]);
              }
              break;
            }
            candidateMoves.add([newRow, newCol]);
            i++;
          }
        }
        break;
      case ChessPieceType.queen:
        //Hậu có thể đi 8 hướng
        var directions = [
          [-1, 0],
          [1, 0],
          [0, -1],
          [0, 1],
          [-1, -1],
          [-1, 1],
          [1, -1],
          [1, 1],
        ];
        for (var direction in directions) {
          var i = 1;
          while (true) {
            var newRow = row + i * direction[0];
            var newCol = col + i * direction[1];
            if (!isInBoard(newRow, newCol)) {
              break;
            }
            if (board[newRow][newCol] != null) {
              if (board[newRow][newCol]!.isWhite != piece.isWhite) {
                candidateMoves.add([newRow, newCol]);
              }
              break;
            }
            candidateMoves.add([newRow, newCol]);
            i++;
          }
        }
        break;
      case ChessPieceType.king:
        //Vua có thể đi 8 hướng
        var directions = [
          [-1, 0],
          [1, 0],
          [0, -1],
          [0, 1],
          [-1, -1],
          [-1, 1],
          [1, -1],
          [1, 1],
        ];
        for (var direction in directions) {
          var newRow = row + direction[0];
          var newCol = col + direction[1];
          if (!isInBoard(newRow, newCol)) {
            continue;
          }
          if (board[newRow][newCol] != null) {
            if (board[newRow][newCol]!.isWhite != piece.isWhite) {
              candidateMoves.add([newRow, newCol]);
            }
            continue;
          }
          candidateMoves.add([newRow, newCol]);
        }
        break;
      default:
    }
    return candidateMoves;
  }

//Tính toán nước đi thực tế
  List<List<int>> calculateRealValidMoves(
      int row, int col, ChessPiece? piece, bool checkSimulation) {
    List<List<int>> realValidMoves = [];
    List<List<int>> candidateMoves = calculateRawValidMoves(row, col, piece);

    if (checkSimulation) {
      for (var move in candidateMoves) {
        int endRow = move[0];
        int endCol = move[1];
        if (simulatedMoveIsSafe(piece!, row, col, endRow, endCol)) {
          realValidMoves.add(move);
        }
      }
    } else {
      realValidMoves = candidateMoves;
    }

    // NHẬP THÀNH (Castling)

    if (piece != null && piece.type == ChessPieceType.king && checkSimulation) {
      bool isWhite = piece.isWhite;
      int baseRow = isWhite ? 7 : 0;

      // 1. Kiểm tra nhập thành vua (king-side)
      if (board[baseRow][5] == null &&
          board[baseRow][6] == null &&
          board[baseRow][7]?.type == ChessPieceType.rook &&
          board[baseRow][7]?.isWhite == isWhite &&
          simulatedMoveIsSafe(piece, row, col, baseRow, 5) &&
          simulatedMoveIsSafe(piece, row, col, baseRow, 6)) {
        realValidMoves.add([baseRow, 6]); // G1 hoặc G8
      }

      // 2. Kiểm tra nhập thành hậu (queen-side)
      if (board[baseRow][1] == null &&
          board[baseRow][2] == null &&
          board[baseRow][3] == null &&
          board[baseRow][0]?.type == ChessPieceType.rook &&
          board[baseRow][0]?.isWhite == isWhite &&
          simulatedMoveIsSafe(piece, row, col, baseRow, 3) &&
          simulatedMoveIsSafe(piece, row, col, baseRow, 2)) {
        realValidMoves.add([baseRow, 2]); // C1 hoặc C8
      }
    }

    return realValidMoves;
  }

//Di chuyển quân cờ
  void movePiece(int newRow, int newCol) {
    // Ăn quân nếu có
    if (board[newRow][newCol] != null) {
      var capturedPiece = board[newRow][newCol];
      if (capturedPiece!.isWhite) {
        whitePiecesTaken.add(capturedPiece);
      } else {
        blackPiecesTaken.add(capturedPiece);
      }
    }

    // Di chuyển quân cờ
    board[newRow][newCol] = selectedPiece;
    board[selectedRow][selectedCol] = null;

    // Cập nhật vị trí vua nếu cần
    if (selectedPiece!.type == ChessPieceType.king) {
      if (selectedPiece!.isWhite) {
        whiteKingPosition = [newRow, newCol];
      } else {
        blackKingPosition = [newRow, newCol];
      }
    }
    // Kiểm tra nhập thành (castling) đơn giản
    if (selectedPiece!.type == ChessPieceType.king &&
        (newCol - selectedCol).abs() == 2) {
      // Trắng nhập thành
      if (selectedPiece!.isWhite && selectedRow == 7) {
        // Nhập thành bên vua
        if (newCol == 6 && board[7][7]?.type == ChessPieceType.rook) {
          board[7][5] = board[7][7]; // Di chuyển xe
          board[7][7] = null;
        }
        // Nhập thành bên hậu
        else if (newCol == 2 && board[7][0]?.type == ChessPieceType.rook) {
          board[7][3] = board[7][0];
          board[7][0] = null;
        }
      }

      // Đen nhập thành
      if (!selectedPiece!.isWhite && selectedRow == 0) {
        if (newCol == 6 && board[0][7]?.type == ChessPieceType.rook) {
          board[0][5] = board[0][7];
          board[0][7] = null;
        } else if (newCol == 2 && board[0][0]?.type == ChessPieceType.rook) {
          board[0][3] = board[0][0];
          board[0][0] = null;
        }
      }
    }
    // Phong cấp quân tốt nếu đến cuối bàn
    if (selectedPiece!.type == ChessPieceType.pawn) {
      if ((selectedPiece!.isWhite && newRow == 0) ||
          (!selectedPiece!.isWhite && newRow == 7)) {
        // Hiện dialog chọn phong cấp
        WidgetsBinding.instance.addPostFrameCallback((_) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) {
              return AlertDialog(
                title: const Text('Pawn Promotion'),
                content: const Text('Choose piece to promote to:'),
                actions: [
                  TextButton(
                    onPressed: () {
                      promotePawn(newRow, newCol, ChessPieceType.queen);
                      Navigator.of(context).pop();
                    },
                    child: const Text('Hậu'),
                  ),
                  TextButton(
                    onPressed: () {
                      promotePawn(newRow, newCol, ChessPieceType.rook);
                      Navigator.of(context).pop();
                    },
                    child: const Text('Xe'),
                  ),
                  TextButton(
                    onPressed: () {
                      promotePawn(newRow, newCol, ChessPieceType.bishop);
                      Navigator.of(context).pop();
                    },
                    child: const Text('Tượng'),
                  ),
                  TextButton(
                    onPressed: () {
                      promotePawn(newRow, newCol, ChessPieceType.knight);
                      Navigator.of(context).pop();
                    },
                    child: const Text('Mã'),
                  ),
                ],
              );
            },
          );
        });
      }
    }

    // Kiểm tra chiếu
    checkStatus = isKingInCheck(!isWhiteTurn);

    // Kiểm tra chiếu hết trước khi đổi lượt
    if (isCheckMate(!isWhiteTurn)) {
      setState(() {
        selectedPiece = null;
        selectedRow = -1;
        selectedCol = -1;
        validMoves = [];
      });

      WidgetsBinding.instance.addPostFrameCallback((_) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("CHECK MATE!"),
            content: Text(isWhiteTurn ? "Red wins!" : "White wins!"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  resetGame();
                },
                child: const Text("Play Again"),
              ),
            ],
          ),
        );
      });

      return;
    }

    // Kiểm tra hòa do bí nước
    if (isStalemate(!isWhiteTurn)) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text("STALEMATE!"),
            content: const Text("Game is a draw!"),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  resetGame();
                },
                child: const Text("Play Again"),
              ),
            ],
          ),
        );
      });
      return;
    }

    // Đổi lượt chơi
    isWhiteTurn = !isWhiteTurn;

    // Reset UI chọn quân
    setState(() {
      selectedPiece = null;
      selectedRow = -1;
      selectedCol = -1;
      validMoves = [];
    });

    // Kiểm tra hòa do không đủ lực
    if (isInsufficientMaterial()) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        showDialog(
          context: context,
          builder: (BuildContext context) => AlertDialog(
            title: const Text("DRAW!"),
            content: const Text("Draw due to insufficient material."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  resetGame();
                },
                child: const Text("Play Again"),
              ),
            ],
          ),
        );
      });
    }
  }

// Vua bị chiếu
  bool isKingInCheck(bool isWhiteKing) {
    //Lấy vị trí của vua
    List<int> kingPosition =
        isWhiteKing ? whiteKingPosition : blackKingPosition;
    //Kiểm tra bất kỳ quân cờ nào có thể tấn công vua
    for (int i = 0; i < 8; i++) {
      for (int j = 0; j < 8; j++) {
        //bỏ qua ô trống và quân cờ trùng màu vs vua
        if (board[i][j] == null || board[i][j]!.isWhite == isWhiteKing) {
          continue;
        }
        List<List<int>> pieceValidMoves =
            calculateRealValidMoves(i, j, board[i][j], false);
        //Kiểm tra nếu vị trí của vua có nước đi hợp lệ
        if (pieceValidMoves.any((move) =>
            move[0] == kingPosition[0] && move[1] == kingPosition[1])) {
          return true;
        }
      }
    }
    return false;
  }

//Mô phỏng nước đi tiếp theo nếu thấy nó k an toàn( K đặt vua vào thế bị chiếu)
  bool simulatedMoveIsSafe(
      ChessPiece piece, int startRow, int startCol, int endRow, int endCol) {
    ChessPiece? originalDestinationPiece = board[endRow][endCol];

    List<int>? originalKingPosition;

    // Lưu vị trí vua hiện tại trước khi mô phỏng
    if (piece.isWhite) {
      originalKingPosition = whiteKingPosition;
    } else {
      originalKingPosition = blackKingPosition;
    }

    // Nếu là vua thì cập nhật vị trí vua
    if (piece.type == ChessPieceType.king) {
      if (piece.isWhite) {
        whiteKingPosition = [endRow, endCol];
      } else {
        blackKingPosition = [endRow, endCol];
      }
    }

    // Giả lập di chuyển
    board[endRow][endCol] = piece;
    board[startRow][startCol] = null;

    // Kiểm tra xem vua có bị chiếu không
    bool kingInCheck = isKingInCheck(piece.isWhite);

    // Khôi phục lại vị trí cũ
    board[startRow][startCol] = piece;
    board[endRow][endCol] = originalDestinationPiece;

    // Khôi phục lại vị trí vua
    if (piece.type == ChessPieceType.king) {
      if (piece.isWhite) {
        whiteKingPosition = originalKingPosition!;
      } else {
        blackKingPosition = originalKingPosition!;
      }
    }

    return !kingInCheck;
  }

//Hết cờ
  bool isCheckMate(bool isWhiteKing) {
    // 1. Nếu vua không bị chiếu, không phải checkmate
    if (!isKingInCheck(isWhiteKing)) {
      return false;
    }

    // 2. Duyệt tất cả quân cờ của bên đang bị chiếu
    for (int row = 0; row < 8; row++) {
      for (int col = 0; col < 8; col++) {
        ChessPiece? piece = board[row][col];
        if (piece == null || piece.isWhite != isWhiteKing) continue;

        // 3. Lấy tất cả nước đi thực sự an toàn
        List<List<int>> moves = calculateRealValidMoves(row, col, piece, true);
        if (moves.isNotEmpty) {
          return false; // Có ít nhất 1 nước để thoát chiếu → chưa checkmate
        }
      }
    }

    // 4. Không có nước nào để thoát chiếu → checkmate
    return true;
  }

//Hàm thế bí
  bool isStalemate(bool isWhiteTurn) {
    // Nếu vua không bị chiếu
    if (isKingInCheck(isWhiteTurn)) return false;

    // Duyệt tất cả quân cờ của bên hiện tại
    for (int row = 0; row < 8; row++) {
      for (int col = 0; col < 8; col++) {
        ChessPiece? piece = board[row][col];
        if (piece == null || piece.isWhite != isWhiteTurn) continue;

        List<List<int>> moves = calculateRealValidMoves(row, col, piece, true);
        if (moves.isNotEmpty) {
          return false; // Còn nước đi → không phải bí thế
        }
      }
    }

    // Không có nước đi hợp lệ và không bị chiếu → bí thế (hoà)
    return true;
  }

//Hàm không đủ sức end game
  bool isInsufficientMaterial() {
    List<ChessPiece> remainingPieces = [];

    for (var row in board) {
      for (var piece in row) {
        if (piece != null) {
          remainingPieces.add(piece);
        }
      }
    }

    // Nếu chỉ còn 2 vua → hoà
    if (remainingPieces.length == 2) {
      return true;
    }

    // Nếu chỉ còn vua và 1 quân mã hoặc tượng (một bên)
    if (remainingPieces.length == 3) {
      return remainingPieces.any((p) =>
          p.type == ChessPieceType.knight || p.type == ChessPieceType.bishop);
    }

    // Nếu chỉ còn vua + tượng cùng màu vs vua + tượng cùng màu
    if (remainingPieces.length == 4) {
      List<ChessPiece> bishops = remainingPieces
          .where((p) => p.type == ChessPieceType.bishop)
          .toList();
      if (bishops.length == 2) {
        // Lấy màu ô của 2 tượng để so sánh
        List<String> bishopColors = [];
        for (int row = 0; row < 8; row++) {
          for (int col = 0; col < 8; col++) {
            var piece = board[row][col];
            if (piece != null && piece.type == ChessPieceType.bishop) {
              String color = ((row + col) % 2 == 0) ? "light" : "dark";
              bishopColors.add(color);
            }
          }
        }
        return bishopColors.length == 2 && bishopColors[0] == bishopColors[1];
      }
    }

    return false;
  }

//Hàm phong tốt
  void promotePawn(int row, int col, ChessPieceType newType) {
    setState(() {
      bool isWhite = board[row][col]!.isWhite;
      String imagePath = getImagePath(newType, isWhite);

      board[row][col] = ChessPiece(
        type: newType,
        isWhite: isWhite,
        imagePath: imagePath,
      );
    });
  }

  String getImagePath(ChessPieceType type, bool isWhite) {
    switch (type) {
      case ChessPieceType.queen:
        return 'assets/images/queen.png';
      case ChessPieceType.rook:
        return 'assets/images/rook.png';
      case ChessPieceType.bishop:
        return 'assets/images/bishop.png';
      case ChessPieceType.knight:
        return 'assets/images/knight.png';
      case ChessPieceType.pawn:
        return 'assets/images/pawn.png';
      case ChessPieceType.king:
        return 'assets/images/king.png';
    }
  }

//Ván mới
  void resetGame() {
    setState(() {
      _initializeBoard();
      isWhiteTurn = true;
      whitePiecesTaken.clear();
      blackPiecesTaken.clear();
      selectedPiece = null;
      selectedRow = -1;
      selectedCol = -1;
      validMoves = [];
      whiteKingPosition = [7, 4];
      blackKingPosition = [0, 4];
      checkStatus = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF5F0DC),
      body: Column(
        children: [
          //Quân cờ trắng bị ăn
          Expanded(
            child: GridView.builder(
              itemCount: whitePiecesTaken.length,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 8,
              ),
              itemBuilder: (context, index) => DeadPiece(
                imagePath: whitePiecesTaken[index].imagePath,
                isWhite: true,
              ),
            ),
          ),
          //Trạng thái game
          Text(checkStatus ? "CHECK" : ""),
          //Bàn cờ
          Expanded(
            flex: 3,
            child: GridView.builder(
              itemCount: 8 * 8,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 8,
              ),
              itemBuilder: (context, index) {
                int row = index ~/ 8;
                int col = index % 8;
                //Kiểm tra nếu quân cờ được chọn
                bool isSelected = selectedRow == row && selectedCol == col;
                //Kiểm tra nếu quân cờ được chọn có nước đi hợp lệ
                bool isValidMove = false;
                for (var position in validMoves) {
                  if (position[0] == row && position[1] == col) {
                    isValidMove = true;
                  }
                }
                return Square(
                  isWhite: isWhite(index),
                  piece: board[row][col],
                  isSelected: isSelected,
                  isValidMove: isValidMove,
                  onTap: () => pieceSelected(row, col),
                );
              },
            ),
          ),
          //Quân đen bị ăn
          Expanded(
            child: GridView.builder(
              itemCount: blackPiecesTaken.length,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 8,
              ),
              itemBuilder: (context, index) => DeadPiece(
                imagePath: blackPiecesTaken[index].imagePath,
                isWhite: false,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
