import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebaseodev/view/common/common_text_field.dart';
import 'package:firebaseodev/view_model/login_view_model.dart';

class LoginPage extends StatelessWidget {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  LoginPage({super.key});

  @oversride
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Login"),
        centerTitle: true,
        backgroundColor: Colors.red.shade600,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                _buildEmailTextField(),
                SizedBox(height: 16),
                _buildPasswordTextField(),
              ],
            ),
            _buildLoginButton(context),
            _buildOpenRegisterButton(context),
          ],
        ),
      ),
    );
  }

  Widget _buildEmailTextField() {
    return CommonTextField(
      controller: _emailController,
      label: "Email",
    );
  }

  Widget _buildPasswordTextField() {
    return CommonTextField(
      controller: _passwordController,
      label: "Password",
    );
  }

  Widget _buildLoginButton(BuildContext context) {
    LoginViewModel viewModel = Provider.of(
      context,
      listen: false,
    );
    return ElevatedButton(
      child: Text("Giriş Yap"),

      onPressed: () {
        viewModel.login(
          context,
          _emailController.text.trim(),
          _passwordController.text.trim(),
        );
      },
    );
  }

  Widget _buildOpenRegisterButton(BuildContext context) {
    LoginViewModel viewModel = Provider.of(
      context,
      listen: false,
    );
    return TextButton(
      child: Text("Kaydol"),
      onPressed: (){
        viewModel.openRegisterPage(context);
      },
    );
  }
}
