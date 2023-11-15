import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'Tager/Presentation/splash_tager/screen/splash_screen_tager.dart';
import 'Tager/core/const/blocObserver.dart';
import 'Tager/core/const/chacheHelper.dart';
import 'Tager/core/const/dioHelper.dart';
import 'mm.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Bloc.observer = MyBlocObserver();

  DioHelper.init();
  await CacheHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(

      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
     //   useMaterial3: true,
        theme: ThemeData.dark(),
        home:

        //MapSample(),

      SplashScreenTager() ,
      ),
    );
  }
}


// import 'package:flutter/material.dart';
//
// import 'Tager/Presentation/splash_tager/screen/splash_screen_tager.dart';
// import 'mm.dart';
//
//
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//
//         colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
//         useMaterial3: true,
//       ),
//       home:  const SplashScreenTager(),
//     );
//   }
// }