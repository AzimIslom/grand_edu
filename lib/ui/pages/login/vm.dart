import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';

class LoginVM extends ChangeNotifier {
  final mask = MaskTextInputFormatter(
    mask: '## ###-##-##',
    filter: {"#": RegExp(r'[0-9]')},
    type: MaskAutoCompletionType.lazy,
  );
  final RoundedLoadingButtonController btnController =
      RoundedLoadingButtonController();

  final TextEditingController password = TextEditingController();

  bool isLoading = false;

  void change() {
    isLoading = !isLoading;
    notifyListeners();
  }
}
