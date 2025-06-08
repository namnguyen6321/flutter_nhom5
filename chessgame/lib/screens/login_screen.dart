import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;

  static const Color primaryColor = Color(0xFF6C7EE1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  
                  const Icon(
                    Icons.castle,
                    size: 80,
                    color: primaryColor,
                  ),
                  const SizedBox(height: 16),

                  // Tiêu đề chào mừng
                  const Text(
                    'Chào mừng trở lại',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF2E3A59),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Đăng nhập để tiếp tục',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 48),

                  //  Email
                  _buildEmailField(),
                  const SizedBox(height: 20),

                  // Mật khẩu
                  _buildPasswordField(),
                  const SizedBox(height: 12),

                  // Nút "Quên mật khẩu?"
                  Align(
                    alignment: Alignment.centerRight,
                    child: TextButton(
                      onPressed: () {
                        // Xử lý logic quên mật khẩu ở đây
                      },
                      child: const Text(
                        'Quên mật khẩu?',
                        style: TextStyle(color: primaryColor, fontWeight: FontWeight.w600),
                      ),
                    ),
                  ),
                  const SizedBox(height: 24),

                  // Nút Đăng nhập
                  _buildLoginButton(),
                  const SizedBox(height: 32),

                  // Dải phân cách "HOẶC"
                  _buildDivider(),
                  const SizedBox(height: 24),

                  // Các nút đăng nhập bằng mạng xã hội
                  _buildSocialLoginRow(),
                  const SizedBox(height: 32),

                  // Tùy chọn chuyển qua màn hình Đăng ký
                  _buildSignUpRow(context),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  /// Widget cho trường nhập liệu Email
  Widget _buildEmailField() {
    return TextFormField(
      decoration: InputDecoration(
        labelText: 'Email',
        prefixIcon: const Icon(Icons.email_outlined, color: primaryColor),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: primaryColor, width: 2),
        ),
        floatingLabelStyle: const TextStyle(color: primaryColor)
      ),
      keyboardType: TextInputType.emailAddress,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Vui lòng nhập email của bạn';
        }
        if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
          return 'Vui lòng nhập một địa chỉ email hợp lệ';
        }
        return null;
      },
    );
  }

  /// Widget cho trường nhập liệu Mật khẩu
  Widget _buildPasswordField() {
    return TextFormField(
      obscureText: !_isPasswordVisible,
      decoration: InputDecoration(
        labelText: 'Mật khẩu',
        prefixIcon: const Icon(Icons.lock_outline, color: primaryColor),
        suffixIcon: IconButton(
          icon: Icon(
            _isPasswordVisible ? Icons.visibility_off_outlined : Icons.visibility_outlined,
            color: primaryColor,
          ),
          onPressed: () {
            setState(() {
              _isPasswordVisible = !_isPasswordVisible;
            });
          },
        ),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
         focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(color: primaryColor, width: 2),
        ),
        floatingLabelStyle: const TextStyle(color: primaryColor)
      ),
      validator: (value) {
        if (value == null || value.isEmpty) {
          return 'Vui lòng nhập mật khẩu của bạn';
        }
        return null;
      },
    );
  }

  /// Widget cho nút Đăng nhập chính
  Widget _buildLoginButton() {
    return ElevatedButton(
      onPressed: () {
        if (_formKey.currentState!.validate()) {
          // Xử lý logic đăng nhập ở đây
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Đang đăng nhập...')),
          );
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: primaryColor,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 5,
        shadowColor: primaryColor.withOpacity(0.4),
      ),
      child: const Text('ĐĂNG NHẬP', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, letterSpacing: 1)),
    );
  }

  /// Widget cho dải phân cách "HOẶC"
  Widget _buildDivider() {
    return Row(
      children: [
        const Expanded(child: Divider()),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Text('HOẶC', style: TextStyle(color: Colors.grey[500], fontWeight: FontWeight.w600)),
        ),
        const Expanded(child: Divider()),
      ],
    );
  }

  /// Widget cho hàng chứa các nút đăng nhập mạng xã hội
  Widget _buildSocialLoginRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Lưu ý: Icon dưới đây là ví dụ. Bạn có thể thay bằng icon thương hiệu chính xác
        // bằng cách sử dụng thư viện như `font_awesome_flutter`.
        _buildSocialButton(icon: Icons.g_mobiledata, onTap: () {}),
        const SizedBox(width: 20),
        _buildSocialButton(icon: Icons.facebook, onTap: () {}),
      ],
    );
  }

  Widget _buildSocialButton({required IconData icon, required VoidCallback onTap}) {
    return OutlinedButton(
      onPressed: onTap,
      style: OutlinedButton.styleFrom(
        shape: const CircleBorder(),
        padding: const EdgeInsets.all(16),
        side: BorderSide(color: Colors.grey[300]!),
      ),
      child: Icon(icon, color: primaryColor, size: 28),
    );
  }

  /// Widget cho tùy chọn chuyển sang màn hình Đăng ký
  Widget _buildSignUpRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Chưa có tài khoản?", style: TextStyle(color: Colors.grey[600])),
        TextButton(
          onPressed: () {
            // Điều hướng tới màn hình Đăng ký ở đây
          },
          child: const Text(
            'Đăng ký ngay',
            style: TextStyle(
              color: primaryColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
