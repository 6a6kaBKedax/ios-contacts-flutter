part of 'contacts_cubit.dart';

enum ContactsStateEnum { init, loading }

@freezed
class ContactsState with _$ContactsState {
  const factory ContactsState.initial({
    @Default([]) List<ContactModel?> contacts,
    @Default([]) List<ContactModel?> searchResult,
    @Default(ContactsStateEnum.init) ContactsStateEnum enumState,
  }) = _Initial;
}
