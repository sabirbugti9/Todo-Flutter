import 'package:bloc/bloc.dart';

import 'package:equatable/equatable.dart';
import 'package:tasky/features/home/data/models/get_tasks.response.dart';
import 'package:tasky/features/home/data/models/refresh_token.dart';
import 'package:tasky/features/home/data/repo/home_repo.dart';
import 'package:tasky/features/task_details/data/model/editModel/edit_request_model.dart';
import 'package:tasky/features/task_details/data/model/editModel/edit_response_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit({required this.homeRepo}) : super(HomeInitial());
  final HomeRepo homeRepo;

  // Store all tasks
  List<GetTasksResponse> allTasks = [];
  bool hasMore = true; // Indicates if more tasks are available
  int currentPage = 1; // Track the current page

  void loadTasks(int pageNum) async {
    if (!hasMore) return; // Don't fetch more if there are no more tasks
    emit(GetTasksLoading());
    try {
      final result = await homeRepo.getTasks(pageNum);
      result.when(
        success: (List<GetTasksResponse> response) {
          if (response.isEmpty) {
            hasMore = false; // No more tasks available
            emit(GetTasksSuccess(allTasks)); // Emit current list of tasks
          } else {
            allTasks.addAll(response); // Append new tasks to the list
            emit(GetTasksSuccess(allTasks)); // Emit updated list of tasks
          }
        },
        failure: (errorHandler) {
          String errorMessage = errorHandler.apiErrorModel.message ??
              "An unknown error occurred. Please try again.";
          emit(GetTasksError(errorMessage));
        },
      );
    } catch (error) {
      emit(GetTasksError("An unexpected error occurred. Please try again."));
    }
  }

  // Filter tasks locally based on task type
  void filterTasks(String filter) {
    if (filter == "All") {
      emit(GetTasksSuccess(allTasks)); // Show all tasks
    } else {
      final filteredTasks =
          allTasks.where((task) => task.status == filter).toList();
      if (filteredTasks.isEmpty) {
        emit(GetTasksEmpty()); // No tasks match the filter
      } else {
        emit(GetTasksSuccess(filteredTasks));
      }
    }
  }

  // Call this to load more tasks (pagination)
  void loadMoreTasks() {
    currentPage++;
    loadTasks(currentPage);
  }

//delete task using id
  void deleteTask(String id) async {
    emit(DeleteTaskLoading());
    try {
      final result = await homeRepo.deleteTask(id);
      result.when(
        success: (response) async {
          emit(DeleteTaskSuccess());
          // Refetch tasks from the backend
          final updatedTasks = await homeRepo.getTasks(1);
          updatedTasks.when(
            success: (List<GetTasksResponse> response) {
              allTasks = response;
              emit(GetTasksSuccess(allTasks));
              emit(DeleteTaskSuccess());
            },
            failure: (errorHandler) {
              emit(GetTasksError("Failed to refetch tasks."));
            },
          );
        },
        failure: (errorHandler) {
          emit(DeleteTaskError("Failed to delete task."));
        },
      );
    } catch (error) {
      emit(DeleteTaskError("An unexpected error occurred. Please try again."));
    }
  }

  //refresh token
  void refreshToken(String token) async {
    emit(RefreshTokenLoading());
    try {
      final result = await homeRepo.refreshToken(token);
      result.when(
        success: (response) {
          emit(RefreshTokenSuccess(response));
        },
        failure: (errorHandler) {
          String errorMessage = errorHandler.apiErrorModel.message ??
              "An unknown error occurred. Please try again.";
          emit(RefreshTokenError(errorMessage));
        },
      );
    } catch (error) {
      emit(
          RefreshTokenError("An unexpected error occurred. Please try again."));
    }
  }

  //edit task using id
  void editTask(String taskId, EditRequestModel editreqModel) async {
    emit(EditTaskLoading());
    try {
      final result = await homeRepo.editTask(taskId, editreqModel);
      result.when(
        success: (EditResponseModel response) async {
          emit(EditTaskSuccess(response));
          // Refetch tasks from the backend
          final updatedTasks = await homeRepo.getTasks(1);
          updatedTasks.when(
            success: (List<GetTasksResponse> response) {
              allTasks = response;
              emit(GetTasksSuccess(allTasks));
            },
            failure: (errorHandler) {
              emit(GetTasksError("Failed to refetch tasks."));
            },
          );
        },
        failure: (errorHandler) {
          emit(EditTaskError("Failed to edit task."));
        },
      );
    } catch (error) {
      emit(EditTaskError("An unexpected error occurred. Please try again."));
    }
  }
}
