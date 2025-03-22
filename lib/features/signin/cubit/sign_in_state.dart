import 'package:equatable/equatable.dart';

import 'package:tasky/features/signin/data/models/signIn_response.dart';

abstract class SignInState extends Equatable {
  const SignInState();

  @override
  List<Object?> get props => [];
}

class SignInInitial extends SignInState {}

class SignInLoading extends SignInState {}

class SignInSuccess extends SignInState {
  final SigninResponse response;

  const SignInSuccess(this.response);

  @override
  List<Object?> get props => [response];
}

class SignInFailure extends SignInState {
  final String error;

  const SignInFailure(this.error);

  @override
  List<Object?> get props => [error];
}
