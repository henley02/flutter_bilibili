import 'package:flutter/material.dart';
import 'package:get/get.dart';

/// 全屏按钮
class FullButton extends StatelessWidget {
  final String title;
  final bool? enable;
  final VoidCallback onPressed;

  const FullButton({
    Key? key,
    required this.title,
    this.enable = true,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 1,
      child: MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(6),
        ),
        height: 45,
        onPressed: enable! ? onPressed : null,
        color: Get.theme.primaryColor,
        textColor: Colors.white,
        disabledColor: Get.theme.primaryColor.withOpacity(0.3),
        child: Text(
          title,
          style: TextStyle(fontSize: 16),
        ),
      ),
    );
  }
}
