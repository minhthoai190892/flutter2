// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import 'package:fb_auth_bloc/models/custom_error.dart';
import 'package:fb_auth_bloc/models/user_model.dart';
import 'package:fb_auth_bloc/repositories/profile_repository.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepository profileRepository;
  ProfileCubit({required this.profileRepository})
      : super(ProfileState.initial());
  Future<void> getProfile({required String uid}) async {
    emit((state.copyWith(status: ProfileStatus.loading)));
    try {
      final UserModel user = await profileRepository.getProfile(uid);
      emit(state.copyWith(status: ProfileStatus.loaded, user: user));
    } on CustomError catch (e) {
      emit(state.copyWith(status: ProfileStatus.error, error: e));
    }
  }
}
