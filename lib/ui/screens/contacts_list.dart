import 'package:contacts_app/ui/di/navigation.dart';
import 'package:contacts_app/ui/screens/models/contacts_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:core/core.dart';
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
                          (BuildContext context, int index) => _CupertinoListItem(item: state.contacts[index]),
                          childCount: state.contacts.length,
                        )
                      : SliverChildBuilderDelegate(
                          (BuildContext context, int index) => _CupertinoListItem(item: state.searchResult[index]),
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

class _CupertinoListItem extends StatelessWidget {
  const _CupertinoListItem({required this.item});

  final ContactModel? item;

  @override
  Widget build(BuildContext context) {
    if (item == null) return const SizedBox();
    return GestureDetector(
      onTap: () => context.go(Routes.detail, extra: item),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 12.0),
        child: Column(
          children: [
            Row(
              children: [
                Text(item!.firstName),
                const SizedBox(width: 4.0),
                Text(item!.lastName),
              ],
            ),
            const Divider(),
          ],
        ),
      ),
    );
  }
}
