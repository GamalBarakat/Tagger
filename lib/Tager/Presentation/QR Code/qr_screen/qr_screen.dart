import 'package:barcode_widget/barcode_widget.dart';
import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:tager/Tager/core/Navigation/navigation.dart';

import '../../../core/const/Styles.dart';
import '../../../core/widget/Button.dart';
import '../../home_tager/presentation/home_screen/home_screen.dart';
import '../../nfc/screen/password.dart';
import '../cubit/qr_cubit.dart';
import '../cubit/qr_state_cubit.dart';

class QrScreen extends StatelessWidget {
  // ignore: prefer_typing_uninitialized_variables
  var amount;
   QrScreen({super.key,required this.amount});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create:(context)=>QrCubit()..getQr(amount: amount),
    child: BlocConsumer<QrCubit, QrCubitState>(
      listener: (context,state){},
      builder: (context,state){
        return
          ConditionalBuilder(condition: BlocProvider.of<QrCubit>(context).qrModel!=null,
          builder:(context)=> Scaffold(
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
            body: Container(
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
                    GradientText(
                      ' For trading',
                      style: Styles.textStyleTitle24

                      ,
                      gradientType: GradientType.values[0],
                      colors: const [
                        Color(0xffEEBB49),
                        Color(0xffD9D9D9)
                      ],
                    ),
                    SizedBox(height: 10,),
                    InkWell(onTap: (){print('${BlocProvider.of<QrCubit>(context).qrModel!.QR}');},child: Text('Ahmed mohamed',style: Styles.textStyleTitle24,)),
                    SizedBox(height: 15,),
                    Text('Please Scane your card',style: Styles.textStyleTitle18,),
                    SizedBox(height:MediaQuery.of(context).size.height*.10,),
                    SizedBox(width: 200.w,
                        height: 200.h,child: BarcodeWidget(data:'${BlocProvider.of<QrCubit>(context).qrModel!.QR}', barcode: Barcode.qrCode(),color:  Color(0xffEEBB49),height: 100,width: 100,)),
                    SizedBox(height:MediaQuery.of(context).size.height*.10,),
                    Button(
                      textButton: 'Next',
                      funcation: (){},
                    )

                  ],
                ),
              ),
            ),
          ),
          fallback:(context)=>Center(child: CircularProgressIndicator()) ,
          );

      },
    ),);

  }
}
