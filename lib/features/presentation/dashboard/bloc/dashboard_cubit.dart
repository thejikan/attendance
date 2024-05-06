import 'package:attendance/features/model/productConfig.dart';
import 'package:attendance/features/service/detailsService.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'dashboard_state.dart';

class DashboardViewCubit extends Cubit<DashboardViewState> {
  final DetailsService _detailsService;

  DashboardViewCubit(this._detailsService)
      : super(const DashboardViewState()) {
    initialState();
  }

  void initialState() async {

  }


}
