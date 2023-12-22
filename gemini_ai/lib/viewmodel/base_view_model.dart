import 'package:flutter/material.dart';
import 'package:flutter_gemini/flutter_gemini.dart';

mixin BaseViewModel<T extends StatefulWidget> on State<T> {
  final controller = TextEditingController();
  final gemini = Gemini.instance;
  String? searchedText, result;
  bool _loading = false;

  bool get loading => _loading;

  set loading(bool set) => setState(() => _loading = set);
  void onpressed() {
    if (controller.text.isNotEmpty) {
      searchedText = controller.text;
      controller.clear();
      loading = true;

      gemini.text(searchedText!).then((value) {
        result = value?.content?.parts?.last.text;
        loading = false;
      });
    }
  }
}
