part of 'smart_list_bloc.dart';

abstract class SmartListState extends Equatable {
  const SmartListState();
}

class SmartListWaiting extends SmartListState {
  const SmartListWaiting();

  @override
  List<Object> get props => <Object>[];
}

class SmartListLoaded extends SmartListState {
  const SmartListLoaded({
    required this.allItems,
    required this.displayedItems,
  });

  const SmartListLoaded.init(List<dynamic> items)
      : allItems = items,
        displayedItems = items;

  final List<dynamic> allItems;
  final List<dynamic> displayedItems;

  @override
  List<Object> get props => <Object>[allItems, displayedItems];

  @override
  String toString() {
    return 'SmartList Loaded - Displaying ${displayedItems.length} of ${allItems.length} items';
  }
}

/// Filtering Settings
class ItemsPerPageOption extends Equatable {
  const ItemsPerPageOption({
    required this.label,
    required this.itemCount,
    this.isAllOption = false,
  });

  final String label;
  final int itemCount;
  final bool isAllOption;

  @override
  List<Object> get props => <Object>[label];
}

class SortByOption<ItemType> extends Equatable {
  const SortByOption({
    required this.label,
    required this.sortItems,
  });

  final String label;
  final List<ItemType> Function(List<ItemType> items) sortItems;

  @override
  List<Object> get props => <Object>[label];
}

class SearchSettings extends Equatable {
  const SearchSettings({
    required this.hint,
    required this.onSearch,
    required this.entry,
    required this.resetEntry,
  });

  final String hint;
  final void Function(String entry) onSearch;
  final String entry;
  final bool resetEntry;

  @override
  List<Object> get props => <Object>[hint, onSearch];
}
