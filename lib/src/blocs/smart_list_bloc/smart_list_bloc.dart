import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'smart_list_event.dart';
part 'smart_list_state.dart';

class SmartListBloc extends Bloc<SmartListEvent, SmartListState> {
  SmartListBloc() : super(const SmartListWaiting());

  @override
  Stream<SmartListState> mapEventToState(SmartListEvent event) async* {
    if (event is InitSmartList) {
      yield* _mapInitSmartListSToState(event);
    } else if (event is ClearSmartList) {
      yield* _mapClearSmartListSToState();
    } else if (event is LoadNewItems) {
      yield* _mapLoadNewItemsToState(state, event);
    } else if (event is ChangeItemsPerPage) {
      yield* _mapChangeItemsPerPageToState(state, event);
    }
  }

  /// Clear Smart List
  Stream<SmartListWaiting> _mapClearSmartListSToState() async* {
    yield const SmartListWaiting();
  }

  /// Init Smart List
  Stream<SmartListLoaded> _mapInitSmartListSToState(
      InitSmartList event) async* {
    yield SmartListLoaded.init(event.newItems);
  }

  /// Load New Items
  Stream<SmartListState> _mapLoadNewItemsToState(
      SmartListState state, LoadNewItems event) async* {
    yield SmartListLoaded(
      allItems: event.newItems,
      displayedItems: _getDisplayedItems(event.newItems),
    );
  }

  /// Change Items Per Page
  Stream<SmartListLoaded> _mapChangeItemsPerPageToState(
      SmartListState state, ChangeItemsPerPage event) async* {
    if (state is SmartListLoaded) {
      yield SmartListLoaded(
        allItems: state.allItems,
        displayedItems: _getDisplayedItems(state.allItems),
      );
    }
  }

  List<dynamic> _getDisplayedItems(List<dynamic> items) {
    return items;
  }
}
