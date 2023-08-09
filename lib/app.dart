import 'package:contacts_app/ui/di/navigation.dart';
import 'package:core/core.dart';
import 'package:contacts_app/ui/screens/models/contacts_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class App extends StatelessWidget {
  const App({super.key, required this.dataSource});

  final LocalDbDataSource dataSource;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ContactsCubit>(
      create: (context) => ContactsCubit(
        ContactsRepository(
          contactsLocalDataSource: ContactsLocalDataSourceImpl(dataSource),
        ),
      )..init(),
      child: CupertinoApp.router(
        routerConfig: router,
        debugShowCheckedModeBanner: false,
        theme: const CupertinoThemeData(brightness: Brightness.light),
      ),
    );
  }
}
