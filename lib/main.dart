import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterspod/constants/app_colors.dart';
import 'package:flutterspod/views/home_page.dart';
import 'package:flutterspod/views/response.dart';
import 'package:flutterspod/views/sample.dart';
import 'package:get/get.dart';


void main (){
  runApp(Home());
}


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;
    print(h);
    print(w);
    return ScreenUtilInit(
      designSize: Size(w, h),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (c, s) => GetMaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(
            useMaterial3: true
        ).copyWith(
          scaffoldBackgroundColor: AppColors.mainColor,





          appBarTheme: AppBarTheme(



              backgroundColor: AppColors.mainColor
          ),
        ),
        home: HomePage(),
        //home: exercise(),
        //home: MyApp(),
       // home: Sample(),
       // home: ResponsePage(),
      ),
    );
  }

}

