import '../../data/model/representative_order_model.dart';
import '../../data/model/user_data_success_model.dart';
import '../data/model/allCollectingRepresentative_model.dart';
import '../data/model/allDeactivateRepresentative_model.dart';

abstract class LogicState {}

class LogicInitial extends LogicState {}

class ShowAndHidePassword extends LogicState {}

class LoginLoadingState extends LogicState {}

class LoginSuccessState extends LogicState {
  final UserDataSuccessModel userDataSuccessModel;

  LoginSuccessState(this.userDataSuccessModel);
}

class LoginFailedState extends LogicState {}


class MeDataRepresentativeSuccessState extends LogicState {

}

class MeDataRepresentativeFailedState extends LogicState {}



class RepresentativeOrderSuccess extends LogicState {
  final AllOrderRepresentativeModel allOrderRepresentativeModel  ;

  RepresentativeOrderSuccess(this.allOrderRepresentativeModel); 
}

class RepresentativeOrderFailed extends LogicState {}



class AllDeactivateRepresentativeSuccess extends LogicState {
  final AllDeactivateRepresentativeModel allDeactivateRepresentativeModel  ;

  AllDeactivateRepresentativeSuccess(this.allDeactivateRepresentativeModel); 
}

class AllDeactivateRepresentativeFailed extends LogicState {}



class AllCollectingRepresentativeSuccess extends LogicState {
  final AllCollectingRepresentativeModel allCollectingRepresentativeModel  ;

  AllCollectingRepresentativeSuccess(this.allCollectingRepresentativeModel); 
}

class AllCollectingRepresentativeFailed extends LogicState {}









class BoolValueMeasurmentOrder extends LogicState {}



class OrderDeliveredLoading extends LogicState {}

class OrderDeliveredSuccess extends LogicState {}

class OrderDeliveredFailed extends LogicState {}

class OrderReturnedLoading extends LogicState {}
class OrderReturnedSuccess extends LogicState {}
class OrderReturnedFailed extends LogicState {}

class OrderPartReturnedLoading extends LogicState {}

class OrderPartReturnedSuccess extends LogicState {}

class OrderPartReturnedFailed extends LogicState {}

class GoToMapSuccessState extends LogicState {}

class GoToMapFailedState extends LogicState {}


class MeasurmentOrderRepresentativeLoading extends LogicState {}
class MeasurmentOrderRepresentativeSuccess extends LogicState {}
class MeasurmentOrderRepresentativeFailed extends LogicState {}



class DoneDeactivateLoading extends LogicState {}
class DoneDeactivateSuccess extends LogicState {}
class DoneDeactivateFailed extends LogicState {}



class CancelDeactivateLoading extends LogicState {}
class CancelDeactivateSuccess extends LogicState {}
class CancelDeactivateFailed extends LogicState {}



class DoneCollectingLoading extends LogicState {}
class DoneCollectingSuccess extends LogicState {}
class DoneCollectingFailed extends LogicState {}



class CancelCollectingLoading extends LogicState {}
class CancelCollectingSuccess extends LogicState {}
class CancelCollectingFailed extends LogicState {}