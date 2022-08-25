import 'package:flutter/material.dart';
import 'package:mogawe_test_2/features/auth/services/auth_services.dart';
import 'package:mogawe_test_2/global.dart';
import 'package:mogawe_test_2/widgets/big_btn.dart';
import 'package:mogawe_test_2/widgets/custom_textfield.dart';

class AuthScreen extends StatefulWidget {
  static const String routeName = '/auth';
  const AuthScreen({Key? key}) : super(key: key);

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final AuthService authService = AuthService();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void signIn() {
    authService.signIn(
      context: context,
      email: _emailController.text,
      password: _passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    // print("REBUILD");
    return Scaffold(
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 52,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  "Masuk",
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  "Silahkan masuk dengan email-mu yang terdafter",
                  style: TextStyle(
                    color: grayFont,
                  ),
                ),
                const SizedBox(height: 16),
                CustomTextfield(
                  controller: _emailController,
                  title: "Email",
                  hintText: "Contoh : nama@gmail.com",
                ),
                const SizedBox(height: 16),
                CustomTextfield(
                  controller: _passwordController,
                  title: "Kata Sandi",
                  hintText: "Masukkan kata sandi",
                  suffix: const Icon(
                    Icons.visibility,
                    color: grayFont,
                  ),
                ),
                const SizedBox(height: 16),
                Container(
                  alignment: Alignment.topRight,
                  child: const Text(
                    "Lupa Kata Sandi?",
                    style: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                const SizedBox(height: 16),
                BigBtn(
                  onTap: signIn,
                  title: const Text(
                    "Masuk",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  height: 50,
                ),
                const SizedBox(height: 16),
                Container(
                  alignment: Alignment.center,
                  child: Column(
                    children: const [
                      Text("Belum Punya Akun?"),
                      Text(
                        "Daftar Disini",
                        style: TextStyle(
                          fontSize: 16,
                          color: primaryColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
