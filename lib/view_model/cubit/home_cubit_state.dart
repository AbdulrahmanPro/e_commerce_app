part of 'home_cubit_cubit.dart';

sealed class HomeCubitState {}

final class HomeCubitInitial extends HomeCubitState {}

final class HomeCubitLoading extends HomeCubitState {}

final class HomeCubitLoaded extends HomeCubitState {
  final List<HomeSliderItemModel> sliderItems;
  final List<ProductItemModel> products;

  HomeCubitLoaded({required this.sliderItems, required this.products});
}

final class HomeCubitFailure extends HomeCubitState {
  final String errorMessage;
  HomeCubitFailure(this.errorMessage);
}
