// ignore_for_file: must_be_immutable

part of 'create_task_cubit.dart';

sealed class CreateTaskState extends Equatable {
  const CreateTaskState();

  @override
  List<Object> get props => [];
}

final class CreateTaskInitial extends CreateTaskState {}

//loading
final class CreateTaskLoading extends CreateTaskState {}

//success
class CreateTaskSuccess extends CreateTaskState {
  CreateTaskRespons createTaskRespons;
  CreateTaskSuccess(this.createTaskRespons);
  @override
  List<Object> get props => [createTaskRespons];
}

//error
class CreateTaskError extends CreateTaskState {
  final String message;

  CreateTaskError(this.message);

  @override
  List<Object> get props => [message];
}
