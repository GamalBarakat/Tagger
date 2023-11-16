


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:tager/Tager/Presentation/nfc/cubit/nfc_cubit.dart';
import 'package:tager/Tager/Presentation/nfc/cubit/nfc_state.dart';
import '../../home_tager/presentation/home_screen/home_screen.dart';
import 'password.dart';
import 'package:tager/Tager/core/Navigation/navigation.dart';
import 'package:tager/Tager/core/const/Styles.dart';
import 'package:tager/Tager/core/widget/Button.dart';

class NfcScreen extends StatelessWidget {
dynamic amount;
  NfcScreen({super.key,required this.amount});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => NfcCubit()..goToNfc(),
        child: BlocConsumer<NfcCubit, NfcState>(
            listener: (context, state) {
              if (state is AddNfcSuccessState)
                {
                  if (state.nfcModel.status == true)
                    {
                      Fluttertoast.showToast(
                          msg: '${state.nfcModel.message}',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.green,
                          textColor: Colors.white,
                          fontSize: 16.0);
                      navigato(context, Password(nfcModel:state.nfcModel ,));
                    }
                  else
                    {
                      Fluttertoast.showToast(
                          msg: '${state.nfcModel.message}',
                          toastLength: Toast.LENGTH_SHORT,
                          gravity: ToastGravity.BOTTOM,
                          timeInSecForIosWeb: 1,
                          backgroundColor: Colors.red,
                          textColor: Colors.white,
                          fontSize: 16.0);
                    }
                }


            },
            builder: (context, state) {
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
                        GradientText(
                          'For trading',
                          style: Styles.textStyleTitle20,
                          gradientType: GradientType.values[0],
                          colors: const [
                            Color(0xffEEBB49),
                            Color(0xffD9D9D9)
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Ahmed mohamed',
                          style: Styles.textStyleTitle24,
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Please enter your card ',
                          style: Styles.textStyleTitle18,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 200.w,
                          height: 250.h,
                          color: Color(0xffEEBB49).withOpacity(0.6),
                          child:
                          Column(children: [
                            Text('NFC IS ${BlocProvider.of<NfcCubit>(context).nfc}'),
                            Image.asset('assets/images/Nfc.png'),
                          ],)
                        ),
                        SizedBox(height: 10,),
                        Button(
                          textButton: 'اضغط لقراءه كود nfc',
                          funcation: () {
                            print(BlocProvider.of<NfcCubit>(context).nfc);
                            BlocProvider.of<NfcCubit>(context).goToNfc();
                          },
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Button(
                          textButton: 'Confirm',
                          funcation: () {
                            print(BlocProvider.of<NfcCubit>(context).nfc);
                           BlocProvider.of<NfcCubit>(context).AddNfc(NfcCode:BlocProvider.of<NfcCubit>(context).nfc, amount: amount);
                          },
                        )
                      ],
                    ),
                  ),
                ),
              );
            }));
  }
}
