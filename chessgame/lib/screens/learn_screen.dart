import 'package:flutter/material.dart';
class LearnScreen extends StatelessWidget {
  const LearnScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Learn Chess')),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        child: Text(
          'Hướng dẫn chơi cờ vua\n\n'
          '1. Cách di chuyển quân cờ:\n'
          '   - Vua: Di chuyển 1 ô theo mọi hướng.\n'
          '   - Hậu: Di chuyển theo hàng, cột hoặc đường chéo.\n'
          '   - Xe: Di chuyển theo hàng hoặc cột.\n'
          '   - Tượng: Di chuyển theo đường chéo.\n'
          '   - Mã: Di chuyển hình chữ L (2 ô theo một hướng và 1 ô theo hướng vuông góc).\n'
          '   - Tốt: Di chuyển 1 ô về phía trước, ăn quân đối phương theo đường chéo.\n\n'
          '2. Cách bắt quân:\n'
          '   - Bắt quân đối phương bằng cách di chuyển quân của bạn vào ô có quân đối phương.\n\n'
          '3. Các quy tắc khác:\n'
          '   - Không được di chuyển vào ô có quân của mình.\n'
          '   - Nếu vua bị chiếu, bạn phải di chuyển vua ra khỏi tình trạng chiếu.\n',
        ),
      ),
    );
  }
}