import 'package:flutter/material.dart';
import 'package:get/get.dart';

class TextInput extends StatefulWidget {
  final String title;

  ///空文本
  final String? hint;
  final ValueChanged<String>? onChanged;
  final ValueChanged<bool>? focusChanged;

  ///底部的线是否撑满整个一行
  final bool? lineStretch;

  /// 是否为密码
  final bool? obscureText;

  ///输入框控制器
  final TextEditingController? controller;

  ///输入框类型
  final TextInputType? keyboardType;

  const TextInput({
    Key? key,
    required this.title,
    this.hint,
    this.onChanged,
    this.focusChanged,
    this.lineStretch = false,
    this.obscureText = false,
    this.controller,
    this.keyboardType = TextInputType.text,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() => _TextInputState();
}

class _TextInputState extends State<TextInput> {
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _focusNode.addListener(() {
      if (widget.focusChanged != null) {
        widget.focusChanged!(_focusNode.hasFocus);
      }
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 15),
              width: 100,
              child: Text(
                widget.title,
                style: const TextStyle(fontSize: 16),
              ),
            ),
            _input(),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(left: widget.lineStretch! ? 0 : 15),
          child: const Divider(
            height: 1,
            thickness: 0.5,
          ),
        ),
      ],
    );
  }

  _input() {
    return Expanded(
      child: TextField(
        controller: widget.controller,
        maxLines: 1,
        cursorColor: context.theme.primaryColor,
        obscureText: widget.obscureText!,
        style: const TextStyle(
          fontSize: 16,
          color: Colors.black,
          fontWeight: FontWeight.w300,
        ),
        onChanged: widget.onChanged,
        focusNode: _focusNode,
        keyboardType: widget.keyboardType!,
        autofocus: !widget.obscureText!,
        decoration: InputDecoration(
          hintText: widget.hint ?? '',
          hintStyle: const TextStyle(fontSize: 15, color: Colors.grey),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.only(
            left: 8,
            right: 8,
          ),
        ),
      ),
    );
  }
}
