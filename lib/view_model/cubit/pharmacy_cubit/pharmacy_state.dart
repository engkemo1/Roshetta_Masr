abstract class PharmacyState {}

class PharmacyInitialState extends PharmacyState{}
class PharmacyLoadingState extends PharmacyState{}
class PharmacySuccessState extends PharmacyState{}

class PharmacyErrorState extends PharmacyState{
  final  error;

  PharmacyErrorState(this.error);
}
class MakeOrderLoadingState extends PharmacyState{}
class MakeOrderSuccessState extends PharmacyState{}

class MakeOrderErrorState extends PharmacyState{
  final  error;

  MakeOrderErrorState(this.error);
}class GetOrderLoadingState extends PharmacyState{}
class GetOrderSuccessState extends PharmacyState{}

class GetOrderErrorState extends PharmacyState{
  final  error;

  GetOrderErrorState(this.error);
}