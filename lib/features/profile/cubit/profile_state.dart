part of 'profile_cubit.dart';

sealed class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

final class ProfileInitial extends ProfileState {}

final class ProfileLoading extends ProfileState {}

final class ProfileLoaded extends ProfileState {
  final ProfileResponse profile;

  const ProfileLoaded({required this.profile});

  @override
  List<Object> get props => [profile];
}

//eror state
final class ProfileError extends ProfileState {
  final String errorMessage;

  const ProfileError({required this.errorMessage});

  @override
  List<Object> get props => [errorMessage];
}
