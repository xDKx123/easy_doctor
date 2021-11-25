import 'package:easy_doctor/src/app/app_drawers/app_drawer.dart';
import 'package:easy_doctor/src/app/utils/device_screen_type.dart';
import 'package:easy_doctor/src/blocs/smart_list_bloc/smart_list_bloc.dart';
import 'package:easy_doctor/src/ui/widgets/helpers/ui_helpers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:implicitly_animated_reorderable_list/implicitly_animated_reorderable_list.dart';
import 'package:implicitly_animated_reorderable_list/transitions.dart';

typedef ItemBuilder<T> = Widget Function(T data);

class SmartList<T> extends StatelessWidget {
  const SmartList({
    Key? key,
    // Items & Item Builder
    this.items,
    required this.itemBuilder,
    // Scroll Controller
    required this.scrollController,
    // Create Button and Form
    this.createButton,
    required this.createForm,
    // Refresh Button and onRefresh callback
    this.refreshButtonChild = const Icon(Icons.refresh),
    required this.onRefresh,
    // Loading Status and Error Message
    this.isLoadingItems = false,
    this.errorMessage,

    // Persistent First Item (ex. Item Navigation Bar)
    required this.persistentFirstItem,
  }) : super(key: key);

  /// Scroll Controller
  final ScrollController scrollController;

  /// Items & Item Builder
  final List<T>? items;
  final ItemBuilder<T> itemBuilder;

  /// Create Button and Form
  final Widget? createButton;
  final Widget createForm;

  /// Refresh Button and onRefresh callback
  final Function onRefresh;
  final Widget refreshButtonChild;

  /// Loading Status and Error Message
  final bool isLoadingItems;
  final String? errorMessage;

  /// Persistent First Item (example: Item Navigation Bar)
  final Widget persistentFirstItem;

  double getListHeaderExtent(SizingInformation sizing) {
    if (sizing.deviceScreenType == DeviceScreenType.desktop) {
      return 130;
    }

    if (sizing.deviceScreenType == DeviceScreenType.tablet) {
      return 170;
    }

    return 80;
  }

  /* Widget _buildUtilityBottomSheet(
      {required BuildContext context,
      required SizingInformation sizingInformation}) {
    return SingleChildScrollView(
        child: CustomBottomSheet(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          const Text(
            'Filtering Options',
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
          ),
          verticalSpaceMedium,
          FilteringUtils(
              refreshDateRange:
                  filteringSettings?.dateRangeSettings?.onDateRefresh,
              enableDateRangePicker:
                  filteringSettings?.dateRangeSettings?.enableDateRangePicker ??
                      false,
              loadNewData: filteringSettings?.dateRangeSettings?.loadNewData,
              device: sizingInformation.deviceScreenType),
          verticalSpaceMedium
        ],
      ),
    ));
  }*/

  Widget _buildMainContent({
    required BuildContext context,
    required List<T> items,
    required bool isLoading,
  }) {
    /// Loading Indicator
    if (isLoading) {
      return const SliverFillRemaining(
        child: Center(
          child: CircularProgressIndicator(),
        ),
      );
    }

    /// [noItemsMessage] & [errorMessage]
    if (items == null || items.isEmpty) {
      return SliverFillRemaining(
        hasScrollBody: true,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              //Text(S.of(context).noItemsMessage),
              //verticalSpaceSmall,
              errorMessage != null
                  ? Opacity(opacity: 0.5, child: Text('$errorMessage'))
                  : Container(),
            ],
          ),
        ),
      );
    }

    /// List Of Items
    return SliverImplicitlyAnimatedList<T>(
      items: items,
      areItemsTheSame: (T a, T b) => a == b,
      itemBuilder: (BuildContext context, Animation<double> animation, T item,
          int index) {
        return Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            SizeFadeTransition(
              sizeFraction: 0.7,
              curve: Curves.easeInOut,
              animation: animation,
              child: itemBuilder(item),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final SmartListBloc bloc = BlocProvider.of<SmartListBloc>(context);
    final SmartListState state = bloc.state;

    /// Prevent redundant state modification when items are loading
    if (!isLoadingItems) {
      /// If SmartList's state hasn't been initialized
      /// or if SmartList has the wrong type of items currently loaded
      /// then Initialize SmartList state with [items] and [filteringSettings]
      if (state is SmartListWaiting ||
          (state is SmartListLoaded && state.allItems is! List<T>)) {
        bloc.add(InitSmartList(newItems: List<T>.from(items!)));
      }

      /// If current [items] are not loaded in SmartList's state
      /// then Load them as new List<T> newItems (not a pointer to list!)
      if (state is SmartListLoaded && !listEquals(items, state.allItems)) {
        BlocProvider.of<SmartListBloc>(context)
            .add(LoadNewItems(newItems: List<T>.from(items!)));
      }
    }

    return BlocBuilder<SmartListBloc, SmartListState>(
      buildWhen: (_, SmartListState state) {
        /// only build when state contains loaded items with type <T>
        return state is SmartListLoaded && state.displayedItems is List<T>;
      },
      builder: (BuildContext context, SmartListState state) {
        /// Display Loading animation if items are loading
        /// or if SmartList's state is not initialized
        /// or if SmartList's state has not yet been updated
        /// with newly loaded items
        bool isLoading = isLoadingItems;
        if (state is SmartListWaiting ||
            (state is SmartListLoaded &&
                items!.length != state.allItems.length)) {
          isLoading = true;
        }

        /// Items that should currently be displayed in the list
        List<T> displayedItems = <T>[];

        /// If the correct type of items are loaded
        /// in SmartList's state, then populate [displayedItems]
        // if (state is SmartListLoaded && state.displayedItems is List<T>) {
        displayedItems = items!;
        // }

        return ResponsiveBuilder(
          builder: (BuildContext context, SizingInformation sizingInformation) {
            return Stack(
              children: <Widget>[
                RefreshIndicator(
                  onRefresh: () async {
                    onRefresh();
                  },
                  child: CustomScrollView(
                    shrinkWrap: false,
                    controller: scrollController,
                    physics: const AlwaysScrollableScrollPhysics(),
                    slivers: <Widget>[
                      /// List Header
                      /// (Search Bar, Create & Refresh Button, Filter Row)
/*                      SliverPersistentHeader(
                        pinned: true,
                        delegate: SmartListHeader(
                          minExtent: sizingInformation.deviceScreenType ==
                                  DeviceScreenType.Desktop
                              ? 118
                              : (sizingInformation.deviceScreenType ==
                                          DeviceScreenType.Tablet &&
                                      MediaQuery.of(context)?.orientation ==
                                          Orientation.landscape)
                                  ? 155
                                  : 80, // 85
                          maxExtent: getListHeaderExtent(sizingInformation),
                          // Filter Utils Row
                          utilityRow: FilteringUtils(
                            refreshDateRange: filteringSettings
                                ?.dateRangeSettings?.onDateRefresh,
                            enableDateRangePicker: filteringSettings
                                    ?.dateRangeSettings
                                    ?.enableDateRangePicker ??
                                false,
                            loadNewData: filteringSettings
                                ?.dateRangeSettings?.loadNewData,
                            device: sizingInformation.deviceScreenType,
                          ),
                          // Create Button
                          createButton:
                              createButton != null ? createButton : Container(),
                          // Refresh button
                          refreshButton: RefreshButton(
                            child: refreshButtonChild,
                            onPressed: onRefresh,
                          ),
                          // Search Bar
                          searchBar: SmartListSearchBar(
                            entry: filteringSettings?.search?.entry ?? '',
                            resetEntry:
                                filteringSettings?.search?.resetEntry ?? false,
                            hintText: filteringSettings?.search?.hint,
                            onSearchSubmitted:
                                filteringSettings?.search?.onSearch ??
                                    (String entry) {},
                            showMenuIcon: sizingInformation.deviceScreenType !=
                                DeviceScreenType.Desktop,
                            showReturnIcon:
                                filteringSettings.displayReturnInSearchBar ??
                                    false,
                            showFilterButton:
                                sizingInformation.deviceScreenType ==
                                    DeviceScreenType.Mobile,
                            onFilterButtonPressed: () {
                              showModalBottomSheet(
                                isScrollControlled:
                                    MediaQuery.of(context)?.orientation ==
                                        Orientation.landscape,
                                context: context,
                                shape: bottomSheetShape,
                                builder: (BuildContext context) {
                                  final Widget utilityBottomSheet =
                                      _buildUtilityBottomSheet(
                                          context: context,
                                          sizingInformation: sizingInformation);
                                  return utilityBottomSheet;
                                },
                              );
                            },
                          ),
                        ),
                      ),*/

                      /// Widgets Above The List
                      SliverToBoxAdapter(
                        child: Column(
                          children: <Widget>[
                            createForm ?? Container(),
                            persistentFirstItem ?? Container()
                          ],
                        ),
                      ),

                      /// Spacer before first item
                      SliverToBoxAdapter(
                        child: Visibility(
                          visible: persistentFirstItem == null,
                          child: verticalSpaceSmall,
                        ),
                      ),

                      /// Main List Content
                      _buildMainContent(
                        context: context,
                        items: displayedItems,
                        isLoading: isLoading,
                      ),

                      /// Spacer after last item
                      SliverToBoxAdapter(
                        child: Visibility(
                          visible: !isLoading && displayedItems.isNotEmpty,
                          child: verticalSpaceLarge,
                        ),
                      ),
                    ],
                  ),
                ),

                /// 'Create' Floating Action Button for Tablet and Mobile View
                Visibility(
                  visible: sizingInformation.deviceScreenType !=
                      DeviceScreenType.desktop,
                  child: Positioned(
                    right:
                        getHorizontalAppPadding(sizingInfo: sizingInformation),
                    bottom: 20,
                    child: Visibility(
                      visible: MediaQuery.of(context).viewInsets.bottom == 0.0,
                      child: createButton ?? Container(),
                    ),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
