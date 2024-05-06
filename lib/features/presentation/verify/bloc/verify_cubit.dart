import 'package:attendance/features/model/productConfig.dart';
import 'package:attendance/features/service/detailsService.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'verify_state.dart';

class VerifyViewCubit extends Cubit<VerifyViewState> {
  final DetailsService _detailsService;

  Map<int, String> _allCategories = {};

  VerifyViewCubit(this._detailsService) : super(const VerifyViewState()) {
    initialState();
  }

  void initialState() async {
    List<ProductConfig> newData =
        await _detailsService.getProductsWithinLimit();
    List<CategoryConfig> categories = await _detailsService.getAllCategories();
    List<CategoryConfig> generalFilter = [];
    generalFilter.add(CategoryConfig(name: 'All Products', id: 0, image: ''));
    for (final category in categories) {
      _allCategories[category.id] = category.name;
      generalFilter.add(category);
    }

    emit(state.copyWith(
      productsList: newData,
      categories: categories,
      filterList: generalFilter,
      isLoading: false,
    ));
  }

  void changeDotIndicator() {
    int num = (state.sliderCardNumber + 1) % 4;
    emit(state.copyWith(
      sliderCardNumber: num,
    ));
  }

  void changeFilterListNumber(int num) async {
    bool flag = true;
    if (state.filterListNumber != num) {
      _detailsService.setOffset(0);
      flag = false;
    }
    List<ProductConfig> newData =
        await _detailsService.filterProductsList({'categoryId': '$num'}, flag);
    emit(state.copyWith(
      filterListNumber: num,
      filterApplied: num > 0,
      productsList: newData,
      moreButtonClicked: false,
    ));
  }

  void addMoreProducts() async {
    emit(state.copyWith(
      moreButtonClicked: true,
    ));
    List<ProductConfig> newData = [];
    if (state.filterApplied) {
      changeFilterListNumber(state.filterListNumber);
      return;
    } else {
      newData = await _detailsService.getProductsWithinLimit();
    }

    emit(state.copyWith(
      productsList: newData,
      moreButtonClicked: false,
    ));
  }
}
