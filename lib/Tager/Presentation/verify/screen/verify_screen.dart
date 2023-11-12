import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:tager/Tager/core/Navigation/navigation.dart';

import '../../../core/const/Styles.dart';
import '../../../core/widget/Button.dart';
import '../../../core/widget/custom_text_form_field.dart';
import '../../QR Code/qr_screen/qr_screen.dart';

class VerifyScreen extends StatelessWidget {
  var verifyController = TextEditingController();

  VerifyScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
      SafeArea(
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
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Column(
              children: [
               Column(
                  children: [
                    const SizedBox(height: 10.0,),
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
                    const SizedBox(
                      height: 10.0,
                    )
                  ],
                ),

          SizedBox(height: 50.h,),


                Text('Enter money amount',style: Styles.textStyleTitle20,),
                SizedBox(height: 20.h,),
                CustomTextFormField(hintText: 'Enter money amount',
                    prefix: const Icon(Icons.money, color: Color(0xffC19843)),
                    textInputType: TextInputType.number,
                    controller: verifyController,
                    validator
                        :(value) {
                      if (value!.isEmpty) {
                        return ' amount Is Required';
                      } else {
                        return null;
                      }
                    }

                ),
                const Spacer(flex: 1,),
                Column(
                  children: [
                    Button(textButton:'NFC card',funcation: (){}),
                    const SizedBox(height: 10.0,),
                    ButtonSide(textButton:'QR code',funcation: (){
                      navigato(context, QrScreen());
                    }),


                  ],
                ),
              SizedBox(height: 50.h,),


              ],

            ),
          ),
        ),
      ),
    );
  }
}
