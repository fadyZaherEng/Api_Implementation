import 'package:talent_link/src/domain/entities/payslip/payslip.dart';

abstract class PayslipState {}

class PayslipInitialState extends PayslipState {}

//get data
class PayslipGetDataLoadingState extends PayslipState {}

class PayslipGetDataSuccessState extends PayslipState {
  PayslipModel? payslipModel;
  PayslipGetDataSuccessState({this.payslipModel});
}

class PayslipGetDataErrorState extends PayslipState {
  String errorMSG;

  PayslipGetDataErrorState({required this.errorMSG});
}

//left arrow
class PayslipLeftArrowLoadingState extends PayslipState {}

class PayslipLeftArrowSuccessState extends PayslipState {}

class PayslipLeftArrowErrorState extends PayslipState {}

//right arrow
class PayslipRightArrowLoadingState extends PayslipState {}

class PayslipRightArrowSuccessState extends PayslipState {}

class PayslipRightArrowErrorState extends PayslipState {}

//select Date
class PayslipSelectDateLoadingState extends PayslipState {}

class PayslipSelectDateSuccessState extends PayslipState {
  String? selectDate;

  PayslipSelectDateSuccessState({required this.selectDate});
}

class PayslipSelectDateErrorState extends PayslipState {}
