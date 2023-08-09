
import 'package:core/core.dart';


class ContactsRepository {
  final ContactsLocalDataSource contactsLocalDataSource;

  ContactsRepository({required this.contactsLocalDataSource});

  Future<List<ContactModel?>> getContacts() => contactsLocalDataSource.getContacts();

  Future<bool> deleteContacts(List<int> ids) => contactsLocalDataSource.deleteContacts(ids);

  Future<ContactModel?> updateContact(ContactModel contact) => contactsLocalDataSource.updateContact(contact);

  Future<bool> addContacts(List<ContactModel> contacts) => contactsLocalDataSource.addContacts(contacts);
}
