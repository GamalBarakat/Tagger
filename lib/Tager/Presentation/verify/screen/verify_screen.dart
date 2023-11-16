

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:tager/Tager/Presentation/QR%20Code/qr_screen/qr_screen.dart';
import 'package:tager/Tager/Presentation/nfc/screen/nfc_screen.dart';
import 'package:tager/Tager/core/Navigation/navigation.dart';
import 'package:tager/Tager/core/widget/Button.dart';

import '../../../core/const/Styles.dart';
import '../../../core/widget/custom_text_form_field.dart';
import '../../home_tager/presentation/home_screen/home_screen.dart';
import '../../nfc/cubit/nfc_cubit.dart';
import '../../nfc/cubit/nfc_state.dart';

class VerifyScreen extends StatelessWidget {
  var verifyController = TextEditingController();
  var keyForm = GlobalKey<FormState>();
  VerifyScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => NfcCubit(),
    child: BlocConsumer<NfcCubit, NfcState>
      (
      listener: (context,state){},
      builder: (context,state){
        return Scaffold(
          appBar: AppBar(
            backgroundColor:   Color(0xffBF953F).withOpacity(0.9),
            leading: IconButton(onPressed: (){navigatofinsh(context, HomeScreen(), false);}, icon: Icon(Icons.home,size: 30),),
            elevation: 0.0,
            centerTitle: true,
            title: GradientText(
              'MBAG',
              style: Styles.textStyleTitle50,
              gradientDirection: GradientDirection.ttb,
              colors:  [
                Color(0xffEEBB49),Colors.white.withOpacity(0.6),

              ],
            ) ,
          ),
          body:
          Container(
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
                  Form(
                    key:keyForm ,
                    child: CustomTextFormField(hintText: 'Enter money amount',
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
                  ),
                  const Spacer(flex: 1,),
                  Column(
                    children: [
                      Button(textButton:'NFC card',funcation: (){
                        if (keyForm.currentState!.validate()){
                          BlocProvider.of<NfcCubit>(context).goToNfc();
                          print('gamallllDone');
                          navigato(context, NfcScreen(amount:verifyController.text ,));
                        }

                      }),
                      const SizedBox(height: 10.0,),
                      ButtonSide(textButton:'QR code',funcation: (){
                        if (keyForm.currentState!.validate()){

                          navigato(context, QrScreen(amount:verifyController.text ,));
                        }


                      }),


                    ],
                  ),
                  SizedBox(height: 50.h,),


                ],

              ),
            ),
          ),
        );
      },
    )
    );

  }
}
