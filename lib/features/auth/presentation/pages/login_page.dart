import 'package:fashion_ecommerce_app/core/constants/colors.dart';
import 'package:fashion_ecommerce_app/core/constants/sizes.dart';
import 'package:fashion_ecommerce_app/core/constants/text_style.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  bool _isPasswordHidden = true;
  bool _isLoading = false;
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  //login
  Future<void> _login() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });
      try {
        await _auth.signInWithEmailAndPassword(
          email: _emailController.text.trim(),
          password: _passwordController.text.trim(),
        );

        setState(() {
          _isLoading = false;
        });
      } on FirebaseAuthException catch (e) {
        String message = 'Something went wrong';
        switch (e.code) {
          case 'invalid-credential':
            message = 'Invalid email or password';
            break;

          case 'user-not-found':
            message = 'No user found with this email';
            break;

          case 'wrong-password':
            message = 'Incorrect password';
            break;

          default:
            message = 'Login failed. Please try again';
        }
        if (mounted) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(message)));
        }
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  //logOut
  Future<void> _logOut() async {
    _auth.signOut();
  }

  @override
  Widget build(BuildContext context) {
    final isLandscape =
        MediaQuery.of(context).orientation == Orientation.landscape;

    final formWidth = isLandscape
        ? MediaQuery.of(context).size.width * 0.55
        : MediaQuery.of(context).size.width * 0.85;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              minHeight: MediaQuery.of(context).size.height,
            ),
            child: Padding(
              padding: const EdgeInsets.all(AppSizes.md),
              child: Center(
                child: Container(
                  // height: MediaQuery.of(context).size.height * 0.65,
                  width: formWidth,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(AppSizes.md),
                    border: Border.all(width: 2, color: AppColors.primary),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(AppSizes.md),
                    child: Center(
                      child: Form(
                        key: _formKey,

                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // User Login
                            Text(
                              'User Login',
                              style: AppTextStyle.heading.copyWith(
                                color: AppColors.primary,
                              ),
                            ),
                            SizedBox(height: AppSizes.md),
                            //Please enter your email
                            TextFormField(
                              controller: _emailController,
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'Please enter your email';
                                }
                                if (!value.contains('@')) {
                                  return 'Please enter a valid email';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: 'Email Address',
                                prefixIcon: Icon(Icons.email),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColors.primary,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    AppSizes.sm,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColors.primary,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    AppSizes.sm,
                                  ),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),
                                  borderRadius: BorderRadius.circular(
                                    AppSizes.sm,
                                  ),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    AppSizes.sm,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: AppSizes.md),
                            //Password
                            TextFormField(
                              controller: _passwordController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your password';
                                }
                                if (value.length < 6) {
                                  return 'Password must be at least 6 characters';
                                }
                                return null;
                              },
                              obscureText: _isPasswordHidden,
                              cursorColor: AppColors.primary,
                              decoration: InputDecoration(
                                hintText: 'Password',
                                suffixIcon: IconButton(
                                  onPressed: () {
                                    setState(() {
                                      _isPasswordHidden = !_isPasswordHidden;
                                    });
                                  },
                                  icon: Icon(
                                    _isPasswordHidden
                                        ? Icons.visibility_off
                                        : Icons.visibility,
                                  ),
                                ),
                                prefixIcon: Icon(Icons.lock),
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColors.primary,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    AppSizes.sm,
                                  ),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: AppColors.primary,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    AppSizes.sm,
                                  ),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red),
                                  borderRadius: BorderRadius.circular(
                                    AppSizes.sm,
                                  ),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Colors.red,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(
                                    AppSizes.sm,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: AppSizes.md),

                            //Register button
                            SizedBox(
                              width: double.infinity,
                              height: 50,
                              child: ElevatedButton(
                                onPressed: _login,
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: AppColors.primary,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                      AppSizes.sm,
                                    ),
                                  ),
                                ),
                                child: _isLoading
                                    ? SizedBox(
                                        width: 25,
                                        height: 25,
                                        child: const CircularProgressIndicator(
                                          color: Colors.white,
                                          strokeWidth: 2,
                                        ),
                                      )
                                    : Text(
                                        'Login',
                                        style: AppTextStyle.body.copyWith(
                                          color: Colors.white,
                                        ),
                                      ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
