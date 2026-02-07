import 'package:e_commerce/models/home_slider_item_model.dart';
import 'package:e_commerce/models/product_item_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_cubit_state.dart';

class HomeCubit extends Cubit<HomeCubitState> {
  HomeCubit() : super(HomeCubitInitial());

  void getHomeData() {
    emit(HomeCubitLoading());
    Future.delayed(const Duration(seconds: 2), () {
      emit(
        HomeCubitLoaded(sliderItems: dummySliderItems, products: dummyProducts),
      );
    }).catchError((error) {
      emit(HomeCubitFailure(error.toString()));
    });
  }
}
