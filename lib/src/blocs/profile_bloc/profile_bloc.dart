import 'package:bloc/bloc.dart';
import 'package:easy_doctor/src/models/user.dart';
import 'package:easy_doctor/src/repositories/profile_repository.dart';
import 'package:easy_doctor/src/utils/logger.dart';
import 'package:equatable/equatable.dart';
import 'package:logger/logger.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  final Logger _logger = CustomLogger().getLogger();
  final ProfileRepository profileRepository;

  ProfileBloc({required this.profileRepository})
      : super(const ProfileNotLoaded()) {
    on<ProfileEvent>((event, emit) {
      if (event is LoadProfile) {
        _onLoadProfile(event, emit);
      }
    });
  }

  Future<void> _onLoadProfile(
      LoadProfile event, Emitter<ProfileState> emit) async {
    emit(ProfileLoading());

    try {
      UserModel loggedUser = await profileRepository.getLoggedUser();

      emit(ProfileLoaded(user: loggedUser));
    } catch (e) {
      _logger.e(e);
      emit(ProfileNotLoaded(message: e.toString()));
    }
  }
}
