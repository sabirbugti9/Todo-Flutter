import 'package:tasky/core/networking/ServicesApi.dart';
import 'package:tasky/core/networking/api_result.dart';
import 'package:tasky/core/networking/error_handling.dart';

import 'package:tasky/features/signin/data/models/signIn_request.dart';
import 'package:tasky/features/signin/data/models/signIn_response.dart';

class SigninRepo {
  final ServicesApi servicesInstance;
  SigninRepo({required this.servicesInstance});

  Future<ApiResult<SigninResponse>> signIn(SigninRequest signinRequest) async {
    try {
      final response = await servicesInstance.signIn(signinRequest);
      return ApiResult.success(response);
    } catch (er) {
      return ApiResult.failure(
        ErrorHandler.handle(er),
      );
    }
  }
}
