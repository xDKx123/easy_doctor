import 'package:bloc/bloc.dart';
import 'package:easy_doctor/src/models/personal_list_model.dart';
import 'package:easy_doctor/src/repositories/personal_list_item_repository.dart';
import 'package:easy_doctor/src/repositories/personal_list_repository.dart';
import 'package:equatable/equatable.dart';

part 'personal_list_event.dart';
part 'personal_list_state.dart';

class PersonalListBloc extends Bloc<PersonalListEvent, PersonalListState> {
  PersonalListBloc({
    required this.personalListRepository,
    required this.personalListItemRepository,
  }) : super(const PersonalListNotLoaded()) {
    on<PersonalListEvent>(
        (PersonalListEvent event, Emitter<PersonalListState> emit) async {
      if (event is LoadPersonalList) {
        await _onLoadPersonalList(emit);
      } else if (event is CreatePersonalList) {
        await _onCreatePersonalList(event, emit);
      } else if (event is UpdatePersonalList) {
        await _onUpdatePersonalList(event, emit);
      } else if (event is RemovePersonalList) {
        await _onRemovePersonalList(event, emit);
      }
    });
  }

  final PersonalListRepository personalListRepository;
  final PersonalListItemRepository personalListItemRepository;

  Future<void> _onLoadPersonalList(Emitter<PersonalListState> emit) async {
    try {
      emit(const PersonalListLoading());

      final List<PersonalListModel> lists =
          await personalListRepository.listPersonalLists();

      final List<Future<PersonalListModel>> personalLists = lists
          .map((PersonalListModel e) async => e.copyWith(
              items: await personalListItemRepository
                  .listPersonalListItems(e.id!)))
          .toList();

      final List<PersonalListModel> personalListsWithItems =
          await Future.wait(personalLists);

      emit(PersonalListLoaded(items: personalListsWithItems));
    } catch (e) {
      print(e);
      emit(PersonalListFailed(error: e.toString()));
    }
  }

  Future<void> _onCreatePersonalList(
      CreatePersonalList event, Emitter<PersonalListState> emit) async {
    try {
      emit(const PersonalListLoading());

      await personalListRepository.createPersonalList(
        PersonalListModel(
          name: event.name,
          items: [],
          description: event.description,
        ),
      );
      emit(const PersonalListSuccess());
    } catch (e) {
      emit(PersonalListFailed(error: e.toString()));
    }
  }

  Future<void> _onUpdatePersonalList(
      UpdatePersonalList event, Emitter<PersonalListState> emit) async {
    try {
      emit(const PersonalListLoading());

      final PersonalListModel model = PersonalListModel(
          id: event.id,
          name: event.name,
          items: [],
          description: event.description);

      await personalListRepository.updatePersonalList(model);

      emit(const PersonalListSuccess());
    } catch (e) {
      emit(PersonalListFailed(error: e.toString()));
    }
  }

  Future<void> _onRemovePersonalList(
      RemovePersonalList event, Emitter<PersonalListState> emit) async {
    try {
      emit(const PersonalListLoading());

      await personalListRepository.removePersonalList(event.id);

      emit(const PersonalListSuccess());
    } catch (e) {
      emit(PersonalListFailed(error: e.toString()));
    }
  }
}
