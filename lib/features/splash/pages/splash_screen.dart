import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_pagination_bloc_test/core/router/app_router.gr.dart';
import 'package:flutter_pagination_bloc_test/features/splash/manager/splash_cubit.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

@RoutePage()
class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) => BlocProvider(
        create: (context) => SplashCubit(),
        child: Builder(
            builder: (context) => BlocListener<SplashCubit, SplashState>(
                  listener: (context, state) {
                    state.whenOrNull(
                        navigateToHomeScreen: () =>
                            context.replaceRoute(const FirstRoute()));
                  },
                  child: Scaffold(
                    body: Center(
                      child: FlutterLogo(
                        size: 200.h,
                      ),
                    ),
                  ),
                )),
      );
}
