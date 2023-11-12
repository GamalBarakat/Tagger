import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:tager/Tager/core/Navigation/navigation.dart';

import '../../../core/const/Styles.dart';
import '../../../core/widget/Button.dart';
import '../../verify/screen/password.dart';

class QrScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
                colors: [
                  Color(0xffBF953F),
                  Colors.black,
                  Colors.black,
                  Colors.black
                ],
                begin: AlignmentDirectional.topStart,
                end: AlignmentDirectional.centerStart),
            image: DecorationImage(
              image: AssetImage('assets/images/img_constraction.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
                SizedBox(height: 10,),
                Center(
                  child: GradientText(
                    'MBAG',
                    style: Styles.textStyleTitle50
                    //     .copyWith(color: Color(
                    //     0xffBF953F
                    // ))
                    ,
                    gradientType: GradientType.values[0],
                    colors: const [
                      Color(0xffEEBB49),
                      Color(0xffD9D9D9)
                    ],
                  ),
                ),
                GradientText(
                  ' For trading',
                  style: Styles.textStyleTitle20

                  ,
                  gradientType: GradientType.values[0],
                  colors: const [
                    Color(0xffEEBB49),
                    Color(0xffD9D9D9)
                  ],
                ),
                SizedBox(height: 10,),
                Text('Ahmed mohamed',style: Styles.textStyleTitle24,),
                SizedBox(height: 15,),
                Text('Please Scane your card',style: Styles.textStyleTitle18,),
                SizedBox(height:MediaQuery.of(context).size.height*.10,),
                SizedBox(width: 200.w,
                    height: 200.h,child: Image.asset('assets/images/img_constraction.png')),
                SizedBox(height:MediaQuery.of(context).size.height*.10,),
                Button(
                  textButton: 'Next',
                  funcation: (){
                    navigato(context, Password());
                  },
                )

              ],
            ),
          ),
        ),
      ),
    );
  }
}
