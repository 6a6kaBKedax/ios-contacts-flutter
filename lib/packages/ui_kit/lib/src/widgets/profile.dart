import 'package:flutter/cupertino.dart';

class ProfileWidget extends StatefulWidget {
  const ProfileWidget({
    super.key,
    required this.name,
    required this.surname,
  });

  final TextEditingController name;
  final TextEditingController surname;

  @override
  State<ProfileWidget> createState() => _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget> {
  @override
  void initState() {
    widget.name.addListener(() => setState(() {
          nameVal = widget.name.value.text;
        }));
    widget.surname.addListener(() => setState(() {
          surnameVal = widget.surname.value.text;
        }));
    super.initState();
  }

  String nameVal = '';
  String surnameVal = '';

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 150,
      height: 150,
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
