import 'package:get/get.dart';

class AppController extends GetxController{
  bool valueSwitch = false;

  void switchVal(val){
    valueSwitch = val;
    update();
  }

}