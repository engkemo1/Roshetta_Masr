abstract class HomeState {}

class HomeInitialState extends HomeState{}
class HomeLoadingState extends HomeState{}
class HomeSuccessState extends HomeState{}

class HomeErrorState extends HomeState{
  final  error;

  HomeErrorState(this.error);
}
class CategoryLoadingState extends HomeState{}
class CategorySuccessState extends HomeState{}

class CategoryErrorState extends HomeState{
  final  error;

  CategoryErrorState(this.error);
}
class SubCLoadingState extends HomeState{}
class SubCSuccessState extends HomeState{}

class SubCErrorState extends HomeState{
  final  error;

  SubCErrorState(this.error);
}
class ProductLoadingState extends HomeState{}
class ProductSuccessState extends HomeState{}

class ProductErrorState extends HomeState{
  final  error;

  ProductErrorState(this.error);
}