import 'package:flutter/material.dart';

class RegisterController with ChangeNotifier {
  final TextEditingController _nameController = TextEditingController();
  get nameController => _nameController;

  final TextEditingController _emailController = TextEditingController();
  get emailController => _emailController;

  final TextEditingController _passwordController = TextEditingController();
  get passwordController => _passwordController;

  final FocusNode _emailFocus = FocusNode();
  get emailFocus => _emailFocus;

  final FocusNode _nameFocus = FocusNode();
  get nameFocus => _nameFocus;

  final FocusNode _passwordFocus = FocusNode();
  get passwordFocus => _passwordFocus;
}
