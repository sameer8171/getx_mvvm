import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getx_mvvm/res/color/AppColor.dart';

class RoundButton extends StatelessWidget {
  const RoundButton(
      {Key? key,
      this.buttonColor = AppColor.blackColor,
      this.textColor = AppColor.whiteColor,
      this.loading = false,
      required this.onPress,
      this.width = 100,
      this.height = 50,
      required this.title})
      : super(key: key);

  final bool loading;
  final String title;
  final double height, width;
  final VoidCallback onPress;
  final Color textColor, buttonColor;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onPress,
      child: Container(
        height: height,
        width: width,
        decoration: BoxDecoration(
          color: buttonColor,
          borderRadius: BorderRadius.circular(10)
        ),
        child: loading ? const Center(child: CircularProgressIndicator()) :
        Center(child: Text(title, style: TextStyle(color: textColor),)),
      ),
    );
  }
}
