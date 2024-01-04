import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/models/login/LoginResponse.dart';
import 'package:getx_mvvm/repository/login_repository/LoginRepository.dart';
import 'package:getx_mvvm/res/routes/RoutesName.dart';
import 'package:getx_mvvm/utils/Utils.dart';
import 'package:getx_mvvm/view_model/controller/user_preference/user_prefrence_view_model.dart';

class LoginViewModel extends GetxController{
  final _api = LoginRepository();
  
  UserPreference userPreference = UserPreference();
  
  final emailController = TextEditingController().obs;
  final passwordController = TextEditingController().obs;

  final emailFocusNode = FocusNode().obs;
  final passwordFocusNode = FocusNode().obs;

  RxBool loading = false.obs;

  void loginApi(){
    loading.value = true;
    Map data ={
      'email': emailController.value.text,
      'password' : passwordController.value.text
    };

    _api.loginApi(data).then((value){
      loading.value = false;
      if(value['error'] == 'user not found'){
        Utils.snackBar("Login", value['error']);
      }else if(value['error'] == 'Missing email or username'){
        Utils.snackBar("Login", value['error']);
      }else if(value['error'] == 'Missing password'){
        Utils.snackBar("Login", value['error']);
      } else{
        userPreference.saveUser(LoginResponse.fromJson(value)).then((value){
          Get.toNamed(RouteName.homeScreen);
        }).onError((error, stackTrace){

        });
        Utils.snackBar('Login', "Login Token -> ${value['token']}");
      }

    }).onError((error, stackTrace){
      loading.value = false;
      if (kDebugMode) {
        print(error.toString());
      }
      Utils.snackBar('Error', error.toString());
    });

  }




}