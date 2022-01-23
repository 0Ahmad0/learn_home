import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:learnapp/constants/const_color.dart';
import 'package:learnapp/constants/theme/theme_services.dart';
import 'package:learnapp/controller/home_controller/home_controller.dart';
import 'package:learnapp/widget/textfieldW.dart';

class HomeNavPage extends StatelessWidget {
  const HomeNavPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.w, vertical: 22.h),
            child: GetBuilder<HomeController>(
              init: HomeController(),
              builder: (_) {
                return Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        FadeInDown(
                          child: SvgPicture.asset(
                            'assets/images/mune${ThemeService().isSavedDarkMode() ? 'Dark' : 'Light'}IMG.svg',
                          ),
                        ),
                        FadeInDown(
                            child: CircleAvatar(
                              backgroundColor: Color(0xffFC3366),
                            ))
                      ],
                    ),
                    SizedBox(
                      height: 36.h,
                    ),
                    FadeInLeft(
                      child: getTextField(
                          hint: 'search',
                          onChange: (val) {},
                          validator: (val) {},
                          prefixIcon: Icon(Icons.search)),
                    ),
                    SizedBox(
                      height: 21.h,
                    ),
                    SizedBox(
                      height: 40.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: _.courseCategory.length,
                        itemBuilder: (ctx, index) {
                          return GestureDetector(
                            onTap: () {
                              _.onTap(index);
                            },
                            child: AnimatedContainer(
                              alignment: Alignment.center,
                              padding: EdgeInsets.symmetric(
                                horizontal: 16.w,
                                vertical: 8.h,
                              ),
                              margin:
                              EdgeInsets.only(left: index == 0 ? 0 : 12.w),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(8.r),
                                  color: _.currentIndex == index
                                      ? ThemeService().isSavedDarkMode()
                                      ?secondColor:mainColor
                                      : colorTextFiled
                              ),
                              duration: Duration(milliseconds: 500),
                              child: Text(
                                _.courseCategory[index],
                                style: TextStyle(
                                    color: _.currentIndex == index
                                        ? Color(0xffFFFFFF)
                                        : Color(0xff9F9DBC),
                                    fontFamily: 'Aftika-SemiBold'),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(
                      height: 30.h,
                    ),
                    Expanded(
                      child: ListView.builder(
                        itemCount: _.courseListDef.length,
                        itemBuilder: (ctx, index) {
                          return GestureDetector(
                              onTap: () {},
                              child: FadeInRightBig(
                                child: Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.only(bottom: 20.h),
                                  width: 331.w,
                                  height: 185.h,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.r),
                                      color: _.courseListDef[index]
                                          .colorBackground),
                                  child: Stack(
                                    children: [
                                      SvgPicture.asset(
                                        '${_.courseListDef[index].logoCourse}',
                                      ),
                                      Center(
                                        child: Column(
                                          mainAxisAlignment:
                                          MainAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              height: 85.h,
                                            ),
                                            Text(
                                              '${_.courseListDef[index].titleCourse}',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  fontSize: 15.sp,
                                                  fontFamily: 'AftikaBold',
                                                  color: Color(0xff2C2B47)),
                                            ),
                                            SizedBox(
                                              height: 15.h,
                                            ),
                                            Wrap(
                                              alignment: WrapAlignment.center,
                                              children: [
                                                Text(
                                                  '${_.courseListDef[index].numVideo}',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize: 13.sp,
                                                      fontFamily:
                                                      'AftikaRegular',
                                                      color: Color(0xff87869E)),
                                                ),
                                                Text(
                                                  ' videos',
                                                  textAlign: TextAlign.center,
                                                  style: TextStyle(
                                                      fontSize: 13.sp,
                                                      fontFamily:
                                                      'AftikaRegular',
                                                      color: Color(0xffB9B8C6)),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ));
                        },
                      ),
                    ),
                  ],
                );
              },
            )),
      ),
    );
  }
}
