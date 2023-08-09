import 'package:flutter/cupertino.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({
    super.key,
    this.name,
    this.surname,
    this.nameString,
    this.surnameString,
  });

  final TextEditingController? name;
  final TextEditingController? surname;
  final String? nameString;
  final String? surnameString;

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  @override
  void initState() {
    if (widget.name != null && widget.surname != null) {
      widget.name!.addListener(() => setState(() {
            nameVal = widget.name!.value.text;
          }));
      widget.surname!.addListener(() => setState(() {
            surnameVal = widget.surname!.value.text;
          }));
    } else if (widget.nameString != null && widget.surnameString != null) {
      nameVal = widget.nameString!;
      surnameVal = widget.surnameString!;
    }
    super.initState();
  }

  @override
  void dispose() {
    if (widget.name != null && widget.surname != null) {
      widget.name!.dispose();
      widget.surname!.dispose();
    }
    super.dispose();
  }

  String nameVal = '';
  String surnameVal = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150.0,
      height: 150.0,
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        gradient: LinearGradient(
          colors: [
            CupertinoColors.opaqueSeparator,
            CupertinoColors.systemGrey,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Center(
        child: _iconBuilder(context),
      ),
    );
  }

  Widget _iconBuilder(BuildContext context) {
    final String value = '${nameVal.isNotEmpty ? nameVal[0] : ''}${surnameVal.isNotEmpty ? surnameVal[0] : ''}';
    if (value != '') {
      return Text(
        value,
        //textAlign: TextAlign.center,
        style: const TextStyle(
          color: CupertinoColors.white,
          fontSize: 60.0,
        ),
      );
    } else {
      return const Icon(
        CupertinoIcons.profile_circled,
        color: CupertinoColors.white,
        size: 150,
      );
    }
  }
}
