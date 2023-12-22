import 'package:flutter/material.dart';

import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:gemini_ai/product/companents/custom_appbar.dart';
import 'package:gemini_ai/product/const/const_color.dart';
import 'package:gemini_ai/product/const/const_text.dart';
import 'package:gemini_ai/viewmodel/base_view_model.dart';
import 'package:lottie/lottie.dart';

class SectionTextInput extends StatefulWidget {
  const SectionTextInput({super.key});

  @override
  State<SectionTextInput> createState() => _SectionTextInputState();
}

class _SectionTextInputState extends State<SectionTextInput>
    with BaseViewModel {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: white,
        appBar: const CustomAppBar(),
        body: Column(
          children: [
            if (searchedText != null)
              MaterialButton(
                  color: black,
                  onPressed: () {
                    setState(() {
                      searchedText = null;
                      result = null;
                    });
                  },
                  child: Text('Aranan: $searchedText',
                      style: Theme.of(context)
                          .textTheme
                          .titleSmall
                          ?.copyWith(color: white))),
            Expanded(
                child: loading
                    ? Lottie.asset('assets/ai.json')
                    : result != null
                        ? Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Markdown(data: result!),
                          )
                        : const Center(
                            child: Text(
                            bodyText,
                            style: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontSize: 16,
                                color: black),
                          ))),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                cursorColor: white,
                style: const TextStyle(color: white),
                controller: controller,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                      onPressed: onpressed,
                      icon: const Icon(
                        Icons.send_rounded,
                        color: Colors.white,
                      )),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                  hintText: hintText,
                  hintStyle: const TextStyle(color: grey),
                  enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(width: 1, color: black)),
                  focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)),
                      borderSide: BorderSide(width: 1, color: black)),
                  filled: true,
                  fillColor: black,
                ),
                onTapOutside: (event) =>
                    FocusManager.instance.primaryFocus?.unfocus(),
              ),
            )
          ],
        ));
  }
}
