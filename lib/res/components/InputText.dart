import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:getx_mvvm/utils/Utils.dart';

class InputText extends StatelessWidget {
  const InputText(
      {super.key,
      required this.inputController,
      required this.inputType,
      this.hint = 'Enter your value',
      required this.focusNode,
      this.focusTitle = 'Field is Empty'});

  final TextEditingController inputController;
  final TextInputType inputType;
  final String hint, focusTitle;
  final FocusNode focusNode;


  @override
  Widget build(BuildContext context) {
    return TextFormField(
      keyboardType: inputType,
      decoration: InputDecoration(hintText: hint),
      controller: inputController,
      focusNode:focusNode,
      validator: (value){
        if(value!.isEmpty){
          Utils.snackBar(focusTitle, hint);
        }
      },
    );
  }
}
