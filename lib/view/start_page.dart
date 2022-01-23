import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:learnapp/constants/const.dart';
import 'package:learnapp/constants/const_color.dart';
import 'package:learnapp/constants/theme/theme_services.dart';
import 'package:learnapp/controller/app_controller/app_controller.dart';
import 'package:learnapp/view/login_page.dart';

class StartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 135.h,
          ),
          ZoomIn(
            delay: Duration(seconds: 1),
            child: SvgPicture.asset(
                'assets/images/startPage${ThemeService().isSavedDarkMode() ? 'Dark' : 'Light'}IMG.svg'
            )
          ),
          SizedBox(
            height: 68.h,
          ),
          FadeInLeft(
            delay: Duration(seconds: 2),
            child: Text(
              'Learn at home!',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 39.sp,
                fontFamily: 'AftikaBlack',
                color: ThemeService().isSavedDarkMode()
                  ? whiteColor
                    :mainColor
              ),
            ),
          ),
          SizedBox(
            height: 8.h,
          ),
          FadeInLeft(
            delay: Duration(seconds: 2),
            child: Text(
              'efficiently and effectively',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: ThemeService().isSavedDarkMode()
                ?colorSubtitleDark
                    :colorSubtitleLight
                ,
                fontSize: 17.sp,
                fontFamily: 'AftikaRegular',
              ),
            ),
          ),
          SizedBox(
            height: 59.h,
          ),
          FadeInUpBig(
            delay: Duration(seconds: 1),
            child: InkWell(
              onTap: () {
                Get.off(() => LoginPage());
              },
              child: Container(
                alignment: Alignment.center,
                width: 186.w,
                height: 58.h,
                decoration: BoxDecoration(
                    color: ThemeService().isSavedDarkMode()
                    ?secondColor
                    :mainColor
                    ,
                    borderRadius: BorderRadius.circular(8)),
                child: Text(
                  'Start Now!',
                  style: TextStyle(
                      color: ThemeService().isSavedDarkMode()
                      ?mainColor
                      :whiteColor,
                      fontSize: 18.sp,
                      fontFamily: 'AftikaBold'),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 50.h,
          ),
          Row(),
        ],
      ),
    );
  }
}
