import 'package:flutter/material.dart';
import 'package:task/constants/values.dart';

class ReusableInputField extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;

  const ReusableInputField({
    super.key,
    required this.hintText,
    required this.controller,
  });

  @override
  State createState() => _ReusableInputFieldState();
}

class _ReusableInputFieldState extends State<ReusableInputField> {
  @override
  void initState() {
    super.initState();
    widget.controller.addListener(() {});
  }

  // @override
  // void dispose() {
  //   widget.controller.dispose();
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 50,
        child: TextField(
          controller: widget.controller,
          style: const TextStyle(fontSize: 18, color: white),
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: const TextStyle(color: grey),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(roundedBorders)),
              borderSide: const BorderSide(color: grey, width: 1),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(roundedBorders)),
              borderSide: const BorderSide(color: grey, width: 2),
            ),
          ),
        ),
      ),
    );
  }
}
