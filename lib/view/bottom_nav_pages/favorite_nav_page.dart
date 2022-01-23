import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:learnapp/constants/theme/theme_services.dart';

class FavoriteNavPage extends StatelessWidget {
  const FavoriteNavPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ZoomIn(
                duration: Duration(seconds: 1),
                child: SvgPicture.asset(
                  'assets/images/soon${
                  ThemeService().isSavedDarkMode()
                      ?'Dark'
                      :'Light'
                  }IMG.svg',
                  width: 350.w,
                  height: 350.h,
                ),
              ),
              SizedBox(height: 50.h,),
              Pulse(
                delay: Duration(milliseconds:1100 ),
                infinite: true,
                child: Text('Soon...',style: TextStyle(
                  fontSize: 30.sp,
                  fontFamily: 'AftikaBlack'
                ),),
              )
            ],
          ),
        ),
      ),
    );
  }
}
