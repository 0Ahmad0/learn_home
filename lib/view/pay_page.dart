import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:learnapp/constants/const_color.dart';
import 'package:learnapp/constants/theme/theme_services.dart';
import 'package:learnapp/controller/pay_controller/pay_controller.dart';

import 'main_page.dart';

class PayPage extends StatelessWidget {
  const PayPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: GetBuilder<PayController>(
            init: PayController(),
            builder: (payController) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 22.w),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      FadeInDownBig(
                        child: SvgPicture.asset(
                            'assets/images/pay${
                                ThemeService().isSavedDarkMode()
                                    ? 'Dark'
                                    : 'Light'
                            }IMG.svg'
                        ),
                      ),
                      SizedBox(height: 26.h,),
                      FadeInRightBig(
                        delay: Duration(milliseconds: 500),
                        child: Text(
                          'Get unlimited access!',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontSize: 38.sp,
                            fontFamily: 'AftikaBlack',
                            color: ThemeService().isSavedDarkMode()
                                ?whiteColor
                                :mainColor
                          ),
                        ),
                      ),
                      SizedBox(height: 14.h,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          buildPayContainer(
                            payController: payController,
                            numPay: 11.99,
                            color: Color(0xffADDEE6),
                              isBorder: payController.isBorderM,
                              text: 'Monthly'
                          ),
                          buildPayContainer(
                            payController: payController,
                            numPay: 4.99,
                            color: secondColor,
                            isBorder: payController.isBorderY,
                            text: 'Yearly',
                          ),
                        ],
                      ),
                      SizedBox(height: 50.h,),
                      FadeInUpBig(
                        child: InkWell(
                          onTap: () {
                            Get.off(() => MainPage(),
                                transition: Transition.rightToLeftWithFade,
                              duration: Duration(milliseconds: 500)
                            );
                          },
                          child: Container(
                            alignment: Alignment.center,
                            width: 186.w,
                            height: 58.h,
                            decoration: BoxDecoration(
                                color: ThemeService().isSavedDarkMode()
                                    ?secondColor
                                    :mainColor,
                                borderRadius: BorderRadius.circular(8)),
                            child: Text(
                              'Go Premium',
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

                    ],
                  ),
                ),
              );
            },
          ),
        )
    );
  }

  ZoomIn buildPayContainer({payController,numPay,color,text,isBorder}) {
    return ZoomIn(
                          delay: Duration(seconds: 1),
                          child: Stack(
                            alignment: Alignment.topRight,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  payController.onSelect();
                                },
                                child: AnimatedContainer(
                                  margin: EdgeInsets.only(
                                      top: 10.h,
                                      bottom: 10.h
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 22.w,
                                      vertical: 22.h
                                  ),
                                  width: 156.w,
                                  height: 136.h,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(
                                          12.r),
                                      border: Border.all(
                                        color: isBorder
                                            ? ThemeService().isSavedDarkMode()
                                        ?colorSubtitleLight:mainColor
                                            : Colors.transparent,
                                      ),
                                      color: ThemeService().isSavedDarkMode()
                                      ?colorSubtitleDark
                                          :colorTextFiled
                                  ),
                                  duration: Duration(milliseconds: 400),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment
                                        .start,
                                    children: [
                                      Text('\$${numPay}', style: TextStyle(
                                          color: ThemeService().isSavedDarkMode()
                                              ?colorPriceDark
                                              :mainColor,
                                          fontSize: 24.sp,
                                          fontFamily: 'AftikaBold'
                                      ),),
                                      SizedBox(height: 14.h,),
                                      Wrap(
                                        children: [
                                          Text('\$${numPay}', style: TextStyle(
                                              color: ThemeService().isSavedDarkMode()
                                                  ?whiteColor
                                                  :mainColor,
                                              fontSize: 12.sp,
                                              fontFamily: 'AftikaBold'
                                          ),),
                                          Text(' per month', style: TextStyle(
                                              color: ThemeService().isSavedDarkMode()
                                                  ?colorSubtitleLight
                                                  :colorSubtitleDark,
                                              fontSize: 12.sp,
                                              fontFamily: 'AftikaRegular'
                                          ),),
                                        ],
                                      ),
                                      SizedBox(height: 9.h,),
                                      Wrap(
                                        children: [
                                          Text('\$${numPay*12}', style: TextStyle(
                                              color: ThemeService().isSavedDarkMode()
                                                  ?whiteColor
                                                  :mainColor,
                                              fontSize: 12.sp,
                                              fontFamily: 'AftikaBold'
                                          ),),
                                          Text(' per year', style: TextStyle(
                                              color: ThemeService().isSavedDarkMode()
                                                  ?colorSubtitleLight
                                                  :colorSubtitleDark,
                                              fontSize: 12.sp,
                                              fontFamily: 'AftikaRegular'
                                          ),),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              Container(
                                alignment: AlignmentDirectional.center,
                                margin: EdgeInsets.only(
                                    top: 5.w,
                                    right: 5.w
                                ),
                                width: 43.w,
                                height: 15.h,
                                decoration: BoxDecoration(
                                    color: color,
                                    borderRadius: BorderRadius.circular(5.r)
                                ),
                                child: Text(text, style: TextStyle(
                                    color: Color(0xffFFFFFF),
                                    fontSize: 7.sp,
                                    fontFamily: 'Aftika-SemiBold'
                                ),),

                              )
                            ],
                          ),
                        );
  }
}
