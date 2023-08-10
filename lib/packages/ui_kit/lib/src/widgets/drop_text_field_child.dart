import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DropTextFieldChild extends StatelessWidget {
  const DropTextFieldChild({
    super.key,
    required this.controllers,
    required this.titleText,
    this.hints,
  });

  final List<TextEditingController> controllers;
  final List<String>? hints;
  final String titleText;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(titleText),
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Icon(
            Icons.arrow_forward_ios_rounded,
            size: 16.0,
          ),
        ),
        Column(children: [
          ...controllers
              .map((e) => Container(
                    decoration: BoxDecoration(
                      border: Border(
                        left: const BorderSide(
                          color: CupertinoColors.systemGrey,
                          width: 0.5,
                        ),
                        bottom: controllers.indexOf(e) != controllers.length - 1
                            ? const BorderSide(
                                color: CupertinoColors.systemGrey,
                                width: 0.5,
                              )
                            : BorderSide.none,
                      ),
                    ),
                    width: MediaQuery.of(context).size.width * 0.65,
                    child: CupertinoTextField.borderless(
                      controller: e,
                      maxLines: 1,
                      placeholder: (hints != null && controllers.indexOf(e) <= hints!.length - 1)
                          ? hints![controllers.indexOf(e)]
                          : null,
                    ),
                  ))
              .toList()
        ]),
      ],
    );
  }
}
