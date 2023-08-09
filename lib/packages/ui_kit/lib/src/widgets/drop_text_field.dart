import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DropTextFieldWidget extends StatefulWidget {
  const DropTextFieldWidget({
    super.key,
    required this.dropWidget,
    required this.addTitle,
    this.isOpen = false,
  });

  final Widget dropWidget;
  final bool isOpen;
  final String addTitle;

  @override
  State<DropTextFieldWidget> createState() => _DropTextFieldWidgetState();
}

class _DropTextFieldWidgetState extends State<DropTextFieldWidget> {
  @override
  void initState() {
    open = widget.isOpen;
    super.initState();
  }

  late bool open;

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 200),
      child: DecoratedBox(
        decoration: const BoxDecoration(
          border: Border.symmetric(
            horizontal: BorderSide(
              color: CupertinoColors.systemGrey,
              width: 0.5,
            ),
          ),
          color:  CupertinoColors.white,
        ),
        //height: open ? 245.0 : 56.0,
        child: Column(
          children: [
            if (open)
              Column(
                children: [
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () => setState(() => open = false),
                        child: const Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 10.0,
                            vertical: 15.0,
                          ),
                          child: Icon(
                            CupertinoIcons.minus_circle_fill,
                            color: CupertinoColors.destructiveRed,
                          ),
                        ),
                      ),
                      widget.dropWidget,
                    ],
                  ),
                  const Divider(
                    color: CupertinoColors.systemGrey,
                    height: 0.5,
                    indent: 45.0,
                  ),
                ],
              ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    if (!open) {
                      setState(() => open = true);
                    }
                  },
                  child: const Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 10.0,
                      vertical: 15.0,
                    ),
                    child: Icon(
                      CupertinoIcons.add_circled_solid,
                      color: CupertinoColors.activeGreen,
                    ),
                  ),
                ),
                Text(widget.addTitle),
              ],
            )
          ],
        ),
      ),
    );
  }
}
