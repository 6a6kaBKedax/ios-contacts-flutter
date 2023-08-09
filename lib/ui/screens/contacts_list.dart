import 'package:contacts_app/ui/screens/models/contacts_cubit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:core/core.dart';

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
                  onTap: () {},
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
              //SliverAppBar(
              //  bottom: _PreferredSizeSearchField(searchController),
              //  actions: const [Icon(Icons.add)],
              //  title: Text('Contacts'),
              //),
              SliverList(
                delegate: searchController.value.text.isEmpty
                    ? SliverChildBuilderDelegate(
                        (BuildContext context, int index) => _CupertinoListItem(item: state.searchResult[index]),
                        childCount:
                            searchController.value.text.isEmpty ? state.contacts.length : state.searchResult.length,
                      )
                    : SliverChildBuilderDelegate(
                        (BuildContext context, int index) => _CupertinoListItem(item: state.searchResult[index]),
                        childCount:
                            searchController.value.text.isEmpty ? state.contacts.length : state.searchResult.length,
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
    return Padding(
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
    );
  }
}
