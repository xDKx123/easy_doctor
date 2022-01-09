import 'package:bloc/bloc.dart';
import 'package:easy_doctor/src/models/personal_list_item_model.dart';
import 'package:easy_doctor/src/models/personal_list_model.dart';
import 'package:easy_doctor/src/repositories/personal_list_item_repository.dart';
import 'package:equatable/equatable.dart';

part 'personal_list_items_event.dart';
part 'personal_list_items_state.dart';

class PersonalListItemsBloc
    extends Bloc<PersonalListItemsEvent, PersonalListItemsState> {
  PersonalListItemsBloc({required this.personalListItemRepository})
      : super(const PersonalListItemsNotLoaded()) {
    on<PersonalListItemsEvent>((PersonalListItemsEvent event,
        Emitter<PersonalListItemsState> emit) async {
      if (event is LoadPersonalListItems) {
        await _onLoadPersonalListItems(event, emit);
      } else if (event is UpdatePersonalListItem) {
        await _onUpdatePersonalListItem(event, emit);
      } else if (event is CreatePersonalListItem) {
        await _onCreatePersonalListItem(event, emit);
      } else if (event is RemovePersonalListItem) {
        await _onRemovePersonalListItem(event, emit);
      }
    });
  }

  final PersonalListItemRepository personalListItemRepository;

  Future<void> _onLoadPersonalListItems(
      LoadPersonalListItems event, Emitter<PersonalListItemsState> emit) async {
    try {
      emit(const PersonalListItemsLoading());

      final List<PersonalListItemModel> items = await personalListItemRepository
          .listPersonalListItems(event.list.id!);

      event.list.items.replaceRange(0, event.list.items.length, items);

      emit(const PersonalListItemsLoaded(items: []));
    } catch (e) {
      print(e);
      emit(PersonalListItemsFailed(error: e.toString()));
    }
  }

  Future<void> _onUpdatePersonalListItem(UpdatePersonalListItem event,
      Emitter<PersonalListItemsState> emit) async {}

  Future<void> _onCreatePersonalListItem(CreatePersonalListItem event,
      Emitter<PersonalListItemsState> emit) async {}

  Future<void> _onRemovePersonalListItem(RemovePersonalListItem event,
      Emitter<PersonalListItemsState> emit) async {}
}
