import 'package:flutter/material.dart';
import 'package:task/constants/values.dart';

class CustomButton extends StatefulWidget {
  final String leftText;
  final String rightText;

  final VoidCallback onLeftButtonTap;
  final VoidCallback onRightButtonTap;

  const CustomButton(
      {super.key,
      required this.leftText,
      required this.rightText,
      required this.onLeftButtonTap,
      required this.onRightButtonTap});

  @override
  State createState() => _CustomButtonState();
}

class _CustomButtonState extends State<CustomButton> {
  bool leftButtonTapped = true;
  bool rightButtonTapped = false;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //This is the left side of button

        InkWell(
          onTap: () {
            if (!leftButtonTapped) {
              setState(() {
                leftButtonTapped = !leftButtonTapped;
                rightButtonTapped = !rightButtonTapped;
              });
            }

            widget.onLeftButtonTap();
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            width: 170,
            height: 50,
            decoration: BoxDecoration(
                color: leftButtonTapped ? activeColor : inactiveColor,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(roundedBorders),
                  bottomLeft: Radius.circular(roundedBorders),
                )),
            child: Center(
              child: Text(
                widget.leftText,
                style: TextStyle(
                    fontSize: 20, color: leftButtonTapped ? white : black),
              ),
            ),
          ),
        ),

//This is the right side of the button

        InkWell(
          onTap: () {
            if (!rightButtonTapped) {
              setState(() {
                leftButtonTapped = !leftButtonTapped;
                rightButtonTapped = !rightButtonTapped;
              });
            }

            widget.onRightButtonTap();
          },
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 100),
            width: 170,
            height: 50,
            decoration: BoxDecoration(
                color: rightButtonTapped ? activeColor : inactiveColor,
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(roundedBorders),
                  bottomRight: Radius.circular(roundedBorders),
                )),
            child: Center(
              child: Text(
                widget.rightText,
                style: TextStyle(
                    fontSize: 20, color: rightButtonTapped ? white : black),
              ),
            ),
          ),
        )
      ],
    );
  }
}
