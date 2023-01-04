abstract class DoctorState {}

class DoctorInitialState extends DoctorState{}
class DoctorLoadingState extends DoctorState{}
class DoctorSuccessState extends DoctorState{}

class DoctorErrorState extends DoctorState{
  final  error;

  DoctorErrorState(this.error);
}
