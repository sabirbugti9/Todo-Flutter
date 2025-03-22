import 'package:flutter/material.dart';
import 'package:tasky/core/di/dependicy_injection.dart';

import 'package:tasky/core/routing/routing.dart';

import 'package:tasky/tasky.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setUpGetIt();

  runApp(Tasky(
    appRouter: AppRoutes(),
  ));
}

/* 


 final dio = DioFactory.getDio();

          // Log interceptors
          print("Interceptors: ${dio.interceptors}");

          // Create an instance of ApiServices
          final api = ServicesApi(dio);

          // Test the API
          try {
            final req = CreateTaskRequest(
                image: "sad",
                title: "toson firstCreatioTask",
                desc: "toson Diescription",
                priority: "low",
                dueDate: "2024-05-15");
            final response = await api.createTask(req);
            print("Response#@#@@#@#@##@##@!@!@!#: $response");
          } catch (e) {
            print("Error: $e");
          }





 final dio = DioFactory.getDio();

  // Log interceptors
  print("Interceptors: ${dio.interceptors}");

  // Create an instance of ApiServices
  final api = ServicesApi(dio);

  // Test the API
  try {
    final loginRequest = LoginRequest("+201010558269", "123456");
    final response = await api.login(loginRequest);
    print("Response: $response");
  } catch (e) {
    print("Error: $e");
  }
 */

/*  final dio = DioFactory.getDio();

  // Log interceptors
  print("Interceptors: ${dio.interceptors}");

  // Create an instance of ApiServices
  final api = ServicesApi(dio);

  // Test the API
  try {
    final loginRequest = SigninRequest(
        phone: "+201010358995",
        password: "123456",
        displayName: "toson mohamed",
        experienceYears: 10,
        address: "Mit ghamr , Dakahlia , Egypt",
        level: "senior");
    SigninResponse response = await api.signIn(loginRequest);
    print("Response: $response");
  } catch (e) {
    print("Error: $e");
  } */
