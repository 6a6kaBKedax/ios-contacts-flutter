import 'package:core/src/data_sources/interfaces/contacts.dart';
import 'package:core/src/data_sources/interfaces/local_db.dart';
import 'package:core/src/models/common/common.dart';
import 'package:flutter/cupertino.dart';

class ContactsLocalDataSourceImpl implements ContactsLocalDataSource {
  final LocalDbDataSource db;

  ContactsLocalDataSourceImpl(this.db);

  @override
  Future<bool> addContacts(List<ContactModel> contacts) async {
    try {
      await db.put(contacts);
      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  @override
  Future<bool> deleteContacts(List<int> ids) async {
    try {
      await db.remove(ids);
      return true;
    } catch (e) {
      debugPrint(e.toString());
      return false;
    }
  }

  @override
  Future<List<ContactModel?>> getContacts() async {
    return await db.get<ContactModel>();
  }

  @override
  Future<ContactModel?> updateContact(ContactModel contactModel) async {
    await db.remove([contactModel.idKey]);
    await db.put([contactModel]);
    return (await db.get<ContactModel>(ids: [contactModel.idKey])).first;
  }
}
