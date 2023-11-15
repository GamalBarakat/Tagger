


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:tager/Tager/Presentation/nfc/cubit/nfc_cubit.dart';
import 'package:tager/Tager/Presentation/nfc/cubit/nfc_state.dart';
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
        create: (context) => NfcCubit(),
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
                          SizedBox(
                            height: 10,
                          ),
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
                            height: MediaQuery.of(context).size.height * .10,
                          ),
                          Container(
                            width: 200.w,
                            height: 200.h,
                            color: Color(0xffEEBB49).withOpacity(0.6),
                            child: Image.asset('assets/images/Nfc.png'),
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * .10,
                          ),
                          Button(
                            textButton: 'Next',
                            funcation: () {
                              print(BlocProvider.of<NfcCubit>(context).nfc);
                             BlocProvider.of<NfcCubit>(context).AddNfc(NfcCode:BlocProvider.of<NfcCubit>(context).nfc, amount: amount);
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              );
            }));
  }
}
