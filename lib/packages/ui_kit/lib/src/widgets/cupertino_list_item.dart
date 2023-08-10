import 'package:flutter/material.dart';

class CupertinoListItem extends StatelessWidget {
  const CupertinoListItem({
    super.key,
    required this.name,
    required this.lastName,
    required this.onTap,
  });

  final String name;
  final String lastName;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context).textTheme;
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: double.infinity,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    name,
                    style: theme.titleSmall,
                  ),
                  const SizedBox(width: 4.0),
                  Text(
                    lastName,
                    style: theme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
