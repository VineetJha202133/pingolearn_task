import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:pingolearn_task/modules/login_module/controller/register_controller.dart';
import 'package:pingolearn_task/modules/login_module/screen/login_screen.dart';
import 'package:pingolearn_task/modules/login_module/widgets/textFormField.dart';
import 'package:pingolearn_task/services/auth_functions.dart';
import 'package:pingolearn_task/utils/constants.dart';
import 'package:pingolearn_task/utils/keyboard_close.dart';
import 'package:pingolearn_task/utils/utils.dart';
import 'package:provider/provider.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  RegisterController registerScreenController = RegisterController();
  final _formKey = GlobalKey<FormState>();
  String name = '';
  String email = '';
  String password = '';

  @override
  void dispose() {
    registerScreenController.nameController.dispose();
    registerScreenController.passwordController.dispose();
    registerScreenController.emailController.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      signUp(email, password, name, context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<RegisterController>(
      create: (BuildContext context) => registerScreenController,
      child: KeyboardClose(
        child: Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: titleText(
                text: 'Registration',
                color: blue,
                fontSize: 20.sp,
                fontWeight: FontWeight.w700),
            backgroundColor: white,
          ),
          bottomNavigationBar: Padding(
            padding:  EdgeInsets.symmetric(vertical: 10.0.h),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  
                  width: double.infinity,
                  color: blue,
                  child: ElevatedButton(
                    onPressed: _submit,
                    child: Text('Sign Up'),
                  ),
                ),
                SizedBox(height: 10.h),
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'Already have an account? ',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w400),
                      ),
                      TextSpan(
                        text: 'Login',
                        style: TextStyle(
                            color: blue,
                            fontWeight: FontWeight.w700,
                            fontSize: 16.sp),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => const LoginScreen(),
                                ));
                          },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          backgroundColor: white,
          body: Consumer<RegisterController>(
              builder: (context, registerConsumer, child) {
            return Padding(
              padding: EdgeInsets.all(20.w),
              child: Form(
                key: _formKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomTextField(
                      hintText: 'Name',
                      controller: registerConsumer.nameController,
                      focusNode: registerConsumer.nameFocus,
                      nextFocusNode: registerConsumer.emailFocus,
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      validator: (value) {
                        if (value!.isEmpty || value.length < 3) {
                          return 'Name is too short';
                        }
                        return null;
                      },
                      onSaved: (value) {
                        name = value!;
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
                        if (!value!.contains('@')) {
                          return 'Invalid email';
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
                        if (value!.length < 6) {
                          return 'Password is too short';
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
