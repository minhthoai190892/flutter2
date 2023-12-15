part of 'profile_cubit.dart';

enum ProfileStatus {
  initial,
  loading,
  loaded,
  error,
}

class ProfileState extends Equatable {
  final UserModel user;
  final CustomError error;
  final ProfileStatus status;
  const ProfileState(
    this.user,
    this.error,
    this.status,
  );

  ProfileState copyWith({
    UserModel? user,
    CustomError? error,
    ProfileStatus? status,
  }) {
    return ProfileState(
      user ?? this.user,
      error ?? this.error,
      status ?? this.status,
    );
  }

  factory ProfileState.initial() {
    return ProfileState(
        UserModel.initial(), const CustomError(), ProfileStatus.initial);
  }

  @override
  bool get stringify => true;

  @override
  List<Object> get props => [user, error, status];
}
