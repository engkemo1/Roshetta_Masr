abstract class LabState {}

class LabInitialState extends LabState{}
class LabLoadingState extends LabState{}
class LabSuccessState extends LabState{}

class LabErrorState extends LabState{
  final  error;

  LabErrorState(this.error);
}
