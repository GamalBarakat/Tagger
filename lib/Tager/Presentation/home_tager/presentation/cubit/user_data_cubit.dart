import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tager/Tager/Presentation/home_tager/presentation/cubit/user_data_state.dart';

import '../../../../core/const/dioHelper.dart';

class userDataCubit extends Cubit<UserDataState>
{
  userDataCubit():super(InitializeUserDataState());
  void getUserData(){
    emit(UserDataLoadingState());
    DioHelper.getData(url:'trader').then((value){
      emit(UserDataSuccessState());
      print(value.data);
    }).catchError((error){
      print(error.toString());
      emit(UserDataErrorState());

    });


  }

  

}

