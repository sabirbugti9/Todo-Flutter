import 'package:tasky/core/networking/ServicesApi.dart';
import 'package:tasky/core/networking/api_result.dart';
import 'package:tasky/core/networking/error_handling.dart';
import 'package:tasky/features/addTask/data/models/create_task_request.dart';
import 'package:tasky/features/addTask/data/models/create_task_respons.dart';

class CreateTaskRepo {
  final ServicesApi servicesInstance;
  CreateTaskRepo({required this.servicesInstance});
  // Create a new task

  Future<ApiResult<CreateTaskRespons>> creatTask(
      CreateTaskRequest createReq) async {
    try {
      final response = await servicesInstance.createTask(createReq);
      return ApiResult.success(response);
    } catch (er) {
      return ApiResult.failure(
        ErrorHandler.handle(er),
      );
    }
  }
}
