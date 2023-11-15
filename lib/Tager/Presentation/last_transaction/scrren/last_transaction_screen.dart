import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:simple_gradient_text/simple_gradient_text.dart';
import 'package:tager/Tager/Presentation/last_transaction/cubit/last_transaction_state.dart';

import '../../../core/Navigation/navigation.dart';
import '../../../core/const/Styles.dart';
import '../../profile/screen/profile_screen.dart';
import '../cubit/lastTransactionCubit.dart';
class LastTransaction extends StatelessWidget {
  const LastTransaction({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context)=>LastTransactionCubit()..getLastTransaction(),
          child:BlocConsumer<LastTransactionCubit, LastTransactionCubitState>(
            listener: (context,state){},
            builder: (context,state)
            {
              return  Scaffold(
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
                appBar: AppBar(
                  leading:Text(''),
                  backgroundColor:   Color(0xffBF953F).withOpacity(0.9),
                  elevation: 0.0,
                  centerTitle: true,
                  title: GradientText(
                    'MBAG',
                    style: Styles.textStyleTitle50,
                    gradientDirection: GradientDirection.ttb,
                    colors: const [
                      Color(0xffEEBB49),Color(0xffEEBB49),

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
                    padding: const EdgeInsets.symmetric(horizontal: 8),
                    child: Column(
                      children: [


                        SizedBox(
                          height: MediaQuery.of(context).size.width * .1,
                        ),
                        Row(
                          children: [
                            Container(decoration: BoxDecoration(color:  const Color(0xffBF953F),borderRadius: BorderRadius.circular(5)),child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Icon(Icons.alarm,color: Colors.black),
                            )),
                            const SizedBox(width: 10),
                            Text('Last transaction',style: Styles.textStyleTitle24,)

                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.width * .1,
                        ),

                        Expanded(
                          child:
                          ConditionalBuilder(
                              condition:BlocProvider.of<LastTransactionCubit>(context).lastTransactionModel!=null,
                              builder: (context){
                                return  ListView.builder(physics: BouncingScrollPhysics(),itemBuilder:(context,index)=>Column(children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('To :${BlocProvider.of<LastTransactionCubit>(context).TransactionDataAll[index].acountNumber}',style: Styles.textStyleTitle12,),
                                      Text('${BlocProvider.of<LastTransactionCubit>(context).TransactionDataAll[index].amount}TL',style: Styles.textStyleTitle14.copyWith( color: Color(0xffBF953F)),),
                                    ],
                                  ),
                                  SizedBox(height: 5,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Date : ${BlocProvider.of<LastTransactionCubit>(context).TransactionDataAll[index].date}',style: Styles.textStyleTitle12,),
                                      Text('Balance :${BlocProvider.of<LastTransactionCubit>(context).TransactionDataAll[index].by}',style: Styles.textStyleTitle12,),
                                    ],
                                  ),
                                  SizedBox(height: 5,),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text('Sender : ${BlocProvider.of<LastTransactionCubit>(context).TransactionDataAll[index].soldToFirstName} ',style: Styles.textStyleTitle12,),
                                      Text('Received by : ${BlocProvider.of<LastTransactionCubit>(context).TransactionDataAll[index].soldToLastName} ',style: Styles.textStyleTitle12),
                                    ],
                                  ),
                                  Divider(color:Color(0xffBF953F),thickness: 2.5,)
                                ]) ,itemCount: BlocProvider.of<LastTransactionCubit>(context).TransactionDataAll.length,);

                              },
                              fallback:(context)=>Center(
                                child:
                                CircularProgressIndicator(color:Color(0xffBF953F),strokeAlign: 3.0, ),
                              )),

                        ),

                      ],
                    ),
                  ),
                ),
              );


            },
          )

      )

    );
  }
}