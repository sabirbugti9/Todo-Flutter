import 'package:tasky/core/networking/ServicesApi.dart';
import 'package:tasky/core/networking/api_result.dart';
import 'package:tasky/core/networking/error_handling.dart';
import 'package:tasky/features/home/data/models/get_tasks.response.dart';
import 'package:tasky/features/home/data/models/refresh_token.dart';
import 'package:tasky/features/task_details/data/model/deleteModel/delete_response.dart';
import 'package:tasky/features/task_details/data/model/editModel/edit_response_model.dart';

class HomeRepo {
  final ServicesApi servicesApi;
  HomeRepo({required this.servicesApi});
//get tasks
  Future<ApiResult<List<GetTasksResponse>>> getTasks(pageNum) async {
    try {
      final response = await servicesApi.getTasks(pageNum);
      return ApiResult.success(response);
    } catch (er) {
      return ApiResult.failure(
        ErrorHandler.handle(er),
      );
    }
  }

//refresh token
  Future<ApiResult<RefreshTokenResponse>> refreshToken(token) async {
    try {
      final response = await servicesApi.refreshToken(token);
      return ApiResult.success(response);
    } catch (er) {
      return ApiResult.failure(
        ErrorHandler.handle(er),
      );
    }
  }

//delete task using id
  Future<ApiResult<TaskDelete>> deleteTask(id) async {
    try {
      final res = await servicesApi.deleteTask(id);
      return ApiResult.success(res);
    } catch (er) {
      return ApiResult.failure(
        ErrorHandler.handle(er),
      );
    }
  }

//edit task using id
  Future<ApiResult<EditResponseModel>> editTask(id, task) async {
    try {
      final res = await servicesApi.editTask(id, task);
      return ApiResult.success(res);
    } catch (er) {
      return ApiResult.failure(
        ErrorHandler.handle(er),
      );
    }
  }
}
