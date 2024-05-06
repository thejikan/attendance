import 'package:attendance/features/presentation/verify/bloc/verify_cubit.dart';
import 'package:attendance/features/service/detailsService.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VerifyView extends StatelessWidget {
  const VerifyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider<VerifyViewCubit>(
      create: (context) => VerifyViewCubit(context.read<DetailsService>()),
      child: _VerifyView(),
    );
  }
}

class _VerifyView extends StatelessWidget {
  _VerifyView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double fem = MediaQuery.of(context).size.width / 380;
    return BlocConsumer<VerifyViewCubit, VerifyViewState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            leading: Icon(
              Icons.arrow_back_ios,
              color: Color(0xFF5F69C7),
              size: 14 * fem,
            ),
            title: Text(
              'Face Verification',
              style: TextStyle(color: Colors.grey, fontSize: 16 * fem),
            ),
            backgroundColor: Colors.white,
          ),
          body: Column(
            children: [],
          ),
          backgroundColor: Colors.white,
        );
      },
    );
  }
}
