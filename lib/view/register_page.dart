import 'package:animate_icons/animate_icons.dart';
import 'package:flutter/material.dart';
import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:learnapp/constants/const_color.dart';
import 'package:learnapp/constants/theme/theme_services.dart';
import 'package:learnapp/controller/register_controller/register_controller.dart';
import 'package:learnapp/view/pay_page.dart';
import 'package:learnapp/widget/textfieldW.dart';

import 'login_page.dart';

class RegisterPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 22.w),
            child: SingleChildScrollView(
              child: GetBuilder<RegisterController>(
                init: RegisterController(),
                builder: (_){
                  return Form(
                    key: _.keyForm,
                    child: Column(
                      children: [
                       
                        FadeInRightBig(
                          child: SvgPicture.asset(
                            'assets/images/signUp${
                                ThemeService().isSavedDarkMode()
                                    ?'Dark'
                                    :'Light'
                            }IMG.svg',
                          ),
                        ),
                        SizedBox(
                          height: 26.h,
                        ),
                        FadeInRightBig(
                          delay: Duration(milliseconds: 500),
                          child: Text(
                            'Create account',
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
                          height: 10.h,
                        ),
                        FadeInDownBig(
                          delay: Duration(milliseconds: 100),
                          child: getTextField(
                              hint: 'UserName',
                              onChange: (val) {},
                              validator: (val) {
                              return _.validateUserName(val);
                              }),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        FadeInDownBig(
                          delay: Duration(milliseconds: 120),
                          child: getTextField(
                              hint: 'Email',
                              onChange: (val) {},
                              validator: (val) {
                                return _.validateEmail(val);
                              }),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        FadeInDownBig(
                          delay: Duration(milliseconds: 140),
                          child: getTextField(
                              isObserve: _.isObserve1,
                              hint: 'Password',
                              suffixIcon:  AnimateIcons(
                                startIcon: Icons.visibility_off_sharp,
                                endIcon: Icons.remove_red_eye,
                                controller: _.controller,
                                onStartIconPress: () {
                                  _.showPassword();
                                  return true;
                                },
                                onEndIconPress: () {
                                  _.showPassword();
                                  return true;
                                },
                                duration: Duration(milliseconds: 500),
                                startIconColor: Color(0xff2c2b47),
                                endIconColor: Color(0xff2c2b47).withOpacity(.5),
                              ),
                              onChange: (val) {},
                              validator: (val) {
                                return _.validatePassword(val);
                              }),
                        ),
                        SizedBox(
                          height: 15.h,
                        ),
                        FadeInDownBig(
                          delay: Duration(milliseconds: 160),
                          child: getTextField(
                              hint: 'Confirm Password',
                              isObserve: _.isObserve2,
                              onChange: (val) {},
                              suffixIcon:  AnimateIcons(
                                startIcon: Icons.visibility_off_sharp,
                                endIcon: Icons.remove_red_eye,
                                controller: _.controller,
                                onStartIconPress: () {
                                  _.showConfrimPassword();

                                  return true;
                                },
                                onEndIconPress: () {
                                  _.showConfrimPassword();

                                  return true;
                                },
                                duration: Duration(milliseconds: 500),
                                startIconColor: Color(0xff2c2b47),
                                endIconColor: Color(0xff2c2b47).withOpacity(.5),
                              ),
                              validator: (val) {
                              }),
                        ),
                        SizedBox(
                          height: 30.h,
                        ),
                        FadeInUpBig(
                          child: InkWell(
                            onTap: () {
                              if(_.keyForm.currentState!.validate()){
                                Get.off(()=>PayPage(),transition: Transition.zoom);
                              }else{
                                print('Hello');
                              }
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
                                'Sign up',
                                style: TextStyle(
                                    color: ThemeService().isSavedDarkMode()
                                  ?mainColor
                                  :whiteColor,
                                    fontSize: 18.sp,
                                    fontFamily: 'AftikaBold',
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 31.h,
                        ),
                        FadeInRightBig(
                          delay: Duration(milliseconds: 500),
                          child: Wrap(
                            children: [
                              Text(
                                'Already have account? ',
                                style: TextStyle(
                                  color: ThemeService().isSavedDarkMode()
                                      ?colorSubtitleDark
                                      :colorSubtitleLight,
                                  fontFamily: 'AftikaRegular',
                                  fontSize: 15.sp,
                                ),
                              ),
                              GestureDetector(
                                onTap: () {
                                  Get.off(() => LoginPage());
                                },
                                child: Text(
                                  'Sign in',
                                  style: TextStyle(
                                    color: ThemeService().isSavedDarkMode()
                                        ?secondColor
                                        :mainColor,
                                    fontSize: 15.sp,
                                      fontFamily: 'AftikaRegular'
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 35.h,
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ));
  }
}
