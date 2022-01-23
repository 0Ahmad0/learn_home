import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:learnapp/constants/theme/theme_services.dart';
import 'package:learnapp/controller/home_controller/home_controller.dart';
import 'package:learnapp/controller/main_controller.dart';
import 'package:learnapp/widget/textfieldW.dart';


class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainController>(
      init: MainController(),
      builder: (_){
        return Scaffold(
          bottomNavigationBar: FadeInRight(
            child: BottomNavigationBar(
              type: BottomNavigationBarType.shifting,
              currentIndex: _.currentIndex,
              onTap: (numPage) {
                _.changeIndexBottomNav(numPage: numPage);
              },
              elevation: 0.0,
              items: [
                BottomNavigationBarItem(
                    title: Text(''),
                    icon: _.changeColorBottomNav(name: 'home',index: 0)
                ),
                BottomNavigationBarItem(
                    title: Text(''),
                    icon: _.changeColorBottomNav(name: 'favorite',index: 1)
                ),
                BottomNavigationBarItem(
                    title: Text(''),
                    icon: _.changeColorBottomNav(name: 'setting',index: 2)
                ),
              ],
            ),
          ),
          body: _.pages![_.currentIndex]['page'],
        );
      },
    );
  }
}
