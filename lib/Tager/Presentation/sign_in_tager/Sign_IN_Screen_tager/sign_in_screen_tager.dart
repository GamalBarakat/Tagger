import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:simple_gradient_text/simple_gradient_text.dart';

import '../../../core/Navigation/navigation.dart';
import '../../../core/const/Styles.dart';
import '../../../core/const/chacheHelper.dart';
import '../../../core/const/consts.dart';
import '../../../core/widget/Button.dart';
import '../../../core/widget/custom_text_form_field.dart';
import '../../home_tager/presentation/home_screen/home_screen.dart';
import '../../verify/screen/verify_screen.dart';
import '../cubit/login_view_cubit.dart';
import '../cubit/login_view_state.dart';

class SignINScreenTager extends StatelessWidget {
  var emailController = TextEditingController();
  var keyForm = GlobalKey<FormState>();
  var passwordController = TextEditingController();

  SignINScreenTager({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => LoginViewCubit(),
        child: BlocConsumer<LoginViewCubit, LoginViewState>(
          listener: (context, state) {


            if (state is LoginViewStateSuccess) {
              if (state.userLoginModel.status == true) {
                CacheHelper.saveData(
                    key: 'uId', value: state.userLoginModel.token)
                    .then((value) {
                  uId = CacheHelper.getData(key: 'uId');

                 Fluttertoast.showToast(
                      msg: '${state.userLoginModel.message}',
                      toastLength: Toast.LENGTH_SHORT,
                      gravity: ToastGravity.BOTTOM,
                      timeInSecForIosWeb: 1,
                      backgroundColor: Colors.green,
                      textColor: Colors.white,
                      fontSize: 16.0);


                 navigatofinsh(context,HomeScreen(), false);


                });
              } else {


                 Fluttertoast.showToast(
                    msg: '${state.userLoginModel.message}',
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
              child: Animate(
                effects: [FadeEffect(), ScaleEffect()],

              child:Container(
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/img_constraction.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Form(
                    key: keyForm,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        SizedBox(height: 20.h),
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
                        SizedBox(height: 8.h),
                        Center(
                          child: GradientText(
                            'For trading',
                            style: Styles.textStyleTitle24,
                            colors: const [
                              Color(0xffEEBB49),
                              Color(0xffD9D9D9)
                            ],
                            gradientType: GradientType.linear,
                          ),
                        ),

                        SizedBox(height: 40.h),
                        Text(
                          'Email',
                          style: Styles.textStyleTitle18,
                        ),
                        SizedBox(height: 10.h),
                        CustomTextFormField(
                            hintText: 'ali@gmail.com',
                            prefix: Icon(Icons.email, color: Color(0xffC19843)),
                            textInputType: TextInputType.emailAddress,
                            controller: emailController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'email is  empty';
                              } else {
                                return null;
                              }
                            }),
                        SizedBox(height: 15.h),
                        Text(
                          'password',
                          style: Styles.textStyleTitle18,
                        ),
                        SizedBox(height: 10.h),
                        CustomTextFormField(
                          hintText: '************',
                          controller: passwordController,
                          textInputType: TextInputType.visiblePassword,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Password is to short';
                            } else {
                              return null;
                            }
                          },
                          prefix: Icon(Icons.lock_outline,
                              color: Color(0xffC19843)),
                        ),
                        SizedBox(height: 50),

                    Button(
                      textButton: 'Sing In',
                      funcation: () {
                        if (keyForm.currentState!.validate()) {
                          BlocProvider.of<LoginViewCubit>(context).userLogin(
                            email: emailController.text,
                            password: passwordController.text,
                          );
                        }
                      },


                    ),

                       
                      ],
                    ),
                  ),
                ),
              ),
              ),
            ));
          },
        ));
  }
}
