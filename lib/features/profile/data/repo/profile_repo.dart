import 'package:tasky/core/networking/ServicesApi.dart';
import 'package:tasky/core/networking/api_result.dart';
import 'package:tasky/core/networking/error_handling.dart';
import 'package:tasky/features/profile/data/models/profile_response.dart';

class ProfileRepo {
  final ServicesApi servicesApi;
  ProfileRepo({required this.servicesApi});

  //get profile data
  Future<ApiResult<ProfileResponse>> getProfileData() async {
    try {
      final res = await servicesApi.getUserProfile();
      return ApiResult.success(res);
    } catch (er) {
      return ApiResult.failure(
        ErrorHandler.handle(er),
      );
    }
  }
}
