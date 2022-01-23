import 'package:get/get.dart';

class PayController extends GetxController{
bool isBorderM = true;
bool isBorderY = false;

void onSelect(){
  isBorderY = !isBorderY;
  isBorderM = !isBorderM;
  isBorderY?isBorderM=false:isBorderM=true;
  isBorderM?isBorderY=false:isBorderY=true;
  update();
}
}