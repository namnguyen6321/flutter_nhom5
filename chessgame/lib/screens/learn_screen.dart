import 'package:flutter/material.dart';

class LearnScreen extends StatelessWidget {
  const LearnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final textColor = Theme.of(context).colorScheme.onBackground;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Learn Chess'),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Hướng dẫn chơi cờ vua',
              style:
                  textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // --- Mục 1: Cách di chuyển quân cờ
            _buildSectionTitle('1. Cách di chuyển quân cờ'),
            _buildPieceRow(
                'Vua', 'Di chuyển 1 ô theo mọi hướng.', 'king.png', context),
            _buildPieceRow('Hậu', 'Di chuyển theo hàng, cột hoặc đường chéo.',
                'queen.png', context),
            _buildPieceRow(
                'Xe', 'Di chuyển theo hàng hoặc cột.', 'rook.png', context),
            _buildPieceRow(
                'Tượng', 'Di chuyển theo đường chéo.', 'bishop.png', context),
            _buildPieceRow(
                'Mã', 'Di chuyển hình chữ L.', 'knight.png', context),
            _buildPieceRow('Tốt', 'Đi 1 ô, ăn chéo.', 'pawn.png', context),

            const SizedBox(height: 20),

            // --- Mục 2: Cách bắt quân
            _buildSectionTitle('2. Cách bắt quân'),
            Text(
              '• Bắt quân đối phương bằng cách di chuyển quân của bạn vào ô có quân đối phương.',
              style: textTheme.bodyLarge?.copyWith(color: textColor),
            ),

            const SizedBox(height: 20),

            // --- Mục 3: Quy tắc khác
            _buildSectionTitle('3. Quy tắc khác'),
            Text(
              '• Không được di chuyển vào ô có quân của mình.\n'
              '• Nếu vua bị chiếu, bạn phải di chuyển vua ra khỏi tình trạng chiếu.\n'
              '• Hết nước đi hoặc bị chiếu bí thì thua.',
              style: textTheme.bodyLarge?.copyWith(color: textColor),
            ),
          ],
        ),
      ),
    );
  }

  // --- Widget tiêu đề mục
  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
      ),
    );
  }

  // --- Widget dòng mô tả quân cờ
  Widget _buildPieceRow(
      String name, String description, String imageName, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(
            'assets/images/$imageName',
            width: 40,
            height: 40,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: RichText(
              text: TextSpan(
                style: TextStyle(
                  fontSize: 14,
                  color: Theme.of(context).colorScheme.onBackground,
                ),
                children: [
                  TextSpan(
                    text: '$name: ',
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  TextSpan(text: description),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
