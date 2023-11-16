import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_nfc_kit/flutter_nfc_kit.dart';

import 'package:tager/Tager/core/const/dioHelper.dart';

import '../model/check_nfc_model.dart';
import '../model/nfc_model.dart';
import 'nfc_state.dart';

class NfcCubit extends Cubit<NfcState>{
  NfcCubit():super(NfcInitializState());

  var nfc = '';
  var done = '';
  goToNfc() async {
    emit(GetNfcLoadingState());
    done = '';

    try {
      var tag = await FlutterNfcKit.poll(
        timeout: Duration(seconds: 10),
        iosMultipleTagMessage: "Multiple tags found!",
        iosAlertMessage: "Scan your tag",
      ).then((tag) {

        var nfcId = tag.id;
        nfc = tag.id;
        emit(GetNfcSuccessState());

        print(tag.id);
      });


    } catch (e) {

      print("Error: $e");

      emit(GetNfcErrorState());
    }
  }
  NfcModel?  nfcModel;
  void AddNfc({required String NfcCode,required var amount}) {
    emit(AddNfcLoadingState());
    DioHelper.postData(
        url: 'add_nfc',
        data: {'nfc': NfcCode, 'amount': amount})
        .then((value) {

       print(value.data);
       nfcModel=NfcModel.fromJson(value.data);
       emit(AddNfcSuccessState(nfcModel!));
    print(nfcModel!.status);
      print(nfcModel!.message);
      print(nfcModel!.amount);
      print(nfcModel!.cardId);
    }).catchError((error) {
      print(error.toString());
      emit(AddNfcErrorState());
    });
  }

  CheckNfcModel? checknfcModel;
  String? NfcCode;String? password;
  var amount;

  void CheckNfc({required password,required NfcCode, required amount}){
    DioHelper.postData(
        url: 'check_nfc_password',
        data: {'card_id': NfcCode, 'amount': amount,'password':password})
        .then((value) {

      print(value.data);
      print(value.data['status'].runtimeType);
      print(value.data['message'].runtimeType);
      checknfcModel=CheckNfcModel.fromJson(value.data);
      emit(CheckNfcSuccessState(checknfcModel!));
      print(checknfcModel!.status);
      print(checknfcModel!.message);

    }).catchError((error) {
      print(error.toString());
      emit(CheckNfcErrorState());
    });
  }


}


