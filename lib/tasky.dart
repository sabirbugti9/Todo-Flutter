import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasky/core/di/dependicy_injection.dart';

import 'package:tasky/core/routing/app_routes.dart';
import 'package:tasky/core/routing/routing.dart';
import 'package:tasky/features/addTask/cubit/create_task_cubit.dart';
import 'package:tasky/features/home/cubit/home_cubit.dart';
import 'package:tasky/features/login/cubit/login_cubit.dart';
import 'package:tasky/features/profile/cubit/profile_cubit.dart';
import 'package:tasky/features/signin/cubit/sign_in_cubit.dart';

class Tasky extends StatelessWidget {
  final AppRoutes appRouter;
  const Tasky({super.key, required this.appRouter});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      minTextAdapt: true,
      splitScreenMode: true,
      child: MultiBlocProvider(
        providers: [
          // Provide multiple Cubits here
          BlocProvider<HomeCubit>(
            create: (context) =>
                HomeCubit(homeRepo: getit()), // Your HomeCubit initialization
          ),
          BlocProvider<LoginCubit>(
            create: (context) => LoginCubit(
                servicesApi: getit()), // Your LoginCubit initialization
          ),
          BlocProvider<SignInCubit>(
            create: (context) => SignInCubit(
                signinRepo: getit()), // Your SignInCubit initialization
          ),

          BlocProvider<ProfileCubit>(
            create: (context) => ProfileCubit(
                getProfileRepo: getit()), // Your SignInCubit initialization
          ),
          BlocProvider<CreateTaskCubit>(
            create: (context) => CreateTaskCubit(
                repoInstance: getit()), // Your SignInCubit initialization
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          onGenerateRoute: appRouter.generateRoute,
          initialRoute: Routes.login,
          title: 'tasky',
        ),
      ),
    );
  }
}
