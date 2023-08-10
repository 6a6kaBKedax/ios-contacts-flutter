import 'package:equatable/equatable.dart';
import 'package:objectbox/objectbox.dart';

@Entity()
class ContactModel extends Equatable {
  @Id()
  int idKey;
  final String firstName;
  final String lastName;
  final String company;
  final String phoneNumber;
  final String streetAddress1;
  final String streetAddress2;
  final String city;
  final String state;
  final String zipCode;

  ContactModel({
    this.idKey = 0,
    required this.firstName,
    required this.lastName,
    required this.company,
    required this.phoneNumber,
    required this.streetAddress1,
    required this.streetAddress2,
    required this.city,
    required this.state,
    required this.zipCode,
  });

  @override
  List<Object?> get props => [
        idKey,
        firstName,
        lastName,
        company,
        phoneNumber,
        streetAddress1,
        streetAddress2,
        city,
        state,
        zipCode,
      ];
}
