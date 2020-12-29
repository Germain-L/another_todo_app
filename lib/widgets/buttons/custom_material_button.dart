import 'package:flutter/material.dart';

class CustomMaterialButton extends StatelessWidget {
  final void Function() onPressed;
  final String text;

  const CustomMaterialButton({
    Key key,
    this.onPressed,
    this.text,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      elevation: 6,
      highlightElevation: 1,
      onPressed: onPressed,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      child: Text(text),
      minWidth: MediaQuery.of(context).size.width * 0.95,
      color: Theme.of(context).buttonColor,
    );
  }
}
