part of 'dashboard_cubit.dart';

class DashboardViewState extends Equatable {
  final int data;

  const DashboardViewState({
    this.data = 0,
  });

  DashboardViewState copyWith({
    int? data,
  }) {
    return DashboardViewState(
      data: data ?? this.data,
    );
  }

  @override
  List<Object?> get props => [
        data,
      ];
}
