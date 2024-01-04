import 'package:flutter/cupertino.dart';
import 'package:getx_mvvm/res/color/AppColor.dart';

class TextView extends StatelessWidget {
  const TextView(
      {super.key,
      this.textValue = "Demo",
      this.textColor = AppColor.blackColor});

  final String textValue;
  final Color textColor;

  @override
  Widget build(BuildContext context) {
    return Text(
      textValue,
      style: TextStyle(color: textColor),
    );
  }
}
