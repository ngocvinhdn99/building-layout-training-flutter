import 'package:flutter/material.dart';

class ActionContainer extends StatelessWidget {
  final List<Map<String, Object>> actionList;

  ActionContainer(this.actionList);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: actionList
          .map((e) => Column(
                children: [
                  Icon(
                    e['icon'] as IconData,
                    color: Colors.blue,
                  ),
                  Text(e['label'] as String,
                      style: const TextStyle(
                        color: Colors.blue,
                      ))
                ],
              ))
          .toList(),
    );
  }
}
