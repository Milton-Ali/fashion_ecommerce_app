import 'package:fashion_ecommerce_app/core/constants/colors.dart';
import 'package:fashion_ecommerce_app/core/constants/sizes.dart';
import 'package:fashion_ecommerce_app/core/constants/text_style.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _isPasswordHidden = true;
  bool _isLoading = false;
  final TextEditingController _emailControal = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  @override
  void dispose() {
    _emailControal.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
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
                            // Create New Account
                            Text(
                              'Create New Account',
                              style: AppTextStyle.heading.copyWith(
                                color: AppColors.primary,
                              ),
                            ),
                            SizedBox(height: AppSizes.md),
                            //full name
                            TextFormField(
                              validator: (value) {
                                if (value == null || value.trim().isEmpty) {
                                  return 'Please enter your name';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                hintText: 'Full name',
                                prefixIcon: Icon(Icons.person),
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
                            TextFormField(
                              controller: _emailControal,
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
                            //Confirm Password
                            TextFormField(
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please confirm your password';
                                }
                                if (value != _passwordController.text) {
                                  return 'Passwords do not match';
                                }
                                return null;
                              },
                              controller: _confirmPasswordController,
                              obscureText: _isPasswordHidden,
                              cursorColor: AppColors.primary,
                              decoration: InputDecoration(
                                hintText: 'Confirm Password',
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
                                onPressed: () async {
                                  if (_isLoading) return;
                                  if (_formKey.currentState!.validate()) {
                                    final email = _emailControal.text.trim();
                                    final password = _passwordController.text
                                        .trim();
                                    setState(() {
                                      _isLoading = true;
                                    });
                                    try {
                                      await _auth
                                          .createUserWithEmailAndPassword(
                                            email: email,
                                            password: password,
                                          );
                                      setState(() {
                                        _isLoading = false;
                                      });

                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                            'Account created successfully',
                                          ),
                                        ),
                                      );
                                    } on FirebaseAuthException catch (e) {
                                      setState(() {
                                        _isLoading = false;
                                      });

                                      String errorMessage;
                                      switch (e.code) {
                                        case 'email-already-in-use':
                                          errorMessage =
                                              'This email is already registered';
                                          break;

                                        case 'weak-password':
                                          errorMessage = 'Password is too weak';
                                          break;

                                        case 'invalid-email':
                                          errorMessage =
                                              'Invalid email address';
                                          break;

                                        default:
                                          errorMessage = 'Registration failed';
                                      }
                                      ScaffoldMessenger.of(
                                        context,
                                      ).showSnackBar(
                                        SnackBar(content: Text(errorMessage)),
                                      );
                                    }
                                  }
                                },
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
                                        'Register',
                                        style: AppTextStyle.body.copyWith(
                                          color: Colors.white,
                                        ),
                                      ),
                              ),
                            ),
                            //Already have an account?login
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text('Already have an account?'),
                                TextButton(
                                  onPressed: () {},
                                  child: Text('Login'),
                                ),
                              ],
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
