import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:core/core.dart';

part 'contacts_state.dart';

part 'contacts_cubit.freezed.dart';

enum ContactsCubitActionEnum {
  create,
  read,
  update,
  delete,
}

class ContactsCubit extends Cubit<ContactsState> {
  ContactsCubit(this.repository) : super(const ContactsState.initial());

  final ContactsRepository repository;

  List<ContactModel> list = [];

  Future<void> init() async {
    try {
      emit(state.copyWith(enumState: ContactsStateEnum.loading));
      List<ContactModel?> list = await repository.getContacts();
      if(list.isEmpty) list = _DUMMYDATA;
      list.sort((a, b){
        if(a == null||b ==null)return 0;
        return a.firstName.compareTo(b.firstName);
      });
      
      emit(state.copyWith(enumState: ContactsStateEnum.init, contacts: list));
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> crud({
    required ContactsCubitActionEnum actionType,
    ContactModel? value,
    List<int>? ids,
  }) async {
    try {
      emit(state.copyWith(enumState: ContactsStateEnum.loading));
      late List<ContactModel?> list;
      switch (actionType) {
        case ContactsCubitActionEnum.create:
          await repository.addContacts([value!]);
          list = await repository.getContacts();
          list.sort((a, b){
            if(a == null||b ==null)return 0;
            return a.firstName.compareTo(b.firstName);
          });
          break;
        case ContactsCubitActionEnum.delete:
          await repository.deleteContacts(ids!);
          list = await repository.getContacts();
          break;
        case ContactsCubitActionEnum.read:
          list = await repository.getContacts();
          break;
        case ContactsCubitActionEnum.update:
          await repository.updateContact(value!);
          list = await repository.getContacts();
          break;
      }
      emit(
        state.copyWith(
          enumState: ContactsStateEnum.init,
          contacts: list,
        ),
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void search(String text) {
    final searchResult = state.contacts
        .where(
          (element) => element != null && (element.lastName.contains(text) || element.firstName.contains(text)),
        )
        .toList();
    emit(state.copyWith(searchResult: searchResult));
  }

  List<ContactModel> _DUMMYDATA = [
    ContactModel(
      firstName: 'Ivan',
      lastName: 'Velkov',
      company: 'capyBUGa',
      phoneNumber: '0500551700',
      streetAddress1: 'example',
      streetAddress2: 'address',
      city: 'Odessa',
      state: 'Odessa',
      zipCode: '65000',
    ),
    ContactModel(
      firstName: 'Alice',
      lastName: 'Velkova',
      company: 'capyBUGa',
      phoneNumber: '0500551700',
      streetAddress1: 'example',
      streetAddress2: 'address',
      city: 'Odessa',
      state: 'Odessa',
      zipCode: '65000',
    ),
    ContactModel(
      firstName: 'Artem',
      lastName: 'Muft',
      company: '',
      phoneNumber: '',
      streetAddress1: '',
      streetAddress2: 'address',
      city: 'Odessa',
      state: 'Odessa',
      zipCode: '65000',
    ),
    ContactModel(
      firstName: 'Arcen',
      lastName: 'Markaryan',
      company: 'base',
      phoneNumber: '0500551700',
      streetAddress1: 'example',
      streetAddress2: 'address',
      city: 'Tbilici',
      state: 'Georgia',
      zipCode: '14000',
    ),
    ContactModel(
      firstName: 'Ivan',
      lastName: 'Velkov',
      company: 'capyBUGa',
      phoneNumber: '0500551700',
      streetAddress1: 'example',
      streetAddress2: 'address',
      city: 'Odessa',
      state: 'Odessa',
      zipCode: '65000',
    ),
  ];
}
