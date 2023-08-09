import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class NameLastNameCompanyWidget extends StatefulWidget {
  const NameLastNameCompanyWidget({
    super.key,
    required this.controllerName,
    required this.controllerSecondName,
    required this.controllerCompany,
  });

  final TextEditingController controllerName;
  final TextEditingController controllerSecondName;
  final TextEditingController controllerCompany;

  @override
  State<NameLastNameCompanyWidget> createState() => _NameLastNameCompanyWidgetState();
}

class _NameLastNameCompanyWidgetState extends State<NameLastNameCompanyWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 146,
      decoration: BoxDecoration(
        border: const Border.symmetric(
          horizontal: BorderSide(color: CupertinoColors.inactiveGray),
        ),
        color: CupertinoDynamicColor.resolve(CupertinoColors.white, context),
      ),
      child: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, top: 5.0, bottom: 5.0),
          child: Column(
            children: [
              CupertinoTextField.borderless(
                maxLines: 1,
                controller: widget.controllerName,
                placeholder: 'Name',
              ),
              const Divider(),
              CupertinoTextField.borderless(
                maxLines: 1,
                placeholder: 'Surname',
                controller: widget.controllerSecondName,
              ),
              const Divider(),
              CupertinoTextField.borderless(
                maxLines: 1,
                placeholder: 'Company',
                controller: widget.controllerCompany,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
