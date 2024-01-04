import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_mvvm/res/components/InputText.dart';
import 'package:getx_mvvm/res/components/TextView.dart';
import 'package:getx_mvvm/view_model/controller/login/login_view_model.dart';

import '../../res/components/Round_Button.dart';
import '../../utils/Utils.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<StatefulWidget> createState() {
    return _LoginScreen();
  }
}

class _LoginScreen extends State<LoginScreen> {
  final loginViewModel = Get.put(LoginViewModel());

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextView(
          textValue: 'login_screen'.tr,
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 20, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    InputText(
                      inputController: loginViewModel.emailController.value,
                      inputType: TextInputType.emailAddress,
                      hint: "email_hint".tr,
                      focusNode: loginViewModel.emailFocusNode.value,
                      focusTitle: 'Email',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    InputText(
                      inputController: loginViewModel.passwordController.value,
                      inputType: TextInputType.emailAddress,
                      hint: "password_hint".tr,
                      focusNode: loginViewModel.passwordFocusNode.value,
                      focusTitle: 'Password',
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              ),
              Obx(() => RoundButton(
                    onPress: () {
                      _formKey.currentState!.validate();
                      if (loginViewModel
                              .emailController.value.text.isNotEmpty &&
                          loginViewModel
                              .passwordController.value.text.isNotEmpty) {
                        loginViewModel.loginApi();
                      }
                    },
                    title: "enter".tr,
                    width: 200,
                    loading: loginViewModel.loading.value,
                  ))
            ],
          ),
        ),
      ),
    );
  }
}
