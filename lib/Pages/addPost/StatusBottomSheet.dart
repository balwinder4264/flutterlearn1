import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpodlearn1/constant/constant.dart';
import 'package:riverpodlearn1/widgets/SelectableListTile.dart';

class SelectionNotifier extends StateNotifier<String> {
  SelectionNotifier() : super('');

  void select(String value) {
    state = value;
  }
}

final selectionProvider = StateNotifierProvider<SelectionNotifier, String>(
    (ref) => SelectionNotifier());

class StatusBottomSheet extends HookConsumerWidget {
  StatusBottomSheet();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final defaultSelected = ref.watch(selectionProvider);

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
            defaultSelected, // Convert enum value to string for display
            textScaleFactor: 1,
          ),
          trailing: Icon(Icons.arrow_drop_down),
          onTap: () {
            showModalBottomSheet(
              context: context,
              builder: (context) => ListView.builder(
                itemCount: productStatuses.length,
                itemBuilder: (context, index) {
                  return SelectableListTile(
                    title: productStatuses[index],
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
