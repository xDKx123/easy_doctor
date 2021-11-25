part of 'smart_list_bloc.dart';

@immutable
abstract class SmartListEvent extends Equatable {
  const SmartListEvent();
  @override
  List<Object> get props => const <Object>[];
}

class ClearSmartList extends SmartListEvent {
  const ClearSmartList();

  @override
  List<Object> get props => <Object>[];
}

class InitSmartList extends SmartListEvent {
  const InitSmartList({
    required this.newItems,
  });

  final List<dynamic> newItems;

  @override
  List<Object> get props => <Object>[newItems];

  @override
  String toString() {
    return 'Initializing SmartList State with ${newItems.length} items';
  }
}

class LoadNewItems extends SmartListEvent {
  const LoadNewItems({required this.newItems});

  final List<dynamic> newItems;

  @override
  List<Object> get props => <Object>[newItems];

  @override
  String toString() {
    return 'Loading ${newItems.length} New Items Into Smart List';
  }
}

class ChangeItemsPerPage extends SmartListEvent {
  const ChangeItemsPerPage({required this.newItemsPerPage});

  final ItemsPerPageOption newItemsPerPage;

  @override
  List<Object> get props => <Object>[newItemsPerPage];
}

class ChangePage extends SmartListEvent {
  const ChangePage({required this.pageChange});

  final PageChange pageChange;

  @override
  List<Object> get props => <Object>[pageChange];
}

enum PageChange {
  next,
  previous,
}
