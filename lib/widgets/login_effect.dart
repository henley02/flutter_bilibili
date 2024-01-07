import 'package:flutter/material.dart';

class LoginEffect extends StatefulWidget {
  final bool protect;
  const LoginEffect({
    Key? key,
    required this.protect,
  }) : super(key: key);

  @override
  State<LoginEffect> createState() => _LoginEffectState();
}

class _LoginEffectState extends State<LoginEffect> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 10),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        border: Border(
          bottom: BorderSide(
            color: Colors.grey.shade300,
          ),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          _image(true),
          Image.asset(
            'assets/images/logo.png',
            width: 90,
            height: 90,
          ),
          _image(false),
        ],
      ),
    );
  }

  _image(bool isLeft) {
    String leftImage = widget.protect
        ? 'assets/images/head_left_protect.png'
        : 'assets/images/head_left.png';
    String rightImage = widget.protect
        ? 'assets/images/head_right_protect.png'
        : 'assets/images/head_right.png';
    return Image.asset(
      isLeft ? leftImage : rightImage,
      width: 100,
      height: 100,
    );
  }
}
