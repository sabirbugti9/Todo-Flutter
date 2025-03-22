import 'package:tasky/core/networking/api_result.dart';
import 'package:tasky/core/networking/error_handling.dart';
import 'package:tasky/core/networking/ServicesApi.dart';
import 'package:tasky/features/login/data/models/login_request.dart';
import 'package:tasky/features/login/data/models/login_response.dart';

class LoginRepo {
  final ServicesApi servicesInstance;

  LoginRepo({required this.servicesInstance});

  Future<ApiResult<LoginResponse>> login(LoginRequest loginReq) async {
    try {
      final response = await servicesInstance.login(loginReq);
      return ApiResult.success(response);
    } catch (er) {
      return ApiResult.failure(
        ErrorHandler.handle(er),
      );
    }
  }
}
