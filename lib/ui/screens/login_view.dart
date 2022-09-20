import 'package:flutter/material.dart';
import 'package:locals_demo/ui/base/base_view.dart';
import 'package:locals_demo/ui/screens/login_viewmodel.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
      builder: (context, viewModel, child) {
        return Scaffold(
          backgroundColor: Colors.black,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Spacer(),
                TextField(
                  controller: viewModel.emailController,
                  decoration: const InputDecoration(
                    hintText: 'Email',
                  ),
                  keyboardType: TextInputType.emailAddress,
                ),
                const SizedBox(height: 32),
                TextField(
                  controller: viewModel.deviceIdController,
                  decoration: const InputDecoration(
                    hintText: 'Device ID',
                  ),
                ),
                const SizedBox(height: 32),
                TextField(
                  controller: viewModel.passwordController,
                  decoration: const InputDecoration(
                    hintText: 'Password',
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 32),
                TextButton(
                  onPressed: viewModel.onLoginPressed,
                  child: viewModel.busy
                      ? const CircularProgressIndicator()
                      : const Text(
                          'Login',
                        ),
                ),
                const SizedBox(height: 32),
                Text(
                  viewModel.errorMessage ?? '',
                  style: TextStyle(
                    color: Colors.red[800]!,
                  ),
                ),
                const Spacer(),
              ],
            ),
          ),
        );
      },
      viewModel: LoginViewModel(),
    );
  }
}
