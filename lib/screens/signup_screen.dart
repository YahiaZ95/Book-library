import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import '../widgets/background_bubbles.dart';
import '../widgets/primary_button.dart';
import '../app.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool _isLoading = false;

  Future<void> _signup() async {
    if (!_formKey.currentState!.validate()) return;

    if (_passwordController.text != _confirmPasswordController.text) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text('Passwords do not match')));
      return;
    }

    setState(() => _isLoading = true);

    try {
      await _auth.createUserWithEmailAndPassword(
        email: _emailController.text.trim(),
        password: _passwordController.text.trim(),
      );

      Navigator.pushReplacementNamed(context, AppRoutes.home);
    } on FirebaseAuthException catch (e) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text(e.message ?? 'Signup failed')));
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Create account')),
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
                    controller: _nameController,
                    decoration: const InputDecoration(hintText: 'Full Name'),
                    validator: (value) =>
                        value!.isEmpty ? 'Enter your name' : null,
                  ),

                  const SizedBox(height: 12),

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
                    validator: (value) => value!.length < 6
                        ? 'Password must be at least 6 characters'
                        : null,
                  ),

                  const SizedBox(height: 12),

                  TextFormField(
                    controller: _confirmPasswordController,
                    decoration: const InputDecoration(
                      hintText: 'Confirm Password',
                    ),
                    obscureText: true,
                    validator: (value) =>
                        value!.isEmpty ? 'Confirm password' : null,
                  ),

                  const SizedBox(height: 24),

                  _isLoading
                      ? const CircularProgressIndicator()
                      : PrimaryButton(
                          label: 'Create Account',
                          onPressed: _signup,
                        ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
