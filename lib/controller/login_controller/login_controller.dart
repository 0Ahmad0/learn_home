import 'package:animate_icons/animate_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController{
  GlobalKey<FormState> keyForm = GlobalKey<FormState>();
  bool isObserve = true;
  AnimateIconController controller = AnimateIconController();


  void showPassword(){
    isObserve = !isObserve;
    update();
  }

  String? validateUserNameOrEmail(val){
    if(val.isEmpty || !val.toString().isEmail){
      return 'falied email';
    }else{
      return null;
    }
  }
}