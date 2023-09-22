import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpodlearn1/models/category.dart';

import 'package:riverpodlearn1/widgets/SelectableListTile.dart';

class CategorySelectSheet extends HookConsumerWidget {
  List<Category> elementList;
  final Category currentSelected;
  final Category defaultValue;
  final Function(Category)? onPressed;

  CategorySelectSheet(
      {required this.elementList,
      required this.currentSelected,
      required this.onPressed,
      required this.defaultValue});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    print("currentSelected.name${currentSelected.name}");
    final ValueNotifier<String> selectedItemNotifier =
        ValueNotifier(currentSelected.name);
    return Container(
      padding: EdgeInsets.symmetric(vertical: 0.0, horizontal: 1.0),
      decoration: BoxDecoration(
        border: Border.all(color: Colors.grey),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: ListTileTheme(
        textColor: Color(0xFF4338CA),
        iconColor: Color(0xFF4338CA),
        child: ListTile(
          title: Text(
            currentSelected.name.isNotEmpty
                ? currentSelected.name
                : defaultValue.name, // Convert enum value to string for display
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
                        title: elementList[index].name,
                        defaultSelected: selectedItemNotifier.value,
                        onPressed: (selectedValue) {
                          selectedItemNotifier.value = selectedValue;
                          onPressed!(elementList[index]);
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
