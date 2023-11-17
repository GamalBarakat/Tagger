import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tager/Tager/Presentation/home_tager/presentation/cubit/user_data_state.dart';

import '../../../../core/const/dioHelper.dart';
import '../../../sign_in_tager/model/user_login_model.dart';
import '../model/user_data_model.dart';

class userDataCubit extends Cubit<UserDataState>
{
  userDataCubit():super(InitializeUserDataState());
  UserData? userDataModel;
  void getUserData(){
    emit(UserDataLoadingState());
    DioHelper.getData(url:'trader').then((value){
      emit(UserDataSuccessState());
       userDataModel=UserData.fromJson(value.data);
      print(userDataModel!.trader!.firstName);
      print(userDataModel!.message);
      print(value.data);
    }).catchError((error){

      print(error);

      emit(UserDataErrorState());

    });


  }

  

}

