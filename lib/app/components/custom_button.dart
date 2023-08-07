import 'package:flash_chat/contants/app_text_style.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton(
      {required this.text, required this.color, super.key, this.onPressed});
  final String text;
  final Color color;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        fixedSize: Size(MediaQuery.of(context).size.width - 30, 60),
        shadowColor: Colors.blueAccent,
        elevation: 5,
      ),
      onPressed: onPressed,
      child: Text(
        text,
        style: AppTextStyles.custombuttom,
      ),
    );
  }
}
