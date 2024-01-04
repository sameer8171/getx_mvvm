
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/res/components/Round_Button.dart';
import 'package:getx_mvvm/utils/Utils.dart';
import 'package:getx_mvvm/view_model/services/SplashServices.dart';

class SplashScreen extends StatefulWidget{
  const SplashScreen({super.key});

  @override
  State<StatefulWidget> createState() {
   return _SplashScreen();
  }

}

class _SplashScreen extends State<SplashScreen>{
  SplashService splashService = SplashService();

  @override
  void initState() {
    splashService.isLogin();
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     appBar: AppBar(
       title: Text('Splash'.tr),
     ),
     body: Center(
       child: Column(
         mainAxisAlignment: MainAxisAlignment.center,

         children: [
           RoundButton(onPress: (){
             Utils.snackBar('email'.tr,"Message");
           }, title: "Enter"),

         ],
       ),
     ),
     floatingActionButton: FloatingActionButton(
       onPressed: (){
         Utils.showToast('email'.tr);
       },
     ),
   );
  }
}