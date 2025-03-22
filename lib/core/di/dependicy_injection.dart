import 'package:dio/dio.dart';

import 'package:get_it/get_it.dart';
import 'package:tasky/core/networking/ServicesApi.dart';
import 'package:tasky/core/networking/dio_factory.dart';
import 'package:tasky/features/addTask/cubit/create_task_cubit.dart';
import 'package:tasky/features/addTask/data/repo/create_task_repo.dart';
import 'package:tasky/features/home/cubit/home_cubit.dart';
import 'package:tasky/features/home/data/repo/home_repo.dart';
import 'package:tasky/features/login/cubit/login_cubit.dart';
import 'package:tasky/features/login/data/repo/login_repo.dart';
import 'package:tasky/features/profile/cubit/profile_cubit.dart';
import 'package:tasky/features/profile/data/repo/profile_repo.dart';
import 'package:tasky/features/signin/cubit/sign_in_cubit.dart';
import 'package:tasky/features/signin/data/repo/signIn_repo.dart';

final getit = GetIt.instance;
Future<void> setUpGetIt() async {
  //Dio
  Dio dio = DioFactory.getDio();
  getit.registerLazySingleton<ServicesApi>(() => ServicesApi(dio));
  //login
  getit.registerLazySingleton<LoginRepo>(
      () => LoginRepo(servicesInstance: getit()));

  getit.registerFactory<LoginCubit>(() => LoginCubit(servicesApi: getit()));

  //sign in

  getit.registerLazySingleton<SigninRepo>(
      () => SigninRepo(servicesInstance: getit()));
  getit.registerFactory<SignInCubit>(() => SignInCubit(signinRepo: getit()));

  //home
  getit.registerLazySingleton<HomeRepo>(() => HomeRepo(servicesApi: getit()));
  getit.registerFactory<HomeCubit>(() => HomeCubit(homeRepo: getit()));

  //profile
  getit.registerLazySingleton<ProfileRepo>(
      () => ProfileRepo(servicesApi: getit()));
  getit.registerFactory<ProfileCubit>(
      () => ProfileCubit(getProfileRepo: getit()));

  //create task
  getit.registerLazySingleton<CreateTaskRepo>(
      () => CreateTaskRepo(servicesInstance: getit()));
  getit.registerFactory<CreateTaskCubit>(
      () => CreateTaskCubit(repoInstance: getit()));
}
