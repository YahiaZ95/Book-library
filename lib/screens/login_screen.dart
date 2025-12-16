import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../widgets/background_bubbles.dart';
import '../widgets/primary_button.dart';
import '../app.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool _isLoading = false;

  Future<void> _login() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => _isLoading = true);

    try {
      await _auth.signInWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      Navigator.pushReplacementNamed(context, AppRoutes.home);
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.message ?? 'Login failed')));
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Log in')),
      body: SafeArea(
        child: BubblesBackground(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(height: 24),

                  TextFormField(
                    controller: _emailController,
                    decoration: const InputDecoration(hintText: 'Email'),
                    validator: (value) =>
                        value!.isEmpty ? 'Enter your email' : null,
                  ),

                  const SizedBox(height: 12),

                  TextFormField(
                    controller: _passwordController,
                    decoration: const InputDecoration(hintText: 'Password'),
                    obscureText: true,
                    validator: (value) =>
                        value!.isEmpty ? 'Enter your password' : null,
                  ),

                  const SizedBox(height: 24),

                  _isLoading
                      ? const CircularProgressIndicator()
                      : PrimaryButton(label: 'Log in', onPressed: _login),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
