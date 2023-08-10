import 'package:contacts_app/ui/di/navigation.dart';
import 'package:contacts_app/ui/screens/models/contacts_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ui_kit/ui_kit.dart';

import 'package:go_router/go_router.dart';

class ContactListScreen extends StatelessWidget {
  ContactListScreen({super.key});

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ContactsCubit, ContactsState>(
      builder: (context, state) {
        return Scaffold(
          body: CustomScrollView(
            slivers: <Widget>[
              CupertinoSliverNavigationBar(
                key: const Key('CupertinoSliverNavigationBar'),
                largeTitle: const Text('Contacts'),
                alwaysShowMiddle: false,
                middle: const Text('Contacts'),
                border: Border.all(color: Colors.white),
                trailing: GestureDetector(
                  onTap: () => context.go(Routes.edit),
                  child: const Icon(Icons.add),
                ),
              ),
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 12.0,
                    right: 12.0,
                    bottom: 8.0,
                  ),
                  child: CupertinoSearchTextField(
                    controller: searchController,
                    onChanged: (val) => context.read<ContactsCubit>().search(val),
                  ),
                ),
              ),
              if (state.enumState == ContactsStateEnum.init)
                SliverList(
                  delegate: searchController.value.text.isEmpty
                      ? SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                            final item = state.contacts[index];
                            if (item == null) return const SizedBox();
                            return CupertinoListItem(
                              onTap: () => context.go(Routes.detail, extra: item),
                              name: item.firstName,
                              lastName: item.lastName,
                            );
                          },
                          childCount: state.contacts.length,
                        )
                      : SliverChildBuilderDelegate(
                          (BuildContext context, int index)  {
                            final item = state.searchResult[index];
                            if (item == null) return const SizedBox();
                            return CupertinoListItem(
                              onTap: () => context.go(Routes.detail, extra: item),
                              name: item.firstName,
                              lastName: item.lastName,
                            );
                          },
                          childCount: state.searchResult.length,
                        ),
                ),
            ],
          ),
        );
      },
    );
  }
}

