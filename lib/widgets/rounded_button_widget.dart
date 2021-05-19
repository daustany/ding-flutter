import 'package:flutter/material.dart';

class RoundedButtonWidget extends StatelessWidget {
  final String buttonText;
  final Color buttonColor;
  final Color textColor;
  final VoidCallback onPressed;

  const RoundedButtonWidget({
    Key? key,
    required this.buttonText,
    required this.buttonColor,
    this.textColor = Colors.white,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextButton(
      // color: buttonColor,
      // shape: StadiumBorder(),
      onPressed: onPressed,
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
        backgroundColor: MaterialStateProperty.all<Color>(buttonColor),
      ),
      child: Text(
        buttonText,
        style: Theme.of(context).textTheme.button!.copyWith(color: textColor),
      ),
    );
  }
}
