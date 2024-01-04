import 'dart:async';

import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:getx_mvvm/res/routes/RoutesName.dart';
import 'package:getx_mvvm/view_model/controller/user_preference/user_prefrence_view_model.dart';

class SplashService {

  UserPreference sharedPreferences =  UserPreference();

  void isLogin() {
    


    sharedPreferences.getUser().then((value) {
      if(value.token!.isEmpty || value.token.toString() == 'null'){
        Timer(const Duration(seconds: 3),
                () => Get.toNamed(RouteName.loginScreen)
        );
      }else{
        Timer(const Duration(seconds: 3),
                () => Get.toNamed(RouteName.homeScreen)
        );
      }
    }).onError((error, stackTrace){
      Timer(const Duration(seconds: 3),
              () => Get.toNamed(RouteName.loginScreen)
      );
    });

  }
}