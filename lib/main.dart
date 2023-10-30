import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutterspod/constants/app_colors.dart';
import 'package:flutterspod/views/home_page.dart';
import 'package:get/get.dart';


//Future getData() async {

class SomeError implements Exception{
  static String get showError{
   return 'something went wrong' ;
  }
}
int getData(){
  try {
    final data = 'helfkidsjf';
    final inNumber = int.parse(data);
    return inNumber;
  } on FormatException {
    throw SomeError.showError;
  }
}
 // await Future.delayed(Duration(seconds: 2));
  //throw Exception('something went wrong');
  //print('hello jii');
  //return 'hello world';

// int a = 0;
// void addSome(){
//   while(a<200000000){
//     a++;
//   }
// }
//



void main (){
  try {
    final g = getData();
    print(g);
  }catch (err){
    print(err);
  }

  //getData().then((value) => print(value)).catchError((err) => print('err: $err'));
  
  
//addSome();
//print('hello world');
//print(a);

  runApp(ProviderScope(child: Home()));
}


class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    final h = MediaQuery.of(context).size.height;
    final w = MediaQuery.of(context).size.width;


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

