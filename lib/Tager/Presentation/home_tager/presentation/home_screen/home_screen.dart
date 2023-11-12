import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../../../core/Navigation/navigation.dart';
import '../../../../core/const/Styles.dart';
import '../../../../core/widget/Button.dart';
import '../../../verify/screen/verify_screen.dart';
class HomeScreen extends StatelessWidget {
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
              end: AlignmentDirectional.centerStart

            ),
            image: DecorationImage(
              image: AssetImage('assets/images/img_constraction.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                children: [
                  SizedBox(height: 10.0,),
                  Center(
                    child: GradientText('MBAG',

                      style: Styles.textStyleTitle50

                      ,

                      gradientDirection:GradientDirection.ttb,
                      colors: const [
                        Color(0xffEEBB49),
                        Color(0xffD9D9D9)

                      ],


                    ),
                  ),

                  SizedBox(height: 8.h),
                  GradientText('For trading',
                    style: Styles.textStyleTitle24,
                    colors: const [
                      Color(0xffEEBB49),
                      Color(0xffD9D9D9)

                    ],
                    gradientDirection:GradientDirection.ttb,
                    // gradientType: GradientType.linear,
                  ),
                  SizedBox(
                    height: 10.0,
                  )
                ],
              ),
              SizedBox(height: 20.h,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Your information',style: Styles.textStyleTitle16.copyWith(color: Colors.white),),
                    SizedBox(height: 10.h,),

                  Container(
                    decoration: BoxDecoration(
                      color: Color(0xfffcf6ba).withOpacity(0.4),
                      borderRadius: BorderRadius.circular(8),


                    )
                    ,
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Name :- Ali ahmed ',style: Styles.textStyleTitle20.copyWith(color: Colors.black),),
                          Divider(

                            thickness: 2,
                            color: Colors.black,
                            endIndent: 10,
                            indent: 5,
                          ),
                          Text('ID number  : 357-787-7879  ',style: Styles.textStyleTitle20.copyWith(color: Colors.black),),
                          Divider(

                            thickness: 2,
                            color: Colors.black,
                            endIndent: 5,
                            indent: 5,
                          ),
                          Text('Phone number  : 3574709080 ',style: Styles.textStyleTitle20.copyWith(color: Colors.black),),
                        ],
                      ),
                    ),
                  )

                  ],
                ),
              ),
              SizedBox(height: 20.h,),
              Container(
                color: Color.fromRGBO(179, 169, 169, 0.6),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Text('Balance',style: Styles.textStyleTitle16,),
                          SizedBox(width: 20,),
                          Text('Balance',style: Styles.textStyleTitle16.copyWith(color:Color( 0xffFCF6BA)),),
                        ],
                      ),
                      SizedBox(height: 20,),
                      Row(
                        children: [
                          Text('IBAN',style: Styles.textStyleTitle16,),
                          SizedBox(width: 20,),
                          Text('756454- 8465456-876',style: Styles.textStyleTitle16.copyWith(color:Color( 0xffFCF6BA)),),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 20.h,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Today sales',style: Styles.textStyleTitle24.copyWith(color: Color(0xffEEBB49)),),

                    Text('127.56 ',style: Styles.textStyleTitle20,),
                  ],
                ),
              ),
              SizedBox(height: 20.h,),
    Padding(
      padding: const EdgeInsets.all(8.0),
      child: Button(textButton: 'Add money',funcation: (){
  navigato(context, VerifyScreen());
      },),
    )





            ],
          ),
        ),
      ),
    );
  }
}
