import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:riverpodlearn1/widgets/SelectableListTile.dart';

class StatusBottomSheet extends HookConsumerWidget {
  List<String> elementList;
  final String defaultSelected;
  final Function(String)? onPressed;

  StatusBottomSheet(
      {@required this.elementList = const [],
      @required this.defaultSelected = '',
      this.onPressed});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ValueNotifier<String> selectedItemNotifier =
        ValueNotifier(defaultSelected);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 1.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: ListTileTheme(
        textColor: Color(0xFF4338CA),
        iconColor: Color(0xFF4338CA),
        child: ListTile(
          title: Text(
            defaultSelected.isNotEmpty
                ? defaultSelected
                : elementList[0], // Convert enum value to string for display
            textScaleFactor: 1,
          ),
          trailing: Icon(Icons.arrow_drop_down),
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => ValueListenableBuilder<String>(
                valueListenable: selectedItemNotifier,
                builder: (context, selectedItem, _) {
                  return ListView.builder(
                    itemCount: elementList.length,
                    itemBuilder: (context, index) {
                      return SelectableListTile(
                        title: elementList[index],
                        defaultSelected: selectedItemNotifier.value,
                        onPressed: (selectedValue) {
                          selectedItemNotifier.value = selectedValue;
                          onPressed!(selectedValue);
                        },
                      );
                    },
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
