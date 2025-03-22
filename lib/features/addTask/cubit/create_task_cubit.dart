import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:tasky/features/addTask/data/models/create_task_request.dart';
import 'package:tasky/features/addTask/data/models/create_task_respons.dart';
import 'package:tasky/features/addTask/data/repo/create_task_repo.dart';

part 'create_task_state.dart';

class CreateTaskCubit extends Cubit<CreateTaskState> {
  final CreateTaskRepo repoInstance;
  CreateTaskCubit({required this.repoInstance}) : super(CreateTaskInitial());
  // create the task New task

  Future<void> createTask(CreateTaskRequest createTaskRequest) async {
    emit(CreateTaskLoading());

    try {
      final result = await repoInstance.creatTask(createTaskRequest);
      result.when(
        success: (CreateTaskRespons response) async {
          emit(CreateTaskSuccess(response));
        },
        failure: (errorHandler) {
          String errorMessage =
              errorHandler.apiErrorModel.message ?? "Unknown Error";
          // Check for specific errors and update message

          emit(CreateTaskError(errorMessage));
        },
      );
    } catch (error) {
      emit(CreateTaskError(
          "An unexpected error occurred. Please try again.${error}"));
    }
  }
}
