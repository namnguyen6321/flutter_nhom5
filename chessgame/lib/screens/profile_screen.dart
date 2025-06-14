import 'package:flutter/material.dart';
import 'edit_profile_screen.dart'; // Import màn hình chỉnh sửa hồ sơ.

// ProfileScreen là một `StatefulWidget` vì nó cần lưu trữ và cập nhật thông tin
// hồ sơ của người dùng (tên, email, v.v.). Khi người dùng chỉnh sửa thông tin,
// trạng thái của widget này sẽ thay đổi và giao diện sẽ được xây dựng lại.
class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  // === TRẠNG THÁI (STATE) ===
  // Các biến này lưu trữ thông tin hồ sơ hiện tại. Chúng là "trạng thái"
  // của widget này. Khi chúng thay đổi bên trong `setState`, UI sẽ cập nhật.
  String name = 'Nguyen Dinh Nam';
  String email = 'nguyendinhnam@gmail.com';
  String phone = '0123 456 789';
  String address = 'Ha Noi';
  String birthday = '01/01/2000';
  String gender = 'Nam';

  // Phương thức `build` được gọi để xây dựng giao diện của widget.
  @override
  Widget build(BuildContext context) {
    // Lấy theme hiện tại để sử dụng các màu sắc và kiểu chữ nhất quán.
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        centerTitle: true, // Căn giữa tiêu đề trên AppBar.
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Hiển thị ảnh đại diện.
            const CircleAvatar(
              radius: 50,
              // `AssetImage` được sử dụng để tải ảnh từ thư mục assets của dự án.
              // Bạn cần đảm bảo đã khai báo 'assets/images/' trong file pubspec.yaml.
              backgroundImage: AssetImage('assets/images/king.png'),
            ),
            const SizedBox(height: 12),

            // Sử dụng hàm trợ giúp để tạo các hàng thông tin một cách nhất quán.
            _buildInfoRow(theme, 'Name', name),
            _buildInfoRow(theme, 'Email', email),
            _buildInfoRow(theme, 'Phone', phone),
            _buildInfoRow(theme, 'Address', address),
            _buildInfoRow(theme, 'Birthday', birthday),
            _buildInfoRow(theme, 'Gender', gender),
            const SizedBox(height: 30),

            // Nút "Edit Profile".
            ElevatedButton.icon(
              icon: const Icon(Icons.edit),
              label: const Text('Edit Profile'),
              style: ElevatedButton.styleFrom(
                padding:
                    const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                backgroundColor: theme.colorScheme.primary, // Màu nền từ theme
                foregroundColor:
                    theme.colorScheme.onPrimary, // Màu chữ/icon từ theme
              ),
              // === XỬ LÝ SỰ KIỆN VÀ LUỒNG DỮ LIỆU ===
              // `onPressed` được đánh dấu là `async` vì nó sẽ đợi kết quả từ một hành động bất đồng bộ.
              onPressed: () async {
                // `Navigator.push` đẩy một màn hình mới (EditProfileScreen) lên trên màn hình hiện tại.
                // `await` sẽ tạm dừng việc thực thi hàm này cho đến khi `EditProfileScreen` được đóng
                // và trả về một kết quả.
                final result = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    // Truyền dữ liệu hiện tại vào `EditProfileScreen` để nó có thể hiển thị
                    // và cho phép người dùng chỉnh sửa.
                    builder: (_) => EditProfileScreen(
                      name: name,
                      email: email,
                      phone: phone,
                      address: address,
                      birthday: birthday,
                      gender: gender,
                    ),
                  ),
                );

                // Sau khi `EditProfileScreen` được đóng (`Navigator.pop`), code ở đây sẽ tiếp tục chạy.
                // `result` sẽ chứa dữ liệu được trả về (là một Map) hoặc là `null` nếu người dùng
                // chỉ nhấn nút back mà không lưu.
                if (result != null) {
                  // `setState` thông báo cho Flutter rằng trạng thái đã thay đổi và cần phải
                  // build lại giao diện.
                  setState(() {
                    // Cập nhật các biến trạng thái với dữ liệu mới nhận được từ `result`.
                    name = result['name'];
                    email = result['email'];
                    phone = result['phone'];
                    address = result['address'];
                    birthday = result['birthday'];
                    gender = result['gender'];
                  });
                }
              },
            ),
          ],
        ),
      ),
    );
  }

  // === HÀM TRỢ GIÚP (HELPER METHOD) ===
  // Xây dựng một hàng để hiển thị thông tin (ví dụ: "Tên: Nguyen Dinh Nam").
  // Tách ra thành hàm riêng giúp code trong `build` gọn gàng hơn.
  Widget _buildInfoRow(ThemeData theme, String title, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        crossAxisAlignment:
            CrossAxisAlignment.start, // Căn các dòng theo đầu dòng.
        children: [
          Text(
            '$title: ',
            style: theme.textTheme.bodyLarge
                ?.copyWith(fontWeight: FontWeight.bold), // In đậm tiêu đề.
          ),
          // `Expanded` đảm bảo rằng giá trị (value) sẽ chiếm hết không gian còn lại
          // và tự động xuống dòng nếu quá dài.
          Expanded(
            child: Text(
              value,
              style: theme.textTheme.bodyLarge,
            ),
          ),
        ],
      ),
    );
  }
}
