import 'package:contacts_app/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:core/core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    App(
      dataSource: ObjectBoxLocalDbSourceImp(await ObjectBoxLocalDbSourceImp.createNewStore()),
    ),
  );
}
