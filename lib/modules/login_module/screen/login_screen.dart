import 'package:email_validator/email_validator.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pingolearn_task/modules/login_module/controller/login_controller.dart';
import 'package:pingolearn_task/modules/login_module/screen/register_screen.dart';
import 'package:pingolearn_task/modules/login_module/widgets/textFormField.dart';
import 'package:pingolearn_task/services/auth_functions.dart';
import 'package:pingolearn_task/utils/constants.dart';
import 'package:pingolearn_task/utils/keyboard_close.dart';
import 'package:pingolearn_task/utils/utils.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  LoginController loginScreenController = LoginController();
  bool isLogin = true;
  final _formKey = GlobalKey<FormState>();
  String username = '';
  String email = '';
  String password = '';

  @override
  void dispose() {
    loginScreenController.passwordController.dispose();
    loginScreenController.emailController.dispose();

    super.dispose();
  }

  void _toggleFormMode() {
    setState(() {
      isLogin = !isLogin;
    });
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      if (isLogin) {
        signIn(email, password, context);
      } else {
        signUp(email, password, username, context);
        // Navigator.push(
        //     context,
        //     MaterialPageRoute(
        //       builder: (context) => const RegisterScreen(),
        //     ));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<LoginController>(
      create: (BuildContext context) => loginScreenController,
      child: KeyboardClose(
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: titleText(
                text: 'Comments',
                color: blue,
                fontSize: 20.sp,
                fontWeight: FontWeight.w700),
            backgroundColor: white,
          ),
          backgroundColor: white,
          bottomNavigationBar: Padding(
            padding: EdgeInsets.symmetric(vertical: 20.0.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                GestureDetector(
                  onTap: _submit,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.r),
                      color: blue,
                    ),
                    padding:
                        EdgeInsets.symmetric(vertical: 10.h, horizontal: 70.w),
                    child: titleText(
                        text: isLogin ? 'Login' : 'SignUp',
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.white),
                  ),
                ),
                heightSpacer(10.h),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: isLogin
                            ? "Don't have an account? "
                            : 'Already Signed Up? ',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400),
                      ),
                      TextSpan(
                        text: isLogin ? 'SignUp' : 'Login',
                        style: TextStyle(
                            color: blue,
                            fontWeight: FontWeight.w700,
                            fontSize: 16.sp),
                        recognizer: TapGestureRecognizer()
                          ..onTap = _toggleFormMode,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          body: Consumer<LoginController>(
              builder: (context, registerConsumer, child) {
            return Padding(
              padding: EdgeInsets.all(20.w),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    if (!isLogin)
                      CustomTextField(
                        hintText: 'Username',
                        controller: TextEditingController(),
                        focusNode: FocusNode(),
                        nextFocusNode: registerConsumer.emailFocus,
                        textInputAction: TextInputAction.next,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter a username';
                          }
                          if (value.length < 3) {
                            return 'Username must be at least 3 characters long';
                          }
                          if (!RegExp(r'^[a-zA-Z0-9_]+$').hasMatch(value)) {
                            return 'Username can only contain letters, numbers, and underscores';
                          }
                          return null;
                        },
                        onSaved: (value) {
                          username = value!;
                        },
                      ),
                    CustomTextField(
                      hintText: 'Email',
                      controller: registerConsumer.emailController,
                      focusNode: registerConsumer.emailFocus,
                      nextFocusNode: registerConsumer.passwordFocus,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter an email address';
                        }
                        if (!EmailValidator.validate(value)) {
                          return 'Please enter a valid email address';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        email = value!;
                      },
                    ),
                    CustomTextField(
                      hintText: 'Password',
                      controller: registerConsumer.passwordController,
                      obscureText: true,
                      focusNode: registerConsumer.passwordFocus,
                      keyboardType: TextInputType.visiblePassword,
                      textInputAction: TextInputAction.done,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter a password';
                        }
                        if (value.length < 6) {
                          return 'Password must be at least 6 characters long';
                        }
                        if (!RegExp(
                                r'(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@#$%^&*]).{6,}')
                            .hasMatch(value)) {
                          return 'Password must include an uppercase letter, a lowercase letter, a digit, and a special character';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        password = value!;
                      },
                    ),
                  ],
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
