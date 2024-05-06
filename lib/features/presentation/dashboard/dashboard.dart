import 'package:attendance/features/presentation/dashboard/bloc/dashboard_cubit.dart';
import 'package:attendance/features/service/detailsService.dart';
import 'package:attendance/router/appRoutesEnum.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<DashboardViewCubit>(
      create: (context) =>
          DashboardViewCubit(context.read<DetailsService>()),
      child: const _DashboardView(),
    );
  }
}

class _DashboardView extends StatelessWidget {
  const _DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double fem = MediaQuery.of(context).size.width/380;
    return BlocConsumer<DashboardViewCubit, DashboardViewState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            leading: InkWell(
              onTap: () {
                context.go(AppRoutes.verify.routePath);
              },
              child: const Icon(Icons.arrow_back_ios_new, color: Colors.black87),
            ),
            title: Center(
                child: Text(
              'Task of the Day',
              style: TextStyle(
                  fontSize: 16*fem,
                  fontWeight: FontWeight.w500,
                  color: Colors.black87),
            )),
            actions: [
              Icon(
                Icons.search,
                color: Colors.grey[800],
                size: 20*fem,
              ),
              Icon(
                Icons.notifications_none_outlined,
                color: Colors.grey[800],
                size: 20*fem,
              ),
              CircleAvatar(
                child: Icon(Icons.image, color: Colors.blueGrey),
              ),
            ],
          ),
          backgroundColor: Colors.white,
          body: Column(
            children: [
              Expanded(
                child: CustomScrollView(
                  shrinkWrap: true,
                  slivers: [
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
