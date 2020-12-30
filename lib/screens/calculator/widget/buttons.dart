import 'package:flutter/material.dart';

import 'button.dart';

class Buttons extends StatelessWidget {
  final List<Button> items;

  Buttons(
    this.items,
  );

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: items.fold(<Widget>[], (list, b) {
          list.isEmpty ? list.add(b) : list.addAll([SizedBox(width: 1), b]);
          return list;
        }),
      ),
    );
  }
}
