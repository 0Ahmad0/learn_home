import 'package:animate_do/animate_do.dart';
import 'package:animate_icons/animate_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:learnapp/constants/const_color.dart';
import 'package:learnapp/constants/theme/theme_services.dart';
import 'package:learnapp/controller/login_controller/login_controller.dart';
import 'package:learnapp/view/pay_page.dart';
import 'package:learnapp/view/register_page.dart';
import 'package:learnapp/widget/textfieldW.dart';

class LoginPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: GetBuilder<LoginController>(
            init: LoginController(),
            builder: (_){
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 22.w),
                child: Form(
                  key: _.keyForm,
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        FadeInRightBig(
                          child: SvgPicture.asset(
                              'assets/images/login${
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
                            'Let’s Start!',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 39.sp,
                              fontFamily: 'AftikaBlack',
                              color: ThemeService().isSavedDarkMode()
                                ?whiteColor
                                  :mainColor
                            ),
                          ),
                        ),
                        SizedBox(height: 10.h,),
                        FadeInDownBig(
                          child: getTextField(
                              hint: 'Email or UserName',
                              onChange: (val) {},
                              validator: (val){
                                return _.validateUserNameOrEmail(val);
                              }),
                        ),
                        SizedBox(height: 15.h,),
                        FadeInDownBig(
                          child: getTextField(
                              hint: 'Password',
                              isObserve: _.isObserve,
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
                                startIconColor: ThemeService().isSavedDarkMode()
                                ?colorTextFiled
                                :mainColor
                                ,
                                endIconColor: ThemeService().isSavedDarkMode()
                                    ?colorTextFiled.withOpacity(.5)
                                    :mainColor.withOpacity(.5),
                              ),

                              onChange: (val) {},
                              validator: (val){
                              }),
                        ),
                        SizedBox(height: 30.h,),
                        FadeInUpBig(
                          child: InkWell(
                            onTap: () {
                              if(_.keyForm.currentState!.validate()){
                                Get.off(()=>PayPage(),transition: Transition.zoom);

                              }else{
                              }
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
                                'Sign in',
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
                          height: 31.h,
                        ),
                        FadeInRightBig(
                          delay: Duration(milliseconds: 500),
                          child: Wrap(
                            children: [
                              Text('Don\'t have an account? ',
                                style: TextStyle(
                                  color: ThemeService().isSavedDarkMode()
                                      ?colorSubtitleDark
                                      :colorSubtitleLight,
                                  fontSize: 15.sp,
                                    fontFamily: 'AftikaRegular'
                                ),
                              ),
                              GestureDetector(
                                onTap: (){
                                  Get.off(()=>RegisterPage());
                                },
                                child: Text('Sign up',style: TextStyle(
                                  color: ThemeService().isSavedDarkMode()
                                      ?secondColor
                                      :mainColor,
                                  fontSize: 15.sp,
                                  fontFamily: 'AftikaRegular'
                                ),),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 35.h,
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
          ),
        )
    );
  }
}
