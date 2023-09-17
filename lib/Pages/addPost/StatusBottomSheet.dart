import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:riverpodlearn1/widgets/SelectableListTile.dart';

class StatusBottomSheet extends HookWidget {
  final List<String> statuses;
  final Function(String) onPressed;
  final String defaultSelected;
  StatusBottomSheet(
      {required this.statuses,
      required this.onPressed,
      required this.defaultSelected});

  @override
  Widget build(BuildContext context) {
   
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
                itemCount: statuses.length,
                itemBuilder: (context, index) {
                  return SelectableListTile(
                    title: statuses[index],
                    onPressed: onPressed,
                    currentSelected: defaultSelected,
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
