import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';
import '../../../../core/Navigation/navigation.dart';
import '../../../../core/const/Styles.dart';
import '../../../../core/widget/Button.dart';
import '../../../last_transaction/scrren/last_transaction_screen.dart';
import '../../../profile/screen/profile_screen.dart';
import '../../../verify/screen/verify_screen.dart';
import '../cubit/user_data_cubit.dart';
import '../cubit/user_data_state.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => userDataCubit()..getUserData(),
      child: BlocConsumer<userDataCubit, UserDataState>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(

              appBar: AppBar(
                backgroundColor:   Color(0xffBF953F).withOpacity(0.9),
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
              drawer: Drawer(
                width:MediaQuery.of(context).size.width*.7 ,
                backgroundColor: Colors.black,

                surfaceTintColor: Colors.purple,
                shape: RoundedRectangleBorder(
                  side: BorderSide(color: Color(0xffEEBB49), width: 1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: ListView(
                  // Important: Remove any padding from the ListView.
                  padding: EdgeInsets.zero,
                  children: [
                    SizedBox(height: 40.h,),
                    ListTile(



                      title:Row(
                        children: [
                          Container(decoration:BoxDecoration(
                            color:  Color(0xffEEBB49),
                            borderRadius: BorderRadius.circular(5),
                          ),child:Icon(Icons.home,color: Colors.black,size: 30) ,),
                          SizedBox(width: 10.0,),

                          Text('Home',style: Styles.textStyleTitle20,),
                        ],
                      ) ,
                      onTap: () {
                        navigatofinsh(context, HomeScreen(), false);
                      },
                    ),
                    ListTile(
                      title:Row(
                        children: [
                          Container(decoration:BoxDecoration(
                            color:  Color(0xffEEBB49),
                            borderRadius: BorderRadius.circular(5),
                          ),child:Icon(Icons.access_time,color: Colors.black,size: 30) ,),
                          SizedBox(width: 10,),

                          Text('Transaction ',style: Styles.textStyleTitle20,),
                        ],
                      ) ,
                      onTap: () {
                        navigato(context,LastTransaction() );
                      },
                    ),
                    ListTile(



                      title:Row(
                        children: [
                          Container(decoration:BoxDecoration(
                            color:  Color(0xffEEBB49),
                            borderRadius: BorderRadius.circular(5),
                          ),child:Icon(Icons.account_box_rounded,color: Colors.black,size: 30) ,),
                          SizedBox(width: 10.0,),

                          Text('Account',style: Styles.textStyleTitle20,),
                        ],
                      ) ,
                      onTap: () {
                        navigato(context,ProfileScreen() );
                      },
                    ),
                    ListTile(



                      title:Row(
                        children: [
                          Container(decoration:BoxDecoration(
                            color:  Color(0xffEEBB49),
                            borderRadius: BorderRadius.circular(5),
                          ),child:Icon(Icons.account_box_rounded,color: Colors.black,size: 30) ,),
                          SizedBox(width: 10.0,),

                          Text('Map',style: Styles.textStyleTitle20,),
                        ],
                      ) ,
                      onTap: () {
                        navigato(context,ProfileScreen() );
                      },
                    ),
                  ],
                ),
              ),
              body:

             ConditionalBuilder(
                condition: BlocProvider.of<userDataCubit>(context).userDataModel!=null,
                builder: (context)=>Container(
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
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      children: [
                        SizedBox(
                          height: 10.0,
                        ),

                        SizedBox(height: 8.h),
                        Center(
                          child: GradientText(
                            'For trading',
                            style: Styles.textStyleTitle24,
                            colors: const [Color(0xffEEBB49), Color(0xffD9D9D9)],
                            gradientDirection: GradientDirection.ttb,
                            // gradientType: GradientType.linear,
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        )
                      ],
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Your information',
                            style: Styles.textStyleTitle16
                                .copyWith(color: Colors.white),
                          ),
                          SizedBox(
                            height: 10.h,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              color: Color(0xfffcf6ba).withOpacity(0.4),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Name :- ${BlocProvider.of<userDataCubit>(context).userDataModel!.trader!.firstName} ${BlocProvider.of<userDataCubit>(context).userDataModel!.trader!.lastName}',
                                    style: Styles.textStyleTitle20
                                        .copyWith(color: Colors.black),
                                  ),
                                  Divider(
                                    thickness: 2,
                                    color: Colors.black,
                                    endIndent: 10,
                                    indent: 5,
                                  ),
                                  Text(
                                    'ID number  : ${BlocProvider.of<userDataCubit>(context).userDataModel!.trader!.iD}  ',
                                    style: Styles.textStyleTitle20
                                        .copyWith(color: Colors.black),
                                  ),
                                  Divider(
                                    thickness: 2,
                                    color: Colors.black,
                                    endIndent: 5,
                                    indent: 5,
                                  ),
                                  Text(
                                    'Phone number  : ${BlocProvider.of<userDataCubit>(context).userDataModel!.trader!.phone} ',
                                    style: Styles.textStyleTitle20
                                        .copyWith(color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Container(
                      color: Color.fromRGBO(179, 169, 169, 0.6),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child:
                        Row(
                          children: [
                            Text(
                              'Balance',
                              style: Styles.textStyleTitle16,
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Text(
                              '${BlocProvider.of<userDataCubit>(context).userDataModel!.trader!.balance}',
                              style: Styles.textStyleTitle16
                                  .copyWith(color: Color(0xffFCF6BA)),
                            ),
                          ],
                        ),

                        // Row(
                        //   children: [
                        //     Text(
                        //       'IBAN',
                        //       style: Styles.textStyleTitle16,
                        //     ),
                        //     SizedBox(
                        //       width: 20,
                        //     ),
                        //     Text(
                        //       '756454- 8465456-876',
                        //       style: Styles.textStyleTitle16
                        //           .copyWith(color: Color(0xffFCF6BA)),
                        //     ),
                        //   ],
                        // )

                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Today sales',
                            style: Styles.textStyleTitle24
                                .copyWith(color: Color(0xffEEBB49)),
                          ),
                          Text(
                            '${BlocProvider.of<userDataCubit>(context).userDataModel!.trader!.todaySales} ',
                            style: Styles.textStyleTitle20,
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Button(
                        textButton: 'pay',
                        funcation: () {
                          navigato(context, VerifyScreen());
                        },
                      ),
                    )
                  ],
                ),
              ),
                fallback:(context)=>Center(child: CircularProgressIndicator(

                  color: Color(0xffEEBB49),
                )),
              )

            );


        },
      ),
    );
  }
}
