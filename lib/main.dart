import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:learnapp/constants/theme/theme.dart';
import 'package:learnapp/constants/theme/theme_services.dart';
import 'package:learnapp/view/bottom_nav_pages/setting_nav_page.dart';
import 'package:learnapp/view/main_page.dart';
import 'package:learnapp/view/start_page.dart';

void main() async{
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: ()=>GetMaterialApp(
        theme: Themes().lightTheme,
        darkTheme: Themes().darkTheme,
        themeMode: ThemeService().getThemeMode(),
        initialRoute: '/',
        getPages: [
          GetPage(name: '/', page: ()=> StartPage()),
        ],
      )
    );
  }
}
