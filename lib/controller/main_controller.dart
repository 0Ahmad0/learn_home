import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:learnapp/constants/theme/theme_services.dart';
import 'package:learnapp/models/course_defenation.dart';
import 'package:learnapp/view/bottom_nav_pages/favorite_nav_page.dart';
import 'package:learnapp/view/bottom_nav_pages/home_nav_page.dart';
import 'package:learnapp/view/bottom_nav_pages/setting_nav_page.dart';

class MainController extends GetxController {
  int currentIndex = 0;
  List<Map<String, dynamic>>? pages;

  Widget changeColorBottomNav({name,index}){
    return SvgPicture.asset(
      'assets/images/$name${ThemeService().isSavedDarkMode() ? 'Dark' : 'Light'}IMG.svg',
      color:  currentIndex == index
          ?
      ThemeService().isSavedDarkMode()
          ?Color(0xffFCAFB7)
          :Color(0xff2C2B47)
          :ThemeService().isSavedDarkMode()
          ?Color(0xff646379)
          :Color(0xffE0DFE8),
    );
  }


  void changeIndexBottomNav({numPage}){
    currentIndex = numPage;
    update();
  }

  @override
  void onInit() {
    pages = [
      {
        'page':HomeNavPage()
      },
      {
        'page':FavoriteNavPage()
      },
      {
        'page': SettingPage()
      }
    ];
    super.onInit();
  }
}
