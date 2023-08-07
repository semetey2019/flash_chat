import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flash_chat/contants/app_text_style.dart';
import 'package:flutter/material.dart';

class FlashChat extends StatelessWidget {
  const FlashChat({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
      style: AppTextStyles.flashChat,
      child: AnimatedTextKit(
        totalRepeatCount: 30,
        animatedTexts: [
          WavyAnimatedText('Flash chat'),
        ],
        isRepeatingAnimation: true,
        onTap: () {},
      ),
    );
  }
}
