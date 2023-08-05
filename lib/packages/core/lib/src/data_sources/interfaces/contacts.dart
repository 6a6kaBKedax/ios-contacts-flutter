import 'package:core/core.dart';

abstract interface class ContactsLocalDataSource {
  Future<bool> addContacts(List<ContactModel> contacts);

  Future<List<ContactModel?>> getContacts();

  Future<ContactModel?> updateContact(ContactModel contactModel);

  Future<bool> deleteContacts(List<int> ids);
}
