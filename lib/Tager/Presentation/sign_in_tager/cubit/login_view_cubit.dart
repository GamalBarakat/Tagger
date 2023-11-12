




import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/const/dioHelper.dart';
import '../model/user_login_model.dart';
import 'login_view_state.dart';

class LoginViewCubit extends Cubit<LoginViewState>{
  LoginViewCubit():super(InitializeLoginViewState());


  bool isPassword=true;
  IconData subfix= Icons.visibility_off;
  void changIconPassword()
  {
    isPassword=!isPassword;
    subfix=isPassword?Icons.visibility_off:Icons.visibility;
    emit(ChangeIconPasswordSuccess());
  }


  UserLoginModel? userLoginModel;
  void userLogin({required String email,required String password})
  {
    emit(LoginViewStateLoading ());
    DioHelper.postData(url:'trader_login' , data: {
      'email':email,
      'password':password,
    }).then((value){

        print(value.data);
      userLoginModel = UserLoginModel.fromJson(value.data);
        print('GAmaaaaaaaaa');
      print(userLoginModel!.message);
      print(userLoginModel!.status);
      print(userLoginModel!.user?.email);
      print('GAmaaaaaaaaa');
       // print(userLoginModel!.data!.last_name);

        emit(LoginViewStateSuccess(userLoginModel!));
    }).catchError((error){

      emit(LoginViewStateError(error.toString()));
      print('ffffffffffffff');
      print(error.toString());
    });
  }





}



  
  
