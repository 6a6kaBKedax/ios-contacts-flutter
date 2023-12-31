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
      id: const IdUid(1, 5136566873840295577),
      name: 'ContactModel',
      lastPropertyId: const IdUid(10, 6361827254636373079),
      flags: 0,
      properties: <ModelProperty>[
        ModelProperty(
            id: const IdUid(1, 1163251642577535205),
            name: 'idKey',
            type: 6,
            flags: 1),
        ModelProperty(
            id: const IdUid(2, 7351150448232480188),
            name: 'firstName',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(3, 59360502092026381),
            name: 'lastName',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(4, 5963087489550259611),
            name: 'company',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(5, 4391623470357394464),
            name: 'phoneNumber',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(6, 3287708238875265221),
            name: 'streetAddress1',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(7, 3170550425526613710),
            name: 'streetAddress2',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(8, 3410163295789585048),
            name: 'city',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(9, 7792780136736120130),
            name: 'state',
            type: 9,
            flags: 0),
        ModelProperty(
            id: const IdUid(10, 6361827254636373079),
            name: 'zipCode',
            type: 9,
            flags: 0)
      ],
      relations: <ModelRelation>[],
      backlinks: <ModelBacklink>[])
];

/// Open an ObjectBox store with the model declared in this file.
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

/// ObjectBox model definition, pass it to [Store] - Store(getObjectBoxModel())
ModelDefinition getObjectBoxModel() {
  final model = ModelInfo(
      entities: _entities,
      lastEntityId: const IdUid(1, 5136566873840295577),
      lastIndexId: const IdUid(0, 0),
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
          final firstNameOffset = fbb.writeString(object.firstName);
          final lastNameOffset = fbb.writeString(object.lastName);
          final companyOffset = fbb.writeString(object.company);
          final phoneNumberOffset = fbb.writeString(object.phoneNumber);
          final streetAddress1Offset = fbb.writeString(object.streetAddress1);
          final streetAddress2Offset = fbb.writeString(object.streetAddress2);
          final cityOffset = fbb.writeString(object.city);
          final stateOffset = fbb.writeString(object.state);
          final zipCodeOffset = fbb.writeString(object.zipCode);
          fbb.startTable(11);
          fbb.addInt64(0, object.idKey);
          fbb.addOffset(1, firstNameOffset);
          fbb.addOffset(2, lastNameOffset);
          fbb.addOffset(3, companyOffset);
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

          final object = ContactModel(
              idKey: const fb.Int64Reader().vTableGet(buffer, rootOffset, 4, 0),
              firstName: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 6, ''),
              lastName: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 8, ''),
              company: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 10, ''),
              phoneNumber: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 12, ''),
              streetAddress1: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 14, ''),
              streetAddress2: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 16, ''),
              city: const fb.StringReader(asciiOptimization: true)
                  .vTableGet(buffer, rootOffset, 18, ''),
              state:
                  const fb.StringReader(asciiOptimization: true).vTableGet(buffer, rootOffset, 20, ''),
              zipCode: const fb.StringReader(asciiOptimization: true).vTableGet(buffer, rootOffset, 22, ''));

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

  /// see [ContactModel.firstName]
  static final firstName =
      QueryStringProperty<ContactModel>(_entities[0].properties[1]);

  /// see [ContactModel.lastName]
  static final lastName =
      QueryStringProperty<ContactModel>(_entities[0].properties[2]);

  /// see [ContactModel.company]
  static final company =
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
