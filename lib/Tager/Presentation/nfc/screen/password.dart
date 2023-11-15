


import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:tager/Tager/Presentation/nfc/cubit/nfc_state.dart';
import 'package:tager/Tager/Presentation/nfc/model/nfc_model.dart';
import 'package:tager/Tager/core/const/Styles.dart';
import 'package:tager/Tager/core/widget/Button.dart';
import 'package:tager/Tager/core/widget/custom_text_form_field.dart';

import '../../../core/Navigation/navigation.dart';

import '../../home_tager/presentation/home_screen/home_screen.dart';
import '../cubit/nfc_cubit.dart';

class Password extends StatelessWidget {
  var keyForm = GlobalKey<FormState>();
  NfcModel? nfcModel;
  var passwordController = TextEditingController();

  Password({super.key, required this.nfcModel});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => NfcCubit(),
        child: BlocConsumer<NfcCubit, NfcState>(
          listener: (context, state) {
            if (state is CheckNfcSuccessState)
            {
              // ignore: unrelated_type_equality_checks
              if (state.checknfcModel.status == true)
              {
                Fluttertoast.showToast(
                    msg: '${state.checknfcModel.message}',
                    toastLength: Toast.LENGTH_SHORT,
                    gravity: ToastGravity.BOTTOM,
                    timeInSecForIosWeb: 1,
                    backgroundColor: Colors.green,
                    textColor: Colors.white,
                    fontSize: 16.0);
navigatofinsh(context,HomeScreen(), false);
              }
              else
              {
                Fluttertoast.showToast(
                    msg: '${state.checknfcModel.message}',
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
                        Column(
                          children: [
                            const SizedBox(
                              height: 10.0,
                            ),
                            InkWell(
                              onTap: () {
                                print(nfcModel!.message);
                              },
                              child: Center(
                                child: GradientText(
                                  'MBAG',
                                  style: Styles.textStyleTitle50,
                                  gradientDirection: GradientDirection.ttb,
                                  colors: const [
                                    Color(0xffEEBB49),
                                    Color(0xffD9D9D9)
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(height: 8.h),
                            GradientText(
                              'For trading',
                              style: Styles.textStyleTitle24,
                              colors: const [
                                Color(0xffEEBB49),
                                Color(0xffD9D9D9)
                              ],
                              gradientDirection: GradientDirection.ttb,
                              // gradientType: GradientType.linear,
                            ),
                            const SizedBox(
                              height: 10.0,
                            )
                          ],
                        ),
                        SizedBox(
                          height: 50.h,
                        ),
                        Text(
                          'Enter password',
                          style: Styles.textStyleTitle20,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        Form(
                          key: keyForm,
                          child: CustomTextFormField(
                              hintText: 'Enter password',
                              prefix: const Icon(Icons.password,
                                  color: Color(0xffC19843)),
                              textInputType: TextInputType.number,
                              controller: passwordController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return ' password Is Required';
                                } else {
                                  return null;
                                }
                              }),
                        ),
                        const Spacer(
                          flex: 1,
                        ),
                        Button(
                            textButton: 'Confirm',
                            funcation: () {
                              if (keyForm.currentState!.validate()) {
                                   print(passwordController.text);
                                   print(nfcModel!.cardId);
                                   print(nfcModel!.amount);
                               BlocProvider.of<NfcCubit>(context).CheckNfc(password:passwordController.text , NfcCode: nfcModel!.cardId, amount: nfcModel!.amount);
                              }
                            }),
                        SizedBox(
                          height: 50.h,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ));
  }
}
