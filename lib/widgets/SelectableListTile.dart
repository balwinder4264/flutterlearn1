import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class SelectableListTile extends HookConsumerWidget {
  final String title;
  final String? description;
  final String? imgUrl;
  final String currentSelected;
  final Function(String) onPressed;
  final double height;

  SelectableListTile({
    required this.title,
    this.description,
    this.imgUrl,
    required this.currentSelected,
    required this.onPressed,
    this.height = 85,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final defaultSelected = useState(currentSelected);
    return GestureDetector(
      onTap: () {
        defaultSelected.value = title;
        onPressed(title);
      },
      child: AnimatedContainer(
        height: height,
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        margin: EdgeInsets.only(bottom: 20),
        duration: Duration(milliseconds: 250),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
                color: defaultSelected.value == title
                    ? Colors.blue
                    : Colors.white.withOpacity(0),
                width: 2),
            boxShadow: [
              defaultSelected.value == title
                  ? BoxShadow(
                      color: Colors.blue.shade100,
                      offset: Offset(0, 3),
                      blurRadius: 10)
                  : BoxShadow(
                      color: Colors.grey.shade200,
                      offset: Offset(0, 3),
                      blurRadius: 10)
            ]),
        child: Row(
          children: [
            imgUrl != null
                ? Image.network(
                    imgUrl ?? '',
                    width: 50,
                  )
                : SizedBox.shrink(),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                        color: Colors.grey.shade800,
                        fontSize: 16,
                        fontWeight: FontWeight.bold),
                  ),
                  description != null
                      ? Text(
                          description ?? "",
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 14,
                          ),
                        )
                      : SizedBox.shrink(),
                ],
              ),
            ),
            Icon(
              Icons.check_circle,
              color:
                  defaultSelected.value == title ? Colors.blue : Colors.white,
            )
          ],
        ),
      ),
    );
  }
}
