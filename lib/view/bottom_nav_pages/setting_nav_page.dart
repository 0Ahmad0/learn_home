// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
//
// class SettingNavPage extends StatelessWidget {
//   const SettingNavPage({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           children: [
//             Text('Choose a style',
//               textAlign: TextAlign.center,
//               style: TextStyle(
//               fontSize: 39.sp,
//               fontFamily: 'AftikaBlack',
//               color: Color(0xff2C2B47)
//             ),),
//             Padding(
//               padding:  EdgeInsets.symmetric(
//                 horizontal: 40.w
//               ),
//               child: Text('pop or subtle. Day or Night. Customize your interface',
//                 textAlign: TextAlign.center,
//                 style: TextStyle(
//                 fontSize: 15.sp,
//                 fontFamily: 'AftikaRegular',
//                 color: Color(0xffB9B8C6)
//               ),),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }

// we use provider to manage the app state

import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:learnapp/constants/theme/theme_services.dart';
import 'package:learnapp/controller/app_controller/app_controller.dart';
import 'package:learnapp/controller/main_controller.dart';

class SettingPage extends StatefulWidget {
  @override
  _SettingPageState createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  changeThemeModeNow(bool theme) {
    if (theme) {
      _animationController.forward(from: 0.0);
    } else {
      _animationController.reverse(from: 1.0);
    }
  }
  @override
  void initState() {
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 800));
    super.initState();
  }

  // function to toggle circle animation


  MainController mainController = Get.put(MainController());

  @override
  Widget build(BuildContext context) {
    // Now we have access to the theme properties
    return Scaffold(
      key: _scaffoldKey,
      body: SafeArea(
        child: Container(
          alignment: Alignment.center,
          margin: EdgeInsets.only(top: 50.h),
          child: Column(
            children: [
              Stack(
                children: [
                  ZoomIn(
                    duration: Duration(seconds: 1),
                    child: Container(
                      width: 140.w,
                      height: 140.w,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                            colors: [
                              if (!ThemeService().isSavedDarkMode()) ...[Color(0xDDFF0080), Color(0xDDFF8C00)],
                              if (ThemeService().isSavedDarkMode()) ...[Color(0xFF8983F7), Color(0xFFA3DAFB)]
                            ],
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight),
                      ),
                    ),
                  ),
                  Transform.translate(
                    offset: Offset(40, 0),
                    child: ScaleTransition(
                      scale: _animationController.drive(
                        Tween<double>(begin: 0.0, end: 1.0).chain(
                          CurveTween(curve: Curves.decelerate),
                        ),
                      ),
                      alignment: Alignment.topRight,
                      child: Container(
                        width: 100.w,
                        height: 100.w,
                        decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: ThemeService().isSavedDarkMode()
                                ? Color(0xff2C2B47)
                                : Colors.white),
                      ),
                    ),
                  )
                ],
              ),
              SizedBox(height: 80.h),
              FadeInRightBig(
                child: Text(
                  'Choose a style',
                  style: TextStyle(
                      fontSize: 39.sp,
                      fontFamily: 'AftikaBlack'),
                ),
              ),
              SizedBox(height: 25.h),
              FadeInLeftBig(
                child: Padding(
                  padding:  EdgeInsets.symmetric(
                    horizontal: 40.w
                  ),
                  child: Text(
                    'Pop or subtle. Day or night. Customize your interface',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 18.sp,
                      fontFamily: 'AftikaRegular'
                    ),
                  ),
                ),
              ),
              SizedBox(height: 60.h),

              ZoomIn(
                duration: Duration(seconds: 1),
                child: ZAnimatedToggle(
                  values: ['Light', 'Dark'],
                  onToggleCallback: (val) {
                    ThemeService().changeThemeMode();
                    setState(() {
                      changeThemeModeNow(ThemeService().isSavedDarkMode());
                      mainController.update();
                    });
                  },
                ),
              ),
              SizedBox(
                height: 50.h,
              ),
              FadeInUp(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    buildDot(
                      width: 8.w,
                      height: 8.w,
                      color: !ThemeService().isSavedDarkMode()
                          ? Color(0xFF26242e)
                          : Colors.white,
                    ),
                    buildDot(
                      width: 25.w,
                      height: 8.h,
                      color: !ThemeService().isSavedDarkMode()
                          ? Color(0xFF26242e)
                          : Colors.white,
                    ),
                    buildDot(
                      width: 8.w,
                      height: 8.w,
                      color: !ThemeService().isSavedDarkMode()
                          ? Color(0xFF26242e)
                          : Colors.white,
                    ),
                  ],
                ),
              ),
              // skip & next
            ],
          ),
        ),
      ),
    );
  }

// for drawing the dots
  Container buildDot({width, height, color}) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 4),
      width: width,
      height: height,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: color,
      ),
    );
  }
}

class ZAnimatedToggle extends StatefulWidget {
  final List<String> values;
  final ValueChanged onToggleCallback;

  ZAnimatedToggle({
    Key? key,
    required this.values,
    required this.onToggleCallback,
  }) : super(key: key);

  @override
  _ZAnimatedToggleState createState() => _ZAnimatedToggleState();
}

class _ZAnimatedToggleState extends State<ZAnimatedToggle> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      width: 270.w,
      height: 55.h,
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              widget.onToggleCallback(1);
            },
            child: Container(
              width: 260.w,
              height: 135.w,
              decoration: ShapeDecoration(
                  color: ThemeService().isSavedDarkMode()
                      ? Color(0xFF222029)
                      : Color(0xFFe7e7e8),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(width * .1))),
              child: Row(
                children: List.generate(
                  widget.values.length,
                  (index) => Padding(
                    padding: EdgeInsets.symmetric(horizontal: width * .1),
                    child: Text(
                      widget.values[index],
                      style: TextStyle(
                          fontSize: 20.w,
                          fontFamily: 'AftikaRegular',
                          color: Color(0xFF646379)),
                    ),
                  ),
                ),
              ),
            ),
          ),
          AnimatedAlign(
            alignment: ThemeService().isSavedDarkMode()
                ? Alignment.centerRight
                : Alignment.centerLeft,
            duration: Duration(milliseconds: 800),
            curve: Curves.ease,
            child: Container(
              alignment: Alignment.center,
              width: 125.w,
              height: 100.w,
              decoration: ShapeDecoration(
                  color: ThemeService().isSavedDarkMode()
                      ? Color(0xFf34323d)
                      : Color(0xFFFFFFFF),
                  shadows: [
                    if (!ThemeService().isSavedDarkMode())
                      BoxShadow(
                          color: Color(0xFFd8d7da),
                          spreadRadius: 5,
                          blurRadius: 10,
                          offset: Offset(0, 5)),
                    if (ThemeService().isSavedDarkMode())
                      BoxShadow(
                          color: Color(0x66000000),
                          spreadRadius: 5,
                          blurRadius: 10,
                          offset: Offset(0, 5))
                  ],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(50.r))),
              child: Text(
                ThemeService().isSavedDarkMode()
                    ? widget.values[1]
                    : widget.values[0],
                style: TextStyle(
                  fontSize: 20.w,
                  fontFamily: 'Aftika-SemiBold',
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
