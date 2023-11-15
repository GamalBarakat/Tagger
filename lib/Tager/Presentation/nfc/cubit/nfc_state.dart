import '../model/check_nfc_model.dart';
import '../model/nfc_model.dart';

abstract class NfcState{}
class NfcInitializState extends NfcState{}

class NfcLoadingState extends  NfcState{}
class NfcSuccessState extends  NfcState{}
class NfcErrorState extends  NfcState{}


class AddNfcLoadingState extends  NfcState{}
class AddNfcSuccessState extends  NfcState{

  final  NfcModel nfcModel;
  AddNfcSuccessState(this.nfcModel);
}
class AddNfcErrorState extends  NfcState{}

class CheckNfcLoadingState extends  NfcState{}
class CheckNfcSuccessState extends  NfcState{

  final  CheckNfcModel checknfcModel;
  CheckNfcSuccessState(this.checknfcModel);
}
class CheckNfcErrorState extends  NfcState{}