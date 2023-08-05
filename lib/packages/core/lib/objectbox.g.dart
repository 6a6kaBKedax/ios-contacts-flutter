// GENERATED CODE - DO NOT MODIFY BY HAND
// This code was generated by ObjectBox. To update it run the generator again:
// With a Flutter package, run `flutter pub run build_runner build`.
// With a Dart package, run `dart run build_runner build`.
// See also https://docs.objectbox.io/getting-started#generate-objectbox-code

// ignore_for_file: camel_case_types, depend_on_referenced_packages
// coverage:ignore-file

import 'dart:typed_data';

import 'package:flat_buffers/flat_buffers.dart' as fb;
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'package:objectbox/objectbox.dart';
import 'package:objectbox_flutter_libs/objectbox_flutter_libs.dart';

import 'src/models/common/contact.dart';

export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file

final _entities = <ModelEntity>[
  ModelEntity(
      id: const IdUid(1, 8221469878817580930),
      name: 'ContactModel',
      lastPropertyId: const IdUid(10, 4595375797297476570),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 7427449571724519060),
            name: 'idKey',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 3759424792526306703),
            name: 'contactID',
            type: 9,
            flags: 2080,
            indexId: const IdUid(1, 8460888384125029248)),
        ModelProperty(
            id: const IdUid(3, 871513587292766656),
            name: 'firstName',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 7317964790738410144),
            name: 'lastName',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 8605916730590511158),
            name: 'phoneNumber',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(6, 2894395833372308116),
            name: 'streetAddress1',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(7, 2315823068014790534),
            name: 'streetAddress2',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(8, 5252560268850954368),
            name: 'city',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(9, 4792493349233974082),
            name: 'state',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(10, 4595375797297476570),
            name: 'zipCode',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[])
];

/// Shortcut for [Store.new] that passes [getObjectBoxModel] and for Flutter
/// apps by default a [directory] using `defaultStoreDirectory()` from the
/// ObjectBox Flutter library.
///
/// Note: for desktop apps it is recommended to specify a unique [directory].
///
/// See [Store.new] for an explanation of all parameters.
Future<Store> openStore(
        {String? directory,
        int? maxDBSizeInKB,
        int? fileMode,
        int? maxReaders,
        bool queriesCaseSensitiveDefault = true,
        String? macosApplicationGroup}) async =>
    Store(getObjectBoxModel(),
        directory: directory ?? (await defaultStoreDirectory()).path,
        maxDBSizeInKB: maxDBSizeInKB,
        fileMode: fileMode,
        maxReaders: maxReaders,
        queriesCaseSensitiveDefault: queriesCaseSensitiveDefault,
        macosApplicationGroup: macosApplicationGroup);

/// Returns the ObjectBox model definition for this project for use with
/// [Store.new].
ModelDefinition getObjectBoxModel() {
  final model = ModelInfo(
      entities: _entities,
      lastEntityId: const IdUid(1, 8221469878817580930),
      lastIndexId: const IdUid(1, 8460888384125029248),
      lastRelationId: const IdUid(0, 0),
      lastSequenceId: const IdUid(0, 0),
      retiredEntityUids: const [],
      retiredIndexUids: const [],
      retiredPropertyUids: const [],
      retiredRelationUids: const [],
      modelVersion: 5,
      modelVersionParserMinimum: 5,
      version: 1);

  final bindings = <Type, EntityDefinition>{
    ContactModel: EntityDefinition<ContactModel>(
        model: _entities[0],
        toOneRelations: (ContactModel object) => [],
        toManyRelations: (ContactModel object) => {},
        getId: (ContactModel object) => object.idKey,
        setId: (ContactModel object, int id) {
          object.idKey = id;
        },
        objectToFB: (ContactModel object, fb.Builder fbb) {
          final contactIDOffset = fbb.writeString(object.contactID);
          final firstNameOffset = fbb.writeString(object.firstName);
          final lastNameOffset = fbb.writeString(object.lastName);
          final phoneNumberOffset = fbb.writeString(object.phoneNumber);
          final streetAddress1Offset = fbb.writeString(object.streetAddress1);
          final streetAddress2Offset = fbb.writeString(object.streetAddress2);
          final cityOffset = fbb.writeString(object.city);
          final stateOffset = fbb.writeString(object.state);
          final zipCodeOffset = fbb.writeString(object.zipCode);
          fbb.startTable(11);
          fbb.addInt64(0, object.idKey);
          fbb.addOffset(1, contactIDOffset);
          fbb.addOffset(2, firstNameOffset);
          fbb.addOffset(3, lastNameOffset);
          fbb.addOffset(4, phoneNumberOffset);
          fbb.addOffset(5, streetAddress1Offset);
          fbb.addOffset(6, streetAddress2Offset);
          fbb.addOffset(7, cityOffset);
          fbb.addOffset(8, stateOffset);
          fbb.addOffset(9, zipCodeOffset);
          fbb.finish(fbb.endTable());
          return object.idKey;
        },
        objectFromFB: (Store store, ByteData fbData) {
          final buffer = fb.BufferContext(fbData);
          final rootOffset = buffer.derefObject(0);
          final idKeyParam =
              const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0);
          final contactIDParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 6, '');
          final firstNameParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 8, '');
          final lastNameParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 10, '');
          final phoneNumberParam =
              const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 12, '');
          final streetAddress1Param =
              const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 14, '');
          final streetAddress2Param =
              const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 16, '');
          final cityParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 18, '');
          final stateParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 20, '');
          final zipCodeParam = const fb.StringReader(asciiOptimization: true)
              .vTableGet(buffer, rootOffset, 22, '');
          final object = ContactModel(
              idKey: idKeyParam,
              contactID: contactIDParam,
              firstName: firstNameParam,
              lastName: lastNameParam,
              phoneNumber: phoneNumberParam,
              streetAddress1: streetAddress1Param,
              streetAddress2: streetAddress2Param,
              city: cityParam,
              state: stateParam,
              zipCode: zipCodeParam);

          return object;
        })
  };

  return ModelDefinition(model, bindings);
}

/// [ContactModel] entity fields to define ObjectBox queries.
class ContactModel_ {
  /// see [ContactModel.idKey]
  static final idKey =
      QueryIntegerProperty<ContactModel>(_entities[0].properties[0]);

  /// see [ContactModel.contactID]
  static final contactID =
      QueryStringProperty<ContactModel>(_entities[0].properties[1]);

  /// see [ContactModel.firstName]
  static final firstName =
      QueryStringProperty<ContactModel>(_entities[0].properties[2]);

  /// see [ContactModel.lastName]
  static final lastName =
      QueryStringProperty<ContactModel>(_entities[0].properties[3]);

  /// see [ContactModel.phoneNumber]
  static final phoneNumber =
      QueryStringProperty<ContactModel>(_entities[0].properties[4]);

  /// see [ContactModel.streetAddress1]
  static final streetAddress1 =
      QueryStringProperty<ContactModel>(_entities[0].properties[5]);

  /// see [ContactModel.streetAddress2]
  static final streetAddress2 =
      QueryStringProperty<ContactModel>(_entities[0].properties[6]);

  /// see [ContactModel.city]
  static final city =
      QueryStringProperty<ContactModel>(_entities[0].properties[7]);

  /// see [ContactModel.state]
  static final state =
      QueryStringProperty<ContactModel>(_entities[0].properties[8]);

  /// see [ContactModel.zipCode]
  static final zipCode =
      QueryStringProperty<ContactModel>(_entities[0].properties[9]);
}
