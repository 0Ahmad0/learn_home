import 'package:animate_icons/animate_icons.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController{
  GlobalKey<FormState> keyForm = GlobalKey<FormState>();
  bool isObserve1 = true;
  bool isObserve2 = true;
   AnimateIconController controller = AnimateIconController();

  void showPassword(){
    isObserve1 = !isObserve1;
    update();
  }

  void showConfrimPassword(){
    isObserve2 = !isObserve2;
    update();
  }


  String? validateUserName(val){
    if (val.isEmpty||(val.length<5||val.toString()[0].isNum||val.toString()[0]=='_')) {
      return 'falied username';
    } else {
      return null;
    }
  }


  String? validateEmail(val){
    if (val.isEmpty||(!val.toString().isEmail)) {
      return 'falied email';
    } else {
      return null;
    }

  }

  String? validatePassword(val){
    if (val.isEmpty||val.length<8) {
      return 'weak password must > 8';
    } else {
      return null;
    }

  }


  String? validateConfrimPassword(val){
    if (val.isEmpty||val.length<8) {
      return 'notTheSame';
    } else {
      return null;
    }

  }



}