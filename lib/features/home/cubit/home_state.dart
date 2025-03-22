part of 'home_cubit.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

// Initial state
final class HomeInitial extends HomeState {}

// GetTasks Loading state
final class GetTasksLoading extends HomeState {}

// Empty state
final class GetTasksEmpty extends HomeState {}

// Error state
final class GetTasksError extends HomeState {
  final String message;

  const GetTasksError(this.message);

  @override
  List<Object> get props => [message];
}

// Success state
final class GetTasksSuccess extends HomeState {
  final List<GetTasksResponse> tasks;

  const GetTasksSuccess(this.tasks);

  @override
  List<Object> get props => [tasks];
}

// RefreshToken Loading state
final class RefreshTokenLoading extends HomeState {}

// RefreshToken Success state
final class RefreshTokenSuccess extends HomeState {
  final RefreshTokenResponse refreshTokenResponse;

  const RefreshTokenSuccess(this.refreshTokenResponse);

  @override
  List<Object> get props => [refreshTokenResponse];
}

// RefreshToken Error state
final class RefreshTokenError extends HomeState {
  final String message;

  const RefreshTokenError(this.message);

  @override
  List<Object> get props => [message];
}

// DeleteTask Loading state
final class DeleteTaskLoading extends HomeState {}

// DeleteTask Success state
final class DeleteTaskSuccess extends HomeState {}

// DeleteTask Error state
final class DeleteTaskError extends HomeState {
  final String message;

  const DeleteTaskError(this.message);

  @override
  List<Object> get props => [message];
}

//editTask Loading state
final class EditTaskLoading extends HomeState {}

// editTask Success state
final class EditTaskSuccess extends HomeState {
  final EditResponseModel editTaskResponse;

  const EditTaskSuccess(this.editTaskResponse);

  @override
  List<Object> get props => [editTaskResponse];
}

// editTask Error state
final class EditTaskError extends HomeState {
  final String message;

  const EditTaskError(this.message);

  @override
  List<Object> get props => [message];
}
