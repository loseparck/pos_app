// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $CategoriesDriftTable extends CategoriesDrift
    with TableInfo<$CategoriesDriftTable, CategoriesDriftData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CategoriesDriftTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String> image = GeneratedColumn<String>(
      'image', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _colorMeta = const VerificationMeta('color');
  @override
  late final GeneratedColumn<int> color = GeneratedColumn<int>(
      'color', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _isActiveMeta =
      const VerificationMeta('isActive');
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
      'is_active', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_active" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _parentIdMeta =
      const VerificationMeta('parentId');
  @override
  late final GeneratedColumn<String> parentId = GeneratedColumn<String>(
      'parent_id', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES categories_drift (id)'));
  static const VerificationMeta _createdByIdMeta =
      const VerificationMeta('createdById');
  @override
  late final GeneratedColumn<String> createdById = GeneratedColumn<String>(
      'created_by_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        image,
        color,
        isActive,
        parentId,
        createdById,
        createdAt,
        updatedAt,
        deletedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'categories_drift';
  @override
  VerificationContext validateIntegrity(
      Insertable<CategoriesDriftData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    }
    if (data.containsKey('color')) {
      context.handle(
          _colorMeta, color.isAcceptableOrUnknown(data['color']!, _colorMeta));
    }
    if (data.containsKey('is_active')) {
      context.handle(_isActiveMeta,
          isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta));
    }
    if (data.containsKey('parent_id')) {
      context.handle(_parentIdMeta,
          parentId.isAcceptableOrUnknown(data['parent_id']!, _parentIdMeta));
    }
    if (data.containsKey('created_by_id')) {
      context.handle(
          _createdByIdMeta,
          createdById.isAcceptableOrUnknown(
              data['created_by_id']!, _createdByIdMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CategoriesDriftData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CategoriesDriftData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      image: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image']),
      color: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}color']),
      isActive: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_active'])!,
      parentId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}parent_id']),
      createdById: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_by_id']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
    );
  }

  @override
  $CategoriesDriftTable createAlias(String alias) {
    return $CategoriesDriftTable(attachedDatabase, alias);
  }
}

class CategoriesDriftData extends DataClass
    implements Insertable<CategoriesDriftData> {
  final String id;
  final String name;
  final String? image;
  final int? color;
  final bool isActive;
  final String? parentId;
  final String? createdById;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  const CategoriesDriftData(
      {required this.id,
      required this.name,
      this.image,
      this.color,
      required this.isActive,
      this.parentId,
      this.createdById,
      required this.createdAt,
      required this.updatedAt,
      this.deletedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || image != null) {
      map['image'] = Variable<String>(image);
    }
    if (!nullToAbsent || color != null) {
      map['color'] = Variable<int>(color);
    }
    map['is_active'] = Variable<bool>(isActive);
    if (!nullToAbsent || parentId != null) {
      map['parent_id'] = Variable<String>(parentId);
    }
    if (!nullToAbsent || createdById != null) {
      map['created_by_id'] = Variable<String>(createdById);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  CategoriesDriftCompanion toCompanion(bool nullToAbsent) {
    return CategoriesDriftCompanion(
      id: Value(id),
      name: Value(name),
      image:
          image == null && nullToAbsent ? const Value.absent() : Value(image),
      color:
          color == null && nullToAbsent ? const Value.absent() : Value(color),
      isActive: Value(isActive),
      parentId: parentId == null && nullToAbsent
          ? const Value.absent()
          : Value(parentId),
      createdById: createdById == null && nullToAbsent
          ? const Value.absent()
          : Value(createdById),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory CategoriesDriftData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CategoriesDriftData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      image: serializer.fromJson<String?>(json['image']),
      color: serializer.fromJson<int?>(json['color']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      parentId: serializer.fromJson<String?>(json['parentId']),
      createdById: serializer.fromJson<String?>(json['createdById']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'image': serializer.toJson<String?>(image),
      'color': serializer.toJson<int?>(color),
      'isActive': serializer.toJson<bool>(isActive),
      'parentId': serializer.toJson<String?>(parentId),
      'createdById': serializer.toJson<String?>(createdById),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  CategoriesDriftData copyWith(
          {String? id,
          String? name,
          Value<String?> image = const Value.absent(),
          Value<int?> color = const Value.absent(),
          bool? isActive,
          Value<String?> parentId = const Value.absent(),
          Value<String?> createdById = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt,
          Value<DateTime?> deletedAt = const Value.absent()}) =>
      CategoriesDriftData(
        id: id ?? this.id,
        name: name ?? this.name,
        image: image.present ? image.value : this.image,
        color: color.present ? color.value : this.color,
        isActive: isActive ?? this.isActive,
        parentId: parentId.present ? parentId.value : this.parentId,
        createdById: createdById.present ? createdById.value : this.createdById,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
      );
  CategoriesDriftData copyWithCompanion(CategoriesDriftCompanion data) {
    return CategoriesDriftData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      image: data.image.present ? data.image.value : this.image,
      color: data.color.present ? data.color.value : this.color,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      parentId: data.parentId.present ? data.parentId.value : this.parentId,
      createdById:
          data.createdById.present ? data.createdById.value : this.createdById,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CategoriesDriftData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('image: $image, ')
          ..write('color: $color, ')
          ..write('isActive: $isActive, ')
          ..write('parentId: $parentId, ')
          ..write('createdById: $createdById, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, image, color, isActive, parentId,
      createdById, createdAt, updatedAt, deletedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CategoriesDriftData &&
          other.id == this.id &&
          other.name == this.name &&
          other.image == this.image &&
          other.color == this.color &&
          other.isActive == this.isActive &&
          other.parentId == this.parentId &&
          other.createdById == this.createdById &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt);
}

class CategoriesDriftCompanion extends UpdateCompanion<CategoriesDriftData> {
  final Value<String> id;
  final Value<String> name;
  final Value<String?> image;
  final Value<int?> color;
  final Value<bool> isActive;
  final Value<String?> parentId;
  final Value<String?> createdById;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<int> rowid;
  const CategoriesDriftCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.image = const Value.absent(),
    this.color = const Value.absent(),
    this.isActive = const Value.absent(),
    this.parentId = const Value.absent(),
    this.createdById = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CategoriesDriftCompanion.insert({
    required String id,
    required String name,
    this.image = const Value.absent(),
    this.color = const Value.absent(),
    this.isActive = const Value.absent(),
    this.parentId = const Value.absent(),
    this.createdById = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<CategoriesDriftData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? image,
    Expression<int>? color,
    Expression<bool>? isActive,
    Expression<String>? parentId,
    Expression<String>? createdById,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (image != null) 'image': image,
      if (color != null) 'color': color,
      if (isActive != null) 'is_active': isActive,
      if (parentId != null) 'parent_id': parentId,
      if (createdById != null) 'created_by_id': createdById,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CategoriesDriftCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String?>? image,
      Value<int?>? color,
      Value<bool>? isActive,
      Value<String?>? parentId,
      Value<String?>? createdById,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<DateTime?>? deletedAt,
      Value<int>? rowid}) {
    return CategoriesDriftCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      image: image ?? this.image,
      color: color ?? this.color,
      isActive: isActive ?? this.isActive,
      parentId: parentId ?? this.parentId,
      createdById: createdById ?? this.createdById,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    if (color.present) {
      map['color'] = Variable<int>(color.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (parentId.present) {
      map['parent_id'] = Variable<String>(parentId.value);
    }
    if (createdById.present) {
      map['created_by_id'] = Variable<String>(createdById.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CategoriesDriftCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('image: $image, ')
          ..write('color: $color, ')
          ..write('isActive: $isActive, ')
          ..write('parentId: $parentId, ')
          ..write('createdById: $createdById, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $SuppliersDriftTable extends SuppliersDrift
    with TableInfo<$SuppliersDriftTable, SuppliersDriftData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $SuppliersDriftTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _commercialNameMeta =
      const VerificationMeta('commercialName');
  @override
  late final GeneratedColumn<String> commercialName = GeneratedColumn<String>(
      'commercial_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  @override
  late final GeneratedColumnWithTypeConverter<SupplierType, String> type =
      GeneratedColumn<String>('type', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<SupplierType>($SuppliersDriftTable.$convertertype);
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
      'code', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _siretMeta = const VerificationMeta('siret');
  @override
  late final GeneratedColumn<String> siret = GeneratedColumn<String>(
      'siret', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _sirenMeta = const VerificationMeta('siren');
  @override
  late final GeneratedColumn<String> siren = GeneratedColumn<String>(
      'siren', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _vatNumberMeta =
      const VerificationMeta('vatNumber');
  @override
  late final GeneratedColumn<String> vatNumber = GeneratedColumn<String>(
      'vat_number', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _contactFirstNameMeta =
      const VerificationMeta('contactFirstName');
  @override
  late final GeneratedColumn<String> contactFirstName = GeneratedColumn<String>(
      'contact_first_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _contactLastNameMeta =
      const VerificationMeta('contactLastName');
  @override
  late final GeneratedColumn<String> contactLastName = GeneratedColumn<String>(
      'contact_last_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _contactJobMeta =
      const VerificationMeta('contactJob');
  @override
  late final GeneratedColumn<String> contactJob = GeneratedColumn<String>(
      'contact_job', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
      'phone', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _secondaryPhoneMeta =
      const VerificationMeta('secondaryPhone');
  @override
  late final GeneratedColumn<String> secondaryPhone = GeneratedColumn<String>(
      'secondary_phone', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _addressMeta =
      const VerificationMeta('address');
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
      'address', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _addressComplementMeta =
      const VerificationMeta('addressComplement');
  @override
  late final GeneratedColumn<String> addressComplement =
      GeneratedColumn<String>('address_complement', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _postalCodeMeta =
      const VerificationMeta('postalCode');
  @override
  late final GeneratedColumn<String> postalCode = GeneratedColumn<String>(
      'postal_code', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _cityMeta = const VerificationMeta('city');
  @override
  late final GeneratedColumn<String> city = GeneratedColumn<String>(
      'city', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _countryMeta =
      const VerificationMeta('country');
  @override
  late final GeneratedColumn<String> country = GeneratedColumn<String>(
      'country', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  late final GeneratedColumnWithTypeConverter<PaymentTerm, String> paymentTerm =
      GeneratedColumn<String>('payment_term', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<PaymentTerm>(
              $SuppliersDriftTable.$converterpaymentTerm);
  static const VerificationMeta _usualDiscountMeta =
      const VerificationMeta('usualDiscount');
  @override
  late final GeneratedColumn<double> usualDiscount = GeneratedColumn<double>(
      'usual_discount', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _minimumOrderAmountCentsMeta =
      const VerificationMeta('minimumOrderAmountCents');
  @override
  late final GeneratedColumn<int> minimumOrderAmountCents =
      GeneratedColumn<int>('minimum_order_amount_cents', aliasedName, true,
          type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _deliveryDelayDaysMeta =
      const VerificationMeta('deliveryDelayDays');
  @override
  late final GeneratedColumn<int> deliveryDelayDays = GeneratedColumn<int>(
      'delivery_delay_days', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _isMainSupplierMeta =
      const VerificationMeta('isMainSupplier');
  @override
  late final GeneratedColumn<bool> isMainSupplier = GeneratedColumn<bool>(
      'is_main_supplier', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_main_supplier" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isActiveMeta =
      const VerificationMeta('isActive');
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
      'is_active', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_active" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        commercialName,
        type,
        code,
        siret,
        siren,
        vatNumber,
        contactFirstName,
        contactLastName,
        contactJob,
        email,
        phone,
        secondaryPhone,
        address,
        addressComplement,
        postalCode,
        city,
        country,
        paymentTerm,
        usualDiscount,
        minimumOrderAmountCents,
        deliveryDelayDays,
        isMainSupplier,
        notes,
        isActive,
        createdAt,
        updatedAt,
        deletedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'suppliers_drift';
  @override
  VerificationContext validateIntegrity(Insertable<SuppliersDriftData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('commercial_name')) {
      context.handle(
          _commercialNameMeta,
          commercialName.isAcceptableOrUnknown(
              data['commercial_name']!, _commercialNameMeta));
    }
    if (data.containsKey('code')) {
      context.handle(
          _codeMeta, code.isAcceptableOrUnknown(data['code']!, _codeMeta));
    }
    if (data.containsKey('siret')) {
      context.handle(
          _siretMeta, siret.isAcceptableOrUnknown(data['siret']!, _siretMeta));
    }
    if (data.containsKey('siren')) {
      context.handle(
          _sirenMeta, siren.isAcceptableOrUnknown(data['siren']!, _sirenMeta));
    }
    if (data.containsKey('vat_number')) {
      context.handle(_vatNumberMeta,
          vatNumber.isAcceptableOrUnknown(data['vat_number']!, _vatNumberMeta));
    }
    if (data.containsKey('contact_first_name')) {
      context.handle(
          _contactFirstNameMeta,
          contactFirstName.isAcceptableOrUnknown(
              data['contact_first_name']!, _contactFirstNameMeta));
    }
    if (data.containsKey('contact_last_name')) {
      context.handle(
          _contactLastNameMeta,
          contactLastName.isAcceptableOrUnknown(
              data['contact_last_name']!, _contactLastNameMeta));
    }
    if (data.containsKey('contact_job')) {
      context.handle(
          _contactJobMeta,
          contactJob.isAcceptableOrUnknown(
              data['contact_job']!, _contactJobMeta));
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    }
    if (data.containsKey('phone')) {
      context.handle(
          _phoneMeta, phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta));
    }
    if (data.containsKey('secondary_phone')) {
      context.handle(
          _secondaryPhoneMeta,
          secondaryPhone.isAcceptableOrUnknown(
              data['secondary_phone']!, _secondaryPhoneMeta));
    }
    if (data.containsKey('address')) {
      context.handle(_addressMeta,
          address.isAcceptableOrUnknown(data['address']!, _addressMeta));
    }
    if (data.containsKey('address_complement')) {
      context.handle(
          _addressComplementMeta,
          addressComplement.isAcceptableOrUnknown(
              data['address_complement']!, _addressComplementMeta));
    }
    if (data.containsKey('postal_code')) {
      context.handle(
          _postalCodeMeta,
          postalCode.isAcceptableOrUnknown(
              data['postal_code']!, _postalCodeMeta));
    }
    if (data.containsKey('city')) {
      context.handle(
          _cityMeta, city.isAcceptableOrUnknown(data['city']!, _cityMeta));
    }
    if (data.containsKey('country')) {
      context.handle(_countryMeta,
          country.isAcceptableOrUnknown(data['country']!, _countryMeta));
    } else if (isInserting) {
      context.missing(_countryMeta);
    }
    if (data.containsKey('usual_discount')) {
      context.handle(
          _usualDiscountMeta,
          usualDiscount.isAcceptableOrUnknown(
              data['usual_discount']!, _usualDiscountMeta));
    }
    if (data.containsKey('minimum_order_amount_cents')) {
      context.handle(
          _minimumOrderAmountCentsMeta,
          minimumOrderAmountCents.isAcceptableOrUnknown(
              data['minimum_order_amount_cents']!,
              _minimumOrderAmountCentsMeta));
    }
    if (data.containsKey('delivery_delay_days')) {
      context.handle(
          _deliveryDelayDaysMeta,
          deliveryDelayDays.isAcceptableOrUnknown(
              data['delivery_delay_days']!, _deliveryDelayDaysMeta));
    }
    if (data.containsKey('is_main_supplier')) {
      context.handle(
          _isMainSupplierMeta,
          isMainSupplier.isAcceptableOrUnknown(
              data['is_main_supplier']!, _isMainSupplierMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    if (data.containsKey('is_active')) {
      context.handle(_isActiveMeta,
          isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  SuppliersDriftData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return SuppliersDriftData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      commercialName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}commercial_name']),
      type: $SuppliersDriftTable.$convertertype.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!),
      code: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}code']),
      siret: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}siret']),
      siren: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}siren']),
      vatNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}vat_number']),
      contactFirstName: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}contact_first_name']),
      contactLastName: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}contact_last_name']),
      contactJob: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}contact_job']),
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email']),
      phone: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}phone']),
      secondaryPhone: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}secondary_phone']),
      address: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}address']),
      addressComplement: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}address_complement']),
      postalCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}postal_code']),
      city: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}city']),
      country: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}country'])!,
      paymentTerm: $SuppliersDriftTable.$converterpaymentTerm.fromSql(
          attachedDatabase.typeMapping.read(
              DriftSqlType.string, data['${effectivePrefix}payment_term'])!),
      usualDiscount: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}usual_discount']),
      minimumOrderAmountCents: attachedDatabase.typeMapping.read(
          DriftSqlType.int,
          data['${effectivePrefix}minimum_order_amount_cents']),
      deliveryDelayDays: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}delivery_delay_days']),
      isMainSupplier: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_main_supplier'])!,
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
      isActive: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_active'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
    );
  }

  @override
  $SuppliersDriftTable createAlias(String alias) {
    return $SuppliersDriftTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<SupplierType, String, String> $convertertype =
      const EnumNameConverter<SupplierType>(SupplierType.values);
  static JsonTypeConverter2<PaymentTerm, String, String> $converterpaymentTerm =
      const EnumNameConverter<PaymentTerm>(PaymentTerm.values);
}

class SuppliersDriftData extends DataClass
    implements Insertable<SuppliersDriftData> {
  final String id;
  final String name;
  final String? commercialName;
  final SupplierType type;
  final String? code;
  final String? siret;
  final String? siren;
  final String? vatNumber;
  final String? contactFirstName;
  final String? contactLastName;
  final String? contactJob;
  final String? email;
  final String? phone;
  final String? secondaryPhone;
  final String? address;
  final String? addressComplement;
  final String? postalCode;
  final String? city;
  final String country;
  final PaymentTerm paymentTerm;

  /// Pourcentage.
  /// Exemple : 5.5% => 5.5
  final double? usualDiscount;

  /// Stocké en centimes.
  /// Exemple : 125.50€ => 12550
  final int? minimumOrderAmountCents;
  final int? deliveryDelayDays;
  final bool isMainSupplier;
  final String? notes;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  const SuppliersDriftData(
      {required this.id,
      required this.name,
      this.commercialName,
      required this.type,
      this.code,
      this.siret,
      this.siren,
      this.vatNumber,
      this.contactFirstName,
      this.contactLastName,
      this.contactJob,
      this.email,
      this.phone,
      this.secondaryPhone,
      this.address,
      this.addressComplement,
      this.postalCode,
      this.city,
      required this.country,
      required this.paymentTerm,
      this.usualDiscount,
      this.minimumOrderAmountCents,
      this.deliveryDelayDays,
      required this.isMainSupplier,
      this.notes,
      required this.isActive,
      required this.createdAt,
      required this.updatedAt,
      this.deletedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || commercialName != null) {
      map['commercial_name'] = Variable<String>(commercialName);
    }
    {
      map['type'] =
          Variable<String>($SuppliersDriftTable.$convertertype.toSql(type));
    }
    if (!nullToAbsent || code != null) {
      map['code'] = Variable<String>(code);
    }
    if (!nullToAbsent || siret != null) {
      map['siret'] = Variable<String>(siret);
    }
    if (!nullToAbsent || siren != null) {
      map['siren'] = Variable<String>(siren);
    }
    if (!nullToAbsent || vatNumber != null) {
      map['vat_number'] = Variable<String>(vatNumber);
    }
    if (!nullToAbsent || contactFirstName != null) {
      map['contact_first_name'] = Variable<String>(contactFirstName);
    }
    if (!nullToAbsent || contactLastName != null) {
      map['contact_last_name'] = Variable<String>(contactLastName);
    }
    if (!nullToAbsent || contactJob != null) {
      map['contact_job'] = Variable<String>(contactJob);
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<String>(phone);
    }
    if (!nullToAbsent || secondaryPhone != null) {
      map['secondary_phone'] = Variable<String>(secondaryPhone);
    }
    if (!nullToAbsent || address != null) {
      map['address'] = Variable<String>(address);
    }
    if (!nullToAbsent || addressComplement != null) {
      map['address_complement'] = Variable<String>(addressComplement);
    }
    if (!nullToAbsent || postalCode != null) {
      map['postal_code'] = Variable<String>(postalCode);
    }
    if (!nullToAbsent || city != null) {
      map['city'] = Variable<String>(city);
    }
    map['country'] = Variable<String>(country);
    {
      map['payment_term'] = Variable<String>(
          $SuppliersDriftTable.$converterpaymentTerm.toSql(paymentTerm));
    }
    if (!nullToAbsent || usualDiscount != null) {
      map['usual_discount'] = Variable<double>(usualDiscount);
    }
    if (!nullToAbsent || minimumOrderAmountCents != null) {
      map['minimum_order_amount_cents'] =
          Variable<int>(minimumOrderAmountCents);
    }
    if (!nullToAbsent || deliveryDelayDays != null) {
      map['delivery_delay_days'] = Variable<int>(deliveryDelayDays);
    }
    map['is_main_supplier'] = Variable<bool>(isMainSupplier);
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['is_active'] = Variable<bool>(isActive);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  SuppliersDriftCompanion toCompanion(bool nullToAbsent) {
    return SuppliersDriftCompanion(
      id: Value(id),
      name: Value(name),
      commercialName: commercialName == null && nullToAbsent
          ? const Value.absent()
          : Value(commercialName),
      type: Value(type),
      code: code == null && nullToAbsent ? const Value.absent() : Value(code),
      siret:
          siret == null && nullToAbsent ? const Value.absent() : Value(siret),
      siren:
          siren == null && nullToAbsent ? const Value.absent() : Value(siren),
      vatNumber: vatNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(vatNumber),
      contactFirstName: contactFirstName == null && nullToAbsent
          ? const Value.absent()
          : Value(contactFirstName),
      contactLastName: contactLastName == null && nullToAbsent
          ? const Value.absent()
          : Value(contactLastName),
      contactJob: contactJob == null && nullToAbsent
          ? const Value.absent()
          : Value(contactJob),
      email:
          email == null && nullToAbsent ? const Value.absent() : Value(email),
      phone:
          phone == null && nullToAbsent ? const Value.absent() : Value(phone),
      secondaryPhone: secondaryPhone == null && nullToAbsent
          ? const Value.absent()
          : Value(secondaryPhone),
      address: address == null && nullToAbsent
          ? const Value.absent()
          : Value(address),
      addressComplement: addressComplement == null && nullToAbsent
          ? const Value.absent()
          : Value(addressComplement),
      postalCode: postalCode == null && nullToAbsent
          ? const Value.absent()
          : Value(postalCode),
      city: city == null && nullToAbsent ? const Value.absent() : Value(city),
      country: Value(country),
      paymentTerm: Value(paymentTerm),
      usualDiscount: usualDiscount == null && nullToAbsent
          ? const Value.absent()
          : Value(usualDiscount),
      minimumOrderAmountCents: minimumOrderAmountCents == null && nullToAbsent
          ? const Value.absent()
          : Value(minimumOrderAmountCents),
      deliveryDelayDays: deliveryDelayDays == null && nullToAbsent
          ? const Value.absent()
          : Value(deliveryDelayDays),
      isMainSupplier: Value(isMainSupplier),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      isActive: Value(isActive),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory SuppliersDriftData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return SuppliersDriftData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      commercialName: serializer.fromJson<String?>(json['commercialName']),
      type: $SuppliersDriftTable.$convertertype
          .fromJson(serializer.fromJson<String>(json['type'])),
      code: serializer.fromJson<String?>(json['code']),
      siret: serializer.fromJson<String?>(json['siret']),
      siren: serializer.fromJson<String?>(json['siren']),
      vatNumber: serializer.fromJson<String?>(json['vatNumber']),
      contactFirstName: serializer.fromJson<String?>(json['contactFirstName']),
      contactLastName: serializer.fromJson<String?>(json['contactLastName']),
      contactJob: serializer.fromJson<String?>(json['contactJob']),
      email: serializer.fromJson<String?>(json['email']),
      phone: serializer.fromJson<String?>(json['phone']),
      secondaryPhone: serializer.fromJson<String?>(json['secondaryPhone']),
      address: serializer.fromJson<String?>(json['address']),
      addressComplement:
          serializer.fromJson<String?>(json['addressComplement']),
      postalCode: serializer.fromJson<String?>(json['postalCode']),
      city: serializer.fromJson<String?>(json['city']),
      country: serializer.fromJson<String>(json['country']),
      paymentTerm: $SuppliersDriftTable.$converterpaymentTerm
          .fromJson(serializer.fromJson<String>(json['paymentTerm'])),
      usualDiscount: serializer.fromJson<double?>(json['usualDiscount']),
      minimumOrderAmountCents:
          serializer.fromJson<int?>(json['minimumOrderAmountCents']),
      deliveryDelayDays: serializer.fromJson<int?>(json['deliveryDelayDays']),
      isMainSupplier: serializer.fromJson<bool>(json['isMainSupplier']),
      notes: serializer.fromJson<String?>(json['notes']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'commercialName': serializer.toJson<String?>(commercialName),
      'type': serializer
          .toJson<String>($SuppliersDriftTable.$convertertype.toJson(type)),
      'code': serializer.toJson<String?>(code),
      'siret': serializer.toJson<String?>(siret),
      'siren': serializer.toJson<String?>(siren),
      'vatNumber': serializer.toJson<String?>(vatNumber),
      'contactFirstName': serializer.toJson<String?>(contactFirstName),
      'contactLastName': serializer.toJson<String?>(contactLastName),
      'contactJob': serializer.toJson<String?>(contactJob),
      'email': serializer.toJson<String?>(email),
      'phone': serializer.toJson<String?>(phone),
      'secondaryPhone': serializer.toJson<String?>(secondaryPhone),
      'address': serializer.toJson<String?>(address),
      'addressComplement': serializer.toJson<String?>(addressComplement),
      'postalCode': serializer.toJson<String?>(postalCode),
      'city': serializer.toJson<String?>(city),
      'country': serializer.toJson<String>(country),
      'paymentTerm': serializer.toJson<String>(
          $SuppliersDriftTable.$converterpaymentTerm.toJson(paymentTerm)),
      'usualDiscount': serializer.toJson<double?>(usualDiscount),
      'minimumOrderAmountCents':
          serializer.toJson<int?>(minimumOrderAmountCents),
      'deliveryDelayDays': serializer.toJson<int?>(deliveryDelayDays),
      'isMainSupplier': serializer.toJson<bool>(isMainSupplier),
      'notes': serializer.toJson<String?>(notes),
      'isActive': serializer.toJson<bool>(isActive),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  SuppliersDriftData copyWith(
          {String? id,
          String? name,
          Value<String?> commercialName = const Value.absent(),
          SupplierType? type,
          Value<String?> code = const Value.absent(),
          Value<String?> siret = const Value.absent(),
          Value<String?> siren = const Value.absent(),
          Value<String?> vatNumber = const Value.absent(),
          Value<String?> contactFirstName = const Value.absent(),
          Value<String?> contactLastName = const Value.absent(),
          Value<String?> contactJob = const Value.absent(),
          Value<String?> email = const Value.absent(),
          Value<String?> phone = const Value.absent(),
          Value<String?> secondaryPhone = const Value.absent(),
          Value<String?> address = const Value.absent(),
          Value<String?> addressComplement = const Value.absent(),
          Value<String?> postalCode = const Value.absent(),
          Value<String?> city = const Value.absent(),
          String? country,
          PaymentTerm? paymentTerm,
          Value<double?> usualDiscount = const Value.absent(),
          Value<int?> minimumOrderAmountCents = const Value.absent(),
          Value<int?> deliveryDelayDays = const Value.absent(),
          bool? isMainSupplier,
          Value<String?> notes = const Value.absent(),
          bool? isActive,
          DateTime? createdAt,
          DateTime? updatedAt,
          Value<DateTime?> deletedAt = const Value.absent()}) =>
      SuppliersDriftData(
        id: id ?? this.id,
        name: name ?? this.name,
        commercialName:
            commercialName.present ? commercialName.value : this.commercialName,
        type: type ?? this.type,
        code: code.present ? code.value : this.code,
        siret: siret.present ? siret.value : this.siret,
        siren: siren.present ? siren.value : this.siren,
        vatNumber: vatNumber.present ? vatNumber.value : this.vatNumber,
        contactFirstName: contactFirstName.present
            ? contactFirstName.value
            : this.contactFirstName,
        contactLastName: contactLastName.present
            ? contactLastName.value
            : this.contactLastName,
        contactJob: contactJob.present ? contactJob.value : this.contactJob,
        email: email.present ? email.value : this.email,
        phone: phone.present ? phone.value : this.phone,
        secondaryPhone:
            secondaryPhone.present ? secondaryPhone.value : this.secondaryPhone,
        address: address.present ? address.value : this.address,
        addressComplement: addressComplement.present
            ? addressComplement.value
            : this.addressComplement,
        postalCode: postalCode.present ? postalCode.value : this.postalCode,
        city: city.present ? city.value : this.city,
        country: country ?? this.country,
        paymentTerm: paymentTerm ?? this.paymentTerm,
        usualDiscount:
            usualDiscount.present ? usualDiscount.value : this.usualDiscount,
        minimumOrderAmountCents: minimumOrderAmountCents.present
            ? minimumOrderAmountCents.value
            : this.minimumOrderAmountCents,
        deliveryDelayDays: deliveryDelayDays.present
            ? deliveryDelayDays.value
            : this.deliveryDelayDays,
        isMainSupplier: isMainSupplier ?? this.isMainSupplier,
        notes: notes.present ? notes.value : this.notes,
        isActive: isActive ?? this.isActive,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
      );
  SuppliersDriftData copyWithCompanion(SuppliersDriftCompanion data) {
    return SuppliersDriftData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      commercialName: data.commercialName.present
          ? data.commercialName.value
          : this.commercialName,
      type: data.type.present ? data.type.value : this.type,
      code: data.code.present ? data.code.value : this.code,
      siret: data.siret.present ? data.siret.value : this.siret,
      siren: data.siren.present ? data.siren.value : this.siren,
      vatNumber: data.vatNumber.present ? data.vatNumber.value : this.vatNumber,
      contactFirstName: data.contactFirstName.present
          ? data.contactFirstName.value
          : this.contactFirstName,
      contactLastName: data.contactLastName.present
          ? data.contactLastName.value
          : this.contactLastName,
      contactJob:
          data.contactJob.present ? data.contactJob.value : this.contactJob,
      email: data.email.present ? data.email.value : this.email,
      phone: data.phone.present ? data.phone.value : this.phone,
      secondaryPhone: data.secondaryPhone.present
          ? data.secondaryPhone.value
          : this.secondaryPhone,
      address: data.address.present ? data.address.value : this.address,
      addressComplement: data.addressComplement.present
          ? data.addressComplement.value
          : this.addressComplement,
      postalCode:
          data.postalCode.present ? data.postalCode.value : this.postalCode,
      city: data.city.present ? data.city.value : this.city,
      country: data.country.present ? data.country.value : this.country,
      paymentTerm:
          data.paymentTerm.present ? data.paymentTerm.value : this.paymentTerm,
      usualDiscount: data.usualDiscount.present
          ? data.usualDiscount.value
          : this.usualDiscount,
      minimumOrderAmountCents: data.minimumOrderAmountCents.present
          ? data.minimumOrderAmountCents.value
          : this.minimumOrderAmountCents,
      deliveryDelayDays: data.deliveryDelayDays.present
          ? data.deliveryDelayDays.value
          : this.deliveryDelayDays,
      isMainSupplier: data.isMainSupplier.present
          ? data.isMainSupplier.value
          : this.isMainSupplier,
      notes: data.notes.present ? data.notes.value : this.notes,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('SuppliersDriftData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('commercialName: $commercialName, ')
          ..write('type: $type, ')
          ..write('code: $code, ')
          ..write('siret: $siret, ')
          ..write('siren: $siren, ')
          ..write('vatNumber: $vatNumber, ')
          ..write('contactFirstName: $contactFirstName, ')
          ..write('contactLastName: $contactLastName, ')
          ..write('contactJob: $contactJob, ')
          ..write('email: $email, ')
          ..write('phone: $phone, ')
          ..write('secondaryPhone: $secondaryPhone, ')
          ..write('address: $address, ')
          ..write('addressComplement: $addressComplement, ')
          ..write('postalCode: $postalCode, ')
          ..write('city: $city, ')
          ..write('country: $country, ')
          ..write('paymentTerm: $paymentTerm, ')
          ..write('usualDiscount: $usualDiscount, ')
          ..write('minimumOrderAmountCents: $minimumOrderAmountCents, ')
          ..write('deliveryDelayDays: $deliveryDelayDays, ')
          ..write('isMainSupplier: $isMainSupplier, ')
          ..write('notes: $notes, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        id,
        name,
        commercialName,
        type,
        code,
        siret,
        siren,
        vatNumber,
        contactFirstName,
        contactLastName,
        contactJob,
        email,
        phone,
        secondaryPhone,
        address,
        addressComplement,
        postalCode,
        city,
        country,
        paymentTerm,
        usualDiscount,
        minimumOrderAmountCents,
        deliveryDelayDays,
        isMainSupplier,
        notes,
        isActive,
        createdAt,
        updatedAt,
        deletedAt
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is SuppliersDriftData &&
          other.id == this.id &&
          other.name == this.name &&
          other.commercialName == this.commercialName &&
          other.type == this.type &&
          other.code == this.code &&
          other.siret == this.siret &&
          other.siren == this.siren &&
          other.vatNumber == this.vatNumber &&
          other.contactFirstName == this.contactFirstName &&
          other.contactLastName == this.contactLastName &&
          other.contactJob == this.contactJob &&
          other.email == this.email &&
          other.phone == this.phone &&
          other.secondaryPhone == this.secondaryPhone &&
          other.address == this.address &&
          other.addressComplement == this.addressComplement &&
          other.postalCode == this.postalCode &&
          other.city == this.city &&
          other.country == this.country &&
          other.paymentTerm == this.paymentTerm &&
          other.usualDiscount == this.usualDiscount &&
          other.minimumOrderAmountCents == this.minimumOrderAmountCents &&
          other.deliveryDelayDays == this.deliveryDelayDays &&
          other.isMainSupplier == this.isMainSupplier &&
          other.notes == this.notes &&
          other.isActive == this.isActive &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt);
}

class SuppliersDriftCompanion extends UpdateCompanion<SuppliersDriftData> {
  final Value<String> id;
  final Value<String> name;
  final Value<String?> commercialName;
  final Value<SupplierType> type;
  final Value<String?> code;
  final Value<String?> siret;
  final Value<String?> siren;
  final Value<String?> vatNumber;
  final Value<String?> contactFirstName;
  final Value<String?> contactLastName;
  final Value<String?> contactJob;
  final Value<String?> email;
  final Value<String?> phone;
  final Value<String?> secondaryPhone;
  final Value<String?> address;
  final Value<String?> addressComplement;
  final Value<String?> postalCode;
  final Value<String?> city;
  final Value<String> country;
  final Value<PaymentTerm> paymentTerm;
  final Value<double?> usualDiscount;
  final Value<int?> minimumOrderAmountCents;
  final Value<int?> deliveryDelayDays;
  final Value<bool> isMainSupplier;
  final Value<String?> notes;
  final Value<bool> isActive;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<int> rowid;
  const SuppliersDriftCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.commercialName = const Value.absent(),
    this.type = const Value.absent(),
    this.code = const Value.absent(),
    this.siret = const Value.absent(),
    this.siren = const Value.absent(),
    this.vatNumber = const Value.absent(),
    this.contactFirstName = const Value.absent(),
    this.contactLastName = const Value.absent(),
    this.contactJob = const Value.absent(),
    this.email = const Value.absent(),
    this.phone = const Value.absent(),
    this.secondaryPhone = const Value.absent(),
    this.address = const Value.absent(),
    this.addressComplement = const Value.absent(),
    this.postalCode = const Value.absent(),
    this.city = const Value.absent(),
    this.country = const Value.absent(),
    this.paymentTerm = const Value.absent(),
    this.usualDiscount = const Value.absent(),
    this.minimumOrderAmountCents = const Value.absent(),
    this.deliveryDelayDays = const Value.absent(),
    this.isMainSupplier = const Value.absent(),
    this.notes = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  SuppliersDriftCompanion.insert({
    required String id,
    required String name,
    this.commercialName = const Value.absent(),
    required SupplierType type,
    this.code = const Value.absent(),
    this.siret = const Value.absent(),
    this.siren = const Value.absent(),
    this.vatNumber = const Value.absent(),
    this.contactFirstName = const Value.absent(),
    this.contactLastName = const Value.absent(),
    this.contactJob = const Value.absent(),
    this.email = const Value.absent(),
    this.phone = const Value.absent(),
    this.secondaryPhone = const Value.absent(),
    this.address = const Value.absent(),
    this.addressComplement = const Value.absent(),
    this.postalCode = const Value.absent(),
    this.city = const Value.absent(),
    required String country,
    required PaymentTerm paymentTerm,
    this.usualDiscount = const Value.absent(),
    this.minimumOrderAmountCents = const Value.absent(),
    this.deliveryDelayDays = const Value.absent(),
    this.isMainSupplier = const Value.absent(),
    this.notes = const Value.absent(),
    this.isActive = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        type = Value(type),
        country = Value(country),
        paymentTerm = Value(paymentTerm),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<SuppliersDriftData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? commercialName,
    Expression<String>? type,
    Expression<String>? code,
    Expression<String>? siret,
    Expression<String>? siren,
    Expression<String>? vatNumber,
    Expression<String>? contactFirstName,
    Expression<String>? contactLastName,
    Expression<String>? contactJob,
    Expression<String>? email,
    Expression<String>? phone,
    Expression<String>? secondaryPhone,
    Expression<String>? address,
    Expression<String>? addressComplement,
    Expression<String>? postalCode,
    Expression<String>? city,
    Expression<String>? country,
    Expression<String>? paymentTerm,
    Expression<double>? usualDiscount,
    Expression<int>? minimumOrderAmountCents,
    Expression<int>? deliveryDelayDays,
    Expression<bool>? isMainSupplier,
    Expression<String>? notes,
    Expression<bool>? isActive,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (commercialName != null) 'commercial_name': commercialName,
      if (type != null) 'type': type,
      if (code != null) 'code': code,
      if (siret != null) 'siret': siret,
      if (siren != null) 'siren': siren,
      if (vatNumber != null) 'vat_number': vatNumber,
      if (contactFirstName != null) 'contact_first_name': contactFirstName,
      if (contactLastName != null) 'contact_last_name': contactLastName,
      if (contactJob != null) 'contact_job': contactJob,
      if (email != null) 'email': email,
      if (phone != null) 'phone': phone,
      if (secondaryPhone != null) 'secondary_phone': secondaryPhone,
      if (address != null) 'address': address,
      if (addressComplement != null) 'address_complement': addressComplement,
      if (postalCode != null) 'postal_code': postalCode,
      if (city != null) 'city': city,
      if (country != null) 'country': country,
      if (paymentTerm != null) 'payment_term': paymentTerm,
      if (usualDiscount != null) 'usual_discount': usualDiscount,
      if (minimumOrderAmountCents != null)
        'minimum_order_amount_cents': minimumOrderAmountCents,
      if (deliveryDelayDays != null) 'delivery_delay_days': deliveryDelayDays,
      if (isMainSupplier != null) 'is_main_supplier': isMainSupplier,
      if (notes != null) 'notes': notes,
      if (isActive != null) 'is_active': isActive,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  SuppliersDriftCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String?>? commercialName,
      Value<SupplierType>? type,
      Value<String?>? code,
      Value<String?>? siret,
      Value<String?>? siren,
      Value<String?>? vatNumber,
      Value<String?>? contactFirstName,
      Value<String?>? contactLastName,
      Value<String?>? contactJob,
      Value<String?>? email,
      Value<String?>? phone,
      Value<String?>? secondaryPhone,
      Value<String?>? address,
      Value<String?>? addressComplement,
      Value<String?>? postalCode,
      Value<String?>? city,
      Value<String>? country,
      Value<PaymentTerm>? paymentTerm,
      Value<double?>? usualDiscount,
      Value<int?>? minimumOrderAmountCents,
      Value<int?>? deliveryDelayDays,
      Value<bool>? isMainSupplier,
      Value<String?>? notes,
      Value<bool>? isActive,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<DateTime?>? deletedAt,
      Value<int>? rowid}) {
    return SuppliersDriftCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      commercialName: commercialName ?? this.commercialName,
      type: type ?? this.type,
      code: code ?? this.code,
      siret: siret ?? this.siret,
      siren: siren ?? this.siren,
      vatNumber: vatNumber ?? this.vatNumber,
      contactFirstName: contactFirstName ?? this.contactFirstName,
      contactLastName: contactLastName ?? this.contactLastName,
      contactJob: contactJob ?? this.contactJob,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      secondaryPhone: secondaryPhone ?? this.secondaryPhone,
      address: address ?? this.address,
      addressComplement: addressComplement ?? this.addressComplement,
      postalCode: postalCode ?? this.postalCode,
      city: city ?? this.city,
      country: country ?? this.country,
      paymentTerm: paymentTerm ?? this.paymentTerm,
      usualDiscount: usualDiscount ?? this.usualDiscount,
      minimumOrderAmountCents:
          minimumOrderAmountCents ?? this.minimumOrderAmountCents,
      deliveryDelayDays: deliveryDelayDays ?? this.deliveryDelayDays,
      isMainSupplier: isMainSupplier ?? this.isMainSupplier,
      notes: notes ?? this.notes,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (commercialName.present) {
      map['commercial_name'] = Variable<String>(commercialName.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(
          $SuppliersDriftTable.$convertertype.toSql(type.value));
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (siret.present) {
      map['siret'] = Variable<String>(siret.value);
    }
    if (siren.present) {
      map['siren'] = Variable<String>(siren.value);
    }
    if (vatNumber.present) {
      map['vat_number'] = Variable<String>(vatNumber.value);
    }
    if (contactFirstName.present) {
      map['contact_first_name'] = Variable<String>(contactFirstName.value);
    }
    if (contactLastName.present) {
      map['contact_last_name'] = Variable<String>(contactLastName.value);
    }
    if (contactJob.present) {
      map['contact_job'] = Variable<String>(contactJob.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (secondaryPhone.present) {
      map['secondary_phone'] = Variable<String>(secondaryPhone.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (addressComplement.present) {
      map['address_complement'] = Variable<String>(addressComplement.value);
    }
    if (postalCode.present) {
      map['postal_code'] = Variable<String>(postalCode.value);
    }
    if (city.present) {
      map['city'] = Variable<String>(city.value);
    }
    if (country.present) {
      map['country'] = Variable<String>(country.value);
    }
    if (paymentTerm.present) {
      map['payment_term'] = Variable<String>(
          $SuppliersDriftTable.$converterpaymentTerm.toSql(paymentTerm.value));
    }
    if (usualDiscount.present) {
      map['usual_discount'] = Variable<double>(usualDiscount.value);
    }
    if (minimumOrderAmountCents.present) {
      map['minimum_order_amount_cents'] =
          Variable<int>(minimumOrderAmountCents.value);
    }
    if (deliveryDelayDays.present) {
      map['delivery_delay_days'] = Variable<int>(deliveryDelayDays.value);
    }
    if (isMainSupplier.present) {
      map['is_main_supplier'] = Variable<bool>(isMainSupplier.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('SuppliersDriftCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('commercialName: $commercialName, ')
          ..write('type: $type, ')
          ..write('code: $code, ')
          ..write('siret: $siret, ')
          ..write('siren: $siren, ')
          ..write('vatNumber: $vatNumber, ')
          ..write('contactFirstName: $contactFirstName, ')
          ..write('contactLastName: $contactLastName, ')
          ..write('contactJob: $contactJob, ')
          ..write('email: $email, ')
          ..write('phone: $phone, ')
          ..write('secondaryPhone: $secondaryPhone, ')
          ..write('address: $address, ')
          ..write('addressComplement: $addressComplement, ')
          ..write('postalCode: $postalCode, ')
          ..write('city: $city, ')
          ..write('country: $country, ')
          ..write('paymentTerm: $paymentTerm, ')
          ..write('usualDiscount: $usualDiscount, ')
          ..write('minimumOrderAmountCents: $minimumOrderAmountCents, ')
          ..write('deliveryDelayDays: $deliveryDelayDays, ')
          ..write('isMainSupplier: $isMainSupplier, ')
          ..write('notes: $notes, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ProductsDriftTable extends ProductsDrift
    with TableInfo<$ProductsDriftTable, ProductsDriftData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductsDriftTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _skuMeta = const VerificationMeta('sku');
  @override
  late final GeneratedColumn<String> sku = GeneratedColumn<String>(
      'sku', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _barcodeMeta =
      const VerificationMeta('barcode');
  @override
  late final GeneratedColumn<String> barcode = GeneratedColumn<String>(
      'barcode', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _salePriceMeta =
      const VerificationMeta('salePrice');
  @override
  late final GeneratedColumn<int> salePrice = GeneratedColumn<int>(
      'sale_price', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _purchasePriceMeta =
      const VerificationMeta('purchasePrice');
  @override
  late final GeneratedColumn<int> purchasePrice = GeneratedColumn<int>(
      'purchase_price', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _costPriceMeta =
      const VerificationMeta('costPrice');
  @override
  late final GeneratedColumn<int> costPrice = GeneratedColumn<int>(
      'cost_price', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _taxRateMeta =
      const VerificationMeta('taxRate');
  @override
  late final GeneratedColumn<double> taxRate = GeneratedColumn<double>(
      'tax_rate', aliasedName, true,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _stockEnabledMeta =
      const VerificationMeta('stockEnabled');
  @override
  late final GeneratedColumn<bool> stockEnabled = GeneratedColumn<bool>(
      'stock_enabled', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("stock_enabled" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _weightedMeta =
      const VerificationMeta('weighted');
  @override
  late final GeneratedColumn<bool> weighted = GeneratedColumn<bool>(
      'weighted', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("weighted" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _serviceMeta =
      const VerificationMeta('service');
  @override
  late final GeneratedColumn<bool> service = GeneratedColumn<bool>(
      'service', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("service" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _favoriteMeta =
      const VerificationMeta('favorite');
  @override
  late final GeneratedColumn<bool> favorite = GeneratedColumn<bool>(
      'favorite', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("favorite" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _allowNegativeStockMeta =
      const VerificationMeta('allowNegativeStock');
  @override
  late final GeneratedColumn<bool> allowNegativeStock = GeneratedColumn<bool>(
      'allow_negative_stock', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("allow_negative_stock" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _stockQuantityMeta =
      const VerificationMeta('stockQuantity');
  @override
  late final GeneratedColumn<double> stockQuantity = GeneratedColumn<double>(
      'stock_quantity', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _stockMinMeta =
      const VerificationMeta('stockMin');
  @override
  late final GeneratedColumn<double> stockMin = GeneratedColumn<double>(
      'stock_min', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _stockMaxMeta =
      const VerificationMeta('stockMax');
  @override
  late final GeneratedColumn<double> stockMax = GeneratedColumn<double>(
      'stock_max', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _reorderPointMeta =
      const VerificationMeta('reorderPoint');
  @override
  late final GeneratedColumn<double> reorderPoint = GeneratedColumn<double>(
      'reorder_point', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _unitMeta = const VerificationMeta('unit');
  @override
  late final GeneratedColumn<String> unit = GeneratedColumn<String>(
      'unit', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('Piece'));
  static const VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String> image = GeneratedColumn<String>(
      'image', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _colorMeta = const VerificationMeta('color');
  @override
  late final GeneratedColumn<int> color = GeneratedColumn<int>(
      'color', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _isActiveMeta =
      const VerificationMeta('isActive');
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
      'is_active', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_active" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _categoryIdMeta =
      const VerificationMeta('categoryId');
  @override
  late final GeneratedColumn<String> categoryId = GeneratedColumn<String>(
      'category_id', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES categories_drift (id)'));
  static const VerificationMeta _supplierIdMeta =
      const VerificationMeta('supplierId');
  @override
  late final GeneratedColumn<String> supplierId = GeneratedColumn<String>(
      'supplier_id', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES suppliers_drift (id)'));
  static const VerificationMeta _createdByIdMeta =
      const VerificationMeta('createdById');
  @override
  late final GeneratedColumn<String> createdById = GeneratedColumn<String>(
      'created_by_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        description,
        sku,
        barcode,
        salePrice,
        purchasePrice,
        costPrice,
        taxRate,
        stockEnabled,
        weighted,
        service,
        favorite,
        allowNegativeStock,
        stockQuantity,
        stockMin,
        stockMax,
        reorderPoint,
        unit,
        image,
        color,
        isActive,
        categoryId,
        supplierId,
        createdById,
        createdAt,
        updatedAt,
        deletedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'products_drift';
  @override
  VerificationContext validateIntegrity(Insertable<ProductsDriftData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('sku')) {
      context.handle(
          _skuMeta, sku.isAcceptableOrUnknown(data['sku']!, _skuMeta));
    }
    if (data.containsKey('barcode')) {
      context.handle(_barcodeMeta,
          barcode.isAcceptableOrUnknown(data['barcode']!, _barcodeMeta));
    }
    if (data.containsKey('sale_price')) {
      context.handle(_salePriceMeta,
          salePrice.isAcceptableOrUnknown(data['sale_price']!, _salePriceMeta));
    }
    if (data.containsKey('purchase_price')) {
      context.handle(
          _purchasePriceMeta,
          purchasePrice.isAcceptableOrUnknown(
              data['purchase_price']!, _purchasePriceMeta));
    }
    if (data.containsKey('cost_price')) {
      context.handle(_costPriceMeta,
          costPrice.isAcceptableOrUnknown(data['cost_price']!, _costPriceMeta));
    }
    if (data.containsKey('tax_rate')) {
      context.handle(_taxRateMeta,
          taxRate.isAcceptableOrUnknown(data['tax_rate']!, _taxRateMeta));
    }
    if (data.containsKey('stock_enabled')) {
      context.handle(
          _stockEnabledMeta,
          stockEnabled.isAcceptableOrUnknown(
              data['stock_enabled']!, _stockEnabledMeta));
    }
    if (data.containsKey('weighted')) {
      context.handle(_weightedMeta,
          weighted.isAcceptableOrUnknown(data['weighted']!, _weightedMeta));
    }
    if (data.containsKey('service')) {
      context.handle(_serviceMeta,
          service.isAcceptableOrUnknown(data['service']!, _serviceMeta));
    }
    if (data.containsKey('favorite')) {
      context.handle(_favoriteMeta,
          favorite.isAcceptableOrUnknown(data['favorite']!, _favoriteMeta));
    }
    if (data.containsKey('allow_negative_stock')) {
      context.handle(
          _allowNegativeStockMeta,
          allowNegativeStock.isAcceptableOrUnknown(
              data['allow_negative_stock']!, _allowNegativeStockMeta));
    }
    if (data.containsKey('stock_quantity')) {
      context.handle(
          _stockQuantityMeta,
          stockQuantity.isAcceptableOrUnknown(
              data['stock_quantity']!, _stockQuantityMeta));
    }
    if (data.containsKey('stock_min')) {
      context.handle(_stockMinMeta,
          stockMin.isAcceptableOrUnknown(data['stock_min']!, _stockMinMeta));
    }
    if (data.containsKey('stock_max')) {
      context.handle(_stockMaxMeta,
          stockMax.isAcceptableOrUnknown(data['stock_max']!, _stockMaxMeta));
    }
    if (data.containsKey('reorder_point')) {
      context.handle(
          _reorderPointMeta,
          reorderPoint.isAcceptableOrUnknown(
              data['reorder_point']!, _reorderPointMeta));
    }
    if (data.containsKey('unit')) {
      context.handle(
          _unitMeta, unit.isAcceptableOrUnknown(data['unit']!, _unitMeta));
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    }
    if (data.containsKey('color')) {
      context.handle(
          _colorMeta, color.isAcceptableOrUnknown(data['color']!, _colorMeta));
    }
    if (data.containsKey('is_active')) {
      context.handle(_isActiveMeta,
          isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta));
    }
    if (data.containsKey('category_id')) {
      context.handle(
          _categoryIdMeta,
          categoryId.isAcceptableOrUnknown(
              data['category_id']!, _categoryIdMeta));
    }
    if (data.containsKey('supplier_id')) {
      context.handle(
          _supplierIdMeta,
          supplierId.isAcceptableOrUnknown(
              data['supplier_id']!, _supplierIdMeta));
    }
    if (data.containsKey('created_by_id')) {
      context.handle(
          _createdByIdMeta,
          createdById.isAcceptableOrUnknown(
              data['created_by_id']!, _createdByIdMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ProductsDriftData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProductsDriftData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      sku: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sku']),
      barcode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}barcode']),
      salePrice: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}sale_price']),
      purchasePrice: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}purchase_price'])!,
      costPrice: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}cost_price'])!,
      taxRate: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}tax_rate']),
      stockEnabled: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}stock_enabled'])!,
      weighted: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}weighted'])!,
      service: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}service'])!,
      favorite: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}favorite'])!,
      allowNegativeStock: attachedDatabase.typeMapping.read(
          DriftSqlType.bool, data['${effectivePrefix}allow_negative_stock'])!,
      stockQuantity: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}stock_quantity'])!,
      stockMin: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}stock_min'])!,
      stockMax: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}stock_max'])!,
      reorderPoint: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}reorder_point'])!,
      unit: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}unit'])!,
      image: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image']),
      color: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}color']),
      isActive: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_active'])!,
      categoryId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category_id']),
      supplierId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}supplier_id']),
      createdById: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_by_id']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
    );
  }

  @override
  $ProductsDriftTable createAlias(String alias) {
    return $ProductsDriftTable(attachedDatabase, alias);
  }
}

class ProductsDriftData extends DataClass
    implements Insertable<ProductsDriftData> {
  final String id;
  final String name;
  final String? description;
  final String? sku;
  final String? barcode;
  final int? salePrice;
  final int purchasePrice;
  final int costPrice;
  final double? taxRate;
  final bool stockEnabled;
  final bool weighted;
  final bool service;
  final bool favorite;
  final bool allowNegativeStock;
  final double stockQuantity;
  final double stockMin;
  final double stockMax;
  final double reorderPoint;
  final String unit;
  final String? image;
  final int? color;
  final bool isActive;
  final String? categoryId;
  final String? supplierId;
  final String? createdById;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  const ProductsDriftData(
      {required this.id,
      required this.name,
      this.description,
      this.sku,
      this.barcode,
      this.salePrice,
      required this.purchasePrice,
      required this.costPrice,
      this.taxRate,
      required this.stockEnabled,
      required this.weighted,
      required this.service,
      required this.favorite,
      required this.allowNegativeStock,
      required this.stockQuantity,
      required this.stockMin,
      required this.stockMax,
      required this.reorderPoint,
      required this.unit,
      this.image,
      this.color,
      required this.isActive,
      this.categoryId,
      this.supplierId,
      this.createdById,
      required this.createdAt,
      required this.updatedAt,
      this.deletedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || sku != null) {
      map['sku'] = Variable<String>(sku);
    }
    if (!nullToAbsent || barcode != null) {
      map['barcode'] = Variable<String>(barcode);
    }
    if (!nullToAbsent || salePrice != null) {
      map['sale_price'] = Variable<int>(salePrice);
    }
    map['purchase_price'] = Variable<int>(purchasePrice);
    map['cost_price'] = Variable<int>(costPrice);
    if (!nullToAbsent || taxRate != null) {
      map['tax_rate'] = Variable<double>(taxRate);
    }
    map['stock_enabled'] = Variable<bool>(stockEnabled);
    map['weighted'] = Variable<bool>(weighted);
    map['service'] = Variable<bool>(service);
    map['favorite'] = Variable<bool>(favorite);
    map['allow_negative_stock'] = Variable<bool>(allowNegativeStock);
    map['stock_quantity'] = Variable<double>(stockQuantity);
    map['stock_min'] = Variable<double>(stockMin);
    map['stock_max'] = Variable<double>(stockMax);
    map['reorder_point'] = Variable<double>(reorderPoint);
    map['unit'] = Variable<String>(unit);
    if (!nullToAbsent || image != null) {
      map['image'] = Variable<String>(image);
    }
    if (!nullToAbsent || color != null) {
      map['color'] = Variable<int>(color);
    }
    map['is_active'] = Variable<bool>(isActive);
    if (!nullToAbsent || categoryId != null) {
      map['category_id'] = Variable<String>(categoryId);
    }
    if (!nullToAbsent || supplierId != null) {
      map['supplier_id'] = Variable<String>(supplierId);
    }
    if (!nullToAbsent || createdById != null) {
      map['created_by_id'] = Variable<String>(createdById);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  ProductsDriftCompanion toCompanion(bool nullToAbsent) {
    return ProductsDriftCompanion(
      id: Value(id),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      sku: sku == null && nullToAbsent ? const Value.absent() : Value(sku),
      barcode: barcode == null && nullToAbsent
          ? const Value.absent()
          : Value(barcode),
      salePrice: salePrice == null && nullToAbsent
          ? const Value.absent()
          : Value(salePrice),
      purchasePrice: Value(purchasePrice),
      costPrice: Value(costPrice),
      taxRate: taxRate == null && nullToAbsent
          ? const Value.absent()
          : Value(taxRate),
      stockEnabled: Value(stockEnabled),
      weighted: Value(weighted),
      service: Value(service),
      favorite: Value(favorite),
      allowNegativeStock: Value(allowNegativeStock),
      stockQuantity: Value(stockQuantity),
      stockMin: Value(stockMin),
      stockMax: Value(stockMax),
      reorderPoint: Value(reorderPoint),
      unit: Value(unit),
      image:
          image == null && nullToAbsent ? const Value.absent() : Value(image),
      color:
          color == null && nullToAbsent ? const Value.absent() : Value(color),
      isActive: Value(isActive),
      categoryId: categoryId == null && nullToAbsent
          ? const Value.absent()
          : Value(categoryId),
      supplierId: supplierId == null && nullToAbsent
          ? const Value.absent()
          : Value(supplierId),
      createdById: createdById == null && nullToAbsent
          ? const Value.absent()
          : Value(createdById),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory ProductsDriftData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProductsDriftData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      sku: serializer.fromJson<String?>(json['sku']),
      barcode: serializer.fromJson<String?>(json['barcode']),
      salePrice: serializer.fromJson<int?>(json['salePrice']),
      purchasePrice: serializer.fromJson<int>(json['purchasePrice']),
      costPrice: serializer.fromJson<int>(json['costPrice']),
      taxRate: serializer.fromJson<double?>(json['taxRate']),
      stockEnabled: serializer.fromJson<bool>(json['stockEnabled']),
      weighted: serializer.fromJson<bool>(json['weighted']),
      service: serializer.fromJson<bool>(json['service']),
      favorite: serializer.fromJson<bool>(json['favorite']),
      allowNegativeStock: serializer.fromJson<bool>(json['allowNegativeStock']),
      stockQuantity: serializer.fromJson<double>(json['stockQuantity']),
      stockMin: serializer.fromJson<double>(json['stockMin']),
      stockMax: serializer.fromJson<double>(json['stockMax']),
      reorderPoint: serializer.fromJson<double>(json['reorderPoint']),
      unit: serializer.fromJson<String>(json['unit']),
      image: serializer.fromJson<String?>(json['image']),
      color: serializer.fromJson<int?>(json['color']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      categoryId: serializer.fromJson<String?>(json['categoryId']),
      supplierId: serializer.fromJson<String?>(json['supplierId']),
      createdById: serializer.fromJson<String?>(json['createdById']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'sku': serializer.toJson<String?>(sku),
      'barcode': serializer.toJson<String?>(barcode),
      'salePrice': serializer.toJson<int?>(salePrice),
      'purchasePrice': serializer.toJson<int>(purchasePrice),
      'costPrice': serializer.toJson<int>(costPrice),
      'taxRate': serializer.toJson<double?>(taxRate),
      'stockEnabled': serializer.toJson<bool>(stockEnabled),
      'weighted': serializer.toJson<bool>(weighted),
      'service': serializer.toJson<bool>(service),
      'favorite': serializer.toJson<bool>(favorite),
      'allowNegativeStock': serializer.toJson<bool>(allowNegativeStock),
      'stockQuantity': serializer.toJson<double>(stockQuantity),
      'stockMin': serializer.toJson<double>(stockMin),
      'stockMax': serializer.toJson<double>(stockMax),
      'reorderPoint': serializer.toJson<double>(reorderPoint),
      'unit': serializer.toJson<String>(unit),
      'image': serializer.toJson<String?>(image),
      'color': serializer.toJson<int?>(color),
      'isActive': serializer.toJson<bool>(isActive),
      'categoryId': serializer.toJson<String?>(categoryId),
      'supplierId': serializer.toJson<String?>(supplierId),
      'createdById': serializer.toJson<String?>(createdById),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  ProductsDriftData copyWith(
          {String? id,
          String? name,
          Value<String?> description = const Value.absent(),
          Value<String?> sku = const Value.absent(),
          Value<String?> barcode = const Value.absent(),
          Value<int?> salePrice = const Value.absent(),
          int? purchasePrice,
          int? costPrice,
          Value<double?> taxRate = const Value.absent(),
          bool? stockEnabled,
          bool? weighted,
          bool? service,
          bool? favorite,
          bool? allowNegativeStock,
          double? stockQuantity,
          double? stockMin,
          double? stockMax,
          double? reorderPoint,
          String? unit,
          Value<String?> image = const Value.absent(),
          Value<int?> color = const Value.absent(),
          bool? isActive,
          Value<String?> categoryId = const Value.absent(),
          Value<String?> supplierId = const Value.absent(),
          Value<String?> createdById = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt,
          Value<DateTime?> deletedAt = const Value.absent()}) =>
      ProductsDriftData(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description.present ? description.value : this.description,
        sku: sku.present ? sku.value : this.sku,
        barcode: barcode.present ? barcode.value : this.barcode,
        salePrice: salePrice.present ? salePrice.value : this.salePrice,
        purchasePrice: purchasePrice ?? this.purchasePrice,
        costPrice: costPrice ?? this.costPrice,
        taxRate: taxRate.present ? taxRate.value : this.taxRate,
        stockEnabled: stockEnabled ?? this.stockEnabled,
        weighted: weighted ?? this.weighted,
        service: service ?? this.service,
        favorite: favorite ?? this.favorite,
        allowNegativeStock: allowNegativeStock ?? this.allowNegativeStock,
        stockQuantity: stockQuantity ?? this.stockQuantity,
        stockMin: stockMin ?? this.stockMin,
        stockMax: stockMax ?? this.stockMax,
        reorderPoint: reorderPoint ?? this.reorderPoint,
        unit: unit ?? this.unit,
        image: image.present ? image.value : this.image,
        color: color.present ? color.value : this.color,
        isActive: isActive ?? this.isActive,
        categoryId: categoryId.present ? categoryId.value : this.categoryId,
        supplierId: supplierId.present ? supplierId.value : this.supplierId,
        createdById: createdById.present ? createdById.value : this.createdById,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
      );
  ProductsDriftData copyWithCompanion(ProductsDriftCompanion data) {
    return ProductsDriftData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description:
          data.description.present ? data.description.value : this.description,
      sku: data.sku.present ? data.sku.value : this.sku,
      barcode: data.barcode.present ? data.barcode.value : this.barcode,
      salePrice: data.salePrice.present ? data.salePrice.value : this.salePrice,
      purchasePrice: data.purchasePrice.present
          ? data.purchasePrice.value
          : this.purchasePrice,
      costPrice: data.costPrice.present ? data.costPrice.value : this.costPrice,
      taxRate: data.taxRate.present ? data.taxRate.value : this.taxRate,
      stockEnabled: data.stockEnabled.present
          ? data.stockEnabled.value
          : this.stockEnabled,
      weighted: data.weighted.present ? data.weighted.value : this.weighted,
      service: data.service.present ? data.service.value : this.service,
      favorite: data.favorite.present ? data.favorite.value : this.favorite,
      allowNegativeStock: data.allowNegativeStock.present
          ? data.allowNegativeStock.value
          : this.allowNegativeStock,
      stockQuantity: data.stockQuantity.present
          ? data.stockQuantity.value
          : this.stockQuantity,
      stockMin: data.stockMin.present ? data.stockMin.value : this.stockMin,
      stockMax: data.stockMax.present ? data.stockMax.value : this.stockMax,
      reorderPoint: data.reorderPoint.present
          ? data.reorderPoint.value
          : this.reorderPoint,
      unit: data.unit.present ? data.unit.value : this.unit,
      image: data.image.present ? data.image.value : this.image,
      color: data.color.present ? data.color.value : this.color,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      categoryId:
          data.categoryId.present ? data.categoryId.value : this.categoryId,
      supplierId:
          data.supplierId.present ? data.supplierId.value : this.supplierId,
      createdById:
          data.createdById.present ? data.createdById.value : this.createdById,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProductsDriftData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('sku: $sku, ')
          ..write('barcode: $barcode, ')
          ..write('salePrice: $salePrice, ')
          ..write('purchasePrice: $purchasePrice, ')
          ..write('costPrice: $costPrice, ')
          ..write('taxRate: $taxRate, ')
          ..write('stockEnabled: $stockEnabled, ')
          ..write('weighted: $weighted, ')
          ..write('service: $service, ')
          ..write('favorite: $favorite, ')
          ..write('allowNegativeStock: $allowNegativeStock, ')
          ..write('stockQuantity: $stockQuantity, ')
          ..write('stockMin: $stockMin, ')
          ..write('stockMax: $stockMax, ')
          ..write('reorderPoint: $reorderPoint, ')
          ..write('unit: $unit, ')
          ..write('image: $image, ')
          ..write('color: $color, ')
          ..write('isActive: $isActive, ')
          ..write('categoryId: $categoryId, ')
          ..write('supplierId: $supplierId, ')
          ..write('createdById: $createdById, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        id,
        name,
        description,
        sku,
        barcode,
        salePrice,
        purchasePrice,
        costPrice,
        taxRate,
        stockEnabled,
        weighted,
        service,
        favorite,
        allowNegativeStock,
        stockQuantity,
        stockMin,
        stockMax,
        reorderPoint,
        unit,
        image,
        color,
        isActive,
        categoryId,
        supplierId,
        createdById,
        createdAt,
        updatedAt,
        deletedAt
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductsDriftData &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.sku == this.sku &&
          other.barcode == this.barcode &&
          other.salePrice == this.salePrice &&
          other.purchasePrice == this.purchasePrice &&
          other.costPrice == this.costPrice &&
          other.taxRate == this.taxRate &&
          other.stockEnabled == this.stockEnabled &&
          other.weighted == this.weighted &&
          other.service == this.service &&
          other.favorite == this.favorite &&
          other.allowNegativeStock == this.allowNegativeStock &&
          other.stockQuantity == this.stockQuantity &&
          other.stockMin == this.stockMin &&
          other.stockMax == this.stockMax &&
          other.reorderPoint == this.reorderPoint &&
          other.unit == this.unit &&
          other.image == this.image &&
          other.color == this.color &&
          other.isActive == this.isActive &&
          other.categoryId == this.categoryId &&
          other.supplierId == this.supplierId &&
          other.createdById == this.createdById &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt);
}

class ProductsDriftCompanion extends UpdateCompanion<ProductsDriftData> {
  final Value<String> id;
  final Value<String> name;
  final Value<String?> description;
  final Value<String?> sku;
  final Value<String?> barcode;
  final Value<int?> salePrice;
  final Value<int> purchasePrice;
  final Value<int> costPrice;
  final Value<double?> taxRate;
  final Value<bool> stockEnabled;
  final Value<bool> weighted;
  final Value<bool> service;
  final Value<bool> favorite;
  final Value<bool> allowNegativeStock;
  final Value<double> stockQuantity;
  final Value<double> stockMin;
  final Value<double> stockMax;
  final Value<double> reorderPoint;
  final Value<String> unit;
  final Value<String?> image;
  final Value<int?> color;
  final Value<bool> isActive;
  final Value<String?> categoryId;
  final Value<String?> supplierId;
  final Value<String?> createdById;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<int> rowid;
  const ProductsDriftCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.sku = const Value.absent(),
    this.barcode = const Value.absent(),
    this.salePrice = const Value.absent(),
    this.purchasePrice = const Value.absent(),
    this.costPrice = const Value.absent(),
    this.taxRate = const Value.absent(),
    this.stockEnabled = const Value.absent(),
    this.weighted = const Value.absent(),
    this.service = const Value.absent(),
    this.favorite = const Value.absent(),
    this.allowNegativeStock = const Value.absent(),
    this.stockQuantity = const Value.absent(),
    this.stockMin = const Value.absent(),
    this.stockMax = const Value.absent(),
    this.reorderPoint = const Value.absent(),
    this.unit = const Value.absent(),
    this.image = const Value.absent(),
    this.color = const Value.absent(),
    this.isActive = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.supplierId = const Value.absent(),
    this.createdById = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProductsDriftCompanion.insert({
    required String id,
    required String name,
    this.description = const Value.absent(),
    this.sku = const Value.absent(),
    this.barcode = const Value.absent(),
    this.salePrice = const Value.absent(),
    this.purchasePrice = const Value.absent(),
    this.costPrice = const Value.absent(),
    this.taxRate = const Value.absent(),
    this.stockEnabled = const Value.absent(),
    this.weighted = const Value.absent(),
    this.service = const Value.absent(),
    this.favorite = const Value.absent(),
    this.allowNegativeStock = const Value.absent(),
    this.stockQuantity = const Value.absent(),
    this.stockMin = const Value.absent(),
    this.stockMax = const Value.absent(),
    this.reorderPoint = const Value.absent(),
    this.unit = const Value.absent(),
    this.image = const Value.absent(),
    this.color = const Value.absent(),
    this.isActive = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.supplierId = const Value.absent(),
    this.createdById = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<ProductsDriftData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? sku,
    Expression<String>? barcode,
    Expression<int>? salePrice,
    Expression<int>? purchasePrice,
    Expression<int>? costPrice,
    Expression<double>? taxRate,
    Expression<bool>? stockEnabled,
    Expression<bool>? weighted,
    Expression<bool>? service,
    Expression<bool>? favorite,
    Expression<bool>? allowNegativeStock,
    Expression<double>? stockQuantity,
    Expression<double>? stockMin,
    Expression<double>? stockMax,
    Expression<double>? reorderPoint,
    Expression<String>? unit,
    Expression<String>? image,
    Expression<int>? color,
    Expression<bool>? isActive,
    Expression<String>? categoryId,
    Expression<String>? supplierId,
    Expression<String>? createdById,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (sku != null) 'sku': sku,
      if (barcode != null) 'barcode': barcode,
      if (salePrice != null) 'sale_price': salePrice,
      if (purchasePrice != null) 'purchase_price': purchasePrice,
      if (costPrice != null) 'cost_price': costPrice,
      if (taxRate != null) 'tax_rate': taxRate,
      if (stockEnabled != null) 'stock_enabled': stockEnabled,
      if (weighted != null) 'weighted': weighted,
      if (service != null) 'service': service,
      if (favorite != null) 'favorite': favorite,
      if (allowNegativeStock != null)
        'allow_negative_stock': allowNegativeStock,
      if (stockQuantity != null) 'stock_quantity': stockQuantity,
      if (stockMin != null) 'stock_min': stockMin,
      if (stockMax != null) 'stock_max': stockMax,
      if (reorderPoint != null) 'reorder_point': reorderPoint,
      if (unit != null) 'unit': unit,
      if (image != null) 'image': image,
      if (color != null) 'color': color,
      if (isActive != null) 'is_active': isActive,
      if (categoryId != null) 'category_id': categoryId,
      if (supplierId != null) 'supplier_id': supplierId,
      if (createdById != null) 'created_by_id': createdById,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProductsDriftCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String?>? description,
      Value<String?>? sku,
      Value<String?>? barcode,
      Value<int?>? salePrice,
      Value<int>? purchasePrice,
      Value<int>? costPrice,
      Value<double?>? taxRate,
      Value<bool>? stockEnabled,
      Value<bool>? weighted,
      Value<bool>? service,
      Value<bool>? favorite,
      Value<bool>? allowNegativeStock,
      Value<double>? stockQuantity,
      Value<double>? stockMin,
      Value<double>? stockMax,
      Value<double>? reorderPoint,
      Value<String>? unit,
      Value<String?>? image,
      Value<int?>? color,
      Value<bool>? isActive,
      Value<String?>? categoryId,
      Value<String?>? supplierId,
      Value<String?>? createdById,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<DateTime?>? deletedAt,
      Value<int>? rowid}) {
    return ProductsDriftCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      sku: sku ?? this.sku,
      barcode: barcode ?? this.barcode,
      salePrice: salePrice ?? this.salePrice,
      purchasePrice: purchasePrice ?? this.purchasePrice,
      costPrice: costPrice ?? this.costPrice,
      taxRate: taxRate ?? this.taxRate,
      stockEnabled: stockEnabled ?? this.stockEnabled,
      weighted: weighted ?? this.weighted,
      service: service ?? this.service,
      favorite: favorite ?? this.favorite,
      allowNegativeStock: allowNegativeStock ?? this.allowNegativeStock,
      stockQuantity: stockQuantity ?? this.stockQuantity,
      stockMin: stockMin ?? this.stockMin,
      stockMax: stockMax ?? this.stockMax,
      reorderPoint: reorderPoint ?? this.reorderPoint,
      unit: unit ?? this.unit,
      image: image ?? this.image,
      color: color ?? this.color,
      isActive: isActive ?? this.isActive,
      categoryId: categoryId ?? this.categoryId,
      supplierId: supplierId ?? this.supplierId,
      createdById: createdById ?? this.createdById,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (sku.present) {
      map['sku'] = Variable<String>(sku.value);
    }
    if (barcode.present) {
      map['barcode'] = Variable<String>(barcode.value);
    }
    if (salePrice.present) {
      map['sale_price'] = Variable<int>(salePrice.value);
    }
    if (purchasePrice.present) {
      map['purchase_price'] = Variable<int>(purchasePrice.value);
    }
    if (costPrice.present) {
      map['cost_price'] = Variable<int>(costPrice.value);
    }
    if (taxRate.present) {
      map['tax_rate'] = Variable<double>(taxRate.value);
    }
    if (stockEnabled.present) {
      map['stock_enabled'] = Variable<bool>(stockEnabled.value);
    }
    if (weighted.present) {
      map['weighted'] = Variable<bool>(weighted.value);
    }
    if (service.present) {
      map['service'] = Variable<bool>(service.value);
    }
    if (favorite.present) {
      map['favorite'] = Variable<bool>(favorite.value);
    }
    if (allowNegativeStock.present) {
      map['allow_negative_stock'] = Variable<bool>(allowNegativeStock.value);
    }
    if (stockQuantity.present) {
      map['stock_quantity'] = Variable<double>(stockQuantity.value);
    }
    if (stockMin.present) {
      map['stock_min'] = Variable<double>(stockMin.value);
    }
    if (stockMax.present) {
      map['stock_max'] = Variable<double>(stockMax.value);
    }
    if (reorderPoint.present) {
      map['reorder_point'] = Variable<double>(reorderPoint.value);
    }
    if (unit.present) {
      map['unit'] = Variable<String>(unit.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    if (color.present) {
      map['color'] = Variable<int>(color.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (categoryId.present) {
      map['category_id'] = Variable<String>(categoryId.value);
    }
    if (supplierId.present) {
      map['supplier_id'] = Variable<String>(supplierId.value);
    }
    if (createdById.present) {
      map['created_by_id'] = Variable<String>(createdById.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductsDriftCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('sku: $sku, ')
          ..write('barcode: $barcode, ')
          ..write('salePrice: $salePrice, ')
          ..write('purchasePrice: $purchasePrice, ')
          ..write('costPrice: $costPrice, ')
          ..write('taxRate: $taxRate, ')
          ..write('stockEnabled: $stockEnabled, ')
          ..write('weighted: $weighted, ')
          ..write('service: $service, ')
          ..write('favorite: $favorite, ')
          ..write('allowNegativeStock: $allowNegativeStock, ')
          ..write('stockQuantity: $stockQuantity, ')
          ..write('stockMin: $stockMin, ')
          ..write('stockMax: $stockMax, ')
          ..write('reorderPoint: $reorderPoint, ')
          ..write('unit: $unit, ')
          ..write('image: $image, ')
          ..write('color: $color, ')
          ..write('isActive: $isActive, ')
          ..write('categoryId: $categoryId, ')
          ..write('supplierId: $supplierId, ')
          ..write('createdById: $createdById, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $OptionsDriftTable extends OptionsDrift
    with TableInfo<$OptionsDriftTable, OptionsDriftData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OptionsDriftTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _mandatoryMeta =
      const VerificationMeta('mandatory');
  @override
  late final GeneratedColumn<bool> mandatory = GeneratedColumn<bool>(
      'mandatory', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("mandatory" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _minSelectionMeta =
      const VerificationMeta('minSelection');
  @override
  late final GeneratedColumn<int> minSelection = GeneratedColumn<int>(
      'min_selection', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _maxSelectionMeta =
      const VerificationMeta('maxSelection');
  @override
  late final GeneratedColumn<int> maxSelection = GeneratedColumn<int>(
      'max_selection', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _allowDuplicateSelectionMeta =
      const VerificationMeta('allowDuplicateSelection');
  @override
  late final GeneratedColumn<bool> allowDuplicateSelection =
      GeneratedColumn<bool>('allow_duplicate_selection', aliasedName, false,
          type: DriftSqlType.bool,
          requiredDuringInsert: false,
          defaultConstraints: GeneratedColumn.constraintIsAlways(
              'CHECK ("allow_duplicate_selection" IN (0, 1))'),
          defaultValue: const Constant(false));
  static const VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String> image = GeneratedColumn<String>(
      'image', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _colorMeta = const VerificationMeta('color');
  @override
  late final GeneratedColumn<String> color = GeneratedColumn<String>(
      'color', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _activeMeta = const VerificationMeta('active');
  @override
  late final GeneratedColumn<bool> active = GeneratedColumn<bool>(
      'active', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("active" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _createdByIdMeta =
      const VerificationMeta('createdById');
  @override
  late final GeneratedColumn<String> createdById = GeneratedColumn<String>(
      'created_by_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        description,
        mandatory,
        minSelection,
        maxSelection,
        allowDuplicateSelection,
        image,
        color,
        active,
        createdById,
        deletedAt,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'options_drift';
  @override
  VerificationContext validateIntegrity(Insertable<OptionsDriftData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('mandatory')) {
      context.handle(_mandatoryMeta,
          mandatory.isAcceptableOrUnknown(data['mandatory']!, _mandatoryMeta));
    }
    if (data.containsKey('min_selection')) {
      context.handle(
          _minSelectionMeta,
          minSelection.isAcceptableOrUnknown(
              data['min_selection']!, _minSelectionMeta));
    }
    if (data.containsKey('max_selection')) {
      context.handle(
          _maxSelectionMeta,
          maxSelection.isAcceptableOrUnknown(
              data['max_selection']!, _maxSelectionMeta));
    }
    if (data.containsKey('allow_duplicate_selection')) {
      context.handle(
          _allowDuplicateSelectionMeta,
          allowDuplicateSelection.isAcceptableOrUnknown(
              data['allow_duplicate_selection']!,
              _allowDuplicateSelectionMeta));
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    }
    if (data.containsKey('color')) {
      context.handle(
          _colorMeta, color.isAcceptableOrUnknown(data['color']!, _colorMeta));
    }
    if (data.containsKey('active')) {
      context.handle(_activeMeta,
          active.isAcceptableOrUnknown(data['active']!, _activeMeta));
    }
    if (data.containsKey('created_by_id')) {
      context.handle(
          _createdByIdMeta,
          createdById.isAcceptableOrUnknown(
              data['created_by_id']!, _createdByIdMeta));
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  OptionsDriftData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OptionsDriftData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      mandatory: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}mandatory'])!,
      minSelection: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}min_selection'])!,
      maxSelection: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}max_selection'])!,
      allowDuplicateSelection: attachedDatabase.typeMapping.read(
          DriftSqlType.bool,
          data['${effectivePrefix}allow_duplicate_selection'])!,
      image: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image']),
      color: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}color']),
      active: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}active'])!,
      createdById: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_by_id']),
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $OptionsDriftTable createAlias(String alias) {
    return $OptionsDriftTable(attachedDatabase, alias);
  }
}

class OptionsDriftData extends DataClass
    implements Insertable<OptionsDriftData> {
  final String id;
  final String name;
  final String? description;
  final bool mandatory;
  final int minSelection;
  final int maxSelection;
  final bool allowDuplicateSelection;
  final String? image;
  final String? color;
  final bool active;
  final String? createdById;
  final DateTime? deletedAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  const OptionsDriftData(
      {required this.id,
      required this.name,
      this.description,
      required this.mandatory,
      required this.minSelection,
      required this.maxSelection,
      required this.allowDuplicateSelection,
      this.image,
      this.color,
      required this.active,
      this.createdById,
      this.deletedAt,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['mandatory'] = Variable<bool>(mandatory);
    map['min_selection'] = Variable<int>(minSelection);
    map['max_selection'] = Variable<int>(maxSelection);
    map['allow_duplicate_selection'] = Variable<bool>(allowDuplicateSelection);
    if (!nullToAbsent || image != null) {
      map['image'] = Variable<String>(image);
    }
    if (!nullToAbsent || color != null) {
      map['color'] = Variable<String>(color);
    }
    map['active'] = Variable<bool>(active);
    if (!nullToAbsent || createdById != null) {
      map['created_by_id'] = Variable<String>(createdById);
    }
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  OptionsDriftCompanion toCompanion(bool nullToAbsent) {
    return OptionsDriftCompanion(
      id: Value(id),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      mandatory: Value(mandatory),
      minSelection: Value(minSelection),
      maxSelection: Value(maxSelection),
      allowDuplicateSelection: Value(allowDuplicateSelection),
      image:
          image == null && nullToAbsent ? const Value.absent() : Value(image),
      color:
          color == null && nullToAbsent ? const Value.absent() : Value(color),
      active: Value(active),
      createdById: createdById == null && nullToAbsent
          ? const Value.absent()
          : Value(createdById),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory OptionsDriftData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OptionsDriftData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      mandatory: serializer.fromJson<bool>(json['mandatory']),
      minSelection: serializer.fromJson<int>(json['minSelection']),
      maxSelection: serializer.fromJson<int>(json['maxSelection']),
      allowDuplicateSelection:
          serializer.fromJson<bool>(json['allowDuplicateSelection']),
      image: serializer.fromJson<String?>(json['image']),
      color: serializer.fromJson<String?>(json['color']),
      active: serializer.fromJson<bool>(json['active']),
      createdById: serializer.fromJson<String?>(json['createdById']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'mandatory': serializer.toJson<bool>(mandatory),
      'minSelection': serializer.toJson<int>(minSelection),
      'maxSelection': serializer.toJson<int>(maxSelection),
      'allowDuplicateSelection':
          serializer.toJson<bool>(allowDuplicateSelection),
      'image': serializer.toJson<String?>(image),
      'color': serializer.toJson<String?>(color),
      'active': serializer.toJson<bool>(active),
      'createdById': serializer.toJson<String?>(createdById),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  OptionsDriftData copyWith(
          {String? id,
          String? name,
          Value<String?> description = const Value.absent(),
          bool? mandatory,
          int? minSelection,
          int? maxSelection,
          bool? allowDuplicateSelection,
          Value<String?> image = const Value.absent(),
          Value<String?> color = const Value.absent(),
          bool? active,
          Value<String?> createdById = const Value.absent(),
          Value<DateTime?> deletedAt = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      OptionsDriftData(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description.present ? description.value : this.description,
        mandatory: mandatory ?? this.mandatory,
        minSelection: minSelection ?? this.minSelection,
        maxSelection: maxSelection ?? this.maxSelection,
        allowDuplicateSelection:
            allowDuplicateSelection ?? this.allowDuplicateSelection,
        image: image.present ? image.value : this.image,
        color: color.present ? color.value : this.color,
        active: active ?? this.active,
        createdById: createdById.present ? createdById.value : this.createdById,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  OptionsDriftData copyWithCompanion(OptionsDriftCompanion data) {
    return OptionsDriftData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description:
          data.description.present ? data.description.value : this.description,
      mandatory: data.mandatory.present ? data.mandatory.value : this.mandatory,
      minSelection: data.minSelection.present
          ? data.minSelection.value
          : this.minSelection,
      maxSelection: data.maxSelection.present
          ? data.maxSelection.value
          : this.maxSelection,
      allowDuplicateSelection: data.allowDuplicateSelection.present
          ? data.allowDuplicateSelection.value
          : this.allowDuplicateSelection,
      image: data.image.present ? data.image.value : this.image,
      color: data.color.present ? data.color.value : this.color,
      active: data.active.present ? data.active.value : this.active,
      createdById:
          data.createdById.present ? data.createdById.value : this.createdById,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('OptionsDriftData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('mandatory: $mandatory, ')
          ..write('minSelection: $minSelection, ')
          ..write('maxSelection: $maxSelection, ')
          ..write('allowDuplicateSelection: $allowDuplicateSelection, ')
          ..write('image: $image, ')
          ..write('color: $color, ')
          ..write('active: $active, ')
          ..write('createdById: $createdById, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      name,
      description,
      mandatory,
      minSelection,
      maxSelection,
      allowDuplicateSelection,
      image,
      color,
      active,
      createdById,
      deletedAt,
      createdAt,
      updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OptionsDriftData &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.mandatory == this.mandatory &&
          other.minSelection == this.minSelection &&
          other.maxSelection == this.maxSelection &&
          other.allowDuplicateSelection == this.allowDuplicateSelection &&
          other.image == this.image &&
          other.color == this.color &&
          other.active == this.active &&
          other.createdById == this.createdById &&
          other.deletedAt == this.deletedAt &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class OptionsDriftCompanion extends UpdateCompanion<OptionsDriftData> {
  final Value<String> id;
  final Value<String> name;
  final Value<String?> description;
  final Value<bool> mandatory;
  final Value<int> minSelection;
  final Value<int> maxSelection;
  final Value<bool> allowDuplicateSelection;
  final Value<String?> image;
  final Value<String?> color;
  final Value<bool> active;
  final Value<String?> createdById;
  final Value<DateTime?> deletedAt;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const OptionsDriftCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.mandatory = const Value.absent(),
    this.minSelection = const Value.absent(),
    this.maxSelection = const Value.absent(),
    this.allowDuplicateSelection = const Value.absent(),
    this.image = const Value.absent(),
    this.color = const Value.absent(),
    this.active = const Value.absent(),
    this.createdById = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  OptionsDriftCompanion.insert({
    required String id,
    required String name,
    this.description = const Value.absent(),
    this.mandatory = const Value.absent(),
    this.minSelection = const Value.absent(),
    this.maxSelection = const Value.absent(),
    this.allowDuplicateSelection = const Value.absent(),
    this.image = const Value.absent(),
    this.color = const Value.absent(),
    this.active = const Value.absent(),
    this.createdById = const Value.absent(),
    this.deletedAt = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<OptionsDriftData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<bool>? mandatory,
    Expression<int>? minSelection,
    Expression<int>? maxSelection,
    Expression<bool>? allowDuplicateSelection,
    Expression<String>? image,
    Expression<String>? color,
    Expression<bool>? active,
    Expression<String>? createdById,
    Expression<DateTime>? deletedAt,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (mandatory != null) 'mandatory': mandatory,
      if (minSelection != null) 'min_selection': minSelection,
      if (maxSelection != null) 'max_selection': maxSelection,
      if (allowDuplicateSelection != null)
        'allow_duplicate_selection': allowDuplicateSelection,
      if (image != null) 'image': image,
      if (color != null) 'color': color,
      if (active != null) 'active': active,
      if (createdById != null) 'created_by_id': createdById,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  OptionsDriftCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String?>? description,
      Value<bool>? mandatory,
      Value<int>? minSelection,
      Value<int>? maxSelection,
      Value<bool>? allowDuplicateSelection,
      Value<String?>? image,
      Value<String?>? color,
      Value<bool>? active,
      Value<String?>? createdById,
      Value<DateTime?>? deletedAt,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<int>? rowid}) {
    return OptionsDriftCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      mandatory: mandatory ?? this.mandatory,
      minSelection: minSelection ?? this.minSelection,
      maxSelection: maxSelection ?? this.maxSelection,
      allowDuplicateSelection:
          allowDuplicateSelection ?? this.allowDuplicateSelection,
      image: image ?? this.image,
      color: color ?? this.color,
      active: active ?? this.active,
      createdById: createdById ?? this.createdById,
      deletedAt: deletedAt ?? this.deletedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (mandatory.present) {
      map['mandatory'] = Variable<bool>(mandatory.value);
    }
    if (minSelection.present) {
      map['min_selection'] = Variable<int>(minSelection.value);
    }
    if (maxSelection.present) {
      map['max_selection'] = Variable<int>(maxSelection.value);
    }
    if (allowDuplicateSelection.present) {
      map['allow_duplicate_selection'] =
          Variable<bool>(allowDuplicateSelection.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    if (color.present) {
      map['color'] = Variable<String>(color.value);
    }
    if (active.present) {
      map['active'] = Variable<bool>(active.value);
    }
    if (createdById.present) {
      map['created_by_id'] = Variable<String>(createdById.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OptionsDriftCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('mandatory: $mandatory, ')
          ..write('minSelection: $minSelection, ')
          ..write('maxSelection: $maxSelection, ')
          ..write('allowDuplicateSelection: $allowDuplicateSelection, ')
          ..write('image: $image, ')
          ..write('color: $color, ')
          ..write('active: $active, ')
          ..write('createdById: $createdById, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ItemsDriftTable extends ItemsDrift
    with TableInfo<$ItemsDriftTable, ItemsDriftData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ItemsDriftTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _skuMeta = const VerificationMeta('sku');
  @override
  late final GeneratedColumn<String> sku = GeneratedColumn<String>(
      'sku', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _additionalPriceMeta =
      const VerificationMeta('additionalPrice');
  @override
  late final GeneratedColumn<int> additionalPrice = GeneratedColumn<int>(
      'additional_price', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _taxRateMeta =
      const VerificationMeta('taxRate');
  @override
  late final GeneratedColumn<double> taxRate = GeneratedColumn<double>(
      'tax_rate', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(20));
  static const VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String> image = GeneratedColumn<String>(
      'image', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _colorMeta = const VerificationMeta('color');
  @override
  late final GeneratedColumn<String> color = GeneratedColumn<String>(
      'color', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _activeMeta = const VerificationMeta('active');
  @override
  late final GeneratedColumn<bool> active = GeneratedColumn<bool>(
      'active', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("active" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _inStockMeta =
      const VerificationMeta('inStock');
  @override
  late final GeneratedColumn<bool> inStock = GeneratedColumn<bool>(
      'in_stock', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("in_stock" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _displayOrderMeta =
      const VerificationMeta('displayOrder');
  @override
  late final GeneratedColumn<int> displayOrder = GeneratedColumn<int>(
      'display_order', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(1));
  static const VerificationMeta _iconMeta = const VerificationMeta('icon');
  @override
  late final GeneratedColumn<int> icon = GeneratedColumn<int>(
      'icon', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _optionIdMeta =
      const VerificationMeta('optionId');
  @override
  late final GeneratedColumn<String> optionId = GeneratedColumn<String>(
      'option_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES options_drift (id)'));
  static const VerificationMeta _createdByIdMeta =
      const VerificationMeta('createdById');
  @override
  late final GeneratedColumn<String> createdById = GeneratedColumn<String>(
      'created_by_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        description,
        sku,
        additionalPrice,
        taxRate,
        image,
        color,
        active,
        inStock,
        displayOrder,
        icon,
        optionId,
        createdById,
        createdAt,
        updatedAt,
        deletedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'items_drift';
  @override
  VerificationContext validateIntegrity(Insertable<ItemsDriftData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('sku')) {
      context.handle(
          _skuMeta, sku.isAcceptableOrUnknown(data['sku']!, _skuMeta));
    }
    if (data.containsKey('additional_price')) {
      context.handle(
          _additionalPriceMeta,
          additionalPrice.isAcceptableOrUnknown(
              data['additional_price']!, _additionalPriceMeta));
    }
    if (data.containsKey('tax_rate')) {
      context.handle(_taxRateMeta,
          taxRate.isAcceptableOrUnknown(data['tax_rate']!, _taxRateMeta));
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    }
    if (data.containsKey('color')) {
      context.handle(
          _colorMeta, color.isAcceptableOrUnknown(data['color']!, _colorMeta));
    }
    if (data.containsKey('active')) {
      context.handle(_activeMeta,
          active.isAcceptableOrUnknown(data['active']!, _activeMeta));
    }
    if (data.containsKey('in_stock')) {
      context.handle(_inStockMeta,
          inStock.isAcceptableOrUnknown(data['in_stock']!, _inStockMeta));
    }
    if (data.containsKey('display_order')) {
      context.handle(
          _displayOrderMeta,
          displayOrder.isAcceptableOrUnknown(
              data['display_order']!, _displayOrderMeta));
    }
    if (data.containsKey('icon')) {
      context.handle(
          _iconMeta, icon.isAcceptableOrUnknown(data['icon']!, _iconMeta));
    }
    if (data.containsKey('option_id')) {
      context.handle(_optionIdMeta,
          optionId.isAcceptableOrUnknown(data['option_id']!, _optionIdMeta));
    } else if (isInserting) {
      context.missing(_optionIdMeta);
    }
    if (data.containsKey('created_by_id')) {
      context.handle(
          _createdByIdMeta,
          createdById.isAcceptableOrUnknown(
              data['created_by_id']!, _createdByIdMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  ItemsDriftData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ItemsDriftData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      sku: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sku']),
      additionalPrice: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}additional_price'])!,
      taxRate: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}tax_rate'])!,
      image: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image']),
      color: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}color']),
      active: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}active'])!,
      inStock: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}in_stock'])!,
      displayOrder: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}display_order'])!,
      icon: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}icon']),
      optionId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}option_id'])!,
      createdById: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_by_id']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
    );
  }

  @override
  $ItemsDriftTable createAlias(String alias) {
    return $ItemsDriftTable(attachedDatabase, alias);
  }
}

class ItemsDriftData extends DataClass implements Insertable<ItemsDriftData> {
  final String id;
  final String name;
  final String? description;
  final String? sku;
  final int additionalPrice;
  final double taxRate;
  final String? image;
  final String? color;
  final bool active;
  final bool inStock;
  final int displayOrder;
  final int? icon;
  final String optionId;
  final String? createdById;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  const ItemsDriftData(
      {required this.id,
      required this.name,
      this.description,
      this.sku,
      required this.additionalPrice,
      required this.taxRate,
      this.image,
      this.color,
      required this.active,
      required this.inStock,
      required this.displayOrder,
      this.icon,
      required this.optionId,
      this.createdById,
      required this.createdAt,
      required this.updatedAt,
      this.deletedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || sku != null) {
      map['sku'] = Variable<String>(sku);
    }
    map['additional_price'] = Variable<int>(additionalPrice);
    map['tax_rate'] = Variable<double>(taxRate);
    if (!nullToAbsent || image != null) {
      map['image'] = Variable<String>(image);
    }
    if (!nullToAbsent || color != null) {
      map['color'] = Variable<String>(color);
    }
    map['active'] = Variable<bool>(active);
    map['in_stock'] = Variable<bool>(inStock);
    map['display_order'] = Variable<int>(displayOrder);
    if (!nullToAbsent || icon != null) {
      map['icon'] = Variable<int>(icon);
    }
    map['option_id'] = Variable<String>(optionId);
    if (!nullToAbsent || createdById != null) {
      map['created_by_id'] = Variable<String>(createdById);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  ItemsDriftCompanion toCompanion(bool nullToAbsent) {
    return ItemsDriftCompanion(
      id: Value(id),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      sku: sku == null && nullToAbsent ? const Value.absent() : Value(sku),
      additionalPrice: Value(additionalPrice),
      taxRate: Value(taxRate),
      image:
          image == null && nullToAbsent ? const Value.absent() : Value(image),
      color:
          color == null && nullToAbsent ? const Value.absent() : Value(color),
      active: Value(active),
      inStock: Value(inStock),
      displayOrder: Value(displayOrder),
      icon: icon == null && nullToAbsent ? const Value.absent() : Value(icon),
      optionId: Value(optionId),
      createdById: createdById == null && nullToAbsent
          ? const Value.absent()
          : Value(createdById),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory ItemsDriftData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ItemsDriftData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      sku: serializer.fromJson<String?>(json['sku']),
      additionalPrice: serializer.fromJson<int>(json['additionalPrice']),
      taxRate: serializer.fromJson<double>(json['taxRate']),
      image: serializer.fromJson<String?>(json['image']),
      color: serializer.fromJson<String?>(json['color']),
      active: serializer.fromJson<bool>(json['active']),
      inStock: serializer.fromJson<bool>(json['inStock']),
      displayOrder: serializer.fromJson<int>(json['displayOrder']),
      icon: serializer.fromJson<int?>(json['icon']),
      optionId: serializer.fromJson<String>(json['optionId']),
      createdById: serializer.fromJson<String?>(json['createdById']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'sku': serializer.toJson<String?>(sku),
      'additionalPrice': serializer.toJson<int>(additionalPrice),
      'taxRate': serializer.toJson<double>(taxRate),
      'image': serializer.toJson<String?>(image),
      'color': serializer.toJson<String?>(color),
      'active': serializer.toJson<bool>(active),
      'inStock': serializer.toJson<bool>(inStock),
      'displayOrder': serializer.toJson<int>(displayOrder),
      'icon': serializer.toJson<int?>(icon),
      'optionId': serializer.toJson<String>(optionId),
      'createdById': serializer.toJson<String?>(createdById),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  ItemsDriftData copyWith(
          {String? id,
          String? name,
          Value<String?> description = const Value.absent(),
          Value<String?> sku = const Value.absent(),
          int? additionalPrice,
          double? taxRate,
          Value<String?> image = const Value.absent(),
          Value<String?> color = const Value.absent(),
          bool? active,
          bool? inStock,
          int? displayOrder,
          Value<int?> icon = const Value.absent(),
          String? optionId,
          Value<String?> createdById = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt,
          Value<DateTime?> deletedAt = const Value.absent()}) =>
      ItemsDriftData(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description.present ? description.value : this.description,
        sku: sku.present ? sku.value : this.sku,
        additionalPrice: additionalPrice ?? this.additionalPrice,
        taxRate: taxRate ?? this.taxRate,
        image: image.present ? image.value : this.image,
        color: color.present ? color.value : this.color,
        active: active ?? this.active,
        inStock: inStock ?? this.inStock,
        displayOrder: displayOrder ?? this.displayOrder,
        icon: icon.present ? icon.value : this.icon,
        optionId: optionId ?? this.optionId,
        createdById: createdById.present ? createdById.value : this.createdById,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
      );
  ItemsDriftData copyWithCompanion(ItemsDriftCompanion data) {
    return ItemsDriftData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description:
          data.description.present ? data.description.value : this.description,
      sku: data.sku.present ? data.sku.value : this.sku,
      additionalPrice: data.additionalPrice.present
          ? data.additionalPrice.value
          : this.additionalPrice,
      taxRate: data.taxRate.present ? data.taxRate.value : this.taxRate,
      image: data.image.present ? data.image.value : this.image,
      color: data.color.present ? data.color.value : this.color,
      active: data.active.present ? data.active.value : this.active,
      inStock: data.inStock.present ? data.inStock.value : this.inStock,
      displayOrder: data.displayOrder.present
          ? data.displayOrder.value
          : this.displayOrder,
      icon: data.icon.present ? data.icon.value : this.icon,
      optionId: data.optionId.present ? data.optionId.value : this.optionId,
      createdById:
          data.createdById.present ? data.createdById.value : this.createdById,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ItemsDriftData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('sku: $sku, ')
          ..write('additionalPrice: $additionalPrice, ')
          ..write('taxRate: $taxRate, ')
          ..write('image: $image, ')
          ..write('color: $color, ')
          ..write('active: $active, ')
          ..write('inStock: $inStock, ')
          ..write('displayOrder: $displayOrder, ')
          ..write('icon: $icon, ')
          ..write('optionId: $optionId, ')
          ..write('createdById: $createdById, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      name,
      description,
      sku,
      additionalPrice,
      taxRate,
      image,
      color,
      active,
      inStock,
      displayOrder,
      icon,
      optionId,
      createdById,
      createdAt,
      updatedAt,
      deletedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ItemsDriftData &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.sku == this.sku &&
          other.additionalPrice == this.additionalPrice &&
          other.taxRate == this.taxRate &&
          other.image == this.image &&
          other.color == this.color &&
          other.active == this.active &&
          other.inStock == this.inStock &&
          other.displayOrder == this.displayOrder &&
          other.icon == this.icon &&
          other.optionId == this.optionId &&
          other.createdById == this.createdById &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt);
}

class ItemsDriftCompanion extends UpdateCompanion<ItemsDriftData> {
  final Value<String> id;
  final Value<String> name;
  final Value<String?> description;
  final Value<String?> sku;
  final Value<int> additionalPrice;
  final Value<double> taxRate;
  final Value<String?> image;
  final Value<String?> color;
  final Value<bool> active;
  final Value<bool> inStock;
  final Value<int> displayOrder;
  final Value<int?> icon;
  final Value<String> optionId;
  final Value<String?> createdById;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<int> rowid;
  const ItemsDriftCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.sku = const Value.absent(),
    this.additionalPrice = const Value.absent(),
    this.taxRate = const Value.absent(),
    this.image = const Value.absent(),
    this.color = const Value.absent(),
    this.active = const Value.absent(),
    this.inStock = const Value.absent(),
    this.displayOrder = const Value.absent(),
    this.icon = const Value.absent(),
    this.optionId = const Value.absent(),
    this.createdById = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ItemsDriftCompanion.insert({
    required String id,
    required String name,
    this.description = const Value.absent(),
    this.sku = const Value.absent(),
    this.additionalPrice = const Value.absent(),
    this.taxRate = const Value.absent(),
    this.image = const Value.absent(),
    this.color = const Value.absent(),
    this.active = const Value.absent(),
    this.inStock = const Value.absent(),
    this.displayOrder = const Value.absent(),
    this.icon = const Value.absent(),
    required String optionId,
    this.createdById = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        optionId = Value(optionId),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<ItemsDriftData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? sku,
    Expression<int>? additionalPrice,
    Expression<double>? taxRate,
    Expression<String>? image,
    Expression<String>? color,
    Expression<bool>? active,
    Expression<bool>? inStock,
    Expression<int>? displayOrder,
    Expression<int>? icon,
    Expression<String>? optionId,
    Expression<String>? createdById,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (sku != null) 'sku': sku,
      if (additionalPrice != null) 'additional_price': additionalPrice,
      if (taxRate != null) 'tax_rate': taxRate,
      if (image != null) 'image': image,
      if (color != null) 'color': color,
      if (active != null) 'active': active,
      if (inStock != null) 'in_stock': inStock,
      if (displayOrder != null) 'display_order': displayOrder,
      if (icon != null) 'icon': icon,
      if (optionId != null) 'option_id': optionId,
      if (createdById != null) 'created_by_id': createdById,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ItemsDriftCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String?>? description,
      Value<String?>? sku,
      Value<int>? additionalPrice,
      Value<double>? taxRate,
      Value<String?>? image,
      Value<String?>? color,
      Value<bool>? active,
      Value<bool>? inStock,
      Value<int>? displayOrder,
      Value<int?>? icon,
      Value<String>? optionId,
      Value<String?>? createdById,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<DateTime?>? deletedAt,
      Value<int>? rowid}) {
    return ItemsDriftCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      sku: sku ?? this.sku,
      additionalPrice: additionalPrice ?? this.additionalPrice,
      taxRate: taxRate ?? this.taxRate,
      image: image ?? this.image,
      color: color ?? this.color,
      active: active ?? this.active,
      inStock: inStock ?? this.inStock,
      displayOrder: displayOrder ?? this.displayOrder,
      icon: icon ?? this.icon,
      optionId: optionId ?? this.optionId,
      createdById: createdById ?? this.createdById,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (sku.present) {
      map['sku'] = Variable<String>(sku.value);
    }
    if (additionalPrice.present) {
      map['additional_price'] = Variable<int>(additionalPrice.value);
    }
    if (taxRate.present) {
      map['tax_rate'] = Variable<double>(taxRate.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    if (color.present) {
      map['color'] = Variable<String>(color.value);
    }
    if (active.present) {
      map['active'] = Variable<bool>(active.value);
    }
    if (inStock.present) {
      map['in_stock'] = Variable<bool>(inStock.value);
    }
    if (displayOrder.present) {
      map['display_order'] = Variable<int>(displayOrder.value);
    }
    if (icon.present) {
      map['icon'] = Variable<int>(icon.value);
    }
    if (optionId.present) {
      map['option_id'] = Variable<String>(optionId.value);
    }
    if (createdById.present) {
      map['created_by_id'] = Variable<String>(createdById.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ItemsDriftCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('sku: $sku, ')
          ..write('additionalPrice: $additionalPrice, ')
          ..write('taxRate: $taxRate, ')
          ..write('image: $image, ')
          ..write('color: $color, ')
          ..write('active: $active, ')
          ..write('inStock: $inStock, ')
          ..write('displayOrder: $displayOrder, ')
          ..write('icon: $icon, ')
          ..write('optionId: $optionId, ')
          ..write('createdById: $createdById, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $ProductsOptionsDriftTable extends ProductsOptionsDrift
    with TableInfo<$ProductsOptionsDriftTable, ProductsOptionsDriftData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductsOptionsDriftTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _productIdMeta =
      const VerificationMeta('productId');
  @override
  late final GeneratedColumn<String> productId = GeneratedColumn<String>(
      'product_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES products_drift (id)'));
  static const VerificationMeta _optionIdMeta =
      const VerificationMeta('optionId');
  @override
  late final GeneratedColumn<String> optionId = GeneratedColumn<String>(
      'option_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES options_drift (id)'));
  static const VerificationMeta _createdByIdMeta =
      const VerificationMeta('createdById');
  @override
  late final GeneratedColumn<String> createdById = GeneratedColumn<String>(
      'created_by_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [productId, optionId, createdById, createdAt, updatedAt, deletedAt];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'products_options_drift';
  @override
  VerificationContext validateIntegrity(
      Insertable<ProductsOptionsDriftData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('product_id')) {
      context.handle(_productIdMeta,
          productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta));
    } else if (isInserting) {
      context.missing(_productIdMeta);
    }
    if (data.containsKey('option_id')) {
      context.handle(_optionIdMeta,
          optionId.isAcceptableOrUnknown(data['option_id']!, _optionIdMeta));
    } else if (isInserting) {
      context.missing(_optionIdMeta);
    }
    if (data.containsKey('created_by_id')) {
      context.handle(
          _createdByIdMeta,
          createdById.isAcceptableOrUnknown(
              data['created_by_id']!, _createdByIdMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {productId, optionId};
  @override
  ProductsOptionsDriftData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProductsOptionsDriftData(
      productId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}product_id'])!,
      optionId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}option_id'])!,
      createdById: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_by_id']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
    );
  }

  @override
  $ProductsOptionsDriftTable createAlias(String alias) {
    return $ProductsOptionsDriftTable(attachedDatabase, alias);
  }
}

class ProductsOptionsDriftData extends DataClass
    implements Insertable<ProductsOptionsDriftData> {
  final String productId;
  final String optionId;
  final String? createdById;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  const ProductsOptionsDriftData(
      {required this.productId,
      required this.optionId,
      this.createdById,
      required this.createdAt,
      required this.updatedAt,
      this.deletedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['product_id'] = Variable<String>(productId);
    map['option_id'] = Variable<String>(optionId);
    if (!nullToAbsent || createdById != null) {
      map['created_by_id'] = Variable<String>(createdById);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  ProductsOptionsDriftCompanion toCompanion(bool nullToAbsent) {
    return ProductsOptionsDriftCompanion(
      productId: Value(productId),
      optionId: Value(optionId),
      createdById: createdById == null && nullToAbsent
          ? const Value.absent()
          : Value(createdById),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory ProductsOptionsDriftData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProductsOptionsDriftData(
      productId: serializer.fromJson<String>(json['productId']),
      optionId: serializer.fromJson<String>(json['optionId']),
      createdById: serializer.fromJson<String?>(json['createdById']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'productId': serializer.toJson<String>(productId),
      'optionId': serializer.toJson<String>(optionId),
      'createdById': serializer.toJson<String?>(createdById),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  ProductsOptionsDriftData copyWith(
          {String? productId,
          String? optionId,
          Value<String?> createdById = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt,
          Value<DateTime?> deletedAt = const Value.absent()}) =>
      ProductsOptionsDriftData(
        productId: productId ?? this.productId,
        optionId: optionId ?? this.optionId,
        createdById: createdById.present ? createdById.value : this.createdById,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
      );
  ProductsOptionsDriftData copyWithCompanion(
      ProductsOptionsDriftCompanion data) {
    return ProductsOptionsDriftData(
      productId: data.productId.present ? data.productId.value : this.productId,
      optionId: data.optionId.present ? data.optionId.value : this.optionId,
      createdById:
          data.createdById.present ? data.createdById.value : this.createdById,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProductsOptionsDriftData(')
          ..write('productId: $productId, ')
          ..write('optionId: $optionId, ')
          ..write('createdById: $createdById, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      productId, optionId, createdById, createdAt, updatedAt, deletedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductsOptionsDriftData &&
          other.productId == this.productId &&
          other.optionId == this.optionId &&
          other.createdById == this.createdById &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt);
}

class ProductsOptionsDriftCompanion
    extends UpdateCompanion<ProductsOptionsDriftData> {
  final Value<String> productId;
  final Value<String> optionId;
  final Value<String?> createdById;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<int> rowid;
  const ProductsOptionsDriftCompanion({
    this.productId = const Value.absent(),
    this.optionId = const Value.absent(),
    this.createdById = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  ProductsOptionsDriftCompanion.insert({
    required String productId,
    required String optionId,
    this.createdById = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : productId = Value(productId),
        optionId = Value(optionId),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<ProductsOptionsDriftData> custom({
    Expression<String>? productId,
    Expression<String>? optionId,
    Expression<String>? createdById,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (productId != null) 'product_id': productId,
      if (optionId != null) 'option_id': optionId,
      if (createdById != null) 'created_by_id': createdById,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  ProductsOptionsDriftCompanion copyWith(
      {Value<String>? productId,
      Value<String>? optionId,
      Value<String?>? createdById,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<DateTime?>? deletedAt,
      Value<int>? rowid}) {
    return ProductsOptionsDriftCompanion(
      productId: productId ?? this.productId,
      optionId: optionId ?? this.optionId,
      createdById: createdById ?? this.createdById,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (productId.present) {
      map['product_id'] = Variable<String>(productId.value);
    }
    if (optionId.present) {
      map['option_id'] = Variable<String>(optionId.value);
    }
    if (createdById.present) {
      map['created_by_id'] = Variable<String>(createdById.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductsOptionsDriftCompanion(')
          ..write('productId: $productId, ')
          ..write('optionId: $optionId, ')
          ..write('createdById: $createdById, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $AuditLogsDriftTable extends AuditLogsDrift
    with TableInfo<$AuditLogsDriftTable, AuditLogsDriftData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $AuditLogsDriftTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _actorUserIdMeta =
      const VerificationMeta('actorUserId');
  @override
  late final GeneratedColumn<String> actorUserId = GeneratedColumn<String>(
      'actor_user_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _actionMeta = const VerificationMeta('action');
  @override
  late final GeneratedColumn<String> action = GeneratedColumn<String>(
      'action', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _auditedEntityNameMeta =
      const VerificationMeta('auditedEntityName');
  @override
  late final GeneratedColumn<String> auditedEntityName =
      GeneratedColumn<String>('audited_entity_name', aliasedName, false,
          type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _entityIdMeta =
      const VerificationMeta('entityId');
  @override
  late final GeneratedColumn<String> entityId = GeneratedColumn<String>(
      'entity_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _metadataMeta =
      const VerificationMeta('metadata');
  @override
  late final GeneratedColumn<String> metadata = GeneratedColumn<String>(
      'metadata', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        actorUserId,
        action,
        auditedEntityName,
        entityId,
        metadata,
        createdAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'audit_logs_drift';
  @override
  VerificationContext validateIntegrity(Insertable<AuditLogsDriftData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('actor_user_id')) {
      context.handle(
          _actorUserIdMeta,
          actorUserId.isAcceptableOrUnknown(
              data['actor_user_id']!, _actorUserIdMeta));
    }
    if (data.containsKey('action')) {
      context.handle(_actionMeta,
          action.isAcceptableOrUnknown(data['action']!, _actionMeta));
    } else if (isInserting) {
      context.missing(_actionMeta);
    }
    if (data.containsKey('audited_entity_name')) {
      context.handle(
          _auditedEntityNameMeta,
          auditedEntityName.isAcceptableOrUnknown(
              data['audited_entity_name']!, _auditedEntityNameMeta));
    } else if (isInserting) {
      context.missing(_auditedEntityNameMeta);
    }
    if (data.containsKey('entity_id')) {
      context.handle(_entityIdMeta,
          entityId.isAcceptableOrUnknown(data['entity_id']!, _entityIdMeta));
    }
    if (data.containsKey('metadata')) {
      context.handle(_metadataMeta,
          metadata.isAcceptableOrUnknown(data['metadata']!, _metadataMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  AuditLogsDriftData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return AuditLogsDriftData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      actorUserId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}actor_user_id']),
      action: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}action'])!,
      auditedEntityName: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}audited_entity_name'])!,
      entityId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}entity_id']),
      metadata: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}metadata']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
    );
  }

  @override
  $AuditLogsDriftTable createAlias(String alias) {
    return $AuditLogsDriftTable(attachedDatabase, alias);
  }
}

class AuditLogsDriftData extends DataClass
    implements Insertable<AuditLogsDriftData> {
  final String id;
  final String? actorUserId;
  final String action;
  final String auditedEntityName;
  final String? entityId;
  final String? metadata;
  final DateTime createdAt;
  const AuditLogsDriftData(
      {required this.id,
      this.actorUserId,
      required this.action,
      required this.auditedEntityName,
      this.entityId,
      this.metadata,
      required this.createdAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || actorUserId != null) {
      map['actor_user_id'] = Variable<String>(actorUserId);
    }
    map['action'] = Variable<String>(action);
    map['audited_entity_name'] = Variable<String>(auditedEntityName);
    if (!nullToAbsent || entityId != null) {
      map['entity_id'] = Variable<String>(entityId);
    }
    if (!nullToAbsent || metadata != null) {
      map['metadata'] = Variable<String>(metadata);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    return map;
  }

  AuditLogsDriftCompanion toCompanion(bool nullToAbsent) {
    return AuditLogsDriftCompanion(
      id: Value(id),
      actorUserId: actorUserId == null && nullToAbsent
          ? const Value.absent()
          : Value(actorUserId),
      action: Value(action),
      auditedEntityName: Value(auditedEntityName),
      entityId: entityId == null && nullToAbsent
          ? const Value.absent()
          : Value(entityId),
      metadata: metadata == null && nullToAbsent
          ? const Value.absent()
          : Value(metadata),
      createdAt: Value(createdAt),
    );
  }

  factory AuditLogsDriftData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return AuditLogsDriftData(
      id: serializer.fromJson<String>(json['id']),
      actorUserId: serializer.fromJson<String?>(json['actorUserId']),
      action: serializer.fromJson<String>(json['action']),
      auditedEntityName: serializer.fromJson<String>(json['auditedEntityName']),
      entityId: serializer.fromJson<String?>(json['entityId']),
      metadata: serializer.fromJson<String?>(json['metadata']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'actorUserId': serializer.toJson<String?>(actorUserId),
      'action': serializer.toJson<String>(action),
      'auditedEntityName': serializer.toJson<String>(auditedEntityName),
      'entityId': serializer.toJson<String?>(entityId),
      'metadata': serializer.toJson<String?>(metadata),
      'createdAt': serializer.toJson<DateTime>(createdAt),
    };
  }

  AuditLogsDriftData copyWith(
          {String? id,
          Value<String?> actorUserId = const Value.absent(),
          String? action,
          String? auditedEntityName,
          Value<String?> entityId = const Value.absent(),
          Value<String?> metadata = const Value.absent(),
          DateTime? createdAt}) =>
      AuditLogsDriftData(
        id: id ?? this.id,
        actorUserId: actorUserId.present ? actorUserId.value : this.actorUserId,
        action: action ?? this.action,
        auditedEntityName: auditedEntityName ?? this.auditedEntityName,
        entityId: entityId.present ? entityId.value : this.entityId,
        metadata: metadata.present ? metadata.value : this.metadata,
        createdAt: createdAt ?? this.createdAt,
      );
  AuditLogsDriftData copyWithCompanion(AuditLogsDriftCompanion data) {
    return AuditLogsDriftData(
      id: data.id.present ? data.id.value : this.id,
      actorUserId:
          data.actorUserId.present ? data.actorUserId.value : this.actorUserId,
      action: data.action.present ? data.action.value : this.action,
      auditedEntityName: data.auditedEntityName.present
          ? data.auditedEntityName.value
          : this.auditedEntityName,
      entityId: data.entityId.present ? data.entityId.value : this.entityId,
      metadata: data.metadata.present ? data.metadata.value : this.metadata,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('AuditLogsDriftData(')
          ..write('id: $id, ')
          ..write('actorUserId: $actorUserId, ')
          ..write('action: $action, ')
          ..write('auditedEntityName: $auditedEntityName, ')
          ..write('entityId: $entityId, ')
          ..write('metadata: $metadata, ')
          ..write('createdAt: $createdAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, actorUserId, action, auditedEntityName,
      entityId, metadata, createdAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is AuditLogsDriftData &&
          other.id == this.id &&
          other.actorUserId == this.actorUserId &&
          other.action == this.action &&
          other.auditedEntityName == this.auditedEntityName &&
          other.entityId == this.entityId &&
          other.metadata == this.metadata &&
          other.createdAt == this.createdAt);
}

class AuditLogsDriftCompanion extends UpdateCompanion<AuditLogsDriftData> {
  final Value<String> id;
  final Value<String?> actorUserId;
  final Value<String> action;
  final Value<String> auditedEntityName;
  final Value<String?> entityId;
  final Value<String?> metadata;
  final Value<DateTime> createdAt;
  final Value<int> rowid;
  const AuditLogsDriftCompanion({
    this.id = const Value.absent(),
    this.actorUserId = const Value.absent(),
    this.action = const Value.absent(),
    this.auditedEntityName = const Value.absent(),
    this.entityId = const Value.absent(),
    this.metadata = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  AuditLogsDriftCompanion.insert({
    required String id,
    this.actorUserId = const Value.absent(),
    required String action,
    required String auditedEntityName,
    this.entityId = const Value.absent(),
    this.metadata = const Value.absent(),
    required DateTime createdAt,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        action = Value(action),
        auditedEntityName = Value(auditedEntityName),
        createdAt = Value(createdAt);
  static Insertable<AuditLogsDriftData> custom({
    Expression<String>? id,
    Expression<String>? actorUserId,
    Expression<String>? action,
    Expression<String>? auditedEntityName,
    Expression<String>? entityId,
    Expression<String>? metadata,
    Expression<DateTime>? createdAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (actorUserId != null) 'actor_user_id': actorUserId,
      if (action != null) 'action': action,
      if (auditedEntityName != null) 'audited_entity_name': auditedEntityName,
      if (entityId != null) 'entity_id': entityId,
      if (metadata != null) 'metadata': metadata,
      if (createdAt != null) 'created_at': createdAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  AuditLogsDriftCompanion copyWith(
      {Value<String>? id,
      Value<String?>? actorUserId,
      Value<String>? action,
      Value<String>? auditedEntityName,
      Value<String?>? entityId,
      Value<String?>? metadata,
      Value<DateTime>? createdAt,
      Value<int>? rowid}) {
    return AuditLogsDriftCompanion(
      id: id ?? this.id,
      actorUserId: actorUserId ?? this.actorUserId,
      action: action ?? this.action,
      auditedEntityName: auditedEntityName ?? this.auditedEntityName,
      entityId: entityId ?? this.entityId,
      metadata: metadata ?? this.metadata,
      createdAt: createdAt ?? this.createdAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (actorUserId.present) {
      map['actor_user_id'] = Variable<String>(actorUserId.value);
    }
    if (action.present) {
      map['action'] = Variable<String>(action.value);
    }
    if (auditedEntityName.present) {
      map['audited_entity_name'] = Variable<String>(auditedEntityName.value);
    }
    if (entityId.present) {
      map['entity_id'] = Variable<String>(entityId.value);
    }
    if (metadata.present) {
      map['metadata'] = Variable<String>(metadata.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('AuditLogsDriftCompanion(')
          ..write('id: $id, ')
          ..write('actorUserId: $actorUserId, ')
          ..write('action: $action, ')
          ..write('auditedEntityName: $auditedEntityName, ')
          ..write('entityId: $entityId, ')
          ..write('metadata: $metadata, ')
          ..write('createdAt: $createdAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PlanDriftTable extends PlanDrift
    with TableInfo<$PlanDriftTable, PlanDriftData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PlanDriftTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _activeMeta = const VerificationMeta('active');
  @override
  late final GeneratedColumn<bool> active = GeneratedColumn<bool>(
      'active', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("active" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _deliveryMeta =
      const VerificationMeta('delivery');
  @override
  late final GeneratedColumn<bool> delivery = GeneratedColumn<bool>(
      'delivery', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("delivery" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _colorMeta = const VerificationMeta('color');
  @override
  late final GeneratedColumn<int> color = GeneratedColumn<int>(
      'color', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _createdByIdMeta =
      const VerificationMeta('createdById');
  @override
  late final GeneratedColumn<String> createdById = GeneratedColumn<String>(
      'created_by_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        active,
        delivery,
        color,
        createdById,
        createdAt,
        updatedAt,
        deletedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'plan_drift';
  @override
  VerificationContext validateIntegrity(Insertable<PlanDriftData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('active')) {
      context.handle(_activeMeta,
          active.isAcceptableOrUnknown(data['active']!, _activeMeta));
    }
    if (data.containsKey('delivery')) {
      context.handle(_deliveryMeta,
          delivery.isAcceptableOrUnknown(data['delivery']!, _deliveryMeta));
    }
    if (data.containsKey('color')) {
      context.handle(
          _colorMeta, color.isAcceptableOrUnknown(data['color']!, _colorMeta));
    }
    if (data.containsKey('created_by_id')) {
      context.handle(
          _createdByIdMeta,
          createdById.isAcceptableOrUnknown(
              data['created_by_id']!, _createdByIdMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PlanDriftData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PlanDriftData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      active: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}active'])!,
      delivery: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}delivery'])!,
      color: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}color']),
      createdById: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_by_id']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
    );
  }

  @override
  $PlanDriftTable createAlias(String alias) {
    return $PlanDriftTable(attachedDatabase, alias);
  }
}

class PlanDriftData extends DataClass implements Insertable<PlanDriftData> {
  final String id;
  final String name;
  final bool active;
  final bool delivery;
  final int? color;
  final String? createdById;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  const PlanDriftData(
      {required this.id,
      required this.name,
      required this.active,
      required this.delivery,
      this.color,
      this.createdById,
      required this.createdAt,
      required this.updatedAt,
      this.deletedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['active'] = Variable<bool>(active);
    map['delivery'] = Variable<bool>(delivery);
    if (!nullToAbsent || color != null) {
      map['color'] = Variable<int>(color);
    }
    if (!nullToAbsent || createdById != null) {
      map['created_by_id'] = Variable<String>(createdById);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  PlanDriftCompanion toCompanion(bool nullToAbsent) {
    return PlanDriftCompanion(
      id: Value(id),
      name: Value(name),
      active: Value(active),
      delivery: Value(delivery),
      color:
          color == null && nullToAbsent ? const Value.absent() : Value(color),
      createdById: createdById == null && nullToAbsent
          ? const Value.absent()
          : Value(createdById),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory PlanDriftData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PlanDriftData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      active: serializer.fromJson<bool>(json['active']),
      delivery: serializer.fromJson<bool>(json['delivery']),
      color: serializer.fromJson<int?>(json['color']),
      createdById: serializer.fromJson<String?>(json['createdById']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'active': serializer.toJson<bool>(active),
      'delivery': serializer.toJson<bool>(delivery),
      'color': serializer.toJson<int?>(color),
      'createdById': serializer.toJson<String?>(createdById),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  PlanDriftData copyWith(
          {String? id,
          String? name,
          bool? active,
          bool? delivery,
          Value<int?> color = const Value.absent(),
          Value<String?> createdById = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt,
          Value<DateTime?> deletedAt = const Value.absent()}) =>
      PlanDriftData(
        id: id ?? this.id,
        name: name ?? this.name,
        active: active ?? this.active,
        delivery: delivery ?? this.delivery,
        color: color.present ? color.value : this.color,
        createdById: createdById.present ? createdById.value : this.createdById,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
      );
  PlanDriftData copyWithCompanion(PlanDriftCompanion data) {
    return PlanDriftData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      active: data.active.present ? data.active.value : this.active,
      delivery: data.delivery.present ? data.delivery.value : this.delivery,
      color: data.color.present ? data.color.value : this.color,
      createdById:
          data.createdById.present ? data.createdById.value : this.createdById,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PlanDriftData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('active: $active, ')
          ..write('delivery: $delivery, ')
          ..write('color: $color, ')
          ..write('createdById: $createdById, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, active, delivery, color,
      createdById, createdAt, updatedAt, deletedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PlanDriftData &&
          other.id == this.id &&
          other.name == this.name &&
          other.active == this.active &&
          other.delivery == this.delivery &&
          other.color == this.color &&
          other.createdById == this.createdById &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt);
}

class PlanDriftCompanion extends UpdateCompanion<PlanDriftData> {
  final Value<String> id;
  final Value<String> name;
  final Value<bool> active;
  final Value<bool> delivery;
  final Value<int?> color;
  final Value<String?> createdById;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<int> rowid;
  const PlanDriftCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.active = const Value.absent(),
    this.delivery = const Value.absent(),
    this.color = const Value.absent(),
    this.createdById = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PlanDriftCompanion.insert({
    required String id,
    required String name,
    this.active = const Value.absent(),
    this.delivery = const Value.absent(),
    this.color = const Value.absent(),
    this.createdById = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<PlanDriftData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<bool>? active,
    Expression<bool>? delivery,
    Expression<int>? color,
    Expression<String>? createdById,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (active != null) 'active': active,
      if (delivery != null) 'delivery': delivery,
      if (color != null) 'color': color,
      if (createdById != null) 'created_by_id': createdById,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PlanDriftCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<bool>? active,
      Value<bool>? delivery,
      Value<int?>? color,
      Value<String?>? createdById,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<DateTime?>? deletedAt,
      Value<int>? rowid}) {
    return PlanDriftCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      active: active ?? this.active,
      delivery: delivery ?? this.delivery,
      color: color ?? this.color,
      createdById: createdById ?? this.createdById,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (active.present) {
      map['active'] = Variable<bool>(active.value);
    }
    if (delivery.present) {
      map['delivery'] = Variable<bool>(delivery.value);
    }
    if (color.present) {
      map['color'] = Variable<int>(color.value);
    }
    if (createdById.present) {
      map['created_by_id'] = Variable<String>(createdById.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PlanDriftCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('active: $active, ')
          ..write('delivery: $delivery, ')
          ..write('color: $color, ')
          ..write('createdById: $createdById, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $RestaurantTableDriftTable extends RestaurantTableDrift
    with TableInfo<$RestaurantTableDriftTable, RestaurantTableDriftData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $RestaurantTableDriftTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('empty'));
  static const VerificationMeta _shapeMeta = const VerificationMeta('shape');
  @override
  late final GeneratedColumn<String> shape = GeneratedColumn<String>(
      'shape', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('square'));
  static const VerificationMeta _xMeta = const VerificationMeta('x');
  @override
  late final GeneratedColumn<double> x = GeneratedColumn<double>(
      'x', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _yMeta = const VerificationMeta('y');
  @override
  late final GeneratedColumn<double> y = GeneratedColumn<double>(
      'y', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _rotationMeta =
      const VerificationMeta('rotation');
  @override
  late final GeneratedColumn<double> rotation = GeneratedColumn<double>(
      'rotation', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _widthMeta = const VerificationMeta('width');
  @override
  late final GeneratedColumn<int> width = GeneratedColumn<int>(
      'width', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(100));
  static const VerificationMeta _heightMeta = const VerificationMeta('height');
  @override
  late final GeneratedColumn<int> height = GeneratedColumn<int>(
      'height', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(100));
  static const VerificationMeta _colorMeta = const VerificationMeta('color');
  @override
  late final GeneratedColumn<int> color = GeneratedColumn<int>(
      'color', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _seatsMeta = const VerificationMeta('seats');
  @override
  late final GeneratedColumn<int> seats = GeneratedColumn<int>(
      'seats', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(2));
  static const VerificationMeta _planIdMeta = const VerificationMeta('planId');
  @override
  late final GeneratedColumn<String> planId = GeneratedColumn<String>(
      'plan_id', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('REFERENCES plan_drift (id)'));
  static const VerificationMeta _isActiveMeta =
      const VerificationMeta('isActive');
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
      'is_active', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_active" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _createdByIdMeta =
      const VerificationMeta('createdById');
  @override
  late final GeneratedColumn<String> createdById = GeneratedColumn<String>(
      'created_by_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        status,
        shape,
        x,
        y,
        rotation,
        width,
        height,
        color,
        seats,
        planId,
        isActive,
        createdById,
        createdAt,
        updatedAt,
        deletedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'restaurant_table_drift';
  @override
  VerificationContext validateIntegrity(
      Insertable<RestaurantTableDriftData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('shape')) {
      context.handle(
          _shapeMeta, shape.isAcceptableOrUnknown(data['shape']!, _shapeMeta));
    }
    if (data.containsKey('x')) {
      context.handle(_xMeta, x.isAcceptableOrUnknown(data['x']!, _xMeta));
    } else if (isInserting) {
      context.missing(_xMeta);
    }
    if (data.containsKey('y')) {
      context.handle(_yMeta, y.isAcceptableOrUnknown(data['y']!, _yMeta));
    } else if (isInserting) {
      context.missing(_yMeta);
    }
    if (data.containsKey('rotation')) {
      context.handle(_rotationMeta,
          rotation.isAcceptableOrUnknown(data['rotation']!, _rotationMeta));
    }
    if (data.containsKey('width')) {
      context.handle(
          _widthMeta, width.isAcceptableOrUnknown(data['width']!, _widthMeta));
    }
    if (data.containsKey('height')) {
      context.handle(_heightMeta,
          height.isAcceptableOrUnknown(data['height']!, _heightMeta));
    }
    if (data.containsKey('color')) {
      context.handle(
          _colorMeta, color.isAcceptableOrUnknown(data['color']!, _colorMeta));
    }
    if (data.containsKey('seats')) {
      context.handle(
          _seatsMeta, seats.isAcceptableOrUnknown(data['seats']!, _seatsMeta));
    }
    if (data.containsKey('plan_id')) {
      context.handle(_planIdMeta,
          planId.isAcceptableOrUnknown(data['plan_id']!, _planIdMeta));
    }
    if (data.containsKey('is_active')) {
      context.handle(_isActiveMeta,
          isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta));
    }
    if (data.containsKey('created_by_id')) {
      context.handle(
          _createdByIdMeta,
          createdById.isAcceptableOrUnknown(
              data['created_by_id']!, _createdByIdMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  RestaurantTableDriftData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return RestaurantTableDriftData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      shape: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}shape'])!,
      x: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}x'])!,
      y: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}y'])!,
      rotation: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}rotation'])!,
      width: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}width'])!,
      height: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}height'])!,
      color: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}color']),
      seats: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}seats'])!,
      planId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}plan_id']),
      isActive: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_active'])!,
      createdById: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_by_id']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
    );
  }

  @override
  $RestaurantTableDriftTable createAlias(String alias) {
    return $RestaurantTableDriftTable(attachedDatabase, alias);
  }
}

class RestaurantTableDriftData extends DataClass
    implements Insertable<RestaurantTableDriftData> {
  final String id;
  final String name;
  final String status;
  final String shape;
  final double x;
  final double y;
  final double rotation;
  final int width;
  final int height;
  final int? color;
  final int seats;
  final String? planId;
  final bool isActive;
  final String? createdById;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  const RestaurantTableDriftData(
      {required this.id,
      required this.name,
      required this.status,
      required this.shape,
      required this.x,
      required this.y,
      required this.rotation,
      required this.width,
      required this.height,
      this.color,
      required this.seats,
      this.planId,
      required this.isActive,
      this.createdById,
      required this.createdAt,
      required this.updatedAt,
      this.deletedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    map['status'] = Variable<String>(status);
    map['shape'] = Variable<String>(shape);
    map['x'] = Variable<double>(x);
    map['y'] = Variable<double>(y);
    map['rotation'] = Variable<double>(rotation);
    map['width'] = Variable<int>(width);
    map['height'] = Variable<int>(height);
    if (!nullToAbsent || color != null) {
      map['color'] = Variable<int>(color);
    }
    map['seats'] = Variable<int>(seats);
    if (!nullToAbsent || planId != null) {
      map['plan_id'] = Variable<String>(planId);
    }
    map['is_active'] = Variable<bool>(isActive);
    if (!nullToAbsent || createdById != null) {
      map['created_by_id'] = Variable<String>(createdById);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  RestaurantTableDriftCompanion toCompanion(bool nullToAbsent) {
    return RestaurantTableDriftCompanion(
      id: Value(id),
      name: Value(name),
      status: Value(status),
      shape: Value(shape),
      x: Value(x),
      y: Value(y),
      rotation: Value(rotation),
      width: Value(width),
      height: Value(height),
      color:
          color == null && nullToAbsent ? const Value.absent() : Value(color),
      seats: Value(seats),
      planId:
          planId == null && nullToAbsent ? const Value.absent() : Value(planId),
      isActive: Value(isActive),
      createdById: createdById == null && nullToAbsent
          ? const Value.absent()
          : Value(createdById),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory RestaurantTableDriftData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return RestaurantTableDriftData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      status: serializer.fromJson<String>(json['status']),
      shape: serializer.fromJson<String>(json['shape']),
      x: serializer.fromJson<double>(json['x']),
      y: serializer.fromJson<double>(json['y']),
      rotation: serializer.fromJson<double>(json['rotation']),
      width: serializer.fromJson<int>(json['width']),
      height: serializer.fromJson<int>(json['height']),
      color: serializer.fromJson<int?>(json['color']),
      seats: serializer.fromJson<int>(json['seats']),
      planId: serializer.fromJson<String?>(json['planId']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      createdById: serializer.fromJson<String?>(json['createdById']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'status': serializer.toJson<String>(status),
      'shape': serializer.toJson<String>(shape),
      'x': serializer.toJson<double>(x),
      'y': serializer.toJson<double>(y),
      'rotation': serializer.toJson<double>(rotation),
      'width': serializer.toJson<int>(width),
      'height': serializer.toJson<int>(height),
      'color': serializer.toJson<int?>(color),
      'seats': serializer.toJson<int>(seats),
      'planId': serializer.toJson<String?>(planId),
      'isActive': serializer.toJson<bool>(isActive),
      'createdById': serializer.toJson<String?>(createdById),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  RestaurantTableDriftData copyWith(
          {String? id,
          String? name,
          String? status,
          String? shape,
          double? x,
          double? y,
          double? rotation,
          int? width,
          int? height,
          Value<int?> color = const Value.absent(),
          int? seats,
          Value<String?> planId = const Value.absent(),
          bool? isActive,
          Value<String?> createdById = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt,
          Value<DateTime?> deletedAt = const Value.absent()}) =>
      RestaurantTableDriftData(
        id: id ?? this.id,
        name: name ?? this.name,
        status: status ?? this.status,
        shape: shape ?? this.shape,
        x: x ?? this.x,
        y: y ?? this.y,
        rotation: rotation ?? this.rotation,
        width: width ?? this.width,
        height: height ?? this.height,
        color: color.present ? color.value : this.color,
        seats: seats ?? this.seats,
        planId: planId.present ? planId.value : this.planId,
        isActive: isActive ?? this.isActive,
        createdById: createdById.present ? createdById.value : this.createdById,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
      );
  RestaurantTableDriftData copyWithCompanion(
      RestaurantTableDriftCompanion data) {
    return RestaurantTableDriftData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      status: data.status.present ? data.status.value : this.status,
      shape: data.shape.present ? data.shape.value : this.shape,
      x: data.x.present ? data.x.value : this.x,
      y: data.y.present ? data.y.value : this.y,
      rotation: data.rotation.present ? data.rotation.value : this.rotation,
      width: data.width.present ? data.width.value : this.width,
      height: data.height.present ? data.height.value : this.height,
      color: data.color.present ? data.color.value : this.color,
      seats: data.seats.present ? data.seats.value : this.seats,
      planId: data.planId.present ? data.planId.value : this.planId,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      createdById:
          data.createdById.present ? data.createdById.value : this.createdById,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('RestaurantTableDriftData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('status: $status, ')
          ..write('shape: $shape, ')
          ..write('x: $x, ')
          ..write('y: $y, ')
          ..write('rotation: $rotation, ')
          ..write('width: $width, ')
          ..write('height: $height, ')
          ..write('color: $color, ')
          ..write('seats: $seats, ')
          ..write('planId: $planId, ')
          ..write('isActive: $isActive, ')
          ..write('createdById: $createdById, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      name,
      status,
      shape,
      x,
      y,
      rotation,
      width,
      height,
      color,
      seats,
      planId,
      isActive,
      createdById,
      createdAt,
      updatedAt,
      deletedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is RestaurantTableDriftData &&
          other.id == this.id &&
          other.name == this.name &&
          other.status == this.status &&
          other.shape == this.shape &&
          other.x == this.x &&
          other.y == this.y &&
          other.rotation == this.rotation &&
          other.width == this.width &&
          other.height == this.height &&
          other.color == this.color &&
          other.seats == this.seats &&
          other.planId == this.planId &&
          other.isActive == this.isActive &&
          other.createdById == this.createdById &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt);
}

class RestaurantTableDriftCompanion
    extends UpdateCompanion<RestaurantTableDriftData> {
  final Value<String> id;
  final Value<String> name;
  final Value<String> status;
  final Value<String> shape;
  final Value<double> x;
  final Value<double> y;
  final Value<double> rotation;
  final Value<int> width;
  final Value<int> height;
  final Value<int?> color;
  final Value<int> seats;
  final Value<String?> planId;
  final Value<bool> isActive;
  final Value<String?> createdById;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<int> rowid;
  const RestaurantTableDriftCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.status = const Value.absent(),
    this.shape = const Value.absent(),
    this.x = const Value.absent(),
    this.y = const Value.absent(),
    this.rotation = const Value.absent(),
    this.width = const Value.absent(),
    this.height = const Value.absent(),
    this.color = const Value.absent(),
    this.seats = const Value.absent(),
    this.planId = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdById = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  RestaurantTableDriftCompanion.insert({
    required String id,
    required String name,
    this.status = const Value.absent(),
    this.shape = const Value.absent(),
    required double x,
    required double y,
    this.rotation = const Value.absent(),
    this.width = const Value.absent(),
    this.height = const Value.absent(),
    this.color = const Value.absent(),
    this.seats = const Value.absent(),
    this.planId = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdById = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        x = Value(x),
        y = Value(y),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<RestaurantTableDriftData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? status,
    Expression<String>? shape,
    Expression<double>? x,
    Expression<double>? y,
    Expression<double>? rotation,
    Expression<int>? width,
    Expression<int>? height,
    Expression<int>? color,
    Expression<int>? seats,
    Expression<String>? planId,
    Expression<bool>? isActive,
    Expression<String>? createdById,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (status != null) 'status': status,
      if (shape != null) 'shape': shape,
      if (x != null) 'x': x,
      if (y != null) 'y': y,
      if (rotation != null) 'rotation': rotation,
      if (width != null) 'width': width,
      if (height != null) 'height': height,
      if (color != null) 'color': color,
      if (seats != null) 'seats': seats,
      if (planId != null) 'plan_id': planId,
      if (isActive != null) 'is_active': isActive,
      if (createdById != null) 'created_by_id': createdById,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  RestaurantTableDriftCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String>? status,
      Value<String>? shape,
      Value<double>? x,
      Value<double>? y,
      Value<double>? rotation,
      Value<int>? width,
      Value<int>? height,
      Value<int?>? color,
      Value<int>? seats,
      Value<String?>? planId,
      Value<bool>? isActive,
      Value<String?>? createdById,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<DateTime?>? deletedAt,
      Value<int>? rowid}) {
    return RestaurantTableDriftCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      status: status ?? this.status,
      shape: shape ?? this.shape,
      x: x ?? this.x,
      y: y ?? this.y,
      rotation: rotation ?? this.rotation,
      width: width ?? this.width,
      height: height ?? this.height,
      color: color ?? this.color,
      seats: seats ?? this.seats,
      planId: planId ?? this.planId,
      isActive: isActive ?? this.isActive,
      createdById: createdById ?? this.createdById,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (shape.present) {
      map['shape'] = Variable<String>(shape.value);
    }
    if (x.present) {
      map['x'] = Variable<double>(x.value);
    }
    if (y.present) {
      map['y'] = Variable<double>(y.value);
    }
    if (rotation.present) {
      map['rotation'] = Variable<double>(rotation.value);
    }
    if (width.present) {
      map['width'] = Variable<int>(width.value);
    }
    if (height.present) {
      map['height'] = Variable<int>(height.value);
    }
    if (color.present) {
      map['color'] = Variable<int>(color.value);
    }
    if (seats.present) {
      map['seats'] = Variable<int>(seats.value);
    }
    if (planId.present) {
      map['plan_id'] = Variable<String>(planId.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (createdById.present) {
      map['created_by_id'] = Variable<String>(createdById.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('RestaurantTableDriftCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('status: $status, ')
          ..write('shape: $shape, ')
          ..write('x: $x, ')
          ..write('y: $y, ')
          ..write('rotation: $rotation, ')
          ..write('width: $width, ')
          ..write('height: $height, ')
          ..write('color: $color, ')
          ..write('seats: $seats, ')
          ..write('planId: $planId, ')
          ..write('isActive: $isActive, ')
          ..write('createdById: $createdById, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $DiscountsDriftTable extends DiscountsDrift
    with TableInfo<$DiscountsDriftTable, DiscountsDriftData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $DiscountsDriftTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      additionalChecks:
          GeneratedColumn.checkTextLength(minTextLength: 1, maxTextLength: 150),
      type: DriftSqlType.string,
      requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _typeMeta = const VerificationMeta('type');
  @override
  late final GeneratedColumn<String> type = GeneratedColumn<String>(
      'type', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _activationMeta =
      const VerificationMeta('activation');
  @override
  late final GeneratedColumn<String> activation = GeneratedColumn<String>(
      'activation', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
      'code', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _scopeMeta = const VerificationMeta('scope');
  @override
  late final GeneratedColumn<String> scope = GeneratedColumn<String>(
      'scope', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _productIdsMeta =
      const VerificationMeta('productIds');
  @override
  late final GeneratedColumn<String> productIds = GeneratedColumn<String>(
      'product_ids', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  static const VerificationMeta _categoryIdsMeta =
      const VerificationMeta('categoryIds');
  @override
  late final GeneratedColumn<String> categoryIds = GeneratedColumn<String>(
      'category_ids', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant(''));
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<int> value = GeneratedColumn<int>(
      'value', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _quantityTriggerMeta =
      const VerificationMeta('quantityTrigger');
  @override
  late final GeneratedColumn<int> quantityTrigger = GeneratedColumn<int>(
      'quantity_trigger', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _quantityRewardMeta =
      const VerificationMeta('quantityReward');
  @override
  late final GeneratedColumn<int> quantityReward = GeneratedColumn<int>(
      'quantity_reward', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _quantityRewardTypeMeta =
      const VerificationMeta('quantityRewardType');
  @override
  late final GeneratedColumn<String> quantityRewardType =
      GeneratedColumn<String>('quantity_reward_type', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _quantityRewardValueMeta =
      const VerificationMeta('quantityRewardValue');
  @override
  late final GeneratedColumn<int> quantityRewardValue = GeneratedColumn<int>(
      'quantity_reward_value', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _quantityBundlePriceMeta =
      const VerificationMeta('quantityBundlePrice');
  @override
  late final GeneratedColumn<int> quantityBundlePrice = GeneratedColumn<int>(
      'quantity_bundle_price', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _minimumAmountMeta =
      const VerificationMeta('minimumAmount');
  @override
  late final GeneratedColumn<int> minimumAmount = GeneratedColumn<int>(
      'minimum_amount', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _minimumQuantityMeta =
      const VerificationMeta('minimumQuantity');
  @override
  late final GeneratedColumn<int> minimumQuantity = GeneratedColumn<int>(
      'minimum_quantity', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _maximumDiscountMeta =
      const VerificationMeta('maximumDiscount');
  @override
  late final GeneratedColumn<int> maximumDiscount = GeneratedColumn<int>(
      'maximum_discount', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _usageLimitMeta =
      const VerificationMeta('usageLimit');
  @override
  late final GeneratedColumn<int> usageLimit = GeneratedColumn<int>(
      'usage_limit', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _usageCountMeta =
      const VerificationMeta('usageCount');
  @override
  late final GeneratedColumn<int> usageCount = GeneratedColumn<int>(
      'usage_count', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _firstUsedAtMeta =
      const VerificationMeta('firstUsedAt');
  @override
  late final GeneratedColumn<DateTime> firstUsedAt = GeneratedColumn<DateTime>(
      'first_used_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _lastUsedAtMeta =
      const VerificationMeta('lastUsedAt');
  @override
  late final GeneratedColumn<DateTime> lastUsedAt = GeneratedColumn<DateTime>(
      'last_used_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _startDateMeta =
      const VerificationMeta('startDate');
  @override
  late final GeneratedColumn<DateTime> startDate = GeneratedColumn<DateTime>(
      'start_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _endDateMeta =
      const VerificationMeta('endDate');
  @override
  late final GeneratedColumn<DateTime> endDate = GeneratedColumn<DateTime>(
      'end_date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _daysOfWeekMeta =
      const VerificationMeta('daysOfWeek');
  @override
  late final GeneratedColumn<String> daysOfWeek = GeneratedColumn<String>(
      'days_of_week', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('[]'));
  static const VerificationMeta _startTimeMeta =
      const VerificationMeta('startTime');
  @override
  late final GeneratedColumn<String> startTime = GeneratedColumn<String>(
      'start_time', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _endTimeMeta =
      const VerificationMeta('endTime');
  @override
  late final GeneratedColumn<String> endTime = GeneratedColumn<String>(
      'end_time', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _combinableMeta =
      const VerificationMeta('combinable');
  @override
  late final GeneratedColumn<bool> combinable = GeneratedColumn<bool>(
      'combinable', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("combinable" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _priorityMeta =
      const VerificationMeta('priority');
  @override
  late final GeneratedColumn<int> priority = GeneratedColumn<int>(
      'priority', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _isActiveMeta =
      const VerificationMeta('isActive');
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
      'is_active', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_active" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        name,
        description,
        type,
        activation,
        code,
        scope,
        productIds,
        categoryIds,
        value,
        quantityTrigger,
        quantityReward,
        quantityRewardType,
        quantityRewardValue,
        quantityBundlePrice,
        minimumAmount,
        minimumQuantity,
        maximumDiscount,
        usageLimit,
        usageCount,
        firstUsedAt,
        lastUsedAt,
        startDate,
        endDate,
        daysOfWeek,
        startTime,
        endTime,
        combinable,
        priority,
        isActive,
        createdAt,
        updatedAt,
        deletedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'discounts_drift';
  @override
  VerificationContext validateIntegrity(Insertable<DiscountsDriftData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('type')) {
      context.handle(
          _typeMeta, type.isAcceptableOrUnknown(data['type']!, _typeMeta));
    } else if (isInserting) {
      context.missing(_typeMeta);
    }
    if (data.containsKey('activation')) {
      context.handle(
          _activationMeta,
          activation.isAcceptableOrUnknown(
              data['activation']!, _activationMeta));
    } else if (isInserting) {
      context.missing(_activationMeta);
    }
    if (data.containsKey('code')) {
      context.handle(
          _codeMeta, code.isAcceptableOrUnknown(data['code']!, _codeMeta));
    }
    if (data.containsKey('scope')) {
      context.handle(
          _scopeMeta, scope.isAcceptableOrUnknown(data['scope']!, _scopeMeta));
    } else if (isInserting) {
      context.missing(_scopeMeta);
    }
    if (data.containsKey('product_ids')) {
      context.handle(
          _productIdsMeta,
          productIds.isAcceptableOrUnknown(
              data['product_ids']!, _productIdsMeta));
    }
    if (data.containsKey('category_ids')) {
      context.handle(
          _categoryIdsMeta,
          categoryIds.isAcceptableOrUnknown(
              data['category_ids']!, _categoryIdsMeta));
    }
    if (data.containsKey('value')) {
      context.handle(
          _valueMeta, value.isAcceptableOrUnknown(data['value']!, _valueMeta));
    }
    if (data.containsKey('quantity_trigger')) {
      context.handle(
          _quantityTriggerMeta,
          quantityTrigger.isAcceptableOrUnknown(
              data['quantity_trigger']!, _quantityTriggerMeta));
    }
    if (data.containsKey('quantity_reward')) {
      context.handle(
          _quantityRewardMeta,
          quantityReward.isAcceptableOrUnknown(
              data['quantity_reward']!, _quantityRewardMeta));
    }
    if (data.containsKey('quantity_reward_type')) {
      context.handle(
          _quantityRewardTypeMeta,
          quantityRewardType.isAcceptableOrUnknown(
              data['quantity_reward_type']!, _quantityRewardTypeMeta));
    }
    if (data.containsKey('quantity_reward_value')) {
      context.handle(
          _quantityRewardValueMeta,
          quantityRewardValue.isAcceptableOrUnknown(
              data['quantity_reward_value']!, _quantityRewardValueMeta));
    }
    if (data.containsKey('quantity_bundle_price')) {
      context.handle(
          _quantityBundlePriceMeta,
          quantityBundlePrice.isAcceptableOrUnknown(
              data['quantity_bundle_price']!, _quantityBundlePriceMeta));
    }
    if (data.containsKey('minimum_amount')) {
      context.handle(
          _minimumAmountMeta,
          minimumAmount.isAcceptableOrUnknown(
              data['minimum_amount']!, _minimumAmountMeta));
    }
    if (data.containsKey('minimum_quantity')) {
      context.handle(
          _minimumQuantityMeta,
          minimumQuantity.isAcceptableOrUnknown(
              data['minimum_quantity']!, _minimumQuantityMeta));
    }
    if (data.containsKey('maximum_discount')) {
      context.handle(
          _maximumDiscountMeta,
          maximumDiscount.isAcceptableOrUnknown(
              data['maximum_discount']!, _maximumDiscountMeta));
    }
    if (data.containsKey('usage_limit')) {
      context.handle(
          _usageLimitMeta,
          usageLimit.isAcceptableOrUnknown(
              data['usage_limit']!, _usageLimitMeta));
    }
    if (data.containsKey('usage_count')) {
      context.handle(
          _usageCountMeta,
          usageCount.isAcceptableOrUnknown(
              data['usage_count']!, _usageCountMeta));
    }
    if (data.containsKey('first_used_at')) {
      context.handle(
          _firstUsedAtMeta,
          firstUsedAt.isAcceptableOrUnknown(
              data['first_used_at']!, _firstUsedAtMeta));
    }
    if (data.containsKey('last_used_at')) {
      context.handle(
          _lastUsedAtMeta,
          lastUsedAt.isAcceptableOrUnknown(
              data['last_used_at']!, _lastUsedAtMeta));
    }
    if (data.containsKey('start_date')) {
      context.handle(_startDateMeta,
          startDate.isAcceptableOrUnknown(data['start_date']!, _startDateMeta));
    }
    if (data.containsKey('end_date')) {
      context.handle(_endDateMeta,
          endDate.isAcceptableOrUnknown(data['end_date']!, _endDateMeta));
    }
    if (data.containsKey('days_of_week')) {
      context.handle(
          _daysOfWeekMeta,
          daysOfWeek.isAcceptableOrUnknown(
              data['days_of_week']!, _daysOfWeekMeta));
    }
    if (data.containsKey('start_time')) {
      context.handle(_startTimeMeta,
          startTime.isAcceptableOrUnknown(data['start_time']!, _startTimeMeta));
    }
    if (data.containsKey('end_time')) {
      context.handle(_endTimeMeta,
          endTime.isAcceptableOrUnknown(data['end_time']!, _endTimeMeta));
    }
    if (data.containsKey('combinable')) {
      context.handle(
          _combinableMeta,
          combinable.isAcceptableOrUnknown(
              data['combinable']!, _combinableMeta));
    }
    if (data.containsKey('priority')) {
      context.handle(_priorityMeta,
          priority.isAcceptableOrUnknown(data['priority']!, _priorityMeta));
    }
    if (data.containsKey('is_active')) {
      context.handle(_isActiveMeta,
          isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  DiscountsDriftData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DiscountsDriftData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      type: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!,
      activation: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}activation'])!,
      code: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}code']),
      scope: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}scope'])!,
      productIds: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}product_ids'])!,
      categoryIds: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category_ids'])!,
      value: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}value']),
      quantityTrigger: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}quantity_trigger']),
      quantityReward: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}quantity_reward']),
      quantityRewardType: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}quantity_reward_type']),
      quantityRewardValue: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}quantity_reward_value']),
      quantityBundlePrice: attachedDatabase.typeMapping.read(
          DriftSqlType.int, data['${effectivePrefix}quantity_bundle_price']),
      minimumAmount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}minimum_amount']),
      minimumQuantity: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}minimum_quantity']),
      maximumDiscount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}maximum_discount']),
      usageLimit: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}usage_limit']),
      usageCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}usage_count'])!,
      firstUsedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}first_used_at']),
      lastUsedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}last_used_at']),
      startDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}start_date']),
      endDate: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}end_date']),
      daysOfWeek: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}days_of_week'])!,
      startTime: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}start_time']),
      endTime: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}end_time']),
      combinable: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}combinable'])!,
      priority: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}priority'])!,
      isActive: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_active'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
    );
  }

  @override
  $DiscountsDriftTable createAlias(String alias) {
    return $DiscountsDriftTable(attachedDatabase, alias);
  }
}

class DiscountsDriftData extends DataClass
    implements Insertable<DiscountsDriftData> {
  final String id;
  final String name;
  final String? description;
  final String type;
  final String activation;
  final String? code;
  final String scope;
  final String productIds;
  final String categoryIds;
  final int? value;
  final int? quantityTrigger;
  final int? quantityReward;
  final String? quantityRewardType;
  final int? quantityRewardValue;
  final int? quantityBundlePrice;
  final int? minimumAmount;
  final int? minimumQuantity;
  final int? maximumDiscount;
  final int? usageLimit;
  final int usageCount;
  final DateTime? firstUsedAt;
  final DateTime? lastUsedAt;
  final DateTime? startDate;
  final DateTime? endDate;
  final String daysOfWeek;
  final String? startTime;
  final String? endTime;
  final bool combinable;
  final int priority;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  const DiscountsDriftData(
      {required this.id,
      required this.name,
      this.description,
      required this.type,
      required this.activation,
      this.code,
      required this.scope,
      required this.productIds,
      required this.categoryIds,
      this.value,
      this.quantityTrigger,
      this.quantityReward,
      this.quantityRewardType,
      this.quantityRewardValue,
      this.quantityBundlePrice,
      this.minimumAmount,
      this.minimumQuantity,
      this.maximumDiscount,
      this.usageLimit,
      required this.usageCount,
      this.firstUsedAt,
      this.lastUsedAt,
      this.startDate,
      this.endDate,
      required this.daysOfWeek,
      this.startTime,
      this.endTime,
      required this.combinable,
      required this.priority,
      required this.isActive,
      required this.createdAt,
      required this.updatedAt,
      this.deletedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    map['type'] = Variable<String>(type);
    map['activation'] = Variable<String>(activation);
    if (!nullToAbsent || code != null) {
      map['code'] = Variable<String>(code);
    }
    map['scope'] = Variable<String>(scope);
    map['product_ids'] = Variable<String>(productIds);
    map['category_ids'] = Variable<String>(categoryIds);
    if (!nullToAbsent || value != null) {
      map['value'] = Variable<int>(value);
    }
    if (!nullToAbsent || quantityTrigger != null) {
      map['quantity_trigger'] = Variable<int>(quantityTrigger);
    }
    if (!nullToAbsent || quantityReward != null) {
      map['quantity_reward'] = Variable<int>(quantityReward);
    }
    if (!nullToAbsent || quantityRewardType != null) {
      map['quantity_reward_type'] = Variable<String>(quantityRewardType);
    }
    if (!nullToAbsent || quantityRewardValue != null) {
      map['quantity_reward_value'] = Variable<int>(quantityRewardValue);
    }
    if (!nullToAbsent || quantityBundlePrice != null) {
      map['quantity_bundle_price'] = Variable<int>(quantityBundlePrice);
    }
    if (!nullToAbsent || minimumAmount != null) {
      map['minimum_amount'] = Variable<int>(minimumAmount);
    }
    if (!nullToAbsent || minimumQuantity != null) {
      map['minimum_quantity'] = Variable<int>(minimumQuantity);
    }
    if (!nullToAbsent || maximumDiscount != null) {
      map['maximum_discount'] = Variable<int>(maximumDiscount);
    }
    if (!nullToAbsent || usageLimit != null) {
      map['usage_limit'] = Variable<int>(usageLimit);
    }
    map['usage_count'] = Variable<int>(usageCount);
    if (!nullToAbsent || firstUsedAt != null) {
      map['first_used_at'] = Variable<DateTime>(firstUsedAt);
    }
    if (!nullToAbsent || lastUsedAt != null) {
      map['last_used_at'] = Variable<DateTime>(lastUsedAt);
    }
    if (!nullToAbsent || startDate != null) {
      map['start_date'] = Variable<DateTime>(startDate);
    }
    if (!nullToAbsent || endDate != null) {
      map['end_date'] = Variable<DateTime>(endDate);
    }
    map['days_of_week'] = Variable<String>(daysOfWeek);
    if (!nullToAbsent || startTime != null) {
      map['start_time'] = Variable<String>(startTime);
    }
    if (!nullToAbsent || endTime != null) {
      map['end_time'] = Variable<String>(endTime);
    }
    map['combinable'] = Variable<bool>(combinable);
    map['priority'] = Variable<int>(priority);
    map['is_active'] = Variable<bool>(isActive);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  DiscountsDriftCompanion toCompanion(bool nullToAbsent) {
    return DiscountsDriftCompanion(
      id: Value(id),
      name: Value(name),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      type: Value(type),
      activation: Value(activation),
      code: code == null && nullToAbsent ? const Value.absent() : Value(code),
      scope: Value(scope),
      productIds: Value(productIds),
      categoryIds: Value(categoryIds),
      value:
          value == null && nullToAbsent ? const Value.absent() : Value(value),
      quantityTrigger: quantityTrigger == null && nullToAbsent
          ? const Value.absent()
          : Value(quantityTrigger),
      quantityReward: quantityReward == null && nullToAbsent
          ? const Value.absent()
          : Value(quantityReward),
      quantityRewardType: quantityRewardType == null && nullToAbsent
          ? const Value.absent()
          : Value(quantityRewardType),
      quantityRewardValue: quantityRewardValue == null && nullToAbsent
          ? const Value.absent()
          : Value(quantityRewardValue),
      quantityBundlePrice: quantityBundlePrice == null && nullToAbsent
          ? const Value.absent()
          : Value(quantityBundlePrice),
      minimumAmount: minimumAmount == null && nullToAbsent
          ? const Value.absent()
          : Value(minimumAmount),
      minimumQuantity: minimumQuantity == null && nullToAbsent
          ? const Value.absent()
          : Value(minimumQuantity),
      maximumDiscount: maximumDiscount == null && nullToAbsent
          ? const Value.absent()
          : Value(maximumDiscount),
      usageLimit: usageLimit == null && nullToAbsent
          ? const Value.absent()
          : Value(usageLimit),
      usageCount: Value(usageCount),
      firstUsedAt: firstUsedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(firstUsedAt),
      lastUsedAt: lastUsedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(lastUsedAt),
      startDate: startDate == null && nullToAbsent
          ? const Value.absent()
          : Value(startDate),
      endDate: endDate == null && nullToAbsent
          ? const Value.absent()
          : Value(endDate),
      daysOfWeek: Value(daysOfWeek),
      startTime: startTime == null && nullToAbsent
          ? const Value.absent()
          : Value(startTime),
      endTime: endTime == null && nullToAbsent
          ? const Value.absent()
          : Value(endTime),
      combinable: Value(combinable),
      priority: Value(priority),
      isActive: Value(isActive),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory DiscountsDriftData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DiscountsDriftData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      description: serializer.fromJson<String?>(json['description']),
      type: serializer.fromJson<String>(json['type']),
      activation: serializer.fromJson<String>(json['activation']),
      code: serializer.fromJson<String?>(json['code']),
      scope: serializer.fromJson<String>(json['scope']),
      productIds: serializer.fromJson<String>(json['productIds']),
      categoryIds: serializer.fromJson<String>(json['categoryIds']),
      value: serializer.fromJson<int?>(json['value']),
      quantityTrigger: serializer.fromJson<int?>(json['quantityTrigger']),
      quantityReward: serializer.fromJson<int?>(json['quantityReward']),
      quantityRewardType:
          serializer.fromJson<String?>(json['quantityRewardType']),
      quantityRewardValue:
          serializer.fromJson<int?>(json['quantityRewardValue']),
      quantityBundlePrice:
          serializer.fromJson<int?>(json['quantityBundlePrice']),
      minimumAmount: serializer.fromJson<int?>(json['minimumAmount']),
      minimumQuantity: serializer.fromJson<int?>(json['minimumQuantity']),
      maximumDiscount: serializer.fromJson<int?>(json['maximumDiscount']),
      usageLimit: serializer.fromJson<int?>(json['usageLimit']),
      usageCount: serializer.fromJson<int>(json['usageCount']),
      firstUsedAt: serializer.fromJson<DateTime?>(json['firstUsedAt']),
      lastUsedAt: serializer.fromJson<DateTime?>(json['lastUsedAt']),
      startDate: serializer.fromJson<DateTime?>(json['startDate']),
      endDate: serializer.fromJson<DateTime?>(json['endDate']),
      daysOfWeek: serializer.fromJson<String>(json['daysOfWeek']),
      startTime: serializer.fromJson<String?>(json['startTime']),
      endTime: serializer.fromJson<String?>(json['endTime']),
      combinable: serializer.fromJson<bool>(json['combinable']),
      priority: serializer.fromJson<int>(json['priority']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'name': serializer.toJson<String>(name),
      'description': serializer.toJson<String?>(description),
      'type': serializer.toJson<String>(type),
      'activation': serializer.toJson<String>(activation),
      'code': serializer.toJson<String?>(code),
      'scope': serializer.toJson<String>(scope),
      'productIds': serializer.toJson<String>(productIds),
      'categoryIds': serializer.toJson<String>(categoryIds),
      'value': serializer.toJson<int?>(value),
      'quantityTrigger': serializer.toJson<int?>(quantityTrigger),
      'quantityReward': serializer.toJson<int?>(quantityReward),
      'quantityRewardType': serializer.toJson<String?>(quantityRewardType),
      'quantityRewardValue': serializer.toJson<int?>(quantityRewardValue),
      'quantityBundlePrice': serializer.toJson<int?>(quantityBundlePrice),
      'minimumAmount': serializer.toJson<int?>(minimumAmount),
      'minimumQuantity': serializer.toJson<int?>(minimumQuantity),
      'maximumDiscount': serializer.toJson<int?>(maximumDiscount),
      'usageLimit': serializer.toJson<int?>(usageLimit),
      'usageCount': serializer.toJson<int>(usageCount),
      'firstUsedAt': serializer.toJson<DateTime?>(firstUsedAt),
      'lastUsedAt': serializer.toJson<DateTime?>(lastUsedAt),
      'startDate': serializer.toJson<DateTime?>(startDate),
      'endDate': serializer.toJson<DateTime?>(endDate),
      'daysOfWeek': serializer.toJson<String>(daysOfWeek),
      'startTime': serializer.toJson<String?>(startTime),
      'endTime': serializer.toJson<String?>(endTime),
      'combinable': serializer.toJson<bool>(combinable),
      'priority': serializer.toJson<int>(priority),
      'isActive': serializer.toJson<bool>(isActive),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  DiscountsDriftData copyWith(
          {String? id,
          String? name,
          Value<String?> description = const Value.absent(),
          String? type,
          String? activation,
          Value<String?> code = const Value.absent(),
          String? scope,
          String? productIds,
          String? categoryIds,
          Value<int?> value = const Value.absent(),
          Value<int?> quantityTrigger = const Value.absent(),
          Value<int?> quantityReward = const Value.absent(),
          Value<String?> quantityRewardType = const Value.absent(),
          Value<int?> quantityRewardValue = const Value.absent(),
          Value<int?> quantityBundlePrice = const Value.absent(),
          Value<int?> minimumAmount = const Value.absent(),
          Value<int?> minimumQuantity = const Value.absent(),
          Value<int?> maximumDiscount = const Value.absent(),
          Value<int?> usageLimit = const Value.absent(),
          int? usageCount,
          Value<DateTime?> firstUsedAt = const Value.absent(),
          Value<DateTime?> lastUsedAt = const Value.absent(),
          Value<DateTime?> startDate = const Value.absent(),
          Value<DateTime?> endDate = const Value.absent(),
          String? daysOfWeek,
          Value<String?> startTime = const Value.absent(),
          Value<String?> endTime = const Value.absent(),
          bool? combinable,
          int? priority,
          bool? isActive,
          DateTime? createdAt,
          DateTime? updatedAt,
          Value<DateTime?> deletedAt = const Value.absent()}) =>
      DiscountsDriftData(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description.present ? description.value : this.description,
        type: type ?? this.type,
        activation: activation ?? this.activation,
        code: code.present ? code.value : this.code,
        scope: scope ?? this.scope,
        productIds: productIds ?? this.productIds,
        categoryIds: categoryIds ?? this.categoryIds,
        value: value.present ? value.value : this.value,
        quantityTrigger: quantityTrigger.present
            ? quantityTrigger.value
            : this.quantityTrigger,
        quantityReward:
            quantityReward.present ? quantityReward.value : this.quantityReward,
        quantityRewardType: quantityRewardType.present
            ? quantityRewardType.value
            : this.quantityRewardType,
        quantityRewardValue: quantityRewardValue.present
            ? quantityRewardValue.value
            : this.quantityRewardValue,
        quantityBundlePrice: quantityBundlePrice.present
            ? quantityBundlePrice.value
            : this.quantityBundlePrice,
        minimumAmount:
            minimumAmount.present ? minimumAmount.value : this.minimumAmount,
        minimumQuantity: minimumQuantity.present
            ? minimumQuantity.value
            : this.minimumQuantity,
        maximumDiscount: maximumDiscount.present
            ? maximumDiscount.value
            : this.maximumDiscount,
        usageLimit: usageLimit.present ? usageLimit.value : this.usageLimit,
        usageCount: usageCount ?? this.usageCount,
        firstUsedAt: firstUsedAt.present ? firstUsedAt.value : this.firstUsedAt,
        lastUsedAt: lastUsedAt.present ? lastUsedAt.value : this.lastUsedAt,
        startDate: startDate.present ? startDate.value : this.startDate,
        endDate: endDate.present ? endDate.value : this.endDate,
        daysOfWeek: daysOfWeek ?? this.daysOfWeek,
        startTime: startTime.present ? startTime.value : this.startTime,
        endTime: endTime.present ? endTime.value : this.endTime,
        combinable: combinable ?? this.combinable,
        priority: priority ?? this.priority,
        isActive: isActive ?? this.isActive,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
      );
  DiscountsDriftData copyWithCompanion(DiscountsDriftCompanion data) {
    return DiscountsDriftData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      description:
          data.description.present ? data.description.value : this.description,
      type: data.type.present ? data.type.value : this.type,
      activation:
          data.activation.present ? data.activation.value : this.activation,
      code: data.code.present ? data.code.value : this.code,
      scope: data.scope.present ? data.scope.value : this.scope,
      productIds:
          data.productIds.present ? data.productIds.value : this.productIds,
      categoryIds:
          data.categoryIds.present ? data.categoryIds.value : this.categoryIds,
      value: data.value.present ? data.value.value : this.value,
      quantityTrigger: data.quantityTrigger.present
          ? data.quantityTrigger.value
          : this.quantityTrigger,
      quantityReward: data.quantityReward.present
          ? data.quantityReward.value
          : this.quantityReward,
      quantityRewardType: data.quantityRewardType.present
          ? data.quantityRewardType.value
          : this.quantityRewardType,
      quantityRewardValue: data.quantityRewardValue.present
          ? data.quantityRewardValue.value
          : this.quantityRewardValue,
      quantityBundlePrice: data.quantityBundlePrice.present
          ? data.quantityBundlePrice.value
          : this.quantityBundlePrice,
      minimumAmount: data.minimumAmount.present
          ? data.minimumAmount.value
          : this.minimumAmount,
      minimumQuantity: data.minimumQuantity.present
          ? data.minimumQuantity.value
          : this.minimumQuantity,
      maximumDiscount: data.maximumDiscount.present
          ? data.maximumDiscount.value
          : this.maximumDiscount,
      usageLimit:
          data.usageLimit.present ? data.usageLimit.value : this.usageLimit,
      usageCount:
          data.usageCount.present ? data.usageCount.value : this.usageCount,
      firstUsedAt:
          data.firstUsedAt.present ? data.firstUsedAt.value : this.firstUsedAt,
      lastUsedAt:
          data.lastUsedAt.present ? data.lastUsedAt.value : this.lastUsedAt,
      startDate: data.startDate.present ? data.startDate.value : this.startDate,
      endDate: data.endDate.present ? data.endDate.value : this.endDate,
      daysOfWeek:
          data.daysOfWeek.present ? data.daysOfWeek.value : this.daysOfWeek,
      startTime: data.startTime.present ? data.startTime.value : this.startTime,
      endTime: data.endTime.present ? data.endTime.value : this.endTime,
      combinable:
          data.combinable.present ? data.combinable.value : this.combinable,
      priority: data.priority.present ? data.priority.value : this.priority,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('DiscountsDriftData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('type: $type, ')
          ..write('activation: $activation, ')
          ..write('code: $code, ')
          ..write('scope: $scope, ')
          ..write('productIds: $productIds, ')
          ..write('categoryIds: $categoryIds, ')
          ..write('value: $value, ')
          ..write('quantityTrigger: $quantityTrigger, ')
          ..write('quantityReward: $quantityReward, ')
          ..write('quantityRewardType: $quantityRewardType, ')
          ..write('quantityRewardValue: $quantityRewardValue, ')
          ..write('quantityBundlePrice: $quantityBundlePrice, ')
          ..write('minimumAmount: $minimumAmount, ')
          ..write('minimumQuantity: $minimumQuantity, ')
          ..write('maximumDiscount: $maximumDiscount, ')
          ..write('usageLimit: $usageLimit, ')
          ..write('usageCount: $usageCount, ')
          ..write('firstUsedAt: $firstUsedAt, ')
          ..write('lastUsedAt: $lastUsedAt, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('daysOfWeek: $daysOfWeek, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('combinable: $combinable, ')
          ..write('priority: $priority, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        id,
        name,
        description,
        type,
        activation,
        code,
        scope,
        productIds,
        categoryIds,
        value,
        quantityTrigger,
        quantityReward,
        quantityRewardType,
        quantityRewardValue,
        quantityBundlePrice,
        minimumAmount,
        minimumQuantity,
        maximumDiscount,
        usageLimit,
        usageCount,
        firstUsedAt,
        lastUsedAt,
        startDate,
        endDate,
        daysOfWeek,
        startTime,
        endTime,
        combinable,
        priority,
        isActive,
        createdAt,
        updatedAt,
        deletedAt
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DiscountsDriftData &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.type == this.type &&
          other.activation == this.activation &&
          other.code == this.code &&
          other.scope == this.scope &&
          other.productIds == this.productIds &&
          other.categoryIds == this.categoryIds &&
          other.value == this.value &&
          other.quantityTrigger == this.quantityTrigger &&
          other.quantityReward == this.quantityReward &&
          other.quantityRewardType == this.quantityRewardType &&
          other.quantityRewardValue == this.quantityRewardValue &&
          other.quantityBundlePrice == this.quantityBundlePrice &&
          other.minimumAmount == this.minimumAmount &&
          other.minimumQuantity == this.minimumQuantity &&
          other.maximumDiscount == this.maximumDiscount &&
          other.usageLimit == this.usageLimit &&
          other.usageCount == this.usageCount &&
          other.firstUsedAt == this.firstUsedAt &&
          other.lastUsedAt == this.lastUsedAt &&
          other.startDate == this.startDate &&
          other.endDate == this.endDate &&
          other.daysOfWeek == this.daysOfWeek &&
          other.startTime == this.startTime &&
          other.endTime == this.endTime &&
          other.combinable == this.combinable &&
          other.priority == this.priority &&
          other.isActive == this.isActive &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt);
}

class DiscountsDriftCompanion extends UpdateCompanion<DiscountsDriftData> {
  final Value<String> id;
  final Value<String> name;
  final Value<String?> description;
  final Value<String> type;
  final Value<String> activation;
  final Value<String?> code;
  final Value<String> scope;
  final Value<String> productIds;
  final Value<String> categoryIds;
  final Value<int?> value;
  final Value<int?> quantityTrigger;
  final Value<int?> quantityReward;
  final Value<String?> quantityRewardType;
  final Value<int?> quantityRewardValue;
  final Value<int?> quantityBundlePrice;
  final Value<int?> minimumAmount;
  final Value<int?> minimumQuantity;
  final Value<int?> maximumDiscount;
  final Value<int?> usageLimit;
  final Value<int> usageCount;
  final Value<DateTime?> firstUsedAt;
  final Value<DateTime?> lastUsedAt;
  final Value<DateTime?> startDate;
  final Value<DateTime?> endDate;
  final Value<String> daysOfWeek;
  final Value<String?> startTime;
  final Value<String?> endTime;
  final Value<bool> combinable;
  final Value<int> priority;
  final Value<bool> isActive;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<int> rowid;
  const DiscountsDriftCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.description = const Value.absent(),
    this.type = const Value.absent(),
    this.activation = const Value.absent(),
    this.code = const Value.absent(),
    this.scope = const Value.absent(),
    this.productIds = const Value.absent(),
    this.categoryIds = const Value.absent(),
    this.value = const Value.absent(),
    this.quantityTrigger = const Value.absent(),
    this.quantityReward = const Value.absent(),
    this.quantityRewardType = const Value.absent(),
    this.quantityRewardValue = const Value.absent(),
    this.quantityBundlePrice = const Value.absent(),
    this.minimumAmount = const Value.absent(),
    this.minimumQuantity = const Value.absent(),
    this.maximumDiscount = const Value.absent(),
    this.usageLimit = const Value.absent(),
    this.usageCount = const Value.absent(),
    this.firstUsedAt = const Value.absent(),
    this.lastUsedAt = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.daysOfWeek = const Value.absent(),
    this.startTime = const Value.absent(),
    this.endTime = const Value.absent(),
    this.combinable = const Value.absent(),
    this.priority = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DiscountsDriftCompanion.insert({
    required String id,
    required String name,
    this.description = const Value.absent(),
    required String type,
    required String activation,
    this.code = const Value.absent(),
    required String scope,
    this.productIds = const Value.absent(),
    this.categoryIds = const Value.absent(),
    this.value = const Value.absent(),
    this.quantityTrigger = const Value.absent(),
    this.quantityReward = const Value.absent(),
    this.quantityRewardType = const Value.absent(),
    this.quantityRewardValue = const Value.absent(),
    this.quantityBundlePrice = const Value.absent(),
    this.minimumAmount = const Value.absent(),
    this.minimumQuantity = const Value.absent(),
    this.maximumDiscount = const Value.absent(),
    this.usageLimit = const Value.absent(),
    this.usageCount = const Value.absent(),
    this.firstUsedAt = const Value.absent(),
    this.lastUsedAt = const Value.absent(),
    this.startDate = const Value.absent(),
    this.endDate = const Value.absent(),
    this.daysOfWeek = const Value.absent(),
    this.startTime = const Value.absent(),
    this.endTime = const Value.absent(),
    this.combinable = const Value.absent(),
    this.priority = const Value.absent(),
    this.isActive = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        type = Value(type),
        activation = Value(activation),
        scope = Value(scope),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<DiscountsDriftData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? type,
    Expression<String>? activation,
    Expression<String>? code,
    Expression<String>? scope,
    Expression<String>? productIds,
    Expression<String>? categoryIds,
    Expression<int>? value,
    Expression<int>? quantityTrigger,
    Expression<int>? quantityReward,
    Expression<String>? quantityRewardType,
    Expression<int>? quantityRewardValue,
    Expression<int>? quantityBundlePrice,
    Expression<int>? minimumAmount,
    Expression<int>? minimumQuantity,
    Expression<int>? maximumDiscount,
    Expression<int>? usageLimit,
    Expression<int>? usageCount,
    Expression<DateTime>? firstUsedAt,
    Expression<DateTime>? lastUsedAt,
    Expression<DateTime>? startDate,
    Expression<DateTime>? endDate,
    Expression<String>? daysOfWeek,
    Expression<String>? startTime,
    Expression<String>? endTime,
    Expression<bool>? combinable,
    Expression<int>? priority,
    Expression<bool>? isActive,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (name != null) 'name': name,
      if (description != null) 'description': description,
      if (type != null) 'type': type,
      if (activation != null) 'activation': activation,
      if (code != null) 'code': code,
      if (scope != null) 'scope': scope,
      if (productIds != null) 'product_ids': productIds,
      if (categoryIds != null) 'category_ids': categoryIds,
      if (value != null) 'value': value,
      if (quantityTrigger != null) 'quantity_trigger': quantityTrigger,
      if (quantityReward != null) 'quantity_reward': quantityReward,
      if (quantityRewardType != null)
        'quantity_reward_type': quantityRewardType,
      if (quantityRewardValue != null)
        'quantity_reward_value': quantityRewardValue,
      if (quantityBundlePrice != null)
        'quantity_bundle_price': quantityBundlePrice,
      if (minimumAmount != null) 'minimum_amount': minimumAmount,
      if (minimumQuantity != null) 'minimum_quantity': minimumQuantity,
      if (maximumDiscount != null) 'maximum_discount': maximumDiscount,
      if (usageLimit != null) 'usage_limit': usageLimit,
      if (usageCount != null) 'usage_count': usageCount,
      if (firstUsedAt != null) 'first_used_at': firstUsedAt,
      if (lastUsedAt != null) 'last_used_at': lastUsedAt,
      if (startDate != null) 'start_date': startDate,
      if (endDate != null) 'end_date': endDate,
      if (daysOfWeek != null) 'days_of_week': daysOfWeek,
      if (startTime != null) 'start_time': startTime,
      if (endTime != null) 'end_time': endTime,
      if (combinable != null) 'combinable': combinable,
      if (priority != null) 'priority': priority,
      if (isActive != null) 'is_active': isActive,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DiscountsDriftCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<String?>? description,
      Value<String>? type,
      Value<String>? activation,
      Value<String?>? code,
      Value<String>? scope,
      Value<String>? productIds,
      Value<String>? categoryIds,
      Value<int?>? value,
      Value<int?>? quantityTrigger,
      Value<int?>? quantityReward,
      Value<String?>? quantityRewardType,
      Value<int?>? quantityRewardValue,
      Value<int?>? quantityBundlePrice,
      Value<int?>? minimumAmount,
      Value<int?>? minimumQuantity,
      Value<int?>? maximumDiscount,
      Value<int?>? usageLimit,
      Value<int>? usageCount,
      Value<DateTime?>? firstUsedAt,
      Value<DateTime?>? lastUsedAt,
      Value<DateTime?>? startDate,
      Value<DateTime?>? endDate,
      Value<String>? daysOfWeek,
      Value<String?>? startTime,
      Value<String?>? endTime,
      Value<bool>? combinable,
      Value<int>? priority,
      Value<bool>? isActive,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<DateTime?>? deletedAt,
      Value<int>? rowid}) {
    return DiscountsDriftCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      type: type ?? this.type,
      activation: activation ?? this.activation,
      code: code ?? this.code,
      scope: scope ?? this.scope,
      productIds: productIds ?? this.productIds,
      categoryIds: categoryIds ?? this.categoryIds,
      value: value ?? this.value,
      quantityTrigger: quantityTrigger ?? this.quantityTrigger,
      quantityReward: quantityReward ?? this.quantityReward,
      quantityRewardType: quantityRewardType ?? this.quantityRewardType,
      quantityRewardValue: quantityRewardValue ?? this.quantityRewardValue,
      quantityBundlePrice: quantityBundlePrice ?? this.quantityBundlePrice,
      minimumAmount: minimumAmount ?? this.minimumAmount,
      minimumQuantity: minimumQuantity ?? this.minimumQuantity,
      maximumDiscount: maximumDiscount ?? this.maximumDiscount,
      usageLimit: usageLimit ?? this.usageLimit,
      usageCount: usageCount ?? this.usageCount,
      firstUsedAt: firstUsedAt ?? this.firstUsedAt,
      lastUsedAt: lastUsedAt ?? this.lastUsedAt,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      daysOfWeek: daysOfWeek ?? this.daysOfWeek,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      combinable: combinable ?? this.combinable,
      priority: priority ?? this.priority,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(type.value);
    }
    if (activation.present) {
      map['activation'] = Variable<String>(activation.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (scope.present) {
      map['scope'] = Variable<String>(scope.value);
    }
    if (productIds.present) {
      map['product_ids'] = Variable<String>(productIds.value);
    }
    if (categoryIds.present) {
      map['category_ids'] = Variable<String>(categoryIds.value);
    }
    if (value.present) {
      map['value'] = Variable<int>(value.value);
    }
    if (quantityTrigger.present) {
      map['quantity_trigger'] = Variable<int>(quantityTrigger.value);
    }
    if (quantityReward.present) {
      map['quantity_reward'] = Variable<int>(quantityReward.value);
    }
    if (quantityRewardType.present) {
      map['quantity_reward_type'] = Variable<String>(quantityRewardType.value);
    }
    if (quantityRewardValue.present) {
      map['quantity_reward_value'] = Variable<int>(quantityRewardValue.value);
    }
    if (quantityBundlePrice.present) {
      map['quantity_bundle_price'] = Variable<int>(quantityBundlePrice.value);
    }
    if (minimumAmount.present) {
      map['minimum_amount'] = Variable<int>(minimumAmount.value);
    }
    if (minimumQuantity.present) {
      map['minimum_quantity'] = Variable<int>(minimumQuantity.value);
    }
    if (maximumDiscount.present) {
      map['maximum_discount'] = Variable<int>(maximumDiscount.value);
    }
    if (usageLimit.present) {
      map['usage_limit'] = Variable<int>(usageLimit.value);
    }
    if (usageCount.present) {
      map['usage_count'] = Variable<int>(usageCount.value);
    }
    if (firstUsedAt.present) {
      map['first_used_at'] = Variable<DateTime>(firstUsedAt.value);
    }
    if (lastUsedAt.present) {
      map['last_used_at'] = Variable<DateTime>(lastUsedAt.value);
    }
    if (startDate.present) {
      map['start_date'] = Variable<DateTime>(startDate.value);
    }
    if (endDate.present) {
      map['end_date'] = Variable<DateTime>(endDate.value);
    }
    if (daysOfWeek.present) {
      map['days_of_week'] = Variable<String>(daysOfWeek.value);
    }
    if (startTime.present) {
      map['start_time'] = Variable<String>(startTime.value);
    }
    if (endTime.present) {
      map['end_time'] = Variable<String>(endTime.value);
    }
    if (combinable.present) {
      map['combinable'] = Variable<bool>(combinable.value);
    }
    if (priority.present) {
      map['priority'] = Variable<int>(priority.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('DiscountsDriftCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('description: $description, ')
          ..write('type: $type, ')
          ..write('activation: $activation, ')
          ..write('code: $code, ')
          ..write('scope: $scope, ')
          ..write('productIds: $productIds, ')
          ..write('categoryIds: $categoryIds, ')
          ..write('value: $value, ')
          ..write('quantityTrigger: $quantityTrigger, ')
          ..write('quantityReward: $quantityReward, ')
          ..write('quantityRewardType: $quantityRewardType, ')
          ..write('quantityRewardValue: $quantityRewardValue, ')
          ..write('quantityBundlePrice: $quantityBundlePrice, ')
          ..write('minimumAmount: $minimumAmount, ')
          ..write('minimumQuantity: $minimumQuantity, ')
          ..write('maximumDiscount: $maximumDiscount, ')
          ..write('usageLimit: $usageLimit, ')
          ..write('usageCount: $usageCount, ')
          ..write('firstUsedAt: $firstUsedAt, ')
          ..write('lastUsedAt: $lastUsedAt, ')
          ..write('startDate: $startDate, ')
          ..write('endDate: $endDate, ')
          ..write('daysOfWeek: $daysOfWeek, ')
          ..write('startTime: $startTime, ')
          ..write('endTime: $endTime, ')
          ..write('combinable: $combinable, ')
          ..write('priority: $priority, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $OrderDriftTable extends OrderDrift
    with TableInfo<$OrderDriftTable, OrderDriftData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OrderDriftTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _tableIdMeta =
      const VerificationMeta('tableId');
  @override
  late final GeneratedColumn<String> tableId = GeneratedColumn<String>(
      'table_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _groupIdMeta =
      const VerificationMeta('groupId');
  @override
  late final GeneratedColumn<String> groupId = GeneratedColumn<String>(
      'group_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _paymentIdMeta =
      const VerificationMeta('paymentId');
  @override
  late final GeneratedColumn<String> paymentId = GeneratedColumn<String>(
      'payment_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _validatedAtMeta =
      const VerificationMeta('validatedAt');
  @override
  late final GeneratedColumn<DateTime> validatedAt = GeneratedColumn<DateTime>(
      'validated_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('draft'));
  static const VerificationMeta _createdByIdMeta =
      const VerificationMeta('createdById');
  @override
  late final GeneratedColumn<String> createdById = GeneratedColumn<String>(
      'created_by_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        tableId,
        groupId,
        paymentId,
        validatedAt,
        status,
        createdById,
        deletedAt,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'order_drift';
  @override
  VerificationContext validateIntegrity(Insertable<OrderDriftData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('table_id')) {
      context.handle(_tableIdMeta,
          tableId.isAcceptableOrUnknown(data['table_id']!, _tableIdMeta));
    } else if (isInserting) {
      context.missing(_tableIdMeta);
    }
    if (data.containsKey('group_id')) {
      context.handle(_groupIdMeta,
          groupId.isAcceptableOrUnknown(data['group_id']!, _groupIdMeta));
    } else if (isInserting) {
      context.missing(_groupIdMeta);
    }
    if (data.containsKey('payment_id')) {
      context.handle(_paymentIdMeta,
          paymentId.isAcceptableOrUnknown(data['payment_id']!, _paymentIdMeta));
    }
    if (data.containsKey('validated_at')) {
      context.handle(
          _validatedAtMeta,
          validatedAt.isAcceptableOrUnknown(
              data['validated_at']!, _validatedAtMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('created_by_id')) {
      context.handle(
          _createdByIdMeta,
          createdById.isAcceptableOrUnknown(
              data['created_by_id']!, _createdByIdMeta));
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  OrderDriftData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OrderDriftData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      tableId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}table_id'])!,
      groupId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}group_id'])!,
      paymentId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}payment_id']),
      validatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}validated_at']),
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      createdById: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_by_id']),
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $OrderDriftTable createAlias(String alias) {
    return $OrderDriftTable(attachedDatabase, alias);
  }
}

class OrderDriftData extends DataClass implements Insertable<OrderDriftData> {
  final String id;
  final String tableId;
  final String groupId;
  final String? paymentId;
  final DateTime? validatedAt;
  final String status;
  final String? createdById;
  final DateTime? deletedAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  const OrderDriftData(
      {required this.id,
      required this.tableId,
      required this.groupId,
      this.paymentId,
      this.validatedAt,
      required this.status,
      this.createdById,
      this.deletedAt,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['table_id'] = Variable<String>(tableId);
    map['group_id'] = Variable<String>(groupId);
    if (!nullToAbsent || paymentId != null) {
      map['payment_id'] = Variable<String>(paymentId);
    }
    if (!nullToAbsent || validatedAt != null) {
      map['validated_at'] = Variable<DateTime>(validatedAt);
    }
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || createdById != null) {
      map['created_by_id'] = Variable<String>(createdById);
    }
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  OrderDriftCompanion toCompanion(bool nullToAbsent) {
    return OrderDriftCompanion(
      id: Value(id),
      tableId: Value(tableId),
      groupId: Value(groupId),
      paymentId: paymentId == null && nullToAbsent
          ? const Value.absent()
          : Value(paymentId),
      validatedAt: validatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(validatedAt),
      status: Value(status),
      createdById: createdById == null && nullToAbsent
          ? const Value.absent()
          : Value(createdById),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory OrderDriftData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OrderDriftData(
      id: serializer.fromJson<String>(json['id']),
      tableId: serializer.fromJson<String>(json['tableId']),
      groupId: serializer.fromJson<String>(json['groupId']),
      paymentId: serializer.fromJson<String?>(json['paymentId']),
      validatedAt: serializer.fromJson<DateTime?>(json['validatedAt']),
      status: serializer.fromJson<String>(json['status']),
      createdById: serializer.fromJson<String?>(json['createdById']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'tableId': serializer.toJson<String>(tableId),
      'groupId': serializer.toJson<String>(groupId),
      'paymentId': serializer.toJson<String?>(paymentId),
      'validatedAt': serializer.toJson<DateTime?>(validatedAt),
      'status': serializer.toJson<String>(status),
      'createdById': serializer.toJson<String?>(createdById),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  OrderDriftData copyWith(
          {String? id,
          String? tableId,
          String? groupId,
          Value<String?> paymentId = const Value.absent(),
          Value<DateTime?> validatedAt = const Value.absent(),
          String? status,
          Value<String?> createdById = const Value.absent(),
          Value<DateTime?> deletedAt = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      OrderDriftData(
        id: id ?? this.id,
        tableId: tableId ?? this.tableId,
        groupId: groupId ?? this.groupId,
        paymentId: paymentId.present ? paymentId.value : this.paymentId,
        validatedAt: validatedAt.present ? validatedAt.value : this.validatedAt,
        status: status ?? this.status,
        createdById: createdById.present ? createdById.value : this.createdById,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  OrderDriftData copyWithCompanion(OrderDriftCompanion data) {
    return OrderDriftData(
      id: data.id.present ? data.id.value : this.id,
      tableId: data.tableId.present ? data.tableId.value : this.tableId,
      groupId: data.groupId.present ? data.groupId.value : this.groupId,
      paymentId: data.paymentId.present ? data.paymentId.value : this.paymentId,
      validatedAt:
          data.validatedAt.present ? data.validatedAt.value : this.validatedAt,
      status: data.status.present ? data.status.value : this.status,
      createdById:
          data.createdById.present ? data.createdById.value : this.createdById,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('OrderDriftData(')
          ..write('id: $id, ')
          ..write('tableId: $tableId, ')
          ..write('groupId: $groupId, ')
          ..write('paymentId: $paymentId, ')
          ..write('validatedAt: $validatedAt, ')
          ..write('status: $status, ')
          ..write('createdById: $createdById, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, tableId, groupId, paymentId, validatedAt,
      status, createdById, deletedAt, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OrderDriftData &&
          other.id == this.id &&
          other.tableId == this.tableId &&
          other.groupId == this.groupId &&
          other.paymentId == this.paymentId &&
          other.validatedAt == this.validatedAt &&
          other.status == this.status &&
          other.createdById == this.createdById &&
          other.deletedAt == this.deletedAt &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class OrderDriftCompanion extends UpdateCompanion<OrderDriftData> {
  final Value<String> id;
  final Value<String> tableId;
  final Value<String> groupId;
  final Value<String?> paymentId;
  final Value<DateTime?> validatedAt;
  final Value<String> status;
  final Value<String?> createdById;
  final Value<DateTime?> deletedAt;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const OrderDriftCompanion({
    this.id = const Value.absent(),
    this.tableId = const Value.absent(),
    this.groupId = const Value.absent(),
    this.paymentId = const Value.absent(),
    this.validatedAt = const Value.absent(),
    this.status = const Value.absent(),
    this.createdById = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  OrderDriftCompanion.insert({
    required String id,
    required String tableId,
    required String groupId,
    this.paymentId = const Value.absent(),
    this.validatedAt = const Value.absent(),
    this.status = const Value.absent(),
    this.createdById = const Value.absent(),
    this.deletedAt = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        tableId = Value(tableId),
        groupId = Value(groupId),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<OrderDriftData> custom({
    Expression<String>? id,
    Expression<String>? tableId,
    Expression<String>? groupId,
    Expression<String>? paymentId,
    Expression<DateTime>? validatedAt,
    Expression<String>? status,
    Expression<String>? createdById,
    Expression<DateTime>? deletedAt,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (tableId != null) 'table_id': tableId,
      if (groupId != null) 'group_id': groupId,
      if (paymentId != null) 'payment_id': paymentId,
      if (validatedAt != null) 'validated_at': validatedAt,
      if (status != null) 'status': status,
      if (createdById != null) 'created_by_id': createdById,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  OrderDriftCompanion copyWith(
      {Value<String>? id,
      Value<String>? tableId,
      Value<String>? groupId,
      Value<String?>? paymentId,
      Value<DateTime?>? validatedAt,
      Value<String>? status,
      Value<String?>? createdById,
      Value<DateTime?>? deletedAt,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<int>? rowid}) {
    return OrderDriftCompanion(
      id: id ?? this.id,
      tableId: tableId ?? this.tableId,
      groupId: groupId ?? this.groupId,
      paymentId: paymentId ?? this.paymentId,
      validatedAt: validatedAt ?? this.validatedAt,
      status: status ?? this.status,
      createdById: createdById ?? this.createdById,
      deletedAt: deletedAt ?? this.deletedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (tableId.present) {
      map['table_id'] = Variable<String>(tableId.value);
    }
    if (groupId.present) {
      map['group_id'] = Variable<String>(groupId.value);
    }
    if (paymentId.present) {
      map['payment_id'] = Variable<String>(paymentId.value);
    }
    if (validatedAt.present) {
      map['validated_at'] = Variable<DateTime>(validatedAt.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (createdById.present) {
      map['created_by_id'] = Variable<String>(createdById.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OrderDriftCompanion(')
          ..write('id: $id, ')
          ..write('tableId: $tableId, ')
          ..write('groupId: $groupId, ')
          ..write('paymentId: $paymentId, ')
          ..write('validatedAt: $validatedAt, ')
          ..write('status: $status, ')
          ..write('createdById: $createdById, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $OrderItemDriftTable extends OrderItemDrift
    with TableInfo<$OrderItemDriftTable, OrderItemDriftData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OrderItemDriftTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _commentMeta =
      const VerificationMeta('comment');
  @override
  late final GeneratedColumn<String> comment = GeneratedColumn<String>(
      'comment', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _orderIdMeta =
      const VerificationMeta('orderId');
  @override
  late final GeneratedColumn<String> orderId = GeneratedColumn<String>(
      'order_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _productIdMeta =
      const VerificationMeta('productId');
  @override
  late final GeneratedColumn<String> productId = GeneratedColumn<String>(
      'product_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _productNameMeta =
      const VerificationMeta('productName');
  @override
  late final GeneratedColumn<String> productName = GeneratedColumn<String>(
      'product_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _quantityMeta =
      const VerificationMeta('quantity');
  @override
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
      'quantity', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _unitPriceMeta =
      const VerificationMeta('unitPrice');
  @override
  late final GeneratedColumn<int> unitPrice = GeneratedColumn<int>(
      'unit_price', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _vatMeta = const VerificationMeta('vat');
  @override
  late final GeneratedColumn<double> vat = GeneratedColumn<double>(
      'vat', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _validatedAtMeta =
      const VerificationMeta('validatedAt');
  @override
  late final GeneratedColumn<DateTime> validatedAt = GeneratedColumn<DateTime>(
      'validated_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _statusMeta = const VerificationMeta('status');
  @override
  late final GeneratedColumn<String> status = GeneratedColumn<String>(
      'status', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('draft'));
  static const VerificationMeta _createdByIdMeta =
      const VerificationMeta('createdById');
  @override
  late final GeneratedColumn<String> createdById = GeneratedColumn<String>(
      'created_by_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        comment,
        orderId,
        productId,
        productName,
        quantity,
        unitPrice,
        vat,
        validatedAt,
        status,
        createdById,
        deletedAt,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'order_item_drift';
  @override
  VerificationContext validateIntegrity(Insertable<OrderItemDriftData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('comment')) {
      context.handle(_commentMeta,
          comment.isAcceptableOrUnknown(data['comment']!, _commentMeta));
    }
    if (data.containsKey('order_id')) {
      context.handle(_orderIdMeta,
          orderId.isAcceptableOrUnknown(data['order_id']!, _orderIdMeta));
    } else if (isInserting) {
      context.missing(_orderIdMeta);
    }
    if (data.containsKey('product_id')) {
      context.handle(_productIdMeta,
          productId.isAcceptableOrUnknown(data['product_id']!, _productIdMeta));
    }
    if (data.containsKey('product_name')) {
      context.handle(
          _productNameMeta,
          productName.isAcceptableOrUnknown(
              data['product_name']!, _productNameMeta));
    } else if (isInserting) {
      context.missing(_productNameMeta);
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta));
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('unit_price')) {
      context.handle(_unitPriceMeta,
          unitPrice.isAcceptableOrUnknown(data['unit_price']!, _unitPriceMeta));
    }
    if (data.containsKey('vat')) {
      context.handle(
          _vatMeta, vat.isAcceptableOrUnknown(data['vat']!, _vatMeta));
    }
    if (data.containsKey('validated_at')) {
      context.handle(
          _validatedAtMeta,
          validatedAt.isAcceptableOrUnknown(
              data['validated_at']!, _validatedAtMeta));
    }
    if (data.containsKey('status')) {
      context.handle(_statusMeta,
          status.isAcceptableOrUnknown(data['status']!, _statusMeta));
    }
    if (data.containsKey('created_by_id')) {
      context.handle(
          _createdByIdMeta,
          createdById.isAcceptableOrUnknown(
              data['created_by_id']!, _createdByIdMeta));
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  OrderItemDriftData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OrderItemDriftData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      comment: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}comment']),
      orderId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}order_id'])!,
      productId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}product_id']),
      productName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}product_name'])!,
      quantity: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}quantity'])!,
      unitPrice: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}unit_price'])!,
      vat: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}vat'])!,
      validatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}validated_at']),
      status: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}status'])!,
      createdById: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_by_id']),
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $OrderItemDriftTable createAlias(String alias) {
    return $OrderItemDriftTable(attachedDatabase, alias);
  }
}

class OrderItemDriftData extends DataClass
    implements Insertable<OrderItemDriftData> {
  final String id;
  final String? comment;
  final String orderId;
  final String? productId;
  final String productName;
  final int quantity;
  final int unitPrice;
  final double vat;
  final DateTime? validatedAt;
  final String status;
  final String? createdById;
  final DateTime? deletedAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  const OrderItemDriftData(
      {required this.id,
      this.comment,
      required this.orderId,
      this.productId,
      required this.productName,
      required this.quantity,
      required this.unitPrice,
      required this.vat,
      this.validatedAt,
      required this.status,
      this.createdById,
      this.deletedAt,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    if (!nullToAbsent || comment != null) {
      map['comment'] = Variable<String>(comment);
    }
    map['order_id'] = Variable<String>(orderId);
    if (!nullToAbsent || productId != null) {
      map['product_id'] = Variable<String>(productId);
    }
    map['product_name'] = Variable<String>(productName);
    map['quantity'] = Variable<int>(quantity);
    map['unit_price'] = Variable<int>(unitPrice);
    map['vat'] = Variable<double>(vat);
    if (!nullToAbsent || validatedAt != null) {
      map['validated_at'] = Variable<DateTime>(validatedAt);
    }
    map['status'] = Variable<String>(status);
    if (!nullToAbsent || createdById != null) {
      map['created_by_id'] = Variable<String>(createdById);
    }
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  OrderItemDriftCompanion toCompanion(bool nullToAbsent) {
    return OrderItemDriftCompanion(
      id: Value(id),
      comment: comment == null && nullToAbsent
          ? const Value.absent()
          : Value(comment),
      orderId: Value(orderId),
      productId: productId == null && nullToAbsent
          ? const Value.absent()
          : Value(productId),
      productName: Value(productName),
      quantity: Value(quantity),
      unitPrice: Value(unitPrice),
      vat: Value(vat),
      validatedAt: validatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(validatedAt),
      status: Value(status),
      createdById: createdById == null && nullToAbsent
          ? const Value.absent()
          : Value(createdById),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory OrderItemDriftData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OrderItemDriftData(
      id: serializer.fromJson<String>(json['id']),
      comment: serializer.fromJson<String?>(json['comment']),
      orderId: serializer.fromJson<String>(json['orderId']),
      productId: serializer.fromJson<String?>(json['productId']),
      productName: serializer.fromJson<String>(json['productName']),
      quantity: serializer.fromJson<int>(json['quantity']),
      unitPrice: serializer.fromJson<int>(json['unitPrice']),
      vat: serializer.fromJson<double>(json['vat']),
      validatedAt: serializer.fromJson<DateTime?>(json['validatedAt']),
      status: serializer.fromJson<String>(json['status']),
      createdById: serializer.fromJson<String?>(json['createdById']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'comment': serializer.toJson<String?>(comment),
      'orderId': serializer.toJson<String>(orderId),
      'productId': serializer.toJson<String?>(productId),
      'productName': serializer.toJson<String>(productName),
      'quantity': serializer.toJson<int>(quantity),
      'unitPrice': serializer.toJson<int>(unitPrice),
      'vat': serializer.toJson<double>(vat),
      'validatedAt': serializer.toJson<DateTime?>(validatedAt),
      'status': serializer.toJson<String>(status),
      'createdById': serializer.toJson<String?>(createdById),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  OrderItemDriftData copyWith(
          {String? id,
          Value<String?> comment = const Value.absent(),
          String? orderId,
          Value<String?> productId = const Value.absent(),
          String? productName,
          int? quantity,
          int? unitPrice,
          double? vat,
          Value<DateTime?> validatedAt = const Value.absent(),
          String? status,
          Value<String?> createdById = const Value.absent(),
          Value<DateTime?> deletedAt = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      OrderItemDriftData(
        id: id ?? this.id,
        comment: comment.present ? comment.value : this.comment,
        orderId: orderId ?? this.orderId,
        productId: productId.present ? productId.value : this.productId,
        productName: productName ?? this.productName,
        quantity: quantity ?? this.quantity,
        unitPrice: unitPrice ?? this.unitPrice,
        vat: vat ?? this.vat,
        validatedAt: validatedAt.present ? validatedAt.value : this.validatedAt,
        status: status ?? this.status,
        createdById: createdById.present ? createdById.value : this.createdById,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  OrderItemDriftData copyWithCompanion(OrderItemDriftCompanion data) {
    return OrderItemDriftData(
      id: data.id.present ? data.id.value : this.id,
      comment: data.comment.present ? data.comment.value : this.comment,
      orderId: data.orderId.present ? data.orderId.value : this.orderId,
      productId: data.productId.present ? data.productId.value : this.productId,
      productName:
          data.productName.present ? data.productName.value : this.productName,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      unitPrice: data.unitPrice.present ? data.unitPrice.value : this.unitPrice,
      vat: data.vat.present ? data.vat.value : this.vat,
      validatedAt:
          data.validatedAt.present ? data.validatedAt.value : this.validatedAt,
      status: data.status.present ? data.status.value : this.status,
      createdById:
          data.createdById.present ? data.createdById.value : this.createdById,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('OrderItemDriftData(')
          ..write('id: $id, ')
          ..write('comment: $comment, ')
          ..write('orderId: $orderId, ')
          ..write('productId: $productId, ')
          ..write('productName: $productName, ')
          ..write('quantity: $quantity, ')
          ..write('unitPrice: $unitPrice, ')
          ..write('vat: $vat, ')
          ..write('validatedAt: $validatedAt, ')
          ..write('status: $status, ')
          ..write('createdById: $createdById, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      comment,
      orderId,
      productId,
      productName,
      quantity,
      unitPrice,
      vat,
      validatedAt,
      status,
      createdById,
      deletedAt,
      createdAt,
      updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OrderItemDriftData &&
          other.id == this.id &&
          other.comment == this.comment &&
          other.orderId == this.orderId &&
          other.productId == this.productId &&
          other.productName == this.productName &&
          other.quantity == this.quantity &&
          other.unitPrice == this.unitPrice &&
          other.vat == this.vat &&
          other.validatedAt == this.validatedAt &&
          other.status == this.status &&
          other.createdById == this.createdById &&
          other.deletedAt == this.deletedAt &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class OrderItemDriftCompanion extends UpdateCompanion<OrderItemDriftData> {
  final Value<String> id;
  final Value<String?> comment;
  final Value<String> orderId;
  final Value<String?> productId;
  final Value<String> productName;
  final Value<int> quantity;
  final Value<int> unitPrice;
  final Value<double> vat;
  final Value<DateTime?> validatedAt;
  final Value<String> status;
  final Value<String?> createdById;
  final Value<DateTime?> deletedAt;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const OrderItemDriftCompanion({
    this.id = const Value.absent(),
    this.comment = const Value.absent(),
    this.orderId = const Value.absent(),
    this.productId = const Value.absent(),
    this.productName = const Value.absent(),
    this.quantity = const Value.absent(),
    this.unitPrice = const Value.absent(),
    this.vat = const Value.absent(),
    this.validatedAt = const Value.absent(),
    this.status = const Value.absent(),
    this.createdById = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  OrderItemDriftCompanion.insert({
    required String id,
    this.comment = const Value.absent(),
    required String orderId,
    this.productId = const Value.absent(),
    required String productName,
    required int quantity,
    this.unitPrice = const Value.absent(),
    this.vat = const Value.absent(),
    this.validatedAt = const Value.absent(),
    this.status = const Value.absent(),
    this.createdById = const Value.absent(),
    this.deletedAt = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        orderId = Value(orderId),
        productName = Value(productName),
        quantity = Value(quantity),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<OrderItemDriftData> custom({
    Expression<String>? id,
    Expression<String>? comment,
    Expression<String>? orderId,
    Expression<String>? productId,
    Expression<String>? productName,
    Expression<int>? quantity,
    Expression<int>? unitPrice,
    Expression<double>? vat,
    Expression<DateTime>? validatedAt,
    Expression<String>? status,
    Expression<String>? createdById,
    Expression<DateTime>? deletedAt,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (comment != null) 'comment': comment,
      if (orderId != null) 'order_id': orderId,
      if (productId != null) 'product_id': productId,
      if (productName != null) 'product_name': productName,
      if (quantity != null) 'quantity': quantity,
      if (unitPrice != null) 'unit_price': unitPrice,
      if (vat != null) 'vat': vat,
      if (validatedAt != null) 'validated_at': validatedAt,
      if (status != null) 'status': status,
      if (createdById != null) 'created_by_id': createdById,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  OrderItemDriftCompanion copyWith(
      {Value<String>? id,
      Value<String?>? comment,
      Value<String>? orderId,
      Value<String?>? productId,
      Value<String>? productName,
      Value<int>? quantity,
      Value<int>? unitPrice,
      Value<double>? vat,
      Value<DateTime?>? validatedAt,
      Value<String>? status,
      Value<String?>? createdById,
      Value<DateTime?>? deletedAt,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<int>? rowid}) {
    return OrderItemDriftCompanion(
      id: id ?? this.id,
      comment: comment ?? this.comment,
      orderId: orderId ?? this.orderId,
      productId: productId ?? this.productId,
      productName: productName ?? this.productName,
      quantity: quantity ?? this.quantity,
      unitPrice: unitPrice ?? this.unitPrice,
      vat: vat ?? this.vat,
      validatedAt: validatedAt ?? this.validatedAt,
      status: status ?? this.status,
      createdById: createdById ?? this.createdById,
      deletedAt: deletedAt ?? this.deletedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (comment.present) {
      map['comment'] = Variable<String>(comment.value);
    }
    if (orderId.present) {
      map['order_id'] = Variable<String>(orderId.value);
    }
    if (productId.present) {
      map['product_id'] = Variable<String>(productId.value);
    }
    if (productName.present) {
      map['product_name'] = Variable<String>(productName.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (unitPrice.present) {
      map['unit_price'] = Variable<int>(unitPrice.value);
    }
    if (vat.present) {
      map['vat'] = Variable<double>(vat.value);
    }
    if (validatedAt.present) {
      map['validated_at'] = Variable<DateTime>(validatedAt.value);
    }
    if (status.present) {
      map['status'] = Variable<String>(status.value);
    }
    if (createdById.present) {
      map['created_by_id'] = Variable<String>(createdById.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OrderItemDriftCompanion(')
          ..write('id: $id, ')
          ..write('comment: $comment, ')
          ..write('orderId: $orderId, ')
          ..write('productId: $productId, ')
          ..write('productName: $productName, ')
          ..write('quantity: $quantity, ')
          ..write('unitPrice: $unitPrice, ')
          ..write('vat: $vat, ')
          ..write('validatedAt: $validatedAt, ')
          ..write('status: $status, ')
          ..write('createdById: $createdById, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $OrderItemOptionsDriftTable extends OrderItemOptionsDrift
    with TableInfo<$OrderItemOptionsDriftTable, OrderItemOptionsDriftData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OrderItemOptionsDriftTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _orderItemIdMeta =
      const VerificationMeta('orderItemId');
  @override
  late final GeneratedColumn<String> orderItemId = GeneratedColumn<String>(
      'order_item_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _optionIdMeta =
      const VerificationMeta('optionId');
  @override
  late final GeneratedColumn<String> optionId = GeneratedColumn<String>(
      'option_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _quantityMeta =
      const VerificationMeta('quantity');
  @override
  late final GeneratedColumn<int> quantity = GeneratedColumn<int>(
      'quantity', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _unitPriceMeta =
      const VerificationMeta('unitPrice');
  @override
  late final GeneratedColumn<int> unitPrice = GeneratedColumn<int>(
      'unit_price', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _vatMeta = const VerificationMeta('vat');
  @override
  late final GeneratedColumn<double> vat = GeneratedColumn<double>(
      'vat', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _optionNameMeta =
      const VerificationMeta('optionName');
  @override
  late final GeneratedColumn<String> optionName = GeneratedColumn<String>(
      'option_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _createdByIdMeta =
      const VerificationMeta('createdById');
  @override
  late final GeneratedColumn<String> createdById = GeneratedColumn<String>(
      'created_by_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        orderItemId,
        optionId,
        quantity,
        unitPrice,
        vat,
        optionName,
        createdById,
        deletedAt,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'order_item_options_drift';
  @override
  VerificationContext validateIntegrity(
      Insertable<OrderItemOptionsDriftData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('order_item_id')) {
      context.handle(
          _orderItemIdMeta,
          orderItemId.isAcceptableOrUnknown(
              data['order_item_id']!, _orderItemIdMeta));
    } else if (isInserting) {
      context.missing(_orderItemIdMeta);
    }
    if (data.containsKey('option_id')) {
      context.handle(_optionIdMeta,
          optionId.isAcceptableOrUnknown(data['option_id']!, _optionIdMeta));
    }
    if (data.containsKey('quantity')) {
      context.handle(_quantityMeta,
          quantity.isAcceptableOrUnknown(data['quantity']!, _quantityMeta));
    } else if (isInserting) {
      context.missing(_quantityMeta);
    }
    if (data.containsKey('unit_price')) {
      context.handle(_unitPriceMeta,
          unitPrice.isAcceptableOrUnknown(data['unit_price']!, _unitPriceMeta));
    }
    if (data.containsKey('vat')) {
      context.handle(
          _vatMeta, vat.isAcceptableOrUnknown(data['vat']!, _vatMeta));
    }
    if (data.containsKey('option_name')) {
      context.handle(
          _optionNameMeta,
          optionName.isAcceptableOrUnknown(
              data['option_name']!, _optionNameMeta));
    } else if (isInserting) {
      context.missing(_optionNameMeta);
    }
    if (data.containsKey('created_by_id')) {
      context.handle(
          _createdByIdMeta,
          createdById.isAcceptableOrUnknown(
              data['created_by_id']!, _createdByIdMeta));
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  OrderItemOptionsDriftData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OrderItemOptionsDriftData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      orderItemId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}order_item_id'])!,
      optionId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}option_id']),
      quantity: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}quantity'])!,
      unitPrice: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}unit_price'])!,
      vat: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}vat'])!,
      optionName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}option_name'])!,
      createdById: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_by_id']),
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $OrderItemOptionsDriftTable createAlias(String alias) {
    return $OrderItemOptionsDriftTable(attachedDatabase, alias);
  }
}

class OrderItemOptionsDriftData extends DataClass
    implements Insertable<OrderItemOptionsDriftData> {
  final String id;
  final String orderItemId;
  final String? optionId;
  final int quantity;
  final int unitPrice;
  final double vat;
  final String optionName;
  final String? createdById;
  final DateTime? deletedAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  const OrderItemOptionsDriftData(
      {required this.id,
      required this.orderItemId,
      this.optionId,
      required this.quantity,
      required this.unitPrice,
      required this.vat,
      required this.optionName,
      this.createdById,
      this.deletedAt,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['order_item_id'] = Variable<String>(orderItemId);
    if (!nullToAbsent || optionId != null) {
      map['option_id'] = Variable<String>(optionId);
    }
    map['quantity'] = Variable<int>(quantity);
    map['unit_price'] = Variable<int>(unitPrice);
    map['vat'] = Variable<double>(vat);
    map['option_name'] = Variable<String>(optionName);
    if (!nullToAbsent || createdById != null) {
      map['created_by_id'] = Variable<String>(createdById);
    }
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  OrderItemOptionsDriftCompanion toCompanion(bool nullToAbsent) {
    return OrderItemOptionsDriftCompanion(
      id: Value(id),
      orderItemId: Value(orderItemId),
      optionId: optionId == null && nullToAbsent
          ? const Value.absent()
          : Value(optionId),
      quantity: Value(quantity),
      unitPrice: Value(unitPrice),
      vat: Value(vat),
      optionName: Value(optionName),
      createdById: createdById == null && nullToAbsent
          ? const Value.absent()
          : Value(createdById),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory OrderItemOptionsDriftData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OrderItemOptionsDriftData(
      id: serializer.fromJson<String>(json['id']),
      orderItemId: serializer.fromJson<String>(json['orderItemId']),
      optionId: serializer.fromJson<String?>(json['optionId']),
      quantity: serializer.fromJson<int>(json['quantity']),
      unitPrice: serializer.fromJson<int>(json['unitPrice']),
      vat: serializer.fromJson<double>(json['vat']),
      optionName: serializer.fromJson<String>(json['optionName']),
      createdById: serializer.fromJson<String?>(json['createdById']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'orderItemId': serializer.toJson<String>(orderItemId),
      'optionId': serializer.toJson<String?>(optionId),
      'quantity': serializer.toJson<int>(quantity),
      'unitPrice': serializer.toJson<int>(unitPrice),
      'vat': serializer.toJson<double>(vat),
      'optionName': serializer.toJson<String>(optionName),
      'createdById': serializer.toJson<String?>(createdById),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  OrderItemOptionsDriftData copyWith(
          {String? id,
          String? orderItemId,
          Value<String?> optionId = const Value.absent(),
          int? quantity,
          int? unitPrice,
          double? vat,
          String? optionName,
          Value<String?> createdById = const Value.absent(),
          Value<DateTime?> deletedAt = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      OrderItemOptionsDriftData(
        id: id ?? this.id,
        orderItemId: orderItemId ?? this.orderItemId,
        optionId: optionId.present ? optionId.value : this.optionId,
        quantity: quantity ?? this.quantity,
        unitPrice: unitPrice ?? this.unitPrice,
        vat: vat ?? this.vat,
        optionName: optionName ?? this.optionName,
        createdById: createdById.present ? createdById.value : this.createdById,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  OrderItemOptionsDriftData copyWithCompanion(
      OrderItemOptionsDriftCompanion data) {
    return OrderItemOptionsDriftData(
      id: data.id.present ? data.id.value : this.id,
      orderItemId:
          data.orderItemId.present ? data.orderItemId.value : this.orderItemId,
      optionId: data.optionId.present ? data.optionId.value : this.optionId,
      quantity: data.quantity.present ? data.quantity.value : this.quantity,
      unitPrice: data.unitPrice.present ? data.unitPrice.value : this.unitPrice,
      vat: data.vat.present ? data.vat.value : this.vat,
      optionName:
          data.optionName.present ? data.optionName.value : this.optionName,
      createdById:
          data.createdById.present ? data.createdById.value : this.createdById,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('OrderItemOptionsDriftData(')
          ..write('id: $id, ')
          ..write('orderItemId: $orderItemId, ')
          ..write('optionId: $optionId, ')
          ..write('quantity: $quantity, ')
          ..write('unitPrice: $unitPrice, ')
          ..write('vat: $vat, ')
          ..write('optionName: $optionName, ')
          ..write('createdById: $createdById, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, orderItemId, optionId, quantity,
      unitPrice, vat, optionName, createdById, deletedAt, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OrderItemOptionsDriftData &&
          other.id == this.id &&
          other.orderItemId == this.orderItemId &&
          other.optionId == this.optionId &&
          other.quantity == this.quantity &&
          other.unitPrice == this.unitPrice &&
          other.vat == this.vat &&
          other.optionName == this.optionName &&
          other.createdById == this.createdById &&
          other.deletedAt == this.deletedAt &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class OrderItemOptionsDriftCompanion
    extends UpdateCompanion<OrderItemOptionsDriftData> {
  final Value<String> id;
  final Value<String> orderItemId;
  final Value<String?> optionId;
  final Value<int> quantity;
  final Value<int> unitPrice;
  final Value<double> vat;
  final Value<String> optionName;
  final Value<String?> createdById;
  final Value<DateTime?> deletedAt;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const OrderItemOptionsDriftCompanion({
    this.id = const Value.absent(),
    this.orderItemId = const Value.absent(),
    this.optionId = const Value.absent(),
    this.quantity = const Value.absent(),
    this.unitPrice = const Value.absent(),
    this.vat = const Value.absent(),
    this.optionName = const Value.absent(),
    this.createdById = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  OrderItemOptionsDriftCompanion.insert({
    required String id,
    required String orderItemId,
    this.optionId = const Value.absent(),
    required int quantity,
    this.unitPrice = const Value.absent(),
    this.vat = const Value.absent(),
    required String optionName,
    this.createdById = const Value.absent(),
    this.deletedAt = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        orderItemId = Value(orderItemId),
        quantity = Value(quantity),
        optionName = Value(optionName),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<OrderItemOptionsDriftData> custom({
    Expression<String>? id,
    Expression<String>? orderItemId,
    Expression<String>? optionId,
    Expression<int>? quantity,
    Expression<int>? unitPrice,
    Expression<double>? vat,
    Expression<String>? optionName,
    Expression<String>? createdById,
    Expression<DateTime>? deletedAt,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (orderItemId != null) 'order_item_id': orderItemId,
      if (optionId != null) 'option_id': optionId,
      if (quantity != null) 'quantity': quantity,
      if (unitPrice != null) 'unit_price': unitPrice,
      if (vat != null) 'vat': vat,
      if (optionName != null) 'option_name': optionName,
      if (createdById != null) 'created_by_id': createdById,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  OrderItemOptionsDriftCompanion copyWith(
      {Value<String>? id,
      Value<String>? orderItemId,
      Value<String?>? optionId,
      Value<int>? quantity,
      Value<int>? unitPrice,
      Value<double>? vat,
      Value<String>? optionName,
      Value<String?>? createdById,
      Value<DateTime?>? deletedAt,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<int>? rowid}) {
    return OrderItemOptionsDriftCompanion(
      id: id ?? this.id,
      orderItemId: orderItemId ?? this.orderItemId,
      optionId: optionId ?? this.optionId,
      quantity: quantity ?? this.quantity,
      unitPrice: unitPrice ?? this.unitPrice,
      vat: vat ?? this.vat,
      optionName: optionName ?? this.optionName,
      createdById: createdById ?? this.createdById,
      deletedAt: deletedAt ?? this.deletedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (orderItemId.present) {
      map['order_item_id'] = Variable<String>(orderItemId.value);
    }
    if (optionId.present) {
      map['option_id'] = Variable<String>(optionId.value);
    }
    if (quantity.present) {
      map['quantity'] = Variable<int>(quantity.value);
    }
    if (unitPrice.present) {
      map['unit_price'] = Variable<int>(unitPrice.value);
    }
    if (vat.present) {
      map['vat'] = Variable<double>(vat.value);
    }
    if (optionName.present) {
      map['option_name'] = Variable<String>(optionName.value);
    }
    if (createdById.present) {
      map['created_by_id'] = Variable<String>(createdById.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OrderItemOptionsDriftCompanion(')
          ..write('id: $id, ')
          ..write('orderItemId: $orderItemId, ')
          ..write('optionId: $optionId, ')
          ..write('quantity: $quantity, ')
          ..write('unitPrice: $unitPrice, ')
          ..write('vat: $vat, ')
          ..write('optionName: $optionName, ')
          ..write('createdById: $createdById, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PaymentSessionDriftTable extends PaymentSessionDrift
    with TableInfo<$PaymentSessionDriftTable, PaymentSessionDriftData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PaymentSessionDriftTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _orderIdMeta =
      const VerificationMeta('orderId');
  @override
  late final GeneratedColumn<String> orderId = GeneratedColumn<String>(
      'order_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _partCountsMeta =
      const VerificationMeta('partCounts');
  @override
  late final GeneratedColumn<int> partCounts = GeneratedColumn<int>(
      'part_counts', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _modeMeta = const VerificationMeta('mode');
  @override
  late final GeneratedColumn<String> mode = GeneratedColumn<String>(
      'mode', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('total'));
  static const VerificationMeta _createdByIdMeta =
      const VerificationMeta('createdById');
  @override
  late final GeneratedColumn<String> createdById = GeneratedColumn<String>(
      'created_by_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        orderId,
        partCounts,
        mode,
        createdById,
        deletedAt,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'payment_session_drift';
  @override
  VerificationContext validateIntegrity(
      Insertable<PaymentSessionDriftData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('order_id')) {
      context.handle(_orderIdMeta,
          orderId.isAcceptableOrUnknown(data['order_id']!, _orderIdMeta));
    } else if (isInserting) {
      context.missing(_orderIdMeta);
    }
    if (data.containsKey('part_counts')) {
      context.handle(
          _partCountsMeta,
          partCounts.isAcceptableOrUnknown(
              data['part_counts']!, _partCountsMeta));
    } else if (isInserting) {
      context.missing(_partCountsMeta);
    }
    if (data.containsKey('mode')) {
      context.handle(
          _modeMeta, mode.isAcceptableOrUnknown(data['mode']!, _modeMeta));
    }
    if (data.containsKey('created_by_id')) {
      context.handle(
          _createdByIdMeta,
          createdById.isAcceptableOrUnknown(
              data['created_by_id']!, _createdByIdMeta));
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PaymentSessionDriftData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PaymentSessionDriftData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      orderId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}order_id'])!,
      partCounts: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}part_counts'])!,
      mode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}mode'])!,
      createdById: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_by_id']),
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $PaymentSessionDriftTable createAlias(String alias) {
    return $PaymentSessionDriftTable(attachedDatabase, alias);
  }
}

class PaymentSessionDriftData extends DataClass
    implements Insertable<PaymentSessionDriftData> {
  final String id;
  final String orderId;
  final int partCounts;
  final String mode;
  final String? createdById;
  final DateTime? deletedAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  const PaymentSessionDriftData(
      {required this.id,
      required this.orderId,
      required this.partCounts,
      required this.mode,
      this.createdById,
      this.deletedAt,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['order_id'] = Variable<String>(orderId);
    map['part_counts'] = Variable<int>(partCounts);
    map['mode'] = Variable<String>(mode);
    if (!nullToAbsent || createdById != null) {
      map['created_by_id'] = Variable<String>(createdById);
    }
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  PaymentSessionDriftCompanion toCompanion(bool nullToAbsent) {
    return PaymentSessionDriftCompanion(
      id: Value(id),
      orderId: Value(orderId),
      partCounts: Value(partCounts),
      mode: Value(mode),
      createdById: createdById == null && nullToAbsent
          ? const Value.absent()
          : Value(createdById),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory PaymentSessionDriftData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PaymentSessionDriftData(
      id: serializer.fromJson<String>(json['id']),
      orderId: serializer.fromJson<String>(json['orderId']),
      partCounts: serializer.fromJson<int>(json['partCounts']),
      mode: serializer.fromJson<String>(json['mode']),
      createdById: serializer.fromJson<String?>(json['createdById']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'orderId': serializer.toJson<String>(orderId),
      'partCounts': serializer.toJson<int>(partCounts),
      'mode': serializer.toJson<String>(mode),
      'createdById': serializer.toJson<String?>(createdById),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  PaymentSessionDriftData copyWith(
          {String? id,
          String? orderId,
          int? partCounts,
          String? mode,
          Value<String?> createdById = const Value.absent(),
          Value<DateTime?> deletedAt = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      PaymentSessionDriftData(
        id: id ?? this.id,
        orderId: orderId ?? this.orderId,
        partCounts: partCounts ?? this.partCounts,
        mode: mode ?? this.mode,
        createdById: createdById.present ? createdById.value : this.createdById,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  PaymentSessionDriftData copyWithCompanion(PaymentSessionDriftCompanion data) {
    return PaymentSessionDriftData(
      id: data.id.present ? data.id.value : this.id,
      orderId: data.orderId.present ? data.orderId.value : this.orderId,
      partCounts:
          data.partCounts.present ? data.partCounts.value : this.partCounts,
      mode: data.mode.present ? data.mode.value : this.mode,
      createdById:
          data.createdById.present ? data.createdById.value : this.createdById,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PaymentSessionDriftData(')
          ..write('id: $id, ')
          ..write('orderId: $orderId, ')
          ..write('partCounts: $partCounts, ')
          ..write('mode: $mode, ')
          ..write('createdById: $createdById, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, orderId, partCounts, mode, createdById,
      deletedAt, createdAt, updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PaymentSessionDriftData &&
          other.id == this.id &&
          other.orderId == this.orderId &&
          other.partCounts == this.partCounts &&
          other.mode == this.mode &&
          other.createdById == this.createdById &&
          other.deletedAt == this.deletedAt &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class PaymentSessionDriftCompanion
    extends UpdateCompanion<PaymentSessionDriftData> {
  final Value<String> id;
  final Value<String> orderId;
  final Value<int> partCounts;
  final Value<String> mode;
  final Value<String?> createdById;
  final Value<DateTime?> deletedAt;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const PaymentSessionDriftCompanion({
    this.id = const Value.absent(),
    this.orderId = const Value.absent(),
    this.partCounts = const Value.absent(),
    this.mode = const Value.absent(),
    this.createdById = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PaymentSessionDriftCompanion.insert({
    required String id,
    required String orderId,
    required int partCounts,
    this.mode = const Value.absent(),
    this.createdById = const Value.absent(),
    this.deletedAt = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        orderId = Value(orderId),
        partCounts = Value(partCounts),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<PaymentSessionDriftData> custom({
    Expression<String>? id,
    Expression<String>? orderId,
    Expression<int>? partCounts,
    Expression<String>? mode,
    Expression<String>? createdById,
    Expression<DateTime>? deletedAt,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (orderId != null) 'order_id': orderId,
      if (partCounts != null) 'part_counts': partCounts,
      if (mode != null) 'mode': mode,
      if (createdById != null) 'created_by_id': createdById,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PaymentSessionDriftCompanion copyWith(
      {Value<String>? id,
      Value<String>? orderId,
      Value<int>? partCounts,
      Value<String>? mode,
      Value<String?>? createdById,
      Value<DateTime?>? deletedAt,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<int>? rowid}) {
    return PaymentSessionDriftCompanion(
      id: id ?? this.id,
      orderId: orderId ?? this.orderId,
      partCounts: partCounts ?? this.partCounts,
      mode: mode ?? this.mode,
      createdById: createdById ?? this.createdById,
      deletedAt: deletedAt ?? this.deletedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (orderId.present) {
      map['order_id'] = Variable<String>(orderId.value);
    }
    if (partCounts.present) {
      map['part_counts'] = Variable<int>(partCounts.value);
    }
    if (mode.present) {
      map['mode'] = Variable<String>(mode.value);
    }
    if (createdById.present) {
      map['created_by_id'] = Variable<String>(createdById.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PaymentSessionDriftCompanion(')
          ..write('id: $id, ')
          ..write('orderId: $orderId, ')
          ..write('partCounts: $partCounts, ')
          ..write('mode: $mode, ')
          ..write('createdById: $createdById, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $PaymentTransactionDriftTable extends PaymentTransactionDrift
    with TableInfo<$PaymentTransactionDriftTable, PaymentTransactionDriftData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $PaymentTransactionDriftTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _sessionIdMeta =
      const VerificationMeta('sessionId');
  @override
  late final GeneratedColumn<String> sessionId = GeneratedColumn<String>(
      'session_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _discountIdMeta =
      const VerificationMeta('discountId');
  @override
  late final GeneratedColumn<String> discountId = GeneratedColumn<String>(
      'discount_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _paymentMethodMeta =
      const VerificationMeta('paymentMethod');
  @override
  late final GeneratedColumn<String> paymentMethod = GeneratedColumn<String>(
      'payment_method', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultValue: const Constant('draft'));
  static const VerificationMeta _amountDueMeta =
      const VerificationMeta('amountDue');
  @override
  late final GeneratedColumn<int> amountDue = GeneratedColumn<int>(
      'amount_due', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _amountReceivedMeta =
      const VerificationMeta('amountReceived');
  @override
  late final GeneratedColumn<int> amountReceived = GeneratedColumn<int>(
      'amount_received', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _paidPartCountMeta =
      const VerificationMeta('paidPartCount');
  @override
  late final GeneratedColumn<int> paidPartCount = GeneratedColumn<int>(
      'paid_part_count', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  @override
  late final GeneratedColumnWithTypeConverter<Map<String, int>, String>
      paidArticlesQty = GeneratedColumn<String>(
              'paid_articles_qty', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<Map<String, int>>(
              $PaymentTransactionDriftTable.$converterpaidArticlesQty);
  static const VerificationMeta _validatedAtMeta =
      const VerificationMeta('validatedAt');
  @override
  late final GeneratedColumn<DateTime> validatedAt = GeneratedColumn<DateTime>(
      'validated_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _createdByIdMeta =
      const VerificationMeta('createdById');
  @override
  late final GeneratedColumn<String> createdById = GeneratedColumn<String>(
      'created_by_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        sessionId,
        discountId,
        paymentMethod,
        amountDue,
        amountReceived,
        paidPartCount,
        paidArticlesQty,
        validatedAt,
        createdById,
        deletedAt,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'payment_transaction_drift';
  @override
  VerificationContext validateIntegrity(
      Insertable<PaymentTransactionDriftData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('session_id')) {
      context.handle(_sessionIdMeta,
          sessionId.isAcceptableOrUnknown(data['session_id']!, _sessionIdMeta));
    } else if (isInserting) {
      context.missing(_sessionIdMeta);
    }
    if (data.containsKey('discount_id')) {
      context.handle(
          _discountIdMeta,
          discountId.isAcceptableOrUnknown(
              data['discount_id']!, _discountIdMeta));
    }
    if (data.containsKey('payment_method')) {
      context.handle(
          _paymentMethodMeta,
          paymentMethod.isAcceptableOrUnknown(
              data['payment_method']!, _paymentMethodMeta));
    }
    if (data.containsKey('amount_due')) {
      context.handle(_amountDueMeta,
          amountDue.isAcceptableOrUnknown(data['amount_due']!, _amountDueMeta));
    }
    if (data.containsKey('amount_received')) {
      context.handle(
          _amountReceivedMeta,
          amountReceived.isAcceptableOrUnknown(
              data['amount_received']!, _amountReceivedMeta));
    }
    if (data.containsKey('paid_part_count')) {
      context.handle(
          _paidPartCountMeta,
          paidPartCount.isAcceptableOrUnknown(
              data['paid_part_count']!, _paidPartCountMeta));
    }
    if (data.containsKey('validated_at')) {
      context.handle(
          _validatedAtMeta,
          validatedAt.isAcceptableOrUnknown(
              data['validated_at']!, _validatedAtMeta));
    }
    if (data.containsKey('created_by_id')) {
      context.handle(
          _createdByIdMeta,
          createdById.isAcceptableOrUnknown(
              data['created_by_id']!, _createdByIdMeta));
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  PaymentTransactionDriftData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PaymentTransactionDriftData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      sessionId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}session_id'])!,
      discountId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}discount_id']),
      paymentMethod: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}payment_method'])!,
      amountDue: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}amount_due'])!,
      amountReceived: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}amount_received'])!,
      paidPartCount: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}paid_part_count'])!,
      paidArticlesQty: $PaymentTransactionDriftTable.$converterpaidArticlesQty
          .fromSql(attachedDatabase.typeMapping.read(DriftSqlType.string,
              data['${effectivePrefix}paid_articles_qty'])!),
      validatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}validated_at']),
      createdById: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_by_id']),
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
    );
  }

  @override
  $PaymentTransactionDriftTable createAlias(String alias) {
    return $PaymentTransactionDriftTable(attachedDatabase, alias);
  }

  static TypeConverter<Map<String, int>, String> $converterpaidArticlesQty =
      const PaymentConverter();
}

class PaymentTransactionDriftData extends DataClass
    implements Insertable<PaymentTransactionDriftData> {
  final String id;
  final String sessionId;
  final String? discountId;
  final String paymentMethod;
  final int amountDue;
  final int amountReceived;
  final int paidPartCount;
  final Map<String, int> paidArticlesQty;
  final DateTime? validatedAt;
  final String? createdById;
  final DateTime? deletedAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  const PaymentTransactionDriftData(
      {required this.id,
      required this.sessionId,
      this.discountId,
      required this.paymentMethod,
      required this.amountDue,
      required this.amountReceived,
      required this.paidPartCount,
      required this.paidArticlesQty,
      this.validatedAt,
      this.createdById,
      this.deletedAt,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    map['session_id'] = Variable<String>(sessionId);
    if (!nullToAbsent || discountId != null) {
      map['discount_id'] = Variable<String>(discountId);
    }
    map['payment_method'] = Variable<String>(paymentMethod);
    map['amount_due'] = Variable<int>(amountDue);
    map['amount_received'] = Variable<int>(amountReceived);
    map['paid_part_count'] = Variable<int>(paidPartCount);
    {
      map['paid_articles_qty'] = Variable<String>($PaymentTransactionDriftTable
          .$converterpaidArticlesQty
          .toSql(paidArticlesQty));
    }
    if (!nullToAbsent || validatedAt != null) {
      map['validated_at'] = Variable<DateTime>(validatedAt);
    }
    if (!nullToAbsent || createdById != null) {
      map['created_by_id'] = Variable<String>(createdById);
    }
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    return map;
  }

  PaymentTransactionDriftCompanion toCompanion(bool nullToAbsent) {
    return PaymentTransactionDriftCompanion(
      id: Value(id),
      sessionId: Value(sessionId),
      discountId: discountId == null && nullToAbsent
          ? const Value.absent()
          : Value(discountId),
      paymentMethod: Value(paymentMethod),
      amountDue: Value(amountDue),
      amountReceived: Value(amountReceived),
      paidPartCount: Value(paidPartCount),
      paidArticlesQty: Value(paidArticlesQty),
      validatedAt: validatedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(validatedAt),
      createdById: createdById == null && nullToAbsent
          ? const Value.absent()
          : Value(createdById),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
    );
  }

  factory PaymentTransactionDriftData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PaymentTransactionDriftData(
      id: serializer.fromJson<String>(json['id']),
      sessionId: serializer.fromJson<String>(json['sessionId']),
      discountId: serializer.fromJson<String?>(json['discountId']),
      paymentMethod: serializer.fromJson<String>(json['paymentMethod']),
      amountDue: serializer.fromJson<int>(json['amountDue']),
      amountReceived: serializer.fromJson<int>(json['amountReceived']),
      paidPartCount: serializer.fromJson<int>(json['paidPartCount']),
      paidArticlesQty:
          serializer.fromJson<Map<String, int>>(json['paidArticlesQty']),
      validatedAt: serializer.fromJson<DateTime?>(json['validatedAt']),
      createdById: serializer.fromJson<String?>(json['createdById']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'sessionId': serializer.toJson<String>(sessionId),
      'discountId': serializer.toJson<String?>(discountId),
      'paymentMethod': serializer.toJson<String>(paymentMethod),
      'amountDue': serializer.toJson<int>(amountDue),
      'amountReceived': serializer.toJson<int>(amountReceived),
      'paidPartCount': serializer.toJson<int>(paidPartCount),
      'paidArticlesQty': serializer.toJson<Map<String, int>>(paidArticlesQty),
      'validatedAt': serializer.toJson<DateTime?>(validatedAt),
      'createdById': serializer.toJson<String?>(createdById),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  PaymentTransactionDriftData copyWith(
          {String? id,
          String? sessionId,
          Value<String?> discountId = const Value.absent(),
          String? paymentMethod,
          int? amountDue,
          int? amountReceived,
          int? paidPartCount,
          Map<String, int>? paidArticlesQty,
          Value<DateTime?> validatedAt = const Value.absent(),
          Value<String?> createdById = const Value.absent(),
          Value<DateTime?> deletedAt = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      PaymentTransactionDriftData(
        id: id ?? this.id,
        sessionId: sessionId ?? this.sessionId,
        discountId: discountId.present ? discountId.value : this.discountId,
        paymentMethod: paymentMethod ?? this.paymentMethod,
        amountDue: amountDue ?? this.amountDue,
        amountReceived: amountReceived ?? this.amountReceived,
        paidPartCount: paidPartCount ?? this.paidPartCount,
        paidArticlesQty: paidArticlesQty ?? this.paidArticlesQty,
        validatedAt: validatedAt.present ? validatedAt.value : this.validatedAt,
        createdById: createdById.present ? createdById.value : this.createdById,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  PaymentTransactionDriftData copyWithCompanion(
      PaymentTransactionDriftCompanion data) {
    return PaymentTransactionDriftData(
      id: data.id.present ? data.id.value : this.id,
      sessionId: data.sessionId.present ? data.sessionId.value : this.sessionId,
      discountId:
          data.discountId.present ? data.discountId.value : this.discountId,
      paymentMethod: data.paymentMethod.present
          ? data.paymentMethod.value
          : this.paymentMethod,
      amountDue: data.amountDue.present ? data.amountDue.value : this.amountDue,
      amountReceived: data.amountReceived.present
          ? data.amountReceived.value
          : this.amountReceived,
      paidPartCount: data.paidPartCount.present
          ? data.paidPartCount.value
          : this.paidPartCount,
      paidArticlesQty: data.paidArticlesQty.present
          ? data.paidArticlesQty.value
          : this.paidArticlesQty,
      validatedAt:
          data.validatedAt.present ? data.validatedAt.value : this.validatedAt,
      createdById:
          data.createdById.present ? data.createdById.value : this.createdById,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('PaymentTransactionDriftData(')
          ..write('id: $id, ')
          ..write('sessionId: $sessionId, ')
          ..write('discountId: $discountId, ')
          ..write('paymentMethod: $paymentMethod, ')
          ..write('amountDue: $amountDue, ')
          ..write('amountReceived: $amountReceived, ')
          ..write('paidPartCount: $paidPartCount, ')
          ..write('paidArticlesQty: $paidArticlesQty, ')
          ..write('validatedAt: $validatedAt, ')
          ..write('createdById: $createdById, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(
      id,
      sessionId,
      discountId,
      paymentMethod,
      amountDue,
      amountReceived,
      paidPartCount,
      paidArticlesQty,
      validatedAt,
      createdById,
      deletedAt,
      createdAt,
      updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PaymentTransactionDriftData &&
          other.id == this.id &&
          other.sessionId == this.sessionId &&
          other.discountId == this.discountId &&
          other.paymentMethod == this.paymentMethod &&
          other.amountDue == this.amountDue &&
          other.amountReceived == this.amountReceived &&
          other.paidPartCount == this.paidPartCount &&
          other.paidArticlesQty == this.paidArticlesQty &&
          other.validatedAt == this.validatedAt &&
          other.createdById == this.createdById &&
          other.deletedAt == this.deletedAt &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class PaymentTransactionDriftCompanion
    extends UpdateCompanion<PaymentTransactionDriftData> {
  final Value<String> id;
  final Value<String> sessionId;
  final Value<String?> discountId;
  final Value<String> paymentMethod;
  final Value<int> amountDue;
  final Value<int> amountReceived;
  final Value<int> paidPartCount;
  final Value<Map<String, int>> paidArticlesQty;
  final Value<DateTime?> validatedAt;
  final Value<String?> createdById;
  final Value<DateTime?> deletedAt;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<int> rowid;
  const PaymentTransactionDriftCompanion({
    this.id = const Value.absent(),
    this.sessionId = const Value.absent(),
    this.discountId = const Value.absent(),
    this.paymentMethod = const Value.absent(),
    this.amountDue = const Value.absent(),
    this.amountReceived = const Value.absent(),
    this.paidPartCount = const Value.absent(),
    this.paidArticlesQty = const Value.absent(),
    this.validatedAt = const Value.absent(),
    this.createdById = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PaymentTransactionDriftCompanion.insert({
    required String id,
    required String sessionId,
    this.discountId = const Value.absent(),
    this.paymentMethod = const Value.absent(),
    this.amountDue = const Value.absent(),
    this.amountReceived = const Value.absent(),
    this.paidPartCount = const Value.absent(),
    required Map<String, int> paidArticlesQty,
    this.validatedAt = const Value.absent(),
    this.createdById = const Value.absent(),
    this.deletedAt = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        sessionId = Value(sessionId),
        paidArticlesQty = Value(paidArticlesQty),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<PaymentTransactionDriftData> custom({
    Expression<String>? id,
    Expression<String>? sessionId,
    Expression<String>? discountId,
    Expression<String>? paymentMethod,
    Expression<int>? amountDue,
    Expression<int>? amountReceived,
    Expression<int>? paidPartCount,
    Expression<String>? paidArticlesQty,
    Expression<DateTime>? validatedAt,
    Expression<String>? createdById,
    Expression<DateTime>? deletedAt,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (sessionId != null) 'session_id': sessionId,
      if (discountId != null) 'discount_id': discountId,
      if (paymentMethod != null) 'payment_method': paymentMethod,
      if (amountDue != null) 'amount_due': amountDue,
      if (amountReceived != null) 'amount_received': amountReceived,
      if (paidPartCount != null) 'paid_part_count': paidPartCount,
      if (paidArticlesQty != null) 'paid_articles_qty': paidArticlesQty,
      if (validatedAt != null) 'validated_at': validatedAt,
      if (createdById != null) 'created_by_id': createdById,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  PaymentTransactionDriftCompanion copyWith(
      {Value<String>? id,
      Value<String>? sessionId,
      Value<String?>? discountId,
      Value<String>? paymentMethod,
      Value<int>? amountDue,
      Value<int>? amountReceived,
      Value<int>? paidPartCount,
      Value<Map<String, int>>? paidArticlesQty,
      Value<DateTime?>? validatedAt,
      Value<String?>? createdById,
      Value<DateTime?>? deletedAt,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<int>? rowid}) {
    return PaymentTransactionDriftCompanion(
      id: id ?? this.id,
      sessionId: sessionId ?? this.sessionId,
      discountId: discountId ?? this.discountId,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      amountDue: amountDue ?? this.amountDue,
      amountReceived: amountReceived ?? this.amountReceived,
      paidPartCount: paidPartCount ?? this.paidPartCount,
      paidArticlesQty: paidArticlesQty ?? this.paidArticlesQty,
      validatedAt: validatedAt ?? this.validatedAt,
      createdById: createdById ?? this.createdById,
      deletedAt: deletedAt ?? this.deletedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (sessionId.present) {
      map['session_id'] = Variable<String>(sessionId.value);
    }
    if (discountId.present) {
      map['discount_id'] = Variable<String>(discountId.value);
    }
    if (paymentMethod.present) {
      map['payment_method'] = Variable<String>(paymentMethod.value);
    }
    if (amountDue.present) {
      map['amount_due'] = Variable<int>(amountDue.value);
    }
    if (amountReceived.present) {
      map['amount_received'] = Variable<int>(amountReceived.value);
    }
    if (paidPartCount.present) {
      map['paid_part_count'] = Variable<int>(paidPartCount.value);
    }
    if (paidArticlesQty.present) {
      map['paid_articles_qty'] = Variable<String>($PaymentTransactionDriftTable
          .$converterpaidArticlesQty
          .toSql(paidArticlesQty.value));
    }
    if (validatedAt.present) {
      map['validated_at'] = Variable<DateTime>(validatedAt.value);
    }
    if (createdById.present) {
      map['created_by_id'] = Variable<String>(createdById.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('PaymentTransactionDriftCompanion(')
          ..write('id: $id, ')
          ..write('sessionId: $sessionId, ')
          ..write('discountId: $discountId, ')
          ..write('paymentMethod: $paymentMethod, ')
          ..write('amountDue: $amountDue, ')
          ..write('amountReceived: $amountReceived, ')
          ..write('paidPartCount: $paidPartCount, ')
          ..write('paidArticlesQty: $paidArticlesQty, ')
          ..write('validatedAt: $validatedAt, ')
          ..write('createdById: $createdById, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

class $CustomersDriftTable extends CustomersDrift
    with TableInfo<$CustomersDriftTable, CustomersDriftData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $CustomersDriftTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<String> id = GeneratedColumn<String>(
      'id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  @override
  late final GeneratedColumnWithTypeConverter<CustomerType, String> type =
      GeneratedColumn<String>('type', aliasedName, false,
              type: DriftSqlType.string, requiredDuringInsert: true)
          .withConverter<CustomerType>($CustomersDriftTable.$convertertype);
  static const VerificationMeta _firstNameMeta =
      const VerificationMeta('firstName');
  @override
  late final GeneratedColumn<String> firstName = GeneratedColumn<String>(
      'first_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _lastNameMeta =
      const VerificationMeta('lastName');
  @override
  late final GeneratedColumn<String> lastName = GeneratedColumn<String>(
      'last_name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _companyNameMeta =
      const VerificationMeta('companyName');
  @override
  late final GeneratedColumn<String> companyName = GeneratedColumn<String>(
      'company_name', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _codeMeta = const VerificationMeta('code');
  @override
  late final GeneratedColumn<String> code = GeneratedColumn<String>(
      'code', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _siretMeta = const VerificationMeta('siret');
  @override
  late final GeneratedColumn<String> siret = GeneratedColumn<String>(
      'siret', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _sirenMeta = const VerificationMeta('siren');
  @override
  late final GeneratedColumn<String> siren = GeneratedColumn<String>(
      'siren', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _vatNumberMeta =
      const VerificationMeta('vatNumber');
  @override
  late final GeneratedColumn<String> vatNumber = GeneratedColumn<String>(
      'vat_number', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _emailMeta = const VerificationMeta('email');
  @override
  late final GeneratedColumn<String> email = GeneratedColumn<String>(
      'email', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _phoneMeta = const VerificationMeta('phone');
  @override
  late final GeneratedColumn<String> phone = GeneratedColumn<String>(
      'phone', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _secondaryPhoneMeta =
      const VerificationMeta('secondaryPhone');
  @override
  late final GeneratedColumn<String> secondaryPhone = GeneratedColumn<String>(
      'secondary_phone', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _addressMeta =
      const VerificationMeta('address');
  @override
  late final GeneratedColumn<String> address = GeneratedColumn<String>(
      'address', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _addressComplementMeta =
      const VerificationMeta('addressComplement');
  @override
  late final GeneratedColumn<String> addressComplement =
      GeneratedColumn<String>('address_complement', aliasedName, true,
          type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _postalCodeMeta =
      const VerificationMeta('postalCode');
  @override
  late final GeneratedColumn<String> postalCode = GeneratedColumn<String>(
      'postal_code', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _cityMeta = const VerificationMeta('city');
  @override
  late final GeneratedColumn<String> city = GeneratedColumn<String>(
      'city', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _countryMeta =
      const VerificationMeta('country');
  @override
  late final GeneratedColumn<String> country = GeneratedColumn<String>(
      'country', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _priceListMeta =
      const VerificationMeta('priceList');
  @override
  late final GeneratedColumn<String> priceList = GeneratedColumn<String>(
      'price_list', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _permanentDiscountMeta =
      const VerificationMeta('permanentDiscount');
  @override
  late final GeneratedColumn<double> permanentDiscount =
      GeneratedColumn<double>('permanent_discount', aliasedName, true,
          type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _allowCreditMeta =
      const VerificationMeta('allowCredit');
  @override
  late final GeneratedColumn<bool> allowCredit = GeneratedColumn<bool>(
      'allow_credit', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("allow_credit" IN (0, 1))'),
      defaultValue: const Constant(false));
  static const VerificationMeta _creditLimitCentsMeta =
      const VerificationMeta('creditLimitCents');
  @override
  late final GeneratedColumn<int> creditLimitCents = GeneratedColumn<int>(
      'credit_limit_cents', aliasedName, true,
      type: DriftSqlType.int, requiredDuringInsert: false);
  static const VerificationMeta _notesMeta = const VerificationMeta('notes');
  @override
  late final GeneratedColumn<String> notes = GeneratedColumn<String>(
      'notes', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _isActiveMeta =
      const VerificationMeta('isActive');
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
      'is_active', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_active" IN (0, 1))'),
      defaultValue: const Constant(true));
  static const VerificationMeta _createdAtMeta =
      const VerificationMeta('createdAt');
  @override
  late final GeneratedColumn<DateTime> createdAt = GeneratedColumn<DateTime>(
      'created_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _updatedAtMeta =
      const VerificationMeta('updatedAt');
  @override
  late final GeneratedColumn<DateTime> updatedAt = GeneratedColumn<DateTime>(
      'updated_at', aliasedName, false,
      type: DriftSqlType.dateTime, requiredDuringInsert: true);
  static const VerificationMeta _deletedAtMeta =
      const VerificationMeta('deletedAt');
  @override
  late final GeneratedColumn<DateTime> deletedAt = GeneratedColumn<DateTime>(
      'deleted_at', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [
        id,
        type,
        firstName,
        lastName,
        companyName,
        code,
        siret,
        siren,
        vatNumber,
        email,
        phone,
        secondaryPhone,
        address,
        addressComplement,
        postalCode,
        city,
        country,
        priceList,
        permanentDiscount,
        allowCredit,
        creditLimitCents,
        notes,
        isActive,
        createdAt,
        updatedAt,
        deletedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'customers_drift';
  @override
  VerificationContext validateIntegrity(Insertable<CustomersDriftData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    } else if (isInserting) {
      context.missing(_idMeta);
    }
    if (data.containsKey('first_name')) {
      context.handle(_firstNameMeta,
          firstName.isAcceptableOrUnknown(data['first_name']!, _firstNameMeta));
    }
    if (data.containsKey('last_name')) {
      context.handle(_lastNameMeta,
          lastName.isAcceptableOrUnknown(data['last_name']!, _lastNameMeta));
    } else if (isInserting) {
      context.missing(_lastNameMeta);
    }
    if (data.containsKey('company_name')) {
      context.handle(
          _companyNameMeta,
          companyName.isAcceptableOrUnknown(
              data['company_name']!, _companyNameMeta));
    }
    if (data.containsKey('code')) {
      context.handle(
          _codeMeta, code.isAcceptableOrUnknown(data['code']!, _codeMeta));
    }
    if (data.containsKey('siret')) {
      context.handle(
          _siretMeta, siret.isAcceptableOrUnknown(data['siret']!, _siretMeta));
    }
    if (data.containsKey('siren')) {
      context.handle(
          _sirenMeta, siren.isAcceptableOrUnknown(data['siren']!, _sirenMeta));
    }
    if (data.containsKey('vat_number')) {
      context.handle(_vatNumberMeta,
          vatNumber.isAcceptableOrUnknown(data['vat_number']!, _vatNumberMeta));
    }
    if (data.containsKey('email')) {
      context.handle(
          _emailMeta, email.isAcceptableOrUnknown(data['email']!, _emailMeta));
    }
    if (data.containsKey('phone')) {
      context.handle(
          _phoneMeta, phone.isAcceptableOrUnknown(data['phone']!, _phoneMeta));
    }
    if (data.containsKey('secondary_phone')) {
      context.handle(
          _secondaryPhoneMeta,
          secondaryPhone.isAcceptableOrUnknown(
              data['secondary_phone']!, _secondaryPhoneMeta));
    }
    if (data.containsKey('address')) {
      context.handle(_addressMeta,
          address.isAcceptableOrUnknown(data['address']!, _addressMeta));
    }
    if (data.containsKey('address_complement')) {
      context.handle(
          _addressComplementMeta,
          addressComplement.isAcceptableOrUnknown(
              data['address_complement']!, _addressComplementMeta));
    }
    if (data.containsKey('postal_code')) {
      context.handle(
          _postalCodeMeta,
          postalCode.isAcceptableOrUnknown(
              data['postal_code']!, _postalCodeMeta));
    }
    if (data.containsKey('city')) {
      context.handle(
          _cityMeta, city.isAcceptableOrUnknown(data['city']!, _cityMeta));
    }
    if (data.containsKey('country')) {
      context.handle(_countryMeta,
          country.isAcceptableOrUnknown(data['country']!, _countryMeta));
    } else if (isInserting) {
      context.missing(_countryMeta);
    }
    if (data.containsKey('price_list')) {
      context.handle(_priceListMeta,
          priceList.isAcceptableOrUnknown(data['price_list']!, _priceListMeta));
    } else if (isInserting) {
      context.missing(_priceListMeta);
    }
    if (data.containsKey('permanent_discount')) {
      context.handle(
          _permanentDiscountMeta,
          permanentDiscount.isAcceptableOrUnknown(
              data['permanent_discount']!, _permanentDiscountMeta));
    }
    if (data.containsKey('allow_credit')) {
      context.handle(
          _allowCreditMeta,
          allowCredit.isAcceptableOrUnknown(
              data['allow_credit']!, _allowCreditMeta));
    }
    if (data.containsKey('credit_limit_cents')) {
      context.handle(
          _creditLimitCentsMeta,
          creditLimitCents.isAcceptableOrUnknown(
              data['credit_limit_cents']!, _creditLimitCentsMeta));
    }
    if (data.containsKey('notes')) {
      context.handle(
          _notesMeta, notes.isAcceptableOrUnknown(data['notes']!, _notesMeta));
    }
    if (data.containsKey('is_active')) {
      context.handle(_isActiveMeta,
          isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta));
    }
    if (data.containsKey('created_at')) {
      context.handle(_createdAtMeta,
          createdAt.isAcceptableOrUnknown(data['created_at']!, _createdAtMeta));
    } else if (isInserting) {
      context.missing(_createdAtMeta);
    }
    if (data.containsKey('updated_at')) {
      context.handle(_updatedAtMeta,
          updatedAt.isAcceptableOrUnknown(data['updated_at']!, _updatedAtMeta));
    } else if (isInserting) {
      context.missing(_updatedAtMeta);
    }
    if (data.containsKey('deleted_at')) {
      context.handle(_deletedAtMeta,
          deletedAt.isAcceptableOrUnknown(data['deleted_at']!, _deletedAtMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  CustomersDriftData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return CustomersDriftData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      type: $CustomersDriftTable.$convertertype.fromSql(attachedDatabase
          .typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}type'])!),
      firstName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}first_name']),
      lastName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}last_name'])!,
      companyName: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}company_name']),
      code: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}code']),
      siret: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}siret']),
      siren: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}siren']),
      vatNumber: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}vat_number']),
      email: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}email']),
      phone: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}phone']),
      secondaryPhone: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}secondary_phone']),
      address: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}address']),
      addressComplement: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}address_complement']),
      postalCode: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}postal_code']),
      city: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}city']),
      country: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}country'])!,
      priceList: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}price_list'])!,
      permanentDiscount: attachedDatabase.typeMapping.read(
          DriftSqlType.double, data['${effectivePrefix}permanent_discount']),
      allowCredit: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}allow_credit'])!,
      creditLimitCents: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}credit_limit_cents']),
      notes: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}notes']),
      isActive: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_active'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
    );
  }

  @override
  $CustomersDriftTable createAlias(String alias) {
    return $CustomersDriftTable(attachedDatabase, alias);
  }

  static JsonTypeConverter2<CustomerType, String, String> $convertertype =
      const EnumNameConverter<CustomerType>(CustomerType.values);
}

class CustomersDriftData extends DataClass
    implements Insertable<CustomersDriftData> {
  final String id;
  final CustomerType type;
  final String? firstName;
  final String lastName;
  final String? companyName;
  final String? code;
  final String? siret;
  final String? siren;
  final String? vatNumber;
  final String? email;
  final String? phone;
  final String? secondaryPhone;
  final String? address;
  final String? addressComplement;
  final String? postalCode;
  final String? city;
  final String country;
  final String priceList;

  /// Pourcentage.
  final double? permanentDiscount;
  final bool allowCredit;

  /// Stocké en centimes.
  final int? creditLimitCents;
  final String? notes;
  final bool isActive;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  const CustomersDriftData(
      {required this.id,
      required this.type,
      this.firstName,
      required this.lastName,
      this.companyName,
      this.code,
      this.siret,
      this.siren,
      this.vatNumber,
      this.email,
      this.phone,
      this.secondaryPhone,
      this.address,
      this.addressComplement,
      this.postalCode,
      this.city,
      required this.country,
      required this.priceList,
      this.permanentDiscount,
      required this.allowCredit,
      this.creditLimitCents,
      this.notes,
      required this.isActive,
      required this.createdAt,
      required this.updatedAt,
      this.deletedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<String>(id);
    {
      map['type'] =
          Variable<String>($CustomersDriftTable.$convertertype.toSql(type));
    }
    if (!nullToAbsent || firstName != null) {
      map['first_name'] = Variable<String>(firstName);
    }
    map['last_name'] = Variable<String>(lastName);
    if (!nullToAbsent || companyName != null) {
      map['company_name'] = Variable<String>(companyName);
    }
    if (!nullToAbsent || code != null) {
      map['code'] = Variable<String>(code);
    }
    if (!nullToAbsent || siret != null) {
      map['siret'] = Variable<String>(siret);
    }
    if (!nullToAbsent || siren != null) {
      map['siren'] = Variable<String>(siren);
    }
    if (!nullToAbsent || vatNumber != null) {
      map['vat_number'] = Variable<String>(vatNumber);
    }
    if (!nullToAbsent || email != null) {
      map['email'] = Variable<String>(email);
    }
    if (!nullToAbsent || phone != null) {
      map['phone'] = Variable<String>(phone);
    }
    if (!nullToAbsent || secondaryPhone != null) {
      map['secondary_phone'] = Variable<String>(secondaryPhone);
    }
    if (!nullToAbsent || address != null) {
      map['address'] = Variable<String>(address);
    }
    if (!nullToAbsent || addressComplement != null) {
      map['address_complement'] = Variable<String>(addressComplement);
    }
    if (!nullToAbsent || postalCode != null) {
      map['postal_code'] = Variable<String>(postalCode);
    }
    if (!nullToAbsent || city != null) {
      map['city'] = Variable<String>(city);
    }
    map['country'] = Variable<String>(country);
    map['price_list'] = Variable<String>(priceList);
    if (!nullToAbsent || permanentDiscount != null) {
      map['permanent_discount'] = Variable<double>(permanentDiscount);
    }
    map['allow_credit'] = Variable<bool>(allowCredit);
    if (!nullToAbsent || creditLimitCents != null) {
      map['credit_limit_cents'] = Variable<int>(creditLimitCents);
    }
    if (!nullToAbsent || notes != null) {
      map['notes'] = Variable<String>(notes);
    }
    map['is_active'] = Variable<bool>(isActive);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  CustomersDriftCompanion toCompanion(bool nullToAbsent) {
    return CustomersDriftCompanion(
      id: Value(id),
      type: Value(type),
      firstName: firstName == null && nullToAbsent
          ? const Value.absent()
          : Value(firstName),
      lastName: Value(lastName),
      companyName: companyName == null && nullToAbsent
          ? const Value.absent()
          : Value(companyName),
      code: code == null && nullToAbsent ? const Value.absent() : Value(code),
      siret:
          siret == null && nullToAbsent ? const Value.absent() : Value(siret),
      siren:
          siren == null && nullToAbsent ? const Value.absent() : Value(siren),
      vatNumber: vatNumber == null && nullToAbsent
          ? const Value.absent()
          : Value(vatNumber),
      email:
          email == null && nullToAbsent ? const Value.absent() : Value(email),
      phone:
          phone == null && nullToAbsent ? const Value.absent() : Value(phone),
      secondaryPhone: secondaryPhone == null && nullToAbsent
          ? const Value.absent()
          : Value(secondaryPhone),
      address: address == null && nullToAbsent
          ? const Value.absent()
          : Value(address),
      addressComplement: addressComplement == null && nullToAbsent
          ? const Value.absent()
          : Value(addressComplement),
      postalCode: postalCode == null && nullToAbsent
          ? const Value.absent()
          : Value(postalCode),
      city: city == null && nullToAbsent ? const Value.absent() : Value(city),
      country: Value(country),
      priceList: Value(priceList),
      permanentDiscount: permanentDiscount == null && nullToAbsent
          ? const Value.absent()
          : Value(permanentDiscount),
      allowCredit: Value(allowCredit),
      creditLimitCents: creditLimitCents == null && nullToAbsent
          ? const Value.absent()
          : Value(creditLimitCents),
      notes:
          notes == null && nullToAbsent ? const Value.absent() : Value(notes),
      isActive: Value(isActive),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory CustomersDriftData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return CustomersDriftData(
      id: serializer.fromJson<String>(json['id']),
      type: $CustomersDriftTable.$convertertype
          .fromJson(serializer.fromJson<String>(json['type'])),
      firstName: serializer.fromJson<String?>(json['firstName']),
      lastName: serializer.fromJson<String>(json['lastName']),
      companyName: serializer.fromJson<String?>(json['companyName']),
      code: serializer.fromJson<String?>(json['code']),
      siret: serializer.fromJson<String?>(json['siret']),
      siren: serializer.fromJson<String?>(json['siren']),
      vatNumber: serializer.fromJson<String?>(json['vatNumber']),
      email: serializer.fromJson<String?>(json['email']),
      phone: serializer.fromJson<String?>(json['phone']),
      secondaryPhone: serializer.fromJson<String?>(json['secondaryPhone']),
      address: serializer.fromJson<String?>(json['address']),
      addressComplement:
          serializer.fromJson<String?>(json['addressComplement']),
      postalCode: serializer.fromJson<String?>(json['postalCode']),
      city: serializer.fromJson<String?>(json['city']),
      country: serializer.fromJson<String>(json['country']),
      priceList: serializer.fromJson<String>(json['priceList']),
      permanentDiscount:
          serializer.fromJson<double?>(json['permanentDiscount']),
      allowCredit: serializer.fromJson<bool>(json['allowCredit']),
      creditLimitCents: serializer.fromJson<int?>(json['creditLimitCents']),
      notes: serializer.fromJson<String?>(json['notes']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<String>(id),
      'type': serializer
          .toJson<String>($CustomersDriftTable.$convertertype.toJson(type)),
      'firstName': serializer.toJson<String?>(firstName),
      'lastName': serializer.toJson<String>(lastName),
      'companyName': serializer.toJson<String?>(companyName),
      'code': serializer.toJson<String?>(code),
      'siret': serializer.toJson<String?>(siret),
      'siren': serializer.toJson<String?>(siren),
      'vatNumber': serializer.toJson<String?>(vatNumber),
      'email': serializer.toJson<String?>(email),
      'phone': serializer.toJson<String?>(phone),
      'secondaryPhone': serializer.toJson<String?>(secondaryPhone),
      'address': serializer.toJson<String?>(address),
      'addressComplement': serializer.toJson<String?>(addressComplement),
      'postalCode': serializer.toJson<String?>(postalCode),
      'city': serializer.toJson<String?>(city),
      'country': serializer.toJson<String>(country),
      'priceList': serializer.toJson<String>(priceList),
      'permanentDiscount': serializer.toJson<double?>(permanentDiscount),
      'allowCredit': serializer.toJson<bool>(allowCredit),
      'creditLimitCents': serializer.toJson<int?>(creditLimitCents),
      'notes': serializer.toJson<String?>(notes),
      'isActive': serializer.toJson<bool>(isActive),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  CustomersDriftData copyWith(
          {String? id,
          CustomerType? type,
          Value<String?> firstName = const Value.absent(),
          String? lastName,
          Value<String?> companyName = const Value.absent(),
          Value<String?> code = const Value.absent(),
          Value<String?> siret = const Value.absent(),
          Value<String?> siren = const Value.absent(),
          Value<String?> vatNumber = const Value.absent(),
          Value<String?> email = const Value.absent(),
          Value<String?> phone = const Value.absent(),
          Value<String?> secondaryPhone = const Value.absent(),
          Value<String?> address = const Value.absent(),
          Value<String?> addressComplement = const Value.absent(),
          Value<String?> postalCode = const Value.absent(),
          Value<String?> city = const Value.absent(),
          String? country,
          String? priceList,
          Value<double?> permanentDiscount = const Value.absent(),
          bool? allowCredit,
          Value<int?> creditLimitCents = const Value.absent(),
          Value<String?> notes = const Value.absent(),
          bool? isActive,
          DateTime? createdAt,
          DateTime? updatedAt,
          Value<DateTime?> deletedAt = const Value.absent()}) =>
      CustomersDriftData(
        id: id ?? this.id,
        type: type ?? this.type,
        firstName: firstName.present ? firstName.value : this.firstName,
        lastName: lastName ?? this.lastName,
        companyName: companyName.present ? companyName.value : this.companyName,
        code: code.present ? code.value : this.code,
        siret: siret.present ? siret.value : this.siret,
        siren: siren.present ? siren.value : this.siren,
        vatNumber: vatNumber.present ? vatNumber.value : this.vatNumber,
        email: email.present ? email.value : this.email,
        phone: phone.present ? phone.value : this.phone,
        secondaryPhone:
            secondaryPhone.present ? secondaryPhone.value : this.secondaryPhone,
        address: address.present ? address.value : this.address,
        addressComplement: addressComplement.present
            ? addressComplement.value
            : this.addressComplement,
        postalCode: postalCode.present ? postalCode.value : this.postalCode,
        city: city.present ? city.value : this.city,
        country: country ?? this.country,
        priceList: priceList ?? this.priceList,
        permanentDiscount: permanentDiscount.present
            ? permanentDiscount.value
            : this.permanentDiscount,
        allowCredit: allowCredit ?? this.allowCredit,
        creditLimitCents: creditLimitCents.present
            ? creditLimitCents.value
            : this.creditLimitCents,
        notes: notes.present ? notes.value : this.notes,
        isActive: isActive ?? this.isActive,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
      );
  CustomersDriftData copyWithCompanion(CustomersDriftCompanion data) {
    return CustomersDriftData(
      id: data.id.present ? data.id.value : this.id,
      type: data.type.present ? data.type.value : this.type,
      firstName: data.firstName.present ? data.firstName.value : this.firstName,
      lastName: data.lastName.present ? data.lastName.value : this.lastName,
      companyName:
          data.companyName.present ? data.companyName.value : this.companyName,
      code: data.code.present ? data.code.value : this.code,
      siret: data.siret.present ? data.siret.value : this.siret,
      siren: data.siren.present ? data.siren.value : this.siren,
      vatNumber: data.vatNumber.present ? data.vatNumber.value : this.vatNumber,
      email: data.email.present ? data.email.value : this.email,
      phone: data.phone.present ? data.phone.value : this.phone,
      secondaryPhone: data.secondaryPhone.present
          ? data.secondaryPhone.value
          : this.secondaryPhone,
      address: data.address.present ? data.address.value : this.address,
      addressComplement: data.addressComplement.present
          ? data.addressComplement.value
          : this.addressComplement,
      postalCode:
          data.postalCode.present ? data.postalCode.value : this.postalCode,
      city: data.city.present ? data.city.value : this.city,
      country: data.country.present ? data.country.value : this.country,
      priceList: data.priceList.present ? data.priceList.value : this.priceList,
      permanentDiscount: data.permanentDiscount.present
          ? data.permanentDiscount.value
          : this.permanentDiscount,
      allowCredit:
          data.allowCredit.present ? data.allowCredit.value : this.allowCredit,
      creditLimitCents: data.creditLimitCents.present
          ? data.creditLimitCents.value
          : this.creditLimitCents,
      notes: data.notes.present ? data.notes.value : this.notes,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('CustomersDriftData(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('companyName: $companyName, ')
          ..write('code: $code, ')
          ..write('siret: $siret, ')
          ..write('siren: $siren, ')
          ..write('vatNumber: $vatNumber, ')
          ..write('email: $email, ')
          ..write('phone: $phone, ')
          ..write('secondaryPhone: $secondaryPhone, ')
          ..write('address: $address, ')
          ..write('addressComplement: $addressComplement, ')
          ..write('postalCode: $postalCode, ')
          ..write('city: $city, ')
          ..write('country: $country, ')
          ..write('priceList: $priceList, ')
          ..write('permanentDiscount: $permanentDiscount, ')
          ..write('allowCredit: $allowCredit, ')
          ..write('creditLimitCents: $creditLimitCents, ')
          ..write('notes: $notes, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hashAll([
        id,
        type,
        firstName,
        lastName,
        companyName,
        code,
        siret,
        siren,
        vatNumber,
        email,
        phone,
        secondaryPhone,
        address,
        addressComplement,
        postalCode,
        city,
        country,
        priceList,
        permanentDiscount,
        allowCredit,
        creditLimitCents,
        notes,
        isActive,
        createdAt,
        updatedAt,
        deletedAt
      ]);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CustomersDriftData &&
          other.id == this.id &&
          other.type == this.type &&
          other.firstName == this.firstName &&
          other.lastName == this.lastName &&
          other.companyName == this.companyName &&
          other.code == this.code &&
          other.siret == this.siret &&
          other.siren == this.siren &&
          other.vatNumber == this.vatNumber &&
          other.email == this.email &&
          other.phone == this.phone &&
          other.secondaryPhone == this.secondaryPhone &&
          other.address == this.address &&
          other.addressComplement == this.addressComplement &&
          other.postalCode == this.postalCode &&
          other.city == this.city &&
          other.country == this.country &&
          other.priceList == this.priceList &&
          other.permanentDiscount == this.permanentDiscount &&
          other.allowCredit == this.allowCredit &&
          other.creditLimitCents == this.creditLimitCents &&
          other.notes == this.notes &&
          other.isActive == this.isActive &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt);
}

class CustomersDriftCompanion extends UpdateCompanion<CustomersDriftData> {
  final Value<String> id;
  final Value<CustomerType> type;
  final Value<String?> firstName;
  final Value<String> lastName;
  final Value<String?> companyName;
  final Value<String?> code;
  final Value<String?> siret;
  final Value<String?> siren;
  final Value<String?> vatNumber;
  final Value<String?> email;
  final Value<String?> phone;
  final Value<String?> secondaryPhone;
  final Value<String?> address;
  final Value<String?> addressComplement;
  final Value<String?> postalCode;
  final Value<String?> city;
  final Value<String> country;
  final Value<String> priceList;
  final Value<double?> permanentDiscount;
  final Value<bool> allowCredit;
  final Value<int?> creditLimitCents;
  final Value<String?> notes;
  final Value<bool> isActive;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<int> rowid;
  const CustomersDriftCompanion({
    this.id = const Value.absent(),
    this.type = const Value.absent(),
    this.firstName = const Value.absent(),
    this.lastName = const Value.absent(),
    this.companyName = const Value.absent(),
    this.code = const Value.absent(),
    this.siret = const Value.absent(),
    this.siren = const Value.absent(),
    this.vatNumber = const Value.absent(),
    this.email = const Value.absent(),
    this.phone = const Value.absent(),
    this.secondaryPhone = const Value.absent(),
    this.address = const Value.absent(),
    this.addressComplement = const Value.absent(),
    this.postalCode = const Value.absent(),
    this.city = const Value.absent(),
    this.country = const Value.absent(),
    this.priceList = const Value.absent(),
    this.permanentDiscount = const Value.absent(),
    this.allowCredit = const Value.absent(),
    this.creditLimitCents = const Value.absent(),
    this.notes = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  CustomersDriftCompanion.insert({
    required String id,
    required CustomerType type,
    this.firstName = const Value.absent(),
    required String lastName,
    this.companyName = const Value.absent(),
    this.code = const Value.absent(),
    this.siret = const Value.absent(),
    this.siren = const Value.absent(),
    this.vatNumber = const Value.absent(),
    this.email = const Value.absent(),
    this.phone = const Value.absent(),
    this.secondaryPhone = const Value.absent(),
    this.address = const Value.absent(),
    this.addressComplement = const Value.absent(),
    this.postalCode = const Value.absent(),
    this.city = const Value.absent(),
    required String country,
    required String priceList,
    this.permanentDiscount = const Value.absent(),
    this.allowCredit = const Value.absent(),
    this.creditLimitCents = const Value.absent(),
    this.notes = const Value.absent(),
    this.isActive = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        type = Value(type),
        lastName = Value(lastName),
        country = Value(country),
        priceList = Value(priceList),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<CustomersDriftData> custom({
    Expression<String>? id,
    Expression<String>? type,
    Expression<String>? firstName,
    Expression<String>? lastName,
    Expression<String>? companyName,
    Expression<String>? code,
    Expression<String>? siret,
    Expression<String>? siren,
    Expression<String>? vatNumber,
    Expression<String>? email,
    Expression<String>? phone,
    Expression<String>? secondaryPhone,
    Expression<String>? address,
    Expression<String>? addressComplement,
    Expression<String>? postalCode,
    Expression<String>? city,
    Expression<String>? country,
    Expression<String>? priceList,
    Expression<double>? permanentDiscount,
    Expression<bool>? allowCredit,
    Expression<int>? creditLimitCents,
    Expression<String>? notes,
    Expression<bool>? isActive,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (type != null) 'type': type,
      if (firstName != null) 'first_name': firstName,
      if (lastName != null) 'last_name': lastName,
      if (companyName != null) 'company_name': companyName,
      if (code != null) 'code': code,
      if (siret != null) 'siret': siret,
      if (siren != null) 'siren': siren,
      if (vatNumber != null) 'vat_number': vatNumber,
      if (email != null) 'email': email,
      if (phone != null) 'phone': phone,
      if (secondaryPhone != null) 'secondary_phone': secondaryPhone,
      if (address != null) 'address': address,
      if (addressComplement != null) 'address_complement': addressComplement,
      if (postalCode != null) 'postal_code': postalCode,
      if (city != null) 'city': city,
      if (country != null) 'country': country,
      if (priceList != null) 'price_list': priceList,
      if (permanentDiscount != null) 'permanent_discount': permanentDiscount,
      if (allowCredit != null) 'allow_credit': allowCredit,
      if (creditLimitCents != null) 'credit_limit_cents': creditLimitCents,
      if (notes != null) 'notes': notes,
      if (isActive != null) 'is_active': isActive,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  CustomersDriftCompanion copyWith(
      {Value<String>? id,
      Value<CustomerType>? type,
      Value<String?>? firstName,
      Value<String>? lastName,
      Value<String?>? companyName,
      Value<String?>? code,
      Value<String?>? siret,
      Value<String?>? siren,
      Value<String?>? vatNumber,
      Value<String?>? email,
      Value<String?>? phone,
      Value<String?>? secondaryPhone,
      Value<String?>? address,
      Value<String?>? addressComplement,
      Value<String?>? postalCode,
      Value<String?>? city,
      Value<String>? country,
      Value<String>? priceList,
      Value<double?>? permanentDiscount,
      Value<bool>? allowCredit,
      Value<int?>? creditLimitCents,
      Value<String?>? notes,
      Value<bool>? isActive,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<DateTime?>? deletedAt,
      Value<int>? rowid}) {
    return CustomersDriftCompanion(
      id: id ?? this.id,
      type: type ?? this.type,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      companyName: companyName ?? this.companyName,
      code: code ?? this.code,
      siret: siret ?? this.siret,
      siren: siren ?? this.siren,
      vatNumber: vatNumber ?? this.vatNumber,
      email: email ?? this.email,
      phone: phone ?? this.phone,
      secondaryPhone: secondaryPhone ?? this.secondaryPhone,
      address: address ?? this.address,
      addressComplement: addressComplement ?? this.addressComplement,
      postalCode: postalCode ?? this.postalCode,
      city: city ?? this.city,
      country: country ?? this.country,
      priceList: priceList ?? this.priceList,
      permanentDiscount: permanentDiscount ?? this.permanentDiscount,
      allowCredit: allowCredit ?? this.allowCredit,
      creditLimitCents: creditLimitCents ?? this.creditLimitCents,
      notes: notes ?? this.notes,
      isActive: isActive ?? this.isActive,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
      rowid: rowid ?? this.rowid,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<String>(id.value);
    }
    if (type.present) {
      map['type'] = Variable<String>(
          $CustomersDriftTable.$convertertype.toSql(type.value));
    }
    if (firstName.present) {
      map['first_name'] = Variable<String>(firstName.value);
    }
    if (lastName.present) {
      map['last_name'] = Variable<String>(lastName.value);
    }
    if (companyName.present) {
      map['company_name'] = Variable<String>(companyName.value);
    }
    if (code.present) {
      map['code'] = Variable<String>(code.value);
    }
    if (siret.present) {
      map['siret'] = Variable<String>(siret.value);
    }
    if (siren.present) {
      map['siren'] = Variable<String>(siren.value);
    }
    if (vatNumber.present) {
      map['vat_number'] = Variable<String>(vatNumber.value);
    }
    if (email.present) {
      map['email'] = Variable<String>(email.value);
    }
    if (phone.present) {
      map['phone'] = Variable<String>(phone.value);
    }
    if (secondaryPhone.present) {
      map['secondary_phone'] = Variable<String>(secondaryPhone.value);
    }
    if (address.present) {
      map['address'] = Variable<String>(address.value);
    }
    if (addressComplement.present) {
      map['address_complement'] = Variable<String>(addressComplement.value);
    }
    if (postalCode.present) {
      map['postal_code'] = Variable<String>(postalCode.value);
    }
    if (city.present) {
      map['city'] = Variable<String>(city.value);
    }
    if (country.present) {
      map['country'] = Variable<String>(country.value);
    }
    if (priceList.present) {
      map['price_list'] = Variable<String>(priceList.value);
    }
    if (permanentDiscount.present) {
      map['permanent_discount'] = Variable<double>(permanentDiscount.value);
    }
    if (allowCredit.present) {
      map['allow_credit'] = Variable<bool>(allowCredit.value);
    }
    if (creditLimitCents.present) {
      map['credit_limit_cents'] = Variable<int>(creditLimitCents.value);
    }
    if (notes.present) {
      map['notes'] = Variable<String>(notes.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (createdAt.present) {
      map['created_at'] = Variable<DateTime>(createdAt.value);
    }
    if (updatedAt.present) {
      map['updated_at'] = Variable<DateTime>(updatedAt.value);
    }
    if (deletedAt.present) {
      map['deleted_at'] = Variable<DateTime>(deletedAt.value);
    }
    if (rowid.present) {
      map['rowid'] = Variable<int>(rowid.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('CustomersDriftCompanion(')
          ..write('id: $id, ')
          ..write('type: $type, ')
          ..write('firstName: $firstName, ')
          ..write('lastName: $lastName, ')
          ..write('companyName: $companyName, ')
          ..write('code: $code, ')
          ..write('siret: $siret, ')
          ..write('siren: $siren, ')
          ..write('vatNumber: $vatNumber, ')
          ..write('email: $email, ')
          ..write('phone: $phone, ')
          ..write('secondaryPhone: $secondaryPhone, ')
          ..write('address: $address, ')
          ..write('addressComplement: $addressComplement, ')
          ..write('postalCode: $postalCode, ')
          ..write('city: $city, ')
          ..write('country: $country, ')
          ..write('priceList: $priceList, ')
          ..write('permanentDiscount: $permanentDiscount, ')
          ..write('allowCredit: $allowCredit, ')
          ..write('creditLimitCents: $creditLimitCents, ')
          ..write('notes: $notes, ')
          ..write('isActive: $isActive, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('rowid: $rowid')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CategoriesDriftTable categoriesDrift =
      $CategoriesDriftTable(this);
  late final $SuppliersDriftTable suppliersDrift = $SuppliersDriftTable(this);
  late final $ProductsDriftTable productsDrift = $ProductsDriftTable(this);
  late final $OptionsDriftTable optionsDrift = $OptionsDriftTable(this);
  late final $ItemsDriftTable itemsDrift = $ItemsDriftTable(this);
  late final $ProductsOptionsDriftTable productsOptionsDrift =
      $ProductsOptionsDriftTable(this);
  late final $AuditLogsDriftTable auditLogsDrift = $AuditLogsDriftTable(this);
  late final $PlanDriftTable planDrift = $PlanDriftTable(this);
  late final $RestaurantTableDriftTable restaurantTableDrift =
      $RestaurantTableDriftTable(this);
  late final $DiscountsDriftTable discountsDrift = $DiscountsDriftTable(this);
  late final $OrderDriftTable orderDrift = $OrderDriftTable(this);
  late final $OrderItemDriftTable orderItemDrift = $OrderItemDriftTable(this);
  late final $OrderItemOptionsDriftTable orderItemOptionsDrift =
      $OrderItemOptionsDriftTable(this);
  late final $PaymentSessionDriftTable paymentSessionDrift =
      $PaymentSessionDriftTable(this);
  late final $PaymentTransactionDriftTable paymentTransactionDrift =
      $PaymentTransactionDriftTable(this);
  late final $CustomersDriftTable customersDrift = $CustomersDriftTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        categoriesDrift,
        suppliersDrift,
        productsDrift,
        optionsDrift,
        itemsDrift,
        productsOptionsDrift,
        auditLogsDrift,
        planDrift,
        restaurantTableDrift,
        discountsDrift,
        orderDrift,
        orderItemDrift,
        orderItemOptionsDrift,
        paymentSessionDrift,
        paymentTransactionDrift,
        customersDrift
      ];
}

typedef $$CategoriesDriftTableCreateCompanionBuilder = CategoriesDriftCompanion
    Function({
  required String id,
  required String name,
  Value<String?> image,
  Value<int?> color,
  Value<bool> isActive,
  Value<String?> parentId,
  Value<String?> createdById,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});
typedef $$CategoriesDriftTableUpdateCompanionBuilder = CategoriesDriftCompanion
    Function({
  Value<String> id,
  Value<String> name,
  Value<String?> image,
  Value<int?> color,
  Value<bool> isActive,
  Value<String?> parentId,
  Value<String?> createdById,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});

final class $$CategoriesDriftTableReferences extends BaseReferences<
    _$AppDatabase, $CategoriesDriftTable, CategoriesDriftData> {
  $$CategoriesDriftTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $CategoriesDriftTable _parentIdTable(_$AppDatabase db) =>
      db.categoriesDrift
          .createAlias('categories_drift__parent_id__categories_drift__id');

  $$CategoriesDriftTableProcessedTableManager? get parentId {
    final $_column = $_itemColumn<String>('parent_id');
    if ($_column == null) return null;
    final manager =
        $$CategoriesDriftTableTableManager($_db, $_db.categoriesDrift)
            .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_parentIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$ProductsDriftTable, List<ProductsDriftData>>
      _productsDriftRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.productsDrift,
              aliasName: 'categories_drift__id__products_drift__category_id');

  $$ProductsDriftTableProcessedTableManager get productsDriftRefs {
    final manager = $$ProductsDriftTableTableManager($_db, $_db.productsDrift)
        .filter((f) => f.categoryId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_productsDriftRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$CategoriesDriftTableFilterComposer
    extends Composer<_$AppDatabase, $CategoriesDriftTable> {
  $$CategoriesDriftTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get image => $composableBuilder(
      column: $table.image, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get color => $composableBuilder(
      column: $table.color, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get createdById => $composableBuilder(
      column: $table.createdById, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));

  $$CategoriesDriftTableFilterComposer get parentId {
    final $$CategoriesDriftTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.parentId,
        referencedTable: $db.categoriesDrift,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CategoriesDriftTableFilterComposer(
              $db: $db,
              $table: $db.categoriesDrift,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> productsDriftRefs(
      Expression<bool> Function($$ProductsDriftTableFilterComposer f) f) {
    final $$ProductsDriftTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.productsDrift,
        getReferencedColumn: (t) => t.categoryId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProductsDriftTableFilterComposer(
              $db: $db,
              $table: $db.productsDrift,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$CategoriesDriftTableOrderingComposer
    extends Composer<_$AppDatabase, $CategoriesDriftTable> {
  $$CategoriesDriftTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get image => $composableBuilder(
      column: $table.image, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get color => $composableBuilder(
      column: $table.color, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get createdById => $composableBuilder(
      column: $table.createdById, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));

  $$CategoriesDriftTableOrderingComposer get parentId {
    final $$CategoriesDriftTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.parentId,
        referencedTable: $db.categoriesDrift,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CategoriesDriftTableOrderingComposer(
              $db: $db,
              $table: $db.categoriesDrift,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$CategoriesDriftTableAnnotationComposer
    extends Composer<_$AppDatabase, $CategoriesDriftTable> {
  $$CategoriesDriftTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get image =>
      $composableBuilder(column: $table.image, builder: (column) => column);

  GeneratedColumn<int> get color =>
      $composableBuilder(column: $table.color, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<String> get createdById => $composableBuilder(
      column: $table.createdById, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  $$CategoriesDriftTableAnnotationComposer get parentId {
    final $$CategoriesDriftTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.parentId,
        referencedTable: $db.categoriesDrift,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CategoriesDriftTableAnnotationComposer(
              $db: $db,
              $table: $db.categoriesDrift,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> productsDriftRefs<T extends Object>(
      Expression<T> Function($$ProductsDriftTableAnnotationComposer a) f) {
    final $$ProductsDriftTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.productsDrift,
        getReferencedColumn: (t) => t.categoryId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProductsDriftTableAnnotationComposer(
              $db: $db,
              $table: $db.productsDrift,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$CategoriesDriftTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CategoriesDriftTable,
    CategoriesDriftData,
    $$CategoriesDriftTableFilterComposer,
    $$CategoriesDriftTableOrderingComposer,
    $$CategoriesDriftTableAnnotationComposer,
    $$CategoriesDriftTableCreateCompanionBuilder,
    $$CategoriesDriftTableUpdateCompanionBuilder,
    (CategoriesDriftData, $$CategoriesDriftTableReferences),
    CategoriesDriftData,
    PrefetchHooks Function({bool parentId, bool productsDriftRefs})> {
  $$CategoriesDriftTableTableManager(
      _$AppDatabase db, $CategoriesDriftTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CategoriesDriftTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CategoriesDriftTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CategoriesDriftTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> image = const Value.absent(),
            Value<int?> color = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            Value<String?> parentId = const Value.absent(),
            Value<String?> createdById = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CategoriesDriftCompanion(
            id: id,
            name: name,
            image: image,
            color: color,
            isActive: isActive,
            parentId: parentId,
            createdById: createdById,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            Value<String?> image = const Value.absent(),
            Value<int?> color = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            Value<String?> parentId = const Value.absent(),
            Value<String?> createdById = const Value.absent(),
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CategoriesDriftCompanion.insert(
            id: id,
            name: name,
            image: image,
            color: color,
            isActive: isActive,
            parentId: parentId,
            createdById: createdById,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$CategoriesDriftTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {parentId = false, productsDriftRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (productsDriftRefs) db.productsDrift
              ],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (parentId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.parentId,
                    referencedTable:
                        $$CategoriesDriftTableReferences._parentIdTable(db),
                    referencedColumn:
                        $$CategoriesDriftTableReferences._parentIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (productsDriftRefs)
                    await $_getPrefetchedData<CategoriesDriftData,
                            $CategoriesDriftTable, ProductsDriftData>(
                        currentTable: table,
                        referencedTable: $$CategoriesDriftTableReferences
                            ._productsDriftRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$CategoriesDriftTableReferences(db, table, p0)
                                .productsDriftRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.categoryId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$CategoriesDriftTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CategoriesDriftTable,
    CategoriesDriftData,
    $$CategoriesDriftTableFilterComposer,
    $$CategoriesDriftTableOrderingComposer,
    $$CategoriesDriftTableAnnotationComposer,
    $$CategoriesDriftTableCreateCompanionBuilder,
    $$CategoriesDriftTableUpdateCompanionBuilder,
    (CategoriesDriftData, $$CategoriesDriftTableReferences),
    CategoriesDriftData,
    PrefetchHooks Function({bool parentId, bool productsDriftRefs})>;
typedef $$SuppliersDriftTableCreateCompanionBuilder = SuppliersDriftCompanion
    Function({
  required String id,
  required String name,
  Value<String?> commercialName,
  required SupplierType type,
  Value<String?> code,
  Value<String?> siret,
  Value<String?> siren,
  Value<String?> vatNumber,
  Value<String?> contactFirstName,
  Value<String?> contactLastName,
  Value<String?> contactJob,
  Value<String?> email,
  Value<String?> phone,
  Value<String?> secondaryPhone,
  Value<String?> address,
  Value<String?> addressComplement,
  Value<String?> postalCode,
  Value<String?> city,
  required String country,
  required PaymentTerm paymentTerm,
  Value<double?> usualDiscount,
  Value<int?> minimumOrderAmountCents,
  Value<int?> deliveryDelayDays,
  Value<bool> isMainSupplier,
  Value<String?> notes,
  Value<bool> isActive,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});
typedef $$SuppliersDriftTableUpdateCompanionBuilder = SuppliersDriftCompanion
    Function({
  Value<String> id,
  Value<String> name,
  Value<String?> commercialName,
  Value<SupplierType> type,
  Value<String?> code,
  Value<String?> siret,
  Value<String?> siren,
  Value<String?> vatNumber,
  Value<String?> contactFirstName,
  Value<String?> contactLastName,
  Value<String?> contactJob,
  Value<String?> email,
  Value<String?> phone,
  Value<String?> secondaryPhone,
  Value<String?> address,
  Value<String?> addressComplement,
  Value<String?> postalCode,
  Value<String?> city,
  Value<String> country,
  Value<PaymentTerm> paymentTerm,
  Value<double?> usualDiscount,
  Value<int?> minimumOrderAmountCents,
  Value<int?> deliveryDelayDays,
  Value<bool> isMainSupplier,
  Value<String?> notes,
  Value<bool> isActive,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});

final class $$SuppliersDriftTableReferences extends BaseReferences<
    _$AppDatabase, $SuppliersDriftTable, SuppliersDriftData> {
  $$SuppliersDriftTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ProductsDriftTable, List<ProductsDriftData>>
      _productsDriftRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.productsDrift,
              aliasName: 'suppliers_drift__id__products_drift__supplier_id');

  $$ProductsDriftTableProcessedTableManager get productsDriftRefs {
    final manager = $$ProductsDriftTableTableManager($_db, $_db.productsDrift)
        .filter((f) => f.supplierId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_productsDriftRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$SuppliersDriftTableFilterComposer
    extends Composer<_$AppDatabase, $SuppliersDriftTable> {
  $$SuppliersDriftTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get commercialName => $composableBuilder(
      column: $table.commercialName,
      builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<SupplierType, SupplierType, String> get type =>
      $composableBuilder(
          column: $table.type,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<String> get code => $composableBuilder(
      column: $table.code, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get siret => $composableBuilder(
      column: $table.siret, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get siren => $composableBuilder(
      column: $table.siren, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get vatNumber => $composableBuilder(
      column: $table.vatNumber, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get contactFirstName => $composableBuilder(
      column: $table.contactFirstName,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get contactLastName => $composableBuilder(
      column: $table.contactLastName,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get contactJob => $composableBuilder(
      column: $table.contactJob, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get phone => $composableBuilder(
      column: $table.phone, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get secondaryPhone => $composableBuilder(
      column: $table.secondaryPhone,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get address => $composableBuilder(
      column: $table.address, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get addressComplement => $composableBuilder(
      column: $table.addressComplement,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get postalCode => $composableBuilder(
      column: $table.postalCode, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get city => $composableBuilder(
      column: $table.city, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get country => $composableBuilder(
      column: $table.country, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<PaymentTerm, PaymentTerm, String>
      get paymentTerm => $composableBuilder(
          column: $table.paymentTerm,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<double> get usualDiscount => $composableBuilder(
      column: $table.usualDiscount, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get minimumOrderAmountCents => $composableBuilder(
      column: $table.minimumOrderAmountCents,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get deliveryDelayDays => $composableBuilder(
      column: $table.deliveryDelayDays,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isMainSupplier => $composableBuilder(
      column: $table.isMainSupplier,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));

  Expression<bool> productsDriftRefs(
      Expression<bool> Function($$ProductsDriftTableFilterComposer f) f) {
    final $$ProductsDriftTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.productsDrift,
        getReferencedColumn: (t) => t.supplierId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProductsDriftTableFilterComposer(
              $db: $db,
              $table: $db.productsDrift,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$SuppliersDriftTableOrderingComposer
    extends Composer<_$AppDatabase, $SuppliersDriftTable> {
  $$SuppliersDriftTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get commercialName => $composableBuilder(
      column: $table.commercialName,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get code => $composableBuilder(
      column: $table.code, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get siret => $composableBuilder(
      column: $table.siret, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get siren => $composableBuilder(
      column: $table.siren, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get vatNumber => $composableBuilder(
      column: $table.vatNumber, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get contactFirstName => $composableBuilder(
      column: $table.contactFirstName,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get contactLastName => $composableBuilder(
      column: $table.contactLastName,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get contactJob => $composableBuilder(
      column: $table.contactJob, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get phone => $composableBuilder(
      column: $table.phone, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get secondaryPhone => $composableBuilder(
      column: $table.secondaryPhone,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get address => $composableBuilder(
      column: $table.address, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get addressComplement => $composableBuilder(
      column: $table.addressComplement,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get postalCode => $composableBuilder(
      column: $table.postalCode, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get city => $composableBuilder(
      column: $table.city, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get country => $composableBuilder(
      column: $table.country, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get paymentTerm => $composableBuilder(
      column: $table.paymentTerm, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get usualDiscount => $composableBuilder(
      column: $table.usualDiscount,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get minimumOrderAmountCents => $composableBuilder(
      column: $table.minimumOrderAmountCents,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get deliveryDelayDays => $composableBuilder(
      column: $table.deliveryDelayDays,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isMainSupplier => $composableBuilder(
      column: $table.isMainSupplier,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));
}

class $$SuppliersDriftTableAnnotationComposer
    extends Composer<_$AppDatabase, $SuppliersDriftTable> {
  $$SuppliersDriftTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get commercialName => $composableBuilder(
      column: $table.commercialName, builder: (column) => column);

  GeneratedColumnWithTypeConverter<SupplierType, String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get code =>
      $composableBuilder(column: $table.code, builder: (column) => column);

  GeneratedColumn<String> get siret =>
      $composableBuilder(column: $table.siret, builder: (column) => column);

  GeneratedColumn<String> get siren =>
      $composableBuilder(column: $table.siren, builder: (column) => column);

  GeneratedColumn<String> get vatNumber =>
      $composableBuilder(column: $table.vatNumber, builder: (column) => column);

  GeneratedColumn<String> get contactFirstName => $composableBuilder(
      column: $table.contactFirstName, builder: (column) => column);

  GeneratedColumn<String> get contactLastName => $composableBuilder(
      column: $table.contactLastName, builder: (column) => column);

  GeneratedColumn<String> get contactJob => $composableBuilder(
      column: $table.contactJob, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<String> get secondaryPhone => $composableBuilder(
      column: $table.secondaryPhone, builder: (column) => column);

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<String> get addressComplement => $composableBuilder(
      column: $table.addressComplement, builder: (column) => column);

  GeneratedColumn<String> get postalCode => $composableBuilder(
      column: $table.postalCode, builder: (column) => column);

  GeneratedColumn<String> get city =>
      $composableBuilder(column: $table.city, builder: (column) => column);

  GeneratedColumn<String> get country =>
      $composableBuilder(column: $table.country, builder: (column) => column);

  GeneratedColumnWithTypeConverter<PaymentTerm, String> get paymentTerm =>
      $composableBuilder(
          column: $table.paymentTerm, builder: (column) => column);

  GeneratedColumn<double> get usualDiscount => $composableBuilder(
      column: $table.usualDiscount, builder: (column) => column);

  GeneratedColumn<int> get minimumOrderAmountCents => $composableBuilder(
      column: $table.minimumOrderAmountCents, builder: (column) => column);

  GeneratedColumn<int> get deliveryDelayDays => $composableBuilder(
      column: $table.deliveryDelayDays, builder: (column) => column);

  GeneratedColumn<bool> get isMainSupplier => $composableBuilder(
      column: $table.isMainSupplier, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  Expression<T> productsDriftRefs<T extends Object>(
      Expression<T> Function($$ProductsDriftTableAnnotationComposer a) f) {
    final $$ProductsDriftTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.productsDrift,
        getReferencedColumn: (t) => t.supplierId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProductsDriftTableAnnotationComposer(
              $db: $db,
              $table: $db.productsDrift,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$SuppliersDriftTableTableManager extends RootTableManager<
    _$AppDatabase,
    $SuppliersDriftTable,
    SuppliersDriftData,
    $$SuppliersDriftTableFilterComposer,
    $$SuppliersDriftTableOrderingComposer,
    $$SuppliersDriftTableAnnotationComposer,
    $$SuppliersDriftTableCreateCompanionBuilder,
    $$SuppliersDriftTableUpdateCompanionBuilder,
    (SuppliersDriftData, $$SuppliersDriftTableReferences),
    SuppliersDriftData,
    PrefetchHooks Function({bool productsDriftRefs})> {
  $$SuppliersDriftTableTableManager(
      _$AppDatabase db, $SuppliersDriftTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$SuppliersDriftTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$SuppliersDriftTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$SuppliersDriftTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> commercialName = const Value.absent(),
            Value<SupplierType> type = const Value.absent(),
            Value<String?> code = const Value.absent(),
            Value<String?> siret = const Value.absent(),
            Value<String?> siren = const Value.absent(),
            Value<String?> vatNumber = const Value.absent(),
            Value<String?> contactFirstName = const Value.absent(),
            Value<String?> contactLastName = const Value.absent(),
            Value<String?> contactJob = const Value.absent(),
            Value<String?> email = const Value.absent(),
            Value<String?> phone = const Value.absent(),
            Value<String?> secondaryPhone = const Value.absent(),
            Value<String?> address = const Value.absent(),
            Value<String?> addressComplement = const Value.absent(),
            Value<String?> postalCode = const Value.absent(),
            Value<String?> city = const Value.absent(),
            Value<String> country = const Value.absent(),
            Value<PaymentTerm> paymentTerm = const Value.absent(),
            Value<double?> usualDiscount = const Value.absent(),
            Value<int?> minimumOrderAmountCents = const Value.absent(),
            Value<int?> deliveryDelayDays = const Value.absent(),
            Value<bool> isMainSupplier = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              SuppliersDriftCompanion(
            id: id,
            name: name,
            commercialName: commercialName,
            type: type,
            code: code,
            siret: siret,
            siren: siren,
            vatNumber: vatNumber,
            contactFirstName: contactFirstName,
            contactLastName: contactLastName,
            contactJob: contactJob,
            email: email,
            phone: phone,
            secondaryPhone: secondaryPhone,
            address: address,
            addressComplement: addressComplement,
            postalCode: postalCode,
            city: city,
            country: country,
            paymentTerm: paymentTerm,
            usualDiscount: usualDiscount,
            minimumOrderAmountCents: minimumOrderAmountCents,
            deliveryDelayDays: deliveryDelayDays,
            isMainSupplier: isMainSupplier,
            notes: notes,
            isActive: isActive,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            Value<String?> commercialName = const Value.absent(),
            required SupplierType type,
            Value<String?> code = const Value.absent(),
            Value<String?> siret = const Value.absent(),
            Value<String?> siren = const Value.absent(),
            Value<String?> vatNumber = const Value.absent(),
            Value<String?> contactFirstName = const Value.absent(),
            Value<String?> contactLastName = const Value.absent(),
            Value<String?> contactJob = const Value.absent(),
            Value<String?> email = const Value.absent(),
            Value<String?> phone = const Value.absent(),
            Value<String?> secondaryPhone = const Value.absent(),
            Value<String?> address = const Value.absent(),
            Value<String?> addressComplement = const Value.absent(),
            Value<String?> postalCode = const Value.absent(),
            Value<String?> city = const Value.absent(),
            required String country,
            required PaymentTerm paymentTerm,
            Value<double?> usualDiscount = const Value.absent(),
            Value<int?> minimumOrderAmountCents = const Value.absent(),
            Value<int?> deliveryDelayDays = const Value.absent(),
            Value<bool> isMainSupplier = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              SuppliersDriftCompanion.insert(
            id: id,
            name: name,
            commercialName: commercialName,
            type: type,
            code: code,
            siret: siret,
            siren: siren,
            vatNumber: vatNumber,
            contactFirstName: contactFirstName,
            contactLastName: contactLastName,
            contactJob: contactJob,
            email: email,
            phone: phone,
            secondaryPhone: secondaryPhone,
            address: address,
            addressComplement: addressComplement,
            postalCode: postalCode,
            city: city,
            country: country,
            paymentTerm: paymentTerm,
            usualDiscount: usualDiscount,
            minimumOrderAmountCents: minimumOrderAmountCents,
            deliveryDelayDays: deliveryDelayDays,
            isMainSupplier: isMainSupplier,
            notes: notes,
            isActive: isActive,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$SuppliersDriftTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({productsDriftRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (productsDriftRefs) db.productsDrift
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (productsDriftRefs)
                    await $_getPrefetchedData<SuppliersDriftData,
                            $SuppliersDriftTable, ProductsDriftData>(
                        currentTable: table,
                        referencedTable: $$SuppliersDriftTableReferences
                            ._productsDriftRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$SuppliersDriftTableReferences(db, table, p0)
                                .productsDriftRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.supplierId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$SuppliersDriftTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $SuppliersDriftTable,
    SuppliersDriftData,
    $$SuppliersDriftTableFilterComposer,
    $$SuppliersDriftTableOrderingComposer,
    $$SuppliersDriftTableAnnotationComposer,
    $$SuppliersDriftTableCreateCompanionBuilder,
    $$SuppliersDriftTableUpdateCompanionBuilder,
    (SuppliersDriftData, $$SuppliersDriftTableReferences),
    SuppliersDriftData,
    PrefetchHooks Function({bool productsDriftRefs})>;
typedef $$ProductsDriftTableCreateCompanionBuilder = ProductsDriftCompanion
    Function({
  required String id,
  required String name,
  Value<String?> description,
  Value<String?> sku,
  Value<String?> barcode,
  Value<int?> salePrice,
  Value<int> purchasePrice,
  Value<int> costPrice,
  Value<double?> taxRate,
  Value<bool> stockEnabled,
  Value<bool> weighted,
  Value<bool> service,
  Value<bool> favorite,
  Value<bool> allowNegativeStock,
  Value<double> stockQuantity,
  Value<double> stockMin,
  Value<double> stockMax,
  Value<double> reorderPoint,
  Value<String> unit,
  Value<String?> image,
  Value<int?> color,
  Value<bool> isActive,
  Value<String?> categoryId,
  Value<String?> supplierId,
  Value<String?> createdById,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});
typedef $$ProductsDriftTableUpdateCompanionBuilder = ProductsDriftCompanion
    Function({
  Value<String> id,
  Value<String> name,
  Value<String?> description,
  Value<String?> sku,
  Value<String?> barcode,
  Value<int?> salePrice,
  Value<int> purchasePrice,
  Value<int> costPrice,
  Value<double?> taxRate,
  Value<bool> stockEnabled,
  Value<bool> weighted,
  Value<bool> service,
  Value<bool> favorite,
  Value<bool> allowNegativeStock,
  Value<double> stockQuantity,
  Value<double> stockMin,
  Value<double> stockMax,
  Value<double> reorderPoint,
  Value<String> unit,
  Value<String?> image,
  Value<int?> color,
  Value<bool> isActive,
  Value<String?> categoryId,
  Value<String?> supplierId,
  Value<String?> createdById,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});

final class $$ProductsDriftTableReferences extends BaseReferences<_$AppDatabase,
    $ProductsDriftTable, ProductsDriftData> {
  $$ProductsDriftTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $CategoriesDriftTable _categoryIdTable(_$AppDatabase db) =>
      db.categoriesDrift
          .createAlias('products_drift__category_id__categories_drift__id');

  $$CategoriesDriftTableProcessedTableManager? get categoryId {
    final $_column = $_itemColumn<String>('category_id');
    if ($_column == null) return null;
    final manager =
        $$CategoriesDriftTableTableManager($_db, $_db.categoriesDrift)
            .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_categoryIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $SuppliersDriftTable _supplierIdTable(_$AppDatabase db) =>
      db.suppliersDrift
          .createAlias('products_drift__supplier_id__suppliers_drift__id');

  $$SuppliersDriftTableProcessedTableManager? get supplierId {
    final $_column = $_itemColumn<String>('supplier_id');
    if ($_column == null) return null;
    final manager = $$SuppliersDriftTableTableManager($_db, $_db.suppliersDrift)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_supplierIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$ProductsOptionsDriftTable,
      List<ProductsOptionsDriftData>> _productsOptionsDriftRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.productsOptionsDrift,
          aliasName: 'products_drift__id__products_options_drift__product_id');

  $$ProductsOptionsDriftTableProcessedTableManager
      get productsOptionsDriftRefs {
    final manager = $$ProductsOptionsDriftTableTableManager(
            $_db, $_db.productsOptionsDrift)
        .filter((f) => f.productId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_productsOptionsDriftRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$ProductsDriftTableFilterComposer
    extends Composer<_$AppDatabase, $ProductsDriftTable> {
  $$ProductsDriftTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get sku => $composableBuilder(
      column: $table.sku, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get barcode => $composableBuilder(
      column: $table.barcode, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get salePrice => $composableBuilder(
      column: $table.salePrice, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get purchasePrice => $composableBuilder(
      column: $table.purchasePrice, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get costPrice => $composableBuilder(
      column: $table.costPrice, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get taxRate => $composableBuilder(
      column: $table.taxRate, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get stockEnabled => $composableBuilder(
      column: $table.stockEnabled, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get weighted => $composableBuilder(
      column: $table.weighted, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get service => $composableBuilder(
      column: $table.service, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get favorite => $composableBuilder(
      column: $table.favorite, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get allowNegativeStock => $composableBuilder(
      column: $table.allowNegativeStock,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get stockQuantity => $composableBuilder(
      column: $table.stockQuantity, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get stockMin => $composableBuilder(
      column: $table.stockMin, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get stockMax => $composableBuilder(
      column: $table.stockMax, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get reorderPoint => $composableBuilder(
      column: $table.reorderPoint, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get unit => $composableBuilder(
      column: $table.unit, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get image => $composableBuilder(
      column: $table.image, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get color => $composableBuilder(
      column: $table.color, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get createdById => $composableBuilder(
      column: $table.createdById, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));

  $$CategoriesDriftTableFilterComposer get categoryId {
    final $$CategoriesDriftTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.categoryId,
        referencedTable: $db.categoriesDrift,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CategoriesDriftTableFilterComposer(
              $db: $db,
              $table: $db.categoriesDrift,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$SuppliersDriftTableFilterComposer get supplierId {
    final $$SuppliersDriftTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.supplierId,
        referencedTable: $db.suppliersDrift,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SuppliersDriftTableFilterComposer(
              $db: $db,
              $table: $db.suppliersDrift,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<bool> productsOptionsDriftRefs(
      Expression<bool> Function($$ProductsOptionsDriftTableFilterComposer f)
          f) {
    final $$ProductsOptionsDriftTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.productsOptionsDrift,
        getReferencedColumn: (t) => t.productId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProductsOptionsDriftTableFilterComposer(
              $db: $db,
              $table: $db.productsOptionsDrift,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$ProductsDriftTableOrderingComposer
    extends Composer<_$AppDatabase, $ProductsDriftTable> {
  $$ProductsDriftTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sku => $composableBuilder(
      column: $table.sku, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get barcode => $composableBuilder(
      column: $table.barcode, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get salePrice => $composableBuilder(
      column: $table.salePrice, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get purchasePrice => $composableBuilder(
      column: $table.purchasePrice,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get costPrice => $composableBuilder(
      column: $table.costPrice, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get taxRate => $composableBuilder(
      column: $table.taxRate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get stockEnabled => $composableBuilder(
      column: $table.stockEnabled,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get weighted => $composableBuilder(
      column: $table.weighted, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get service => $composableBuilder(
      column: $table.service, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get favorite => $composableBuilder(
      column: $table.favorite, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get allowNegativeStock => $composableBuilder(
      column: $table.allowNegativeStock,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get stockQuantity => $composableBuilder(
      column: $table.stockQuantity,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get stockMin => $composableBuilder(
      column: $table.stockMin, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get stockMax => $composableBuilder(
      column: $table.stockMax, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get reorderPoint => $composableBuilder(
      column: $table.reorderPoint,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get unit => $composableBuilder(
      column: $table.unit, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get image => $composableBuilder(
      column: $table.image, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get color => $composableBuilder(
      column: $table.color, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get createdById => $composableBuilder(
      column: $table.createdById, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));

  $$CategoriesDriftTableOrderingComposer get categoryId {
    final $$CategoriesDriftTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.categoryId,
        referencedTable: $db.categoriesDrift,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CategoriesDriftTableOrderingComposer(
              $db: $db,
              $table: $db.categoriesDrift,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$SuppliersDriftTableOrderingComposer get supplierId {
    final $$SuppliersDriftTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.supplierId,
        referencedTable: $db.suppliersDrift,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SuppliersDriftTableOrderingComposer(
              $db: $db,
              $table: $db.suppliersDrift,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ProductsDriftTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProductsDriftTable> {
  $$ProductsDriftTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<String> get sku =>
      $composableBuilder(column: $table.sku, builder: (column) => column);

  GeneratedColumn<String> get barcode =>
      $composableBuilder(column: $table.barcode, builder: (column) => column);

  GeneratedColumn<int> get salePrice =>
      $composableBuilder(column: $table.salePrice, builder: (column) => column);

  GeneratedColumn<int> get purchasePrice => $composableBuilder(
      column: $table.purchasePrice, builder: (column) => column);

  GeneratedColumn<int> get costPrice =>
      $composableBuilder(column: $table.costPrice, builder: (column) => column);

  GeneratedColumn<double> get taxRate =>
      $composableBuilder(column: $table.taxRate, builder: (column) => column);

  GeneratedColumn<bool> get stockEnabled => $composableBuilder(
      column: $table.stockEnabled, builder: (column) => column);

  GeneratedColumn<bool> get weighted =>
      $composableBuilder(column: $table.weighted, builder: (column) => column);

  GeneratedColumn<bool> get service =>
      $composableBuilder(column: $table.service, builder: (column) => column);

  GeneratedColumn<bool> get favorite =>
      $composableBuilder(column: $table.favorite, builder: (column) => column);

  GeneratedColumn<bool> get allowNegativeStock => $composableBuilder(
      column: $table.allowNegativeStock, builder: (column) => column);

  GeneratedColumn<double> get stockQuantity => $composableBuilder(
      column: $table.stockQuantity, builder: (column) => column);

  GeneratedColumn<double> get stockMin =>
      $composableBuilder(column: $table.stockMin, builder: (column) => column);

  GeneratedColumn<double> get stockMax =>
      $composableBuilder(column: $table.stockMax, builder: (column) => column);

  GeneratedColumn<double> get reorderPoint => $composableBuilder(
      column: $table.reorderPoint, builder: (column) => column);

  GeneratedColumn<String> get unit =>
      $composableBuilder(column: $table.unit, builder: (column) => column);

  GeneratedColumn<String> get image =>
      $composableBuilder(column: $table.image, builder: (column) => column);

  GeneratedColumn<int> get color =>
      $composableBuilder(column: $table.color, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<String> get createdById => $composableBuilder(
      column: $table.createdById, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  $$CategoriesDriftTableAnnotationComposer get categoryId {
    final $$CategoriesDriftTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.categoryId,
        referencedTable: $db.categoriesDrift,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$CategoriesDriftTableAnnotationComposer(
              $db: $db,
              $table: $db.categoriesDrift,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$SuppliersDriftTableAnnotationComposer get supplierId {
    final $$SuppliersDriftTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.supplierId,
        referencedTable: $db.suppliersDrift,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$SuppliersDriftTableAnnotationComposer(
              $db: $db,
              $table: $db.suppliersDrift,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  Expression<T> productsOptionsDriftRefs<T extends Object>(
      Expression<T> Function($$ProductsOptionsDriftTableAnnotationComposer a)
          f) {
    final $$ProductsOptionsDriftTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.productsOptionsDrift,
            getReferencedColumn: (t) => t.productId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$ProductsOptionsDriftTableAnnotationComposer(
                  $db: $db,
                  $table: $db.productsOptionsDrift,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$ProductsDriftTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ProductsDriftTable,
    ProductsDriftData,
    $$ProductsDriftTableFilterComposer,
    $$ProductsDriftTableOrderingComposer,
    $$ProductsDriftTableAnnotationComposer,
    $$ProductsDriftTableCreateCompanionBuilder,
    $$ProductsDriftTableUpdateCompanionBuilder,
    (ProductsDriftData, $$ProductsDriftTableReferences),
    ProductsDriftData,
    PrefetchHooks Function(
        {bool categoryId, bool supplierId, bool productsOptionsDriftRefs})> {
  $$ProductsDriftTableTableManager(_$AppDatabase db, $ProductsDriftTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProductsDriftTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProductsDriftTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProductsDriftTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<String?> sku = const Value.absent(),
            Value<String?> barcode = const Value.absent(),
            Value<int?> salePrice = const Value.absent(),
            Value<int> purchasePrice = const Value.absent(),
            Value<int> costPrice = const Value.absent(),
            Value<double?> taxRate = const Value.absent(),
            Value<bool> stockEnabled = const Value.absent(),
            Value<bool> weighted = const Value.absent(),
            Value<bool> service = const Value.absent(),
            Value<bool> favorite = const Value.absent(),
            Value<bool> allowNegativeStock = const Value.absent(),
            Value<double> stockQuantity = const Value.absent(),
            Value<double> stockMin = const Value.absent(),
            Value<double> stockMax = const Value.absent(),
            Value<double> reorderPoint = const Value.absent(),
            Value<String> unit = const Value.absent(),
            Value<String?> image = const Value.absent(),
            Value<int?> color = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            Value<String?> categoryId = const Value.absent(),
            Value<String?> supplierId = const Value.absent(),
            Value<String?> createdById = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ProductsDriftCompanion(
            id: id,
            name: name,
            description: description,
            sku: sku,
            barcode: barcode,
            salePrice: salePrice,
            purchasePrice: purchasePrice,
            costPrice: costPrice,
            taxRate: taxRate,
            stockEnabled: stockEnabled,
            weighted: weighted,
            service: service,
            favorite: favorite,
            allowNegativeStock: allowNegativeStock,
            stockQuantity: stockQuantity,
            stockMin: stockMin,
            stockMax: stockMax,
            reorderPoint: reorderPoint,
            unit: unit,
            image: image,
            color: color,
            isActive: isActive,
            categoryId: categoryId,
            supplierId: supplierId,
            createdById: createdById,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            Value<String?> description = const Value.absent(),
            Value<String?> sku = const Value.absent(),
            Value<String?> barcode = const Value.absent(),
            Value<int?> salePrice = const Value.absent(),
            Value<int> purchasePrice = const Value.absent(),
            Value<int> costPrice = const Value.absent(),
            Value<double?> taxRate = const Value.absent(),
            Value<bool> stockEnabled = const Value.absent(),
            Value<bool> weighted = const Value.absent(),
            Value<bool> service = const Value.absent(),
            Value<bool> favorite = const Value.absent(),
            Value<bool> allowNegativeStock = const Value.absent(),
            Value<double> stockQuantity = const Value.absent(),
            Value<double> stockMin = const Value.absent(),
            Value<double> stockMax = const Value.absent(),
            Value<double> reorderPoint = const Value.absent(),
            Value<String> unit = const Value.absent(),
            Value<String?> image = const Value.absent(),
            Value<int?> color = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            Value<String?> categoryId = const Value.absent(),
            Value<String?> supplierId = const Value.absent(),
            Value<String?> createdById = const Value.absent(),
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ProductsDriftCompanion.insert(
            id: id,
            name: name,
            description: description,
            sku: sku,
            barcode: barcode,
            salePrice: salePrice,
            purchasePrice: purchasePrice,
            costPrice: costPrice,
            taxRate: taxRate,
            stockEnabled: stockEnabled,
            weighted: weighted,
            service: service,
            favorite: favorite,
            allowNegativeStock: allowNegativeStock,
            stockQuantity: stockQuantity,
            stockMin: stockMin,
            stockMax: stockMax,
            reorderPoint: reorderPoint,
            unit: unit,
            image: image,
            color: color,
            isActive: isActive,
            categoryId: categoryId,
            supplierId: supplierId,
            createdById: createdById,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$ProductsDriftTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {categoryId = false,
              supplierId = false,
              productsOptionsDriftRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (productsOptionsDriftRefs) db.productsOptionsDrift
              ],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (categoryId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.categoryId,
                    referencedTable:
                        $$ProductsDriftTableReferences._categoryIdTable(db),
                    referencedColumn:
                        $$ProductsDriftTableReferences._categoryIdTable(db).id,
                  ) as T;
                }
                if (supplierId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.supplierId,
                    referencedTable:
                        $$ProductsDriftTableReferences._supplierIdTable(db),
                    referencedColumn:
                        $$ProductsDriftTableReferences._supplierIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (productsOptionsDriftRefs)
                    await $_getPrefetchedData<ProductsDriftData,
                            $ProductsDriftTable, ProductsOptionsDriftData>(
                        currentTable: table,
                        referencedTable: $$ProductsDriftTableReferences
                            ._productsOptionsDriftRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$ProductsDriftTableReferences(db, table, p0)
                                .productsOptionsDriftRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.productId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$ProductsDriftTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ProductsDriftTable,
    ProductsDriftData,
    $$ProductsDriftTableFilterComposer,
    $$ProductsDriftTableOrderingComposer,
    $$ProductsDriftTableAnnotationComposer,
    $$ProductsDriftTableCreateCompanionBuilder,
    $$ProductsDriftTableUpdateCompanionBuilder,
    (ProductsDriftData, $$ProductsDriftTableReferences),
    ProductsDriftData,
    PrefetchHooks Function(
        {bool categoryId, bool supplierId, bool productsOptionsDriftRefs})>;
typedef $$OptionsDriftTableCreateCompanionBuilder = OptionsDriftCompanion
    Function({
  required String id,
  required String name,
  Value<String?> description,
  Value<bool> mandatory,
  Value<int> minSelection,
  Value<int> maxSelection,
  Value<bool> allowDuplicateSelection,
  Value<String?> image,
  Value<String?> color,
  Value<bool> active,
  Value<String?> createdById,
  Value<DateTime?> deletedAt,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<int> rowid,
});
typedef $$OptionsDriftTableUpdateCompanionBuilder = OptionsDriftCompanion
    Function({
  Value<String> id,
  Value<String> name,
  Value<String?> description,
  Value<bool> mandatory,
  Value<int> minSelection,
  Value<int> maxSelection,
  Value<bool> allowDuplicateSelection,
  Value<String?> image,
  Value<String?> color,
  Value<bool> active,
  Value<String?> createdById,
  Value<DateTime?> deletedAt,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});

final class $$OptionsDriftTableReferences extends BaseReferences<_$AppDatabase,
    $OptionsDriftTable, OptionsDriftData> {
  $$OptionsDriftTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ItemsDriftTable, List<ItemsDriftData>>
      _itemsDriftRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.itemsDrift,
              aliasName: 'options_drift__id__items_drift__option_id');

  $$ItemsDriftTableProcessedTableManager get itemsDriftRefs {
    final manager = $$ItemsDriftTableTableManager($_db, $_db.itemsDrift)
        .filter((f) => f.optionId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache = $_typedResult.readTableOrNull(_itemsDriftRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }

  static MultiTypedResultKey<$ProductsOptionsDriftTable,
      List<ProductsOptionsDriftData>> _productsOptionsDriftRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.productsOptionsDrift,
          aliasName: 'options_drift__id__products_options_drift__option_id');

  $$ProductsOptionsDriftTableProcessedTableManager
      get productsOptionsDriftRefs {
    final manager = $$ProductsOptionsDriftTableTableManager(
            $_db, $_db.productsOptionsDrift)
        .filter((f) => f.optionId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_productsOptionsDriftRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$OptionsDriftTableFilterComposer
    extends Composer<_$AppDatabase, $OptionsDriftTable> {
  $$OptionsDriftTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get mandatory => $composableBuilder(
      column: $table.mandatory, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get minSelection => $composableBuilder(
      column: $table.minSelection, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get maxSelection => $composableBuilder(
      column: $table.maxSelection, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get allowDuplicateSelection => $composableBuilder(
      column: $table.allowDuplicateSelection,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get image => $composableBuilder(
      column: $table.image, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get color => $composableBuilder(
      column: $table.color, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get active => $composableBuilder(
      column: $table.active, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get createdById => $composableBuilder(
      column: $table.createdById, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  Expression<bool> itemsDriftRefs(
      Expression<bool> Function($$ItemsDriftTableFilterComposer f) f) {
    final $$ItemsDriftTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.itemsDrift,
        getReferencedColumn: (t) => t.optionId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ItemsDriftTableFilterComposer(
              $db: $db,
              $table: $db.itemsDrift,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<bool> productsOptionsDriftRefs(
      Expression<bool> Function($$ProductsOptionsDriftTableFilterComposer f)
          f) {
    final $$ProductsOptionsDriftTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.productsOptionsDrift,
        getReferencedColumn: (t) => t.optionId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProductsOptionsDriftTableFilterComposer(
              $db: $db,
              $table: $db.productsOptionsDrift,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$OptionsDriftTableOrderingComposer
    extends Composer<_$AppDatabase, $OptionsDriftTable> {
  $$OptionsDriftTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get mandatory => $composableBuilder(
      column: $table.mandatory, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get minSelection => $composableBuilder(
      column: $table.minSelection,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get maxSelection => $composableBuilder(
      column: $table.maxSelection,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get allowDuplicateSelection => $composableBuilder(
      column: $table.allowDuplicateSelection,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get image => $composableBuilder(
      column: $table.image, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get color => $composableBuilder(
      column: $table.color, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get active => $composableBuilder(
      column: $table.active, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get createdById => $composableBuilder(
      column: $table.createdById, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$OptionsDriftTableAnnotationComposer
    extends Composer<_$AppDatabase, $OptionsDriftTable> {
  $$OptionsDriftTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<bool> get mandatory =>
      $composableBuilder(column: $table.mandatory, builder: (column) => column);

  GeneratedColumn<int> get minSelection => $composableBuilder(
      column: $table.minSelection, builder: (column) => column);

  GeneratedColumn<int> get maxSelection => $composableBuilder(
      column: $table.maxSelection, builder: (column) => column);

  GeneratedColumn<bool> get allowDuplicateSelection => $composableBuilder(
      column: $table.allowDuplicateSelection, builder: (column) => column);

  GeneratedColumn<String> get image =>
      $composableBuilder(column: $table.image, builder: (column) => column);

  GeneratedColumn<String> get color =>
      $composableBuilder(column: $table.color, builder: (column) => column);

  GeneratedColumn<bool> get active =>
      $composableBuilder(column: $table.active, builder: (column) => column);

  GeneratedColumn<String> get createdById => $composableBuilder(
      column: $table.createdById, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> itemsDriftRefs<T extends Object>(
      Expression<T> Function($$ItemsDriftTableAnnotationComposer a) f) {
    final $$ItemsDriftTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.itemsDrift,
        getReferencedColumn: (t) => t.optionId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ItemsDriftTableAnnotationComposer(
              $db: $db,
              $table: $db.itemsDrift,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }

  Expression<T> productsOptionsDriftRefs<T extends Object>(
      Expression<T> Function($$ProductsOptionsDriftTableAnnotationComposer a)
          f) {
    final $$ProductsOptionsDriftTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.productsOptionsDrift,
            getReferencedColumn: (t) => t.optionId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$ProductsOptionsDriftTableAnnotationComposer(
                  $db: $db,
                  $table: $db.productsOptionsDrift,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$OptionsDriftTableTableManager extends RootTableManager<
    _$AppDatabase,
    $OptionsDriftTable,
    OptionsDriftData,
    $$OptionsDriftTableFilterComposer,
    $$OptionsDriftTableOrderingComposer,
    $$OptionsDriftTableAnnotationComposer,
    $$OptionsDriftTableCreateCompanionBuilder,
    $$OptionsDriftTableUpdateCompanionBuilder,
    (OptionsDriftData, $$OptionsDriftTableReferences),
    OptionsDriftData,
    PrefetchHooks Function(
        {bool itemsDriftRefs, bool productsOptionsDriftRefs})> {
  $$OptionsDriftTableTableManager(_$AppDatabase db, $OptionsDriftTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$OptionsDriftTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$OptionsDriftTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$OptionsDriftTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<bool> mandatory = const Value.absent(),
            Value<int> minSelection = const Value.absent(),
            Value<int> maxSelection = const Value.absent(),
            Value<bool> allowDuplicateSelection = const Value.absent(),
            Value<String?> image = const Value.absent(),
            Value<String?> color = const Value.absent(),
            Value<bool> active = const Value.absent(),
            Value<String?> createdById = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              OptionsDriftCompanion(
            id: id,
            name: name,
            description: description,
            mandatory: mandatory,
            minSelection: minSelection,
            maxSelection: maxSelection,
            allowDuplicateSelection: allowDuplicateSelection,
            image: image,
            color: color,
            active: active,
            createdById: createdById,
            deletedAt: deletedAt,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            Value<String?> description = const Value.absent(),
            Value<bool> mandatory = const Value.absent(),
            Value<int> minSelection = const Value.absent(),
            Value<int> maxSelection = const Value.absent(),
            Value<bool> allowDuplicateSelection = const Value.absent(),
            Value<String?> image = const Value.absent(),
            Value<String?> color = const Value.absent(),
            Value<bool> active = const Value.absent(),
            Value<String?> createdById = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              OptionsDriftCompanion.insert(
            id: id,
            name: name,
            description: description,
            mandatory: mandatory,
            minSelection: minSelection,
            maxSelection: maxSelection,
            allowDuplicateSelection: allowDuplicateSelection,
            image: image,
            color: color,
            active: active,
            createdById: createdById,
            deletedAt: deletedAt,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$OptionsDriftTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {itemsDriftRefs = false, productsOptionsDriftRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (itemsDriftRefs) db.itemsDrift,
                if (productsOptionsDriftRefs) db.productsOptionsDrift
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (itemsDriftRefs)
                    await $_getPrefetchedData<OptionsDriftData,
                            $OptionsDriftTable, ItemsDriftData>(
                        currentTable: table,
                        referencedTable: $$OptionsDriftTableReferences
                            ._itemsDriftRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$OptionsDriftTableReferences(db, table, p0)
                                .itemsDriftRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.optionId == item.id),
                        typedResults: items),
                  if (productsOptionsDriftRefs)
                    await $_getPrefetchedData<OptionsDriftData,
                            $OptionsDriftTable, ProductsOptionsDriftData>(
                        currentTable: table,
                        referencedTable: $$OptionsDriftTableReferences
                            ._productsOptionsDriftRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$OptionsDriftTableReferences(db, table, p0)
                                .productsOptionsDriftRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.optionId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$OptionsDriftTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $OptionsDriftTable,
    OptionsDriftData,
    $$OptionsDriftTableFilterComposer,
    $$OptionsDriftTableOrderingComposer,
    $$OptionsDriftTableAnnotationComposer,
    $$OptionsDriftTableCreateCompanionBuilder,
    $$OptionsDriftTableUpdateCompanionBuilder,
    (OptionsDriftData, $$OptionsDriftTableReferences),
    OptionsDriftData,
    PrefetchHooks Function(
        {bool itemsDriftRefs, bool productsOptionsDriftRefs})>;
typedef $$ItemsDriftTableCreateCompanionBuilder = ItemsDriftCompanion Function({
  required String id,
  required String name,
  Value<String?> description,
  Value<String?> sku,
  Value<int> additionalPrice,
  Value<double> taxRate,
  Value<String?> image,
  Value<String?> color,
  Value<bool> active,
  Value<bool> inStock,
  Value<int> displayOrder,
  Value<int?> icon,
  required String optionId,
  Value<String?> createdById,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});
typedef $$ItemsDriftTableUpdateCompanionBuilder = ItemsDriftCompanion Function({
  Value<String> id,
  Value<String> name,
  Value<String?> description,
  Value<String?> sku,
  Value<int> additionalPrice,
  Value<double> taxRate,
  Value<String?> image,
  Value<String?> color,
  Value<bool> active,
  Value<bool> inStock,
  Value<int> displayOrder,
  Value<int?> icon,
  Value<String> optionId,
  Value<String?> createdById,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});

final class $$ItemsDriftTableReferences
    extends BaseReferences<_$AppDatabase, $ItemsDriftTable, ItemsDriftData> {
  $$ItemsDriftTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static $OptionsDriftTable _optionIdTable(_$AppDatabase db) =>
      db.optionsDrift.createAlias('items_drift__option_id__options_drift__id');

  $$OptionsDriftTableProcessedTableManager get optionId {
    final $_column = $_itemColumn<String>('option_id')!;

    final manager = $$OptionsDriftTableTableManager($_db, $_db.optionsDrift)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_optionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$ItemsDriftTableFilterComposer
    extends Composer<_$AppDatabase, $ItemsDriftTable> {
  $$ItemsDriftTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get sku => $composableBuilder(
      column: $table.sku, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get additionalPrice => $composableBuilder(
      column: $table.additionalPrice,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get taxRate => $composableBuilder(
      column: $table.taxRate, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get image => $composableBuilder(
      column: $table.image, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get color => $composableBuilder(
      column: $table.color, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get active => $composableBuilder(
      column: $table.active, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get inStock => $composableBuilder(
      column: $table.inStock, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get displayOrder => $composableBuilder(
      column: $table.displayOrder, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get icon => $composableBuilder(
      column: $table.icon, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get createdById => $composableBuilder(
      column: $table.createdById, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));

  $$OptionsDriftTableFilterComposer get optionId {
    final $$OptionsDriftTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.optionId,
        referencedTable: $db.optionsDrift,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$OptionsDriftTableFilterComposer(
              $db: $db,
              $table: $db.optionsDrift,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ItemsDriftTableOrderingComposer
    extends Composer<_$AppDatabase, $ItemsDriftTable> {
  $$ItemsDriftTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sku => $composableBuilder(
      column: $table.sku, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get additionalPrice => $composableBuilder(
      column: $table.additionalPrice,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get taxRate => $composableBuilder(
      column: $table.taxRate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get image => $composableBuilder(
      column: $table.image, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get color => $composableBuilder(
      column: $table.color, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get active => $composableBuilder(
      column: $table.active, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get inStock => $composableBuilder(
      column: $table.inStock, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get displayOrder => $composableBuilder(
      column: $table.displayOrder,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get icon => $composableBuilder(
      column: $table.icon, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get createdById => $composableBuilder(
      column: $table.createdById, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));

  $$OptionsDriftTableOrderingComposer get optionId {
    final $$OptionsDriftTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.optionId,
        referencedTable: $db.optionsDrift,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$OptionsDriftTableOrderingComposer(
              $db: $db,
              $table: $db.optionsDrift,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ItemsDriftTableAnnotationComposer
    extends Composer<_$AppDatabase, $ItemsDriftTable> {
  $$ItemsDriftTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<String> get sku =>
      $composableBuilder(column: $table.sku, builder: (column) => column);

  GeneratedColumn<int> get additionalPrice => $composableBuilder(
      column: $table.additionalPrice, builder: (column) => column);

  GeneratedColumn<double> get taxRate =>
      $composableBuilder(column: $table.taxRate, builder: (column) => column);

  GeneratedColumn<String> get image =>
      $composableBuilder(column: $table.image, builder: (column) => column);

  GeneratedColumn<String> get color =>
      $composableBuilder(column: $table.color, builder: (column) => column);

  GeneratedColumn<bool> get active =>
      $composableBuilder(column: $table.active, builder: (column) => column);

  GeneratedColumn<bool> get inStock =>
      $composableBuilder(column: $table.inStock, builder: (column) => column);

  GeneratedColumn<int> get displayOrder => $composableBuilder(
      column: $table.displayOrder, builder: (column) => column);

  GeneratedColumn<int> get icon =>
      $composableBuilder(column: $table.icon, builder: (column) => column);

  GeneratedColumn<String> get createdById => $composableBuilder(
      column: $table.createdById, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  $$OptionsDriftTableAnnotationComposer get optionId {
    final $$OptionsDriftTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.optionId,
        referencedTable: $db.optionsDrift,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$OptionsDriftTableAnnotationComposer(
              $db: $db,
              $table: $db.optionsDrift,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ItemsDriftTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ItemsDriftTable,
    ItemsDriftData,
    $$ItemsDriftTableFilterComposer,
    $$ItemsDriftTableOrderingComposer,
    $$ItemsDriftTableAnnotationComposer,
    $$ItemsDriftTableCreateCompanionBuilder,
    $$ItemsDriftTableUpdateCompanionBuilder,
    (ItemsDriftData, $$ItemsDriftTableReferences),
    ItemsDriftData,
    PrefetchHooks Function({bool optionId})> {
  $$ItemsDriftTableTableManager(_$AppDatabase db, $ItemsDriftTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ItemsDriftTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ItemsDriftTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ItemsDriftTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<String?> sku = const Value.absent(),
            Value<int> additionalPrice = const Value.absent(),
            Value<double> taxRate = const Value.absent(),
            Value<String?> image = const Value.absent(),
            Value<String?> color = const Value.absent(),
            Value<bool> active = const Value.absent(),
            Value<bool> inStock = const Value.absent(),
            Value<int> displayOrder = const Value.absent(),
            Value<int?> icon = const Value.absent(),
            Value<String> optionId = const Value.absent(),
            Value<String?> createdById = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ItemsDriftCompanion(
            id: id,
            name: name,
            description: description,
            sku: sku,
            additionalPrice: additionalPrice,
            taxRate: taxRate,
            image: image,
            color: color,
            active: active,
            inStock: inStock,
            displayOrder: displayOrder,
            icon: icon,
            optionId: optionId,
            createdById: createdById,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            Value<String?> description = const Value.absent(),
            Value<String?> sku = const Value.absent(),
            Value<int> additionalPrice = const Value.absent(),
            Value<double> taxRate = const Value.absent(),
            Value<String?> image = const Value.absent(),
            Value<String?> color = const Value.absent(),
            Value<bool> active = const Value.absent(),
            Value<bool> inStock = const Value.absent(),
            Value<int> displayOrder = const Value.absent(),
            Value<int?> icon = const Value.absent(),
            required String optionId,
            Value<String?> createdById = const Value.absent(),
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ItemsDriftCompanion.insert(
            id: id,
            name: name,
            description: description,
            sku: sku,
            additionalPrice: additionalPrice,
            taxRate: taxRate,
            image: image,
            color: color,
            active: active,
            inStock: inStock,
            displayOrder: displayOrder,
            icon: icon,
            optionId: optionId,
            createdById: createdById,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$ItemsDriftTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({optionId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (optionId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.optionId,
                    referencedTable:
                        $$ItemsDriftTableReferences._optionIdTable(db),
                    referencedColumn:
                        $$ItemsDriftTableReferences._optionIdTable(db).id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$ItemsDriftTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ItemsDriftTable,
    ItemsDriftData,
    $$ItemsDriftTableFilterComposer,
    $$ItemsDriftTableOrderingComposer,
    $$ItemsDriftTableAnnotationComposer,
    $$ItemsDriftTableCreateCompanionBuilder,
    $$ItemsDriftTableUpdateCompanionBuilder,
    (ItemsDriftData, $$ItemsDriftTableReferences),
    ItemsDriftData,
    PrefetchHooks Function({bool optionId})>;
typedef $$ProductsOptionsDriftTableCreateCompanionBuilder
    = ProductsOptionsDriftCompanion Function({
  required String productId,
  required String optionId,
  Value<String?> createdById,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});
typedef $$ProductsOptionsDriftTableUpdateCompanionBuilder
    = ProductsOptionsDriftCompanion Function({
  Value<String> productId,
  Value<String> optionId,
  Value<String?> createdById,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});

final class $$ProductsOptionsDriftTableReferences extends BaseReferences<
    _$AppDatabase, $ProductsOptionsDriftTable, ProductsOptionsDriftData> {
  $$ProductsOptionsDriftTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $ProductsDriftTable _productIdTable(_$AppDatabase db) => db
      .productsDrift
      .createAlias('products_options_drift__product_id__products_drift__id');

  $$ProductsDriftTableProcessedTableManager get productId {
    final $_column = $_itemColumn<String>('product_id')!;

    final manager = $$ProductsDriftTableTableManager($_db, $_db.productsDrift)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_productIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $OptionsDriftTable _optionIdTable(_$AppDatabase db) => db.optionsDrift
      .createAlias('products_options_drift__option_id__options_drift__id');

  $$OptionsDriftTableProcessedTableManager get optionId {
    final $_column = $_itemColumn<String>('option_id')!;

    final manager = $$OptionsDriftTableTableManager($_db, $_db.optionsDrift)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_optionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$ProductsOptionsDriftTableFilterComposer
    extends Composer<_$AppDatabase, $ProductsOptionsDriftTable> {
  $$ProductsOptionsDriftTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get createdById => $composableBuilder(
      column: $table.createdById, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));

  $$ProductsDriftTableFilterComposer get productId {
    final $$ProductsDriftTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.productId,
        referencedTable: $db.productsDrift,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProductsDriftTableFilterComposer(
              $db: $db,
              $table: $db.productsDrift,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$OptionsDriftTableFilterComposer get optionId {
    final $$OptionsDriftTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.optionId,
        referencedTable: $db.optionsDrift,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$OptionsDriftTableFilterComposer(
              $db: $db,
              $table: $db.optionsDrift,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ProductsOptionsDriftTableOrderingComposer
    extends Composer<_$AppDatabase, $ProductsOptionsDriftTable> {
  $$ProductsOptionsDriftTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get createdById => $composableBuilder(
      column: $table.createdById, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));

  $$ProductsDriftTableOrderingComposer get productId {
    final $$ProductsDriftTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.productId,
        referencedTable: $db.productsDrift,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProductsDriftTableOrderingComposer(
              $db: $db,
              $table: $db.productsDrift,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$OptionsDriftTableOrderingComposer get optionId {
    final $$OptionsDriftTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.optionId,
        referencedTable: $db.optionsDrift,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$OptionsDriftTableOrderingComposer(
              $db: $db,
              $table: $db.optionsDrift,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ProductsOptionsDriftTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProductsOptionsDriftTable> {
  $$ProductsOptionsDriftTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get createdById => $composableBuilder(
      column: $table.createdById, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  $$ProductsDriftTableAnnotationComposer get productId {
    final $$ProductsDriftTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.productId,
        referencedTable: $db.productsDrift,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProductsDriftTableAnnotationComposer(
              $db: $db,
              $table: $db.productsDrift,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }

  $$OptionsDriftTableAnnotationComposer get optionId {
    final $$OptionsDriftTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.optionId,
        referencedTable: $db.optionsDrift,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$OptionsDriftTableAnnotationComposer(
              $db: $db,
              $table: $db.optionsDrift,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ProductsOptionsDriftTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ProductsOptionsDriftTable,
    ProductsOptionsDriftData,
    $$ProductsOptionsDriftTableFilterComposer,
    $$ProductsOptionsDriftTableOrderingComposer,
    $$ProductsOptionsDriftTableAnnotationComposer,
    $$ProductsOptionsDriftTableCreateCompanionBuilder,
    $$ProductsOptionsDriftTableUpdateCompanionBuilder,
    (ProductsOptionsDriftData, $$ProductsOptionsDriftTableReferences),
    ProductsOptionsDriftData,
    PrefetchHooks Function({bool productId, bool optionId})> {
  $$ProductsOptionsDriftTableTableManager(
      _$AppDatabase db, $ProductsOptionsDriftTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProductsOptionsDriftTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProductsOptionsDriftTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProductsOptionsDriftTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> productId = const Value.absent(),
            Value<String> optionId = const Value.absent(),
            Value<String?> createdById = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ProductsOptionsDriftCompanion(
            productId: productId,
            optionId: optionId,
            createdById: createdById,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String productId,
            required String optionId,
            Value<String?> createdById = const Value.absent(),
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              ProductsOptionsDriftCompanion.insert(
            productId: productId,
            optionId: optionId,
            createdById: createdById,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$ProductsOptionsDriftTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({productId = false, optionId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (productId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.productId,
                    referencedTable: $$ProductsOptionsDriftTableReferences
                        ._productIdTable(db),
                    referencedColumn: $$ProductsOptionsDriftTableReferences
                        ._productIdTable(db)
                        .id,
                  ) as T;
                }
                if (optionId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.optionId,
                    referencedTable: $$ProductsOptionsDriftTableReferences
                        ._optionIdTable(db),
                    referencedColumn: $$ProductsOptionsDriftTableReferences
                        ._optionIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$ProductsOptionsDriftTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $ProductsOptionsDriftTable,
        ProductsOptionsDriftData,
        $$ProductsOptionsDriftTableFilterComposer,
        $$ProductsOptionsDriftTableOrderingComposer,
        $$ProductsOptionsDriftTableAnnotationComposer,
        $$ProductsOptionsDriftTableCreateCompanionBuilder,
        $$ProductsOptionsDriftTableUpdateCompanionBuilder,
        (ProductsOptionsDriftData, $$ProductsOptionsDriftTableReferences),
        ProductsOptionsDriftData,
        PrefetchHooks Function({bool productId, bool optionId})>;
typedef $$AuditLogsDriftTableCreateCompanionBuilder = AuditLogsDriftCompanion
    Function({
  required String id,
  Value<String?> actorUserId,
  required String action,
  required String auditedEntityName,
  Value<String?> entityId,
  Value<String?> metadata,
  required DateTime createdAt,
  Value<int> rowid,
});
typedef $$AuditLogsDriftTableUpdateCompanionBuilder = AuditLogsDriftCompanion
    Function({
  Value<String> id,
  Value<String?> actorUserId,
  Value<String> action,
  Value<String> auditedEntityName,
  Value<String?> entityId,
  Value<String?> metadata,
  Value<DateTime> createdAt,
  Value<int> rowid,
});

class $$AuditLogsDriftTableFilterComposer
    extends Composer<_$AppDatabase, $AuditLogsDriftTable> {
  $$AuditLogsDriftTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get actorUserId => $composableBuilder(
      column: $table.actorUserId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get action => $composableBuilder(
      column: $table.action, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get auditedEntityName => $composableBuilder(
      column: $table.auditedEntityName,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get entityId => $composableBuilder(
      column: $table.entityId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get metadata => $composableBuilder(
      column: $table.metadata, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));
}

class $$AuditLogsDriftTableOrderingComposer
    extends Composer<_$AppDatabase, $AuditLogsDriftTable> {
  $$AuditLogsDriftTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get actorUserId => $composableBuilder(
      column: $table.actorUserId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get action => $composableBuilder(
      column: $table.action, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get auditedEntityName => $composableBuilder(
      column: $table.auditedEntityName,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get entityId => $composableBuilder(
      column: $table.entityId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get metadata => $composableBuilder(
      column: $table.metadata, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));
}

class $$AuditLogsDriftTableAnnotationComposer
    extends Composer<_$AppDatabase, $AuditLogsDriftTable> {
  $$AuditLogsDriftTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get actorUserId => $composableBuilder(
      column: $table.actorUserId, builder: (column) => column);

  GeneratedColumn<String> get action =>
      $composableBuilder(column: $table.action, builder: (column) => column);

  GeneratedColumn<String> get auditedEntityName => $composableBuilder(
      column: $table.auditedEntityName, builder: (column) => column);

  GeneratedColumn<String> get entityId =>
      $composableBuilder(column: $table.entityId, builder: (column) => column);

  GeneratedColumn<String> get metadata =>
      $composableBuilder(column: $table.metadata, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);
}

class $$AuditLogsDriftTableTableManager extends RootTableManager<
    _$AppDatabase,
    $AuditLogsDriftTable,
    AuditLogsDriftData,
    $$AuditLogsDriftTableFilterComposer,
    $$AuditLogsDriftTableOrderingComposer,
    $$AuditLogsDriftTableAnnotationComposer,
    $$AuditLogsDriftTableCreateCompanionBuilder,
    $$AuditLogsDriftTableUpdateCompanionBuilder,
    (
      AuditLogsDriftData,
      BaseReferences<_$AppDatabase, $AuditLogsDriftTable, AuditLogsDriftData>
    ),
    AuditLogsDriftData,
    PrefetchHooks Function()> {
  $$AuditLogsDriftTableTableManager(
      _$AppDatabase db, $AuditLogsDriftTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$AuditLogsDriftTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$AuditLogsDriftTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$AuditLogsDriftTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String?> actorUserId = const Value.absent(),
            Value<String> action = const Value.absent(),
            Value<String> auditedEntityName = const Value.absent(),
            Value<String?> entityId = const Value.absent(),
            Value<String?> metadata = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              AuditLogsDriftCompanion(
            id: id,
            actorUserId: actorUserId,
            action: action,
            auditedEntityName: auditedEntityName,
            entityId: entityId,
            metadata: metadata,
            createdAt: createdAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            Value<String?> actorUserId = const Value.absent(),
            required String action,
            required String auditedEntityName,
            Value<String?> entityId = const Value.absent(),
            Value<String?> metadata = const Value.absent(),
            required DateTime createdAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              AuditLogsDriftCompanion.insert(
            id: id,
            actorUserId: actorUserId,
            action: action,
            auditedEntityName: auditedEntityName,
            entityId: entityId,
            metadata: metadata,
            createdAt: createdAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$AuditLogsDriftTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $AuditLogsDriftTable,
    AuditLogsDriftData,
    $$AuditLogsDriftTableFilterComposer,
    $$AuditLogsDriftTableOrderingComposer,
    $$AuditLogsDriftTableAnnotationComposer,
    $$AuditLogsDriftTableCreateCompanionBuilder,
    $$AuditLogsDriftTableUpdateCompanionBuilder,
    (
      AuditLogsDriftData,
      BaseReferences<_$AppDatabase, $AuditLogsDriftTable, AuditLogsDriftData>
    ),
    AuditLogsDriftData,
    PrefetchHooks Function()>;
typedef $$PlanDriftTableCreateCompanionBuilder = PlanDriftCompanion Function({
  required String id,
  required String name,
  Value<bool> active,
  Value<bool> delivery,
  Value<int?> color,
  Value<String?> createdById,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});
typedef $$PlanDriftTableUpdateCompanionBuilder = PlanDriftCompanion Function({
  Value<String> id,
  Value<String> name,
  Value<bool> active,
  Value<bool> delivery,
  Value<int?> color,
  Value<String?> createdById,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});

final class $$PlanDriftTableReferences
    extends BaseReferences<_$AppDatabase, $PlanDriftTable, PlanDriftData> {
  $$PlanDriftTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$RestaurantTableDriftTable,
      List<RestaurantTableDriftData>> _restaurantTableDriftRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.restaurantTableDrift,
          aliasName: 'plan_drift__id__restaurant_table_drift__plan_id');

  $$RestaurantTableDriftTableProcessedTableManager
      get restaurantTableDriftRefs {
    final manager =
        $$RestaurantTableDriftTableTableManager($_db, $_db.restaurantTableDrift)
            .filter((f) => f.planId.id.sqlEquals($_itemColumn<String>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_restaurantTableDriftRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$PlanDriftTableFilterComposer
    extends Composer<_$AppDatabase, $PlanDriftTable> {
  $$PlanDriftTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get active => $composableBuilder(
      column: $table.active, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get delivery => $composableBuilder(
      column: $table.delivery, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get color => $composableBuilder(
      column: $table.color, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get createdById => $composableBuilder(
      column: $table.createdById, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));

  Expression<bool> restaurantTableDriftRefs(
      Expression<bool> Function($$RestaurantTableDriftTableFilterComposer f)
          f) {
    final $$RestaurantTableDriftTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.restaurantTableDrift,
        getReferencedColumn: (t) => t.planId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$RestaurantTableDriftTableFilterComposer(
              $db: $db,
              $table: $db.restaurantTableDrift,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$PlanDriftTableOrderingComposer
    extends Composer<_$AppDatabase, $PlanDriftTable> {
  $$PlanDriftTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get active => $composableBuilder(
      column: $table.active, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get delivery => $composableBuilder(
      column: $table.delivery, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get color => $composableBuilder(
      column: $table.color, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get createdById => $composableBuilder(
      column: $table.createdById, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));
}

class $$PlanDriftTableAnnotationComposer
    extends Composer<_$AppDatabase, $PlanDriftTable> {
  $$PlanDriftTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<bool> get active =>
      $composableBuilder(column: $table.active, builder: (column) => column);

  GeneratedColumn<bool> get delivery =>
      $composableBuilder(column: $table.delivery, builder: (column) => column);

  GeneratedColumn<int> get color =>
      $composableBuilder(column: $table.color, builder: (column) => column);

  GeneratedColumn<String> get createdById => $composableBuilder(
      column: $table.createdById, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  Expression<T> restaurantTableDriftRefs<T extends Object>(
      Expression<T> Function($$RestaurantTableDriftTableAnnotationComposer a)
          f) {
    final $$RestaurantTableDriftTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.id,
            referencedTable: $db.restaurantTableDrift,
            getReferencedColumn: (t) => t.planId,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$RestaurantTableDriftTableAnnotationComposer(
                  $db: $db,
                  $table: $db.restaurantTableDrift,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return f(composer);
  }
}

class $$PlanDriftTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PlanDriftTable,
    PlanDriftData,
    $$PlanDriftTableFilterComposer,
    $$PlanDriftTableOrderingComposer,
    $$PlanDriftTableAnnotationComposer,
    $$PlanDriftTableCreateCompanionBuilder,
    $$PlanDriftTableUpdateCompanionBuilder,
    (PlanDriftData, $$PlanDriftTableReferences),
    PlanDriftData,
    PrefetchHooks Function({bool restaurantTableDriftRefs})> {
  $$PlanDriftTableTableManager(_$AppDatabase db, $PlanDriftTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PlanDriftTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PlanDriftTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PlanDriftTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<bool> active = const Value.absent(),
            Value<bool> delivery = const Value.absent(),
            Value<int?> color = const Value.absent(),
            Value<String?> createdById = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              PlanDriftCompanion(
            id: id,
            name: name,
            active: active,
            delivery: delivery,
            color: color,
            createdById: createdById,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            Value<bool> active = const Value.absent(),
            Value<bool> delivery = const Value.absent(),
            Value<int?> color = const Value.absent(),
            Value<String?> createdById = const Value.absent(),
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              PlanDriftCompanion.insert(
            id: id,
            name: name,
            active: active,
            delivery: delivery,
            color: color,
            createdById: createdById,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$PlanDriftTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({restaurantTableDriftRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (restaurantTableDriftRefs) db.restaurantTableDrift
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (restaurantTableDriftRefs)
                    await $_getPrefetchedData<PlanDriftData, $PlanDriftTable,
                            RestaurantTableDriftData>(
                        currentTable: table,
                        referencedTable: $$PlanDriftTableReferences
                            ._restaurantTableDriftRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$PlanDriftTableReferences(db, table, p0)
                                .restaurantTableDriftRefs,
                        referencedItemsForCurrentItem: (item,
                                referencedItems) =>
                            referencedItems.where((e) => e.planId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$PlanDriftTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $PlanDriftTable,
    PlanDriftData,
    $$PlanDriftTableFilterComposer,
    $$PlanDriftTableOrderingComposer,
    $$PlanDriftTableAnnotationComposer,
    $$PlanDriftTableCreateCompanionBuilder,
    $$PlanDriftTableUpdateCompanionBuilder,
    (PlanDriftData, $$PlanDriftTableReferences),
    PlanDriftData,
    PrefetchHooks Function({bool restaurantTableDriftRefs})>;
typedef $$RestaurantTableDriftTableCreateCompanionBuilder
    = RestaurantTableDriftCompanion Function({
  required String id,
  required String name,
  Value<String> status,
  Value<String> shape,
  required double x,
  required double y,
  Value<double> rotation,
  Value<int> width,
  Value<int> height,
  Value<int?> color,
  Value<int> seats,
  Value<String?> planId,
  Value<bool> isActive,
  Value<String?> createdById,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});
typedef $$RestaurantTableDriftTableUpdateCompanionBuilder
    = RestaurantTableDriftCompanion Function({
  Value<String> id,
  Value<String> name,
  Value<String> status,
  Value<String> shape,
  Value<double> x,
  Value<double> y,
  Value<double> rotation,
  Value<int> width,
  Value<int> height,
  Value<int?> color,
  Value<int> seats,
  Value<String?> planId,
  Value<bool> isActive,
  Value<String?> createdById,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});

final class $$RestaurantTableDriftTableReferences extends BaseReferences<
    _$AppDatabase, $RestaurantTableDriftTable, RestaurantTableDriftData> {
  $$RestaurantTableDriftTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $PlanDriftTable _planIdTable(_$AppDatabase db) => db.planDrift
      .createAlias('restaurant_table_drift__plan_id__plan_drift__id');

  $$PlanDriftTableProcessedTableManager? get planId {
    final $_column = $_itemColumn<String>('plan_id');
    if ($_column == null) return null;
    final manager = $$PlanDriftTableTableManager($_db, $_db.planDrift)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_planIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$RestaurantTableDriftTableFilterComposer
    extends Composer<_$AppDatabase, $RestaurantTableDriftTable> {
  $$RestaurantTableDriftTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get shape => $composableBuilder(
      column: $table.shape, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get x => $composableBuilder(
      column: $table.x, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get y => $composableBuilder(
      column: $table.y, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get rotation => $composableBuilder(
      column: $table.rotation, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get width => $composableBuilder(
      column: $table.width, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get height => $composableBuilder(
      column: $table.height, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get color => $composableBuilder(
      column: $table.color, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get seats => $composableBuilder(
      column: $table.seats, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get createdById => $composableBuilder(
      column: $table.createdById, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));

  $$PlanDriftTableFilterComposer get planId {
    final $$PlanDriftTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.planId,
        referencedTable: $db.planDrift,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PlanDriftTableFilterComposer(
              $db: $db,
              $table: $db.planDrift,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$RestaurantTableDriftTableOrderingComposer
    extends Composer<_$AppDatabase, $RestaurantTableDriftTable> {
  $$RestaurantTableDriftTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get shape => $composableBuilder(
      column: $table.shape, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get x => $composableBuilder(
      column: $table.x, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get y => $composableBuilder(
      column: $table.y, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get rotation => $composableBuilder(
      column: $table.rotation, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get width => $composableBuilder(
      column: $table.width, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get height => $composableBuilder(
      column: $table.height, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get color => $composableBuilder(
      column: $table.color, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get seats => $composableBuilder(
      column: $table.seats, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get createdById => $composableBuilder(
      column: $table.createdById, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));

  $$PlanDriftTableOrderingComposer get planId {
    final $$PlanDriftTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.planId,
        referencedTable: $db.planDrift,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PlanDriftTableOrderingComposer(
              $db: $db,
              $table: $db.planDrift,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$RestaurantTableDriftTableAnnotationComposer
    extends Composer<_$AppDatabase, $RestaurantTableDriftTable> {
  $$RestaurantTableDriftTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get shape =>
      $composableBuilder(column: $table.shape, builder: (column) => column);

  GeneratedColumn<double> get x =>
      $composableBuilder(column: $table.x, builder: (column) => column);

  GeneratedColumn<double> get y =>
      $composableBuilder(column: $table.y, builder: (column) => column);

  GeneratedColumn<double> get rotation =>
      $composableBuilder(column: $table.rotation, builder: (column) => column);

  GeneratedColumn<int> get width =>
      $composableBuilder(column: $table.width, builder: (column) => column);

  GeneratedColumn<int> get height =>
      $composableBuilder(column: $table.height, builder: (column) => column);

  GeneratedColumn<int> get color =>
      $composableBuilder(column: $table.color, builder: (column) => column);

  GeneratedColumn<int> get seats =>
      $composableBuilder(column: $table.seats, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<String> get createdById => $composableBuilder(
      column: $table.createdById, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  $$PlanDriftTableAnnotationComposer get planId {
    final $$PlanDriftTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.planId,
        referencedTable: $db.planDrift,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$PlanDriftTableAnnotationComposer(
              $db: $db,
              $table: $db.planDrift,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$RestaurantTableDriftTableTableManager extends RootTableManager<
    _$AppDatabase,
    $RestaurantTableDriftTable,
    RestaurantTableDriftData,
    $$RestaurantTableDriftTableFilterComposer,
    $$RestaurantTableDriftTableOrderingComposer,
    $$RestaurantTableDriftTableAnnotationComposer,
    $$RestaurantTableDriftTableCreateCompanionBuilder,
    $$RestaurantTableDriftTableUpdateCompanionBuilder,
    (RestaurantTableDriftData, $$RestaurantTableDriftTableReferences),
    RestaurantTableDriftData,
    PrefetchHooks Function({bool planId})> {
  $$RestaurantTableDriftTableTableManager(
      _$AppDatabase db, $RestaurantTableDriftTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$RestaurantTableDriftTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$RestaurantTableDriftTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$RestaurantTableDriftTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<String> shape = const Value.absent(),
            Value<double> x = const Value.absent(),
            Value<double> y = const Value.absent(),
            Value<double> rotation = const Value.absent(),
            Value<int> width = const Value.absent(),
            Value<int> height = const Value.absent(),
            Value<int?> color = const Value.absent(),
            Value<int> seats = const Value.absent(),
            Value<String?> planId = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            Value<String?> createdById = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              RestaurantTableDriftCompanion(
            id: id,
            name: name,
            status: status,
            shape: shape,
            x: x,
            y: y,
            rotation: rotation,
            width: width,
            height: height,
            color: color,
            seats: seats,
            planId: planId,
            isActive: isActive,
            createdById: createdById,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            Value<String> status = const Value.absent(),
            Value<String> shape = const Value.absent(),
            required double x,
            required double y,
            Value<double> rotation = const Value.absent(),
            Value<int> width = const Value.absent(),
            Value<int> height = const Value.absent(),
            Value<int?> color = const Value.absent(),
            Value<int> seats = const Value.absent(),
            Value<String?> planId = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            Value<String?> createdById = const Value.absent(),
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              RestaurantTableDriftCompanion.insert(
            id: id,
            name: name,
            status: status,
            shape: shape,
            x: x,
            y: y,
            rotation: rotation,
            width: width,
            height: height,
            color: color,
            seats: seats,
            planId: planId,
            isActive: isActive,
            createdById: createdById,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$RestaurantTableDriftTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({planId = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [],
              addJoins: <
                  T extends TableManagerState<
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic,
                      dynamic>>(state) {
                if (planId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.planId,
                    referencedTable:
                        $$RestaurantTableDriftTableReferences._planIdTable(db),
                    referencedColumn: $$RestaurantTableDriftTableReferences
                        ._planIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [];
              },
            );
          },
        ));
}

typedef $$RestaurantTableDriftTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $RestaurantTableDriftTable,
        RestaurantTableDriftData,
        $$RestaurantTableDriftTableFilterComposer,
        $$RestaurantTableDriftTableOrderingComposer,
        $$RestaurantTableDriftTableAnnotationComposer,
        $$RestaurantTableDriftTableCreateCompanionBuilder,
        $$RestaurantTableDriftTableUpdateCompanionBuilder,
        (RestaurantTableDriftData, $$RestaurantTableDriftTableReferences),
        RestaurantTableDriftData,
        PrefetchHooks Function({bool planId})>;
typedef $$DiscountsDriftTableCreateCompanionBuilder = DiscountsDriftCompanion
    Function({
  required String id,
  required String name,
  Value<String?> description,
  required String type,
  required String activation,
  Value<String?> code,
  required String scope,
  Value<String> productIds,
  Value<String> categoryIds,
  Value<int?> value,
  Value<int?> quantityTrigger,
  Value<int?> quantityReward,
  Value<String?> quantityRewardType,
  Value<int?> quantityRewardValue,
  Value<int?> quantityBundlePrice,
  Value<int?> minimumAmount,
  Value<int?> minimumQuantity,
  Value<int?> maximumDiscount,
  Value<int?> usageLimit,
  Value<int> usageCount,
  Value<DateTime?> firstUsedAt,
  Value<DateTime?> lastUsedAt,
  Value<DateTime?> startDate,
  Value<DateTime?> endDate,
  Value<String> daysOfWeek,
  Value<String?> startTime,
  Value<String?> endTime,
  Value<bool> combinable,
  Value<int> priority,
  Value<bool> isActive,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});
typedef $$DiscountsDriftTableUpdateCompanionBuilder = DiscountsDriftCompanion
    Function({
  Value<String> id,
  Value<String> name,
  Value<String?> description,
  Value<String> type,
  Value<String> activation,
  Value<String?> code,
  Value<String> scope,
  Value<String> productIds,
  Value<String> categoryIds,
  Value<int?> value,
  Value<int?> quantityTrigger,
  Value<int?> quantityReward,
  Value<String?> quantityRewardType,
  Value<int?> quantityRewardValue,
  Value<int?> quantityBundlePrice,
  Value<int?> minimumAmount,
  Value<int?> minimumQuantity,
  Value<int?> maximumDiscount,
  Value<int?> usageLimit,
  Value<int> usageCount,
  Value<DateTime?> firstUsedAt,
  Value<DateTime?> lastUsedAt,
  Value<DateTime?> startDate,
  Value<DateTime?> endDate,
  Value<String> daysOfWeek,
  Value<String?> startTime,
  Value<String?> endTime,
  Value<bool> combinable,
  Value<int> priority,
  Value<bool> isActive,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});

class $$DiscountsDriftTableFilterComposer
    extends Composer<_$AppDatabase, $DiscountsDriftTable> {
  $$DiscountsDriftTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get activation => $composableBuilder(
      column: $table.activation, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get code => $composableBuilder(
      column: $table.code, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get scope => $composableBuilder(
      column: $table.scope, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get productIds => $composableBuilder(
      column: $table.productIds, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get categoryIds => $composableBuilder(
      column: $table.categoryIds, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get value => $composableBuilder(
      column: $table.value, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get quantityTrigger => $composableBuilder(
      column: $table.quantityTrigger,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get quantityReward => $composableBuilder(
      column: $table.quantityReward,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get quantityRewardType => $composableBuilder(
      column: $table.quantityRewardType,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get quantityRewardValue => $composableBuilder(
      column: $table.quantityRewardValue,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get quantityBundlePrice => $composableBuilder(
      column: $table.quantityBundlePrice,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get minimumAmount => $composableBuilder(
      column: $table.minimumAmount, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get minimumQuantity => $composableBuilder(
      column: $table.minimumQuantity,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get maximumDiscount => $composableBuilder(
      column: $table.maximumDiscount,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get usageLimit => $composableBuilder(
      column: $table.usageLimit, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get usageCount => $composableBuilder(
      column: $table.usageCount, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get firstUsedAt => $composableBuilder(
      column: $table.firstUsedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get lastUsedAt => $composableBuilder(
      column: $table.lastUsedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get startDate => $composableBuilder(
      column: $table.startDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get endDate => $composableBuilder(
      column: $table.endDate, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get daysOfWeek => $composableBuilder(
      column: $table.daysOfWeek, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get startTime => $composableBuilder(
      column: $table.startTime, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get endTime => $composableBuilder(
      column: $table.endTime, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get combinable => $composableBuilder(
      column: $table.combinable, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get priority => $composableBuilder(
      column: $table.priority, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));
}

class $$DiscountsDriftTableOrderingComposer
    extends Composer<_$AppDatabase, $DiscountsDriftTable> {
  $$DiscountsDriftTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get activation => $composableBuilder(
      column: $table.activation, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get code => $composableBuilder(
      column: $table.code, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get scope => $composableBuilder(
      column: $table.scope, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get productIds => $composableBuilder(
      column: $table.productIds, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get categoryIds => $composableBuilder(
      column: $table.categoryIds, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get value => $composableBuilder(
      column: $table.value, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get quantityTrigger => $composableBuilder(
      column: $table.quantityTrigger,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get quantityReward => $composableBuilder(
      column: $table.quantityReward,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get quantityRewardType => $composableBuilder(
      column: $table.quantityRewardType,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get quantityRewardValue => $composableBuilder(
      column: $table.quantityRewardValue,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get quantityBundlePrice => $composableBuilder(
      column: $table.quantityBundlePrice,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get minimumAmount => $composableBuilder(
      column: $table.minimumAmount,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get minimumQuantity => $composableBuilder(
      column: $table.minimumQuantity,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get maximumDiscount => $composableBuilder(
      column: $table.maximumDiscount,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get usageLimit => $composableBuilder(
      column: $table.usageLimit, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get usageCount => $composableBuilder(
      column: $table.usageCount, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get firstUsedAt => $composableBuilder(
      column: $table.firstUsedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get lastUsedAt => $composableBuilder(
      column: $table.lastUsedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get startDate => $composableBuilder(
      column: $table.startDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get endDate => $composableBuilder(
      column: $table.endDate, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get daysOfWeek => $composableBuilder(
      column: $table.daysOfWeek, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get startTime => $composableBuilder(
      column: $table.startTime, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get endTime => $composableBuilder(
      column: $table.endTime, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get combinable => $composableBuilder(
      column: $table.combinable, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get priority => $composableBuilder(
      column: $table.priority, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));
}

class $$DiscountsDriftTableAnnotationComposer
    extends Composer<_$AppDatabase, $DiscountsDriftTable> {
  $$DiscountsDriftTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get activation => $composableBuilder(
      column: $table.activation, builder: (column) => column);

  GeneratedColumn<String> get code =>
      $composableBuilder(column: $table.code, builder: (column) => column);

  GeneratedColumn<String> get scope =>
      $composableBuilder(column: $table.scope, builder: (column) => column);

  GeneratedColumn<String> get productIds => $composableBuilder(
      column: $table.productIds, builder: (column) => column);

  GeneratedColumn<String> get categoryIds => $composableBuilder(
      column: $table.categoryIds, builder: (column) => column);

  GeneratedColumn<int> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);

  GeneratedColumn<int> get quantityTrigger => $composableBuilder(
      column: $table.quantityTrigger, builder: (column) => column);

  GeneratedColumn<int> get quantityReward => $composableBuilder(
      column: $table.quantityReward, builder: (column) => column);

  GeneratedColumn<String> get quantityRewardType => $composableBuilder(
      column: $table.quantityRewardType, builder: (column) => column);

  GeneratedColumn<int> get quantityRewardValue => $composableBuilder(
      column: $table.quantityRewardValue, builder: (column) => column);

  GeneratedColumn<int> get quantityBundlePrice => $composableBuilder(
      column: $table.quantityBundlePrice, builder: (column) => column);

  GeneratedColumn<int> get minimumAmount => $composableBuilder(
      column: $table.minimumAmount, builder: (column) => column);

  GeneratedColumn<int> get minimumQuantity => $composableBuilder(
      column: $table.minimumQuantity, builder: (column) => column);

  GeneratedColumn<int> get maximumDiscount => $composableBuilder(
      column: $table.maximumDiscount, builder: (column) => column);

  GeneratedColumn<int> get usageLimit => $composableBuilder(
      column: $table.usageLimit, builder: (column) => column);

  GeneratedColumn<int> get usageCount => $composableBuilder(
      column: $table.usageCount, builder: (column) => column);

  GeneratedColumn<DateTime> get firstUsedAt => $composableBuilder(
      column: $table.firstUsedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get lastUsedAt => $composableBuilder(
      column: $table.lastUsedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get startDate =>
      $composableBuilder(column: $table.startDate, builder: (column) => column);

  GeneratedColumn<DateTime> get endDate =>
      $composableBuilder(column: $table.endDate, builder: (column) => column);

  GeneratedColumn<String> get daysOfWeek => $composableBuilder(
      column: $table.daysOfWeek, builder: (column) => column);

  GeneratedColumn<String> get startTime =>
      $composableBuilder(column: $table.startTime, builder: (column) => column);

  GeneratedColumn<String> get endTime =>
      $composableBuilder(column: $table.endTime, builder: (column) => column);

  GeneratedColumn<bool> get combinable => $composableBuilder(
      column: $table.combinable, builder: (column) => column);

  GeneratedColumn<int> get priority =>
      $composableBuilder(column: $table.priority, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);
}

class $$DiscountsDriftTableTableManager extends RootTableManager<
    _$AppDatabase,
    $DiscountsDriftTable,
    DiscountsDriftData,
    $$DiscountsDriftTableFilterComposer,
    $$DiscountsDriftTableOrderingComposer,
    $$DiscountsDriftTableAnnotationComposer,
    $$DiscountsDriftTableCreateCompanionBuilder,
    $$DiscountsDriftTableUpdateCompanionBuilder,
    (
      DiscountsDriftData,
      BaseReferences<_$AppDatabase, $DiscountsDriftTable, DiscountsDriftData>
    ),
    DiscountsDriftData,
    PrefetchHooks Function()> {
  $$DiscountsDriftTableTableManager(
      _$AppDatabase db, $DiscountsDriftTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$DiscountsDriftTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$DiscountsDriftTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$DiscountsDriftTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<String> type = const Value.absent(),
            Value<String> activation = const Value.absent(),
            Value<String?> code = const Value.absent(),
            Value<String> scope = const Value.absent(),
            Value<String> productIds = const Value.absent(),
            Value<String> categoryIds = const Value.absent(),
            Value<int?> value = const Value.absent(),
            Value<int?> quantityTrigger = const Value.absent(),
            Value<int?> quantityReward = const Value.absent(),
            Value<String?> quantityRewardType = const Value.absent(),
            Value<int?> quantityRewardValue = const Value.absent(),
            Value<int?> quantityBundlePrice = const Value.absent(),
            Value<int?> minimumAmount = const Value.absent(),
            Value<int?> minimumQuantity = const Value.absent(),
            Value<int?> maximumDiscount = const Value.absent(),
            Value<int?> usageLimit = const Value.absent(),
            Value<int> usageCount = const Value.absent(),
            Value<DateTime?> firstUsedAt = const Value.absent(),
            Value<DateTime?> lastUsedAt = const Value.absent(),
            Value<DateTime?> startDate = const Value.absent(),
            Value<DateTime?> endDate = const Value.absent(),
            Value<String> daysOfWeek = const Value.absent(),
            Value<String?> startTime = const Value.absent(),
            Value<String?> endTime = const Value.absent(),
            Value<bool> combinable = const Value.absent(),
            Value<int> priority = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DiscountsDriftCompanion(
            id: id,
            name: name,
            description: description,
            type: type,
            activation: activation,
            code: code,
            scope: scope,
            productIds: productIds,
            categoryIds: categoryIds,
            value: value,
            quantityTrigger: quantityTrigger,
            quantityReward: quantityReward,
            quantityRewardType: quantityRewardType,
            quantityRewardValue: quantityRewardValue,
            quantityBundlePrice: quantityBundlePrice,
            minimumAmount: minimumAmount,
            minimumQuantity: minimumQuantity,
            maximumDiscount: maximumDiscount,
            usageLimit: usageLimit,
            usageCount: usageCount,
            firstUsedAt: firstUsedAt,
            lastUsedAt: lastUsedAt,
            startDate: startDate,
            endDate: endDate,
            daysOfWeek: daysOfWeek,
            startTime: startTime,
            endTime: endTime,
            combinable: combinable,
            priority: priority,
            isActive: isActive,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String name,
            Value<String?> description = const Value.absent(),
            required String type,
            required String activation,
            Value<String?> code = const Value.absent(),
            required String scope,
            Value<String> productIds = const Value.absent(),
            Value<String> categoryIds = const Value.absent(),
            Value<int?> value = const Value.absent(),
            Value<int?> quantityTrigger = const Value.absent(),
            Value<int?> quantityReward = const Value.absent(),
            Value<String?> quantityRewardType = const Value.absent(),
            Value<int?> quantityRewardValue = const Value.absent(),
            Value<int?> quantityBundlePrice = const Value.absent(),
            Value<int?> minimumAmount = const Value.absent(),
            Value<int?> minimumQuantity = const Value.absent(),
            Value<int?> maximumDiscount = const Value.absent(),
            Value<int?> usageLimit = const Value.absent(),
            Value<int> usageCount = const Value.absent(),
            Value<DateTime?> firstUsedAt = const Value.absent(),
            Value<DateTime?> lastUsedAt = const Value.absent(),
            Value<DateTime?> startDate = const Value.absent(),
            Value<DateTime?> endDate = const Value.absent(),
            Value<String> daysOfWeek = const Value.absent(),
            Value<String?> startTime = const Value.absent(),
            Value<String?> endTime = const Value.absent(),
            Value<bool> combinable = const Value.absent(),
            Value<int> priority = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DiscountsDriftCompanion.insert(
            id: id,
            name: name,
            description: description,
            type: type,
            activation: activation,
            code: code,
            scope: scope,
            productIds: productIds,
            categoryIds: categoryIds,
            value: value,
            quantityTrigger: quantityTrigger,
            quantityReward: quantityReward,
            quantityRewardType: quantityRewardType,
            quantityRewardValue: quantityRewardValue,
            quantityBundlePrice: quantityBundlePrice,
            minimumAmount: minimumAmount,
            minimumQuantity: minimumQuantity,
            maximumDiscount: maximumDiscount,
            usageLimit: usageLimit,
            usageCount: usageCount,
            firstUsedAt: firstUsedAt,
            lastUsedAt: lastUsedAt,
            startDate: startDate,
            endDate: endDate,
            daysOfWeek: daysOfWeek,
            startTime: startTime,
            endTime: endTime,
            combinable: combinable,
            priority: priority,
            isActive: isActive,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$DiscountsDriftTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $DiscountsDriftTable,
    DiscountsDriftData,
    $$DiscountsDriftTableFilterComposer,
    $$DiscountsDriftTableOrderingComposer,
    $$DiscountsDriftTableAnnotationComposer,
    $$DiscountsDriftTableCreateCompanionBuilder,
    $$DiscountsDriftTableUpdateCompanionBuilder,
    (
      DiscountsDriftData,
      BaseReferences<_$AppDatabase, $DiscountsDriftTable, DiscountsDriftData>
    ),
    DiscountsDriftData,
    PrefetchHooks Function()>;
typedef $$OrderDriftTableCreateCompanionBuilder = OrderDriftCompanion Function({
  required String id,
  required String tableId,
  required String groupId,
  Value<String?> paymentId,
  Value<DateTime?> validatedAt,
  Value<String> status,
  Value<String?> createdById,
  Value<DateTime?> deletedAt,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<int> rowid,
});
typedef $$OrderDriftTableUpdateCompanionBuilder = OrderDriftCompanion Function({
  Value<String> id,
  Value<String> tableId,
  Value<String> groupId,
  Value<String?> paymentId,
  Value<DateTime?> validatedAt,
  Value<String> status,
  Value<String?> createdById,
  Value<DateTime?> deletedAt,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});

class $$OrderDriftTableFilterComposer
    extends Composer<_$AppDatabase, $OrderDriftTable> {
  $$OrderDriftTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get tableId => $composableBuilder(
      column: $table.tableId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get groupId => $composableBuilder(
      column: $table.groupId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get paymentId => $composableBuilder(
      column: $table.paymentId, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get validatedAt => $composableBuilder(
      column: $table.validatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get createdById => $composableBuilder(
      column: $table.createdById, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$OrderDriftTableOrderingComposer
    extends Composer<_$AppDatabase, $OrderDriftTable> {
  $$OrderDriftTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get tableId => $composableBuilder(
      column: $table.tableId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get groupId => $composableBuilder(
      column: $table.groupId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get paymentId => $composableBuilder(
      column: $table.paymentId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get validatedAt => $composableBuilder(
      column: $table.validatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get createdById => $composableBuilder(
      column: $table.createdById, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$OrderDriftTableAnnotationComposer
    extends Composer<_$AppDatabase, $OrderDriftTable> {
  $$OrderDriftTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get tableId =>
      $composableBuilder(column: $table.tableId, builder: (column) => column);

  GeneratedColumn<String> get groupId =>
      $composableBuilder(column: $table.groupId, builder: (column) => column);

  GeneratedColumn<String> get paymentId =>
      $composableBuilder(column: $table.paymentId, builder: (column) => column);

  GeneratedColumn<DateTime> get validatedAt => $composableBuilder(
      column: $table.validatedAt, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get createdById => $composableBuilder(
      column: $table.createdById, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$OrderDriftTableTableManager extends RootTableManager<
    _$AppDatabase,
    $OrderDriftTable,
    OrderDriftData,
    $$OrderDriftTableFilterComposer,
    $$OrderDriftTableOrderingComposer,
    $$OrderDriftTableAnnotationComposer,
    $$OrderDriftTableCreateCompanionBuilder,
    $$OrderDriftTableUpdateCompanionBuilder,
    (
      OrderDriftData,
      BaseReferences<_$AppDatabase, $OrderDriftTable, OrderDriftData>
    ),
    OrderDriftData,
    PrefetchHooks Function()> {
  $$OrderDriftTableTableManager(_$AppDatabase db, $OrderDriftTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$OrderDriftTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$OrderDriftTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$OrderDriftTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> tableId = const Value.absent(),
            Value<String> groupId = const Value.absent(),
            Value<String?> paymentId = const Value.absent(),
            Value<DateTime?> validatedAt = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<String?> createdById = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              OrderDriftCompanion(
            id: id,
            tableId: tableId,
            groupId: groupId,
            paymentId: paymentId,
            validatedAt: validatedAt,
            status: status,
            createdById: createdById,
            deletedAt: deletedAt,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String tableId,
            required String groupId,
            Value<String?> paymentId = const Value.absent(),
            Value<DateTime?> validatedAt = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<String?> createdById = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              OrderDriftCompanion.insert(
            id: id,
            tableId: tableId,
            groupId: groupId,
            paymentId: paymentId,
            validatedAt: validatedAt,
            status: status,
            createdById: createdById,
            deletedAt: deletedAt,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$OrderDriftTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $OrderDriftTable,
    OrderDriftData,
    $$OrderDriftTableFilterComposer,
    $$OrderDriftTableOrderingComposer,
    $$OrderDriftTableAnnotationComposer,
    $$OrderDriftTableCreateCompanionBuilder,
    $$OrderDriftTableUpdateCompanionBuilder,
    (
      OrderDriftData,
      BaseReferences<_$AppDatabase, $OrderDriftTable, OrderDriftData>
    ),
    OrderDriftData,
    PrefetchHooks Function()>;
typedef $$OrderItemDriftTableCreateCompanionBuilder = OrderItemDriftCompanion
    Function({
  required String id,
  Value<String?> comment,
  required String orderId,
  Value<String?> productId,
  required String productName,
  required int quantity,
  Value<int> unitPrice,
  Value<double> vat,
  Value<DateTime?> validatedAt,
  Value<String> status,
  Value<String?> createdById,
  Value<DateTime?> deletedAt,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<int> rowid,
});
typedef $$OrderItemDriftTableUpdateCompanionBuilder = OrderItemDriftCompanion
    Function({
  Value<String> id,
  Value<String?> comment,
  Value<String> orderId,
  Value<String?> productId,
  Value<String> productName,
  Value<int> quantity,
  Value<int> unitPrice,
  Value<double> vat,
  Value<DateTime?> validatedAt,
  Value<String> status,
  Value<String?> createdById,
  Value<DateTime?> deletedAt,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});

class $$OrderItemDriftTableFilterComposer
    extends Composer<_$AppDatabase, $OrderItemDriftTable> {
  $$OrderItemDriftTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get comment => $composableBuilder(
      column: $table.comment, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get orderId => $composableBuilder(
      column: $table.orderId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get productId => $composableBuilder(
      column: $table.productId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get productName => $composableBuilder(
      column: $table.productName, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get unitPrice => $composableBuilder(
      column: $table.unitPrice, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get vat => $composableBuilder(
      column: $table.vat, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get validatedAt => $composableBuilder(
      column: $table.validatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get createdById => $composableBuilder(
      column: $table.createdById, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$OrderItemDriftTableOrderingComposer
    extends Composer<_$AppDatabase, $OrderItemDriftTable> {
  $$OrderItemDriftTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get comment => $composableBuilder(
      column: $table.comment, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get orderId => $composableBuilder(
      column: $table.orderId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get productId => $composableBuilder(
      column: $table.productId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get productName => $composableBuilder(
      column: $table.productName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get unitPrice => $composableBuilder(
      column: $table.unitPrice, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get vat => $composableBuilder(
      column: $table.vat, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get validatedAt => $composableBuilder(
      column: $table.validatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get status => $composableBuilder(
      column: $table.status, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get createdById => $composableBuilder(
      column: $table.createdById, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$OrderItemDriftTableAnnotationComposer
    extends Composer<_$AppDatabase, $OrderItemDriftTable> {
  $$OrderItemDriftTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get comment =>
      $composableBuilder(column: $table.comment, builder: (column) => column);

  GeneratedColumn<String> get orderId =>
      $composableBuilder(column: $table.orderId, builder: (column) => column);

  GeneratedColumn<String> get productId =>
      $composableBuilder(column: $table.productId, builder: (column) => column);

  GeneratedColumn<String> get productName => $composableBuilder(
      column: $table.productName, builder: (column) => column);

  GeneratedColumn<int> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<int> get unitPrice =>
      $composableBuilder(column: $table.unitPrice, builder: (column) => column);

  GeneratedColumn<double> get vat =>
      $composableBuilder(column: $table.vat, builder: (column) => column);

  GeneratedColumn<DateTime> get validatedAt => $composableBuilder(
      column: $table.validatedAt, builder: (column) => column);

  GeneratedColumn<String> get status =>
      $composableBuilder(column: $table.status, builder: (column) => column);

  GeneratedColumn<String> get createdById => $composableBuilder(
      column: $table.createdById, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$OrderItemDriftTableTableManager extends RootTableManager<
    _$AppDatabase,
    $OrderItemDriftTable,
    OrderItemDriftData,
    $$OrderItemDriftTableFilterComposer,
    $$OrderItemDriftTableOrderingComposer,
    $$OrderItemDriftTableAnnotationComposer,
    $$OrderItemDriftTableCreateCompanionBuilder,
    $$OrderItemDriftTableUpdateCompanionBuilder,
    (
      OrderItemDriftData,
      BaseReferences<_$AppDatabase, $OrderItemDriftTable, OrderItemDriftData>
    ),
    OrderItemDriftData,
    PrefetchHooks Function()> {
  $$OrderItemDriftTableTableManager(
      _$AppDatabase db, $OrderItemDriftTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$OrderItemDriftTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$OrderItemDriftTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$OrderItemDriftTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String?> comment = const Value.absent(),
            Value<String> orderId = const Value.absent(),
            Value<String?> productId = const Value.absent(),
            Value<String> productName = const Value.absent(),
            Value<int> quantity = const Value.absent(),
            Value<int> unitPrice = const Value.absent(),
            Value<double> vat = const Value.absent(),
            Value<DateTime?> validatedAt = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<String?> createdById = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              OrderItemDriftCompanion(
            id: id,
            comment: comment,
            orderId: orderId,
            productId: productId,
            productName: productName,
            quantity: quantity,
            unitPrice: unitPrice,
            vat: vat,
            validatedAt: validatedAt,
            status: status,
            createdById: createdById,
            deletedAt: deletedAt,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            Value<String?> comment = const Value.absent(),
            required String orderId,
            Value<String?> productId = const Value.absent(),
            required String productName,
            required int quantity,
            Value<int> unitPrice = const Value.absent(),
            Value<double> vat = const Value.absent(),
            Value<DateTime?> validatedAt = const Value.absent(),
            Value<String> status = const Value.absent(),
            Value<String?> createdById = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              OrderItemDriftCompanion.insert(
            id: id,
            comment: comment,
            orderId: orderId,
            productId: productId,
            productName: productName,
            quantity: quantity,
            unitPrice: unitPrice,
            vat: vat,
            validatedAt: validatedAt,
            status: status,
            createdById: createdById,
            deletedAt: deletedAt,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$OrderItemDriftTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $OrderItemDriftTable,
    OrderItemDriftData,
    $$OrderItemDriftTableFilterComposer,
    $$OrderItemDriftTableOrderingComposer,
    $$OrderItemDriftTableAnnotationComposer,
    $$OrderItemDriftTableCreateCompanionBuilder,
    $$OrderItemDriftTableUpdateCompanionBuilder,
    (
      OrderItemDriftData,
      BaseReferences<_$AppDatabase, $OrderItemDriftTable, OrderItemDriftData>
    ),
    OrderItemDriftData,
    PrefetchHooks Function()>;
typedef $$OrderItemOptionsDriftTableCreateCompanionBuilder
    = OrderItemOptionsDriftCompanion Function({
  required String id,
  required String orderItemId,
  Value<String?> optionId,
  required int quantity,
  Value<int> unitPrice,
  Value<double> vat,
  required String optionName,
  Value<String?> createdById,
  Value<DateTime?> deletedAt,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<int> rowid,
});
typedef $$OrderItemOptionsDriftTableUpdateCompanionBuilder
    = OrderItemOptionsDriftCompanion Function({
  Value<String> id,
  Value<String> orderItemId,
  Value<String?> optionId,
  Value<int> quantity,
  Value<int> unitPrice,
  Value<double> vat,
  Value<String> optionName,
  Value<String?> createdById,
  Value<DateTime?> deletedAt,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});

class $$OrderItemOptionsDriftTableFilterComposer
    extends Composer<_$AppDatabase, $OrderItemOptionsDriftTable> {
  $$OrderItemOptionsDriftTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get orderItemId => $composableBuilder(
      column: $table.orderItemId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get optionId => $composableBuilder(
      column: $table.optionId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get unitPrice => $composableBuilder(
      column: $table.unitPrice, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get vat => $composableBuilder(
      column: $table.vat, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get optionName => $composableBuilder(
      column: $table.optionName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get createdById => $composableBuilder(
      column: $table.createdById, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$OrderItemOptionsDriftTableOrderingComposer
    extends Composer<_$AppDatabase, $OrderItemOptionsDriftTable> {
  $$OrderItemOptionsDriftTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get orderItemId => $composableBuilder(
      column: $table.orderItemId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get optionId => $composableBuilder(
      column: $table.optionId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get quantity => $composableBuilder(
      column: $table.quantity, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get unitPrice => $composableBuilder(
      column: $table.unitPrice, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get vat => $composableBuilder(
      column: $table.vat, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get optionName => $composableBuilder(
      column: $table.optionName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get createdById => $composableBuilder(
      column: $table.createdById, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$OrderItemOptionsDriftTableAnnotationComposer
    extends Composer<_$AppDatabase, $OrderItemOptionsDriftTable> {
  $$OrderItemOptionsDriftTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get orderItemId => $composableBuilder(
      column: $table.orderItemId, builder: (column) => column);

  GeneratedColumn<String> get optionId =>
      $composableBuilder(column: $table.optionId, builder: (column) => column);

  GeneratedColumn<int> get quantity =>
      $composableBuilder(column: $table.quantity, builder: (column) => column);

  GeneratedColumn<int> get unitPrice =>
      $composableBuilder(column: $table.unitPrice, builder: (column) => column);

  GeneratedColumn<double> get vat =>
      $composableBuilder(column: $table.vat, builder: (column) => column);

  GeneratedColumn<String> get optionName => $composableBuilder(
      column: $table.optionName, builder: (column) => column);

  GeneratedColumn<String> get createdById => $composableBuilder(
      column: $table.createdById, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$OrderItemOptionsDriftTableTableManager extends RootTableManager<
    _$AppDatabase,
    $OrderItemOptionsDriftTable,
    OrderItemOptionsDriftData,
    $$OrderItemOptionsDriftTableFilterComposer,
    $$OrderItemOptionsDriftTableOrderingComposer,
    $$OrderItemOptionsDriftTableAnnotationComposer,
    $$OrderItemOptionsDriftTableCreateCompanionBuilder,
    $$OrderItemOptionsDriftTableUpdateCompanionBuilder,
    (
      OrderItemOptionsDriftData,
      BaseReferences<_$AppDatabase, $OrderItemOptionsDriftTable,
          OrderItemOptionsDriftData>
    ),
    OrderItemOptionsDriftData,
    PrefetchHooks Function()> {
  $$OrderItemOptionsDriftTableTableManager(
      _$AppDatabase db, $OrderItemOptionsDriftTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$OrderItemOptionsDriftTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$OrderItemOptionsDriftTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$OrderItemOptionsDriftTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> orderItemId = const Value.absent(),
            Value<String?> optionId = const Value.absent(),
            Value<int> quantity = const Value.absent(),
            Value<int> unitPrice = const Value.absent(),
            Value<double> vat = const Value.absent(),
            Value<String> optionName = const Value.absent(),
            Value<String?> createdById = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              OrderItemOptionsDriftCompanion(
            id: id,
            orderItemId: orderItemId,
            optionId: optionId,
            quantity: quantity,
            unitPrice: unitPrice,
            vat: vat,
            optionName: optionName,
            createdById: createdById,
            deletedAt: deletedAt,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String orderItemId,
            Value<String?> optionId = const Value.absent(),
            required int quantity,
            Value<int> unitPrice = const Value.absent(),
            Value<double> vat = const Value.absent(),
            required String optionName,
            Value<String?> createdById = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              OrderItemOptionsDriftCompanion.insert(
            id: id,
            orderItemId: orderItemId,
            optionId: optionId,
            quantity: quantity,
            unitPrice: unitPrice,
            vat: vat,
            optionName: optionName,
            createdById: createdById,
            deletedAt: deletedAt,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$OrderItemOptionsDriftTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $OrderItemOptionsDriftTable,
        OrderItemOptionsDriftData,
        $$OrderItemOptionsDriftTableFilterComposer,
        $$OrderItemOptionsDriftTableOrderingComposer,
        $$OrderItemOptionsDriftTableAnnotationComposer,
        $$OrderItemOptionsDriftTableCreateCompanionBuilder,
        $$OrderItemOptionsDriftTableUpdateCompanionBuilder,
        (
          OrderItemOptionsDriftData,
          BaseReferences<_$AppDatabase, $OrderItemOptionsDriftTable,
              OrderItemOptionsDriftData>
        ),
        OrderItemOptionsDriftData,
        PrefetchHooks Function()>;
typedef $$PaymentSessionDriftTableCreateCompanionBuilder
    = PaymentSessionDriftCompanion Function({
  required String id,
  required String orderId,
  required int partCounts,
  Value<String> mode,
  Value<String?> createdById,
  Value<DateTime?> deletedAt,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<int> rowid,
});
typedef $$PaymentSessionDriftTableUpdateCompanionBuilder
    = PaymentSessionDriftCompanion Function({
  Value<String> id,
  Value<String> orderId,
  Value<int> partCounts,
  Value<String> mode,
  Value<String?> createdById,
  Value<DateTime?> deletedAt,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});

class $$PaymentSessionDriftTableFilterComposer
    extends Composer<_$AppDatabase, $PaymentSessionDriftTable> {
  $$PaymentSessionDriftTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get orderId => $composableBuilder(
      column: $table.orderId, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get partCounts => $composableBuilder(
      column: $table.partCounts, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get mode => $composableBuilder(
      column: $table.mode, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get createdById => $composableBuilder(
      column: $table.createdById, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$PaymentSessionDriftTableOrderingComposer
    extends Composer<_$AppDatabase, $PaymentSessionDriftTable> {
  $$PaymentSessionDriftTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get orderId => $composableBuilder(
      column: $table.orderId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get partCounts => $composableBuilder(
      column: $table.partCounts, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get mode => $composableBuilder(
      column: $table.mode, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get createdById => $composableBuilder(
      column: $table.createdById, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$PaymentSessionDriftTableAnnotationComposer
    extends Composer<_$AppDatabase, $PaymentSessionDriftTable> {
  $$PaymentSessionDriftTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get orderId =>
      $composableBuilder(column: $table.orderId, builder: (column) => column);

  GeneratedColumn<int> get partCounts => $composableBuilder(
      column: $table.partCounts, builder: (column) => column);

  GeneratedColumn<String> get mode =>
      $composableBuilder(column: $table.mode, builder: (column) => column);

  GeneratedColumn<String> get createdById => $composableBuilder(
      column: $table.createdById, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$PaymentSessionDriftTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PaymentSessionDriftTable,
    PaymentSessionDriftData,
    $$PaymentSessionDriftTableFilterComposer,
    $$PaymentSessionDriftTableOrderingComposer,
    $$PaymentSessionDriftTableAnnotationComposer,
    $$PaymentSessionDriftTableCreateCompanionBuilder,
    $$PaymentSessionDriftTableUpdateCompanionBuilder,
    (
      PaymentSessionDriftData,
      BaseReferences<_$AppDatabase, $PaymentSessionDriftTable,
          PaymentSessionDriftData>
    ),
    PaymentSessionDriftData,
    PrefetchHooks Function()> {
  $$PaymentSessionDriftTableTableManager(
      _$AppDatabase db, $PaymentSessionDriftTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PaymentSessionDriftTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$PaymentSessionDriftTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PaymentSessionDriftTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> orderId = const Value.absent(),
            Value<int> partCounts = const Value.absent(),
            Value<String> mode = const Value.absent(),
            Value<String?> createdById = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              PaymentSessionDriftCompanion(
            id: id,
            orderId: orderId,
            partCounts: partCounts,
            mode: mode,
            createdById: createdById,
            deletedAt: deletedAt,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String orderId,
            required int partCounts,
            Value<String> mode = const Value.absent(),
            Value<String?> createdById = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              PaymentSessionDriftCompanion.insert(
            id: id,
            orderId: orderId,
            partCounts: partCounts,
            mode: mode,
            createdById: createdById,
            deletedAt: deletedAt,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$PaymentSessionDriftTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $PaymentSessionDriftTable,
    PaymentSessionDriftData,
    $$PaymentSessionDriftTableFilterComposer,
    $$PaymentSessionDriftTableOrderingComposer,
    $$PaymentSessionDriftTableAnnotationComposer,
    $$PaymentSessionDriftTableCreateCompanionBuilder,
    $$PaymentSessionDriftTableUpdateCompanionBuilder,
    (
      PaymentSessionDriftData,
      BaseReferences<_$AppDatabase, $PaymentSessionDriftTable,
          PaymentSessionDriftData>
    ),
    PaymentSessionDriftData,
    PrefetchHooks Function()>;
typedef $$PaymentTransactionDriftTableCreateCompanionBuilder
    = PaymentTransactionDriftCompanion Function({
  required String id,
  required String sessionId,
  Value<String?> discountId,
  Value<String> paymentMethod,
  Value<int> amountDue,
  Value<int> amountReceived,
  Value<int> paidPartCount,
  required Map<String, int> paidArticlesQty,
  Value<DateTime?> validatedAt,
  Value<String?> createdById,
  Value<DateTime?> deletedAt,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<int> rowid,
});
typedef $$PaymentTransactionDriftTableUpdateCompanionBuilder
    = PaymentTransactionDriftCompanion Function({
  Value<String> id,
  Value<String> sessionId,
  Value<String?> discountId,
  Value<String> paymentMethod,
  Value<int> amountDue,
  Value<int> amountReceived,
  Value<int> paidPartCount,
  Value<Map<String, int>> paidArticlesQty,
  Value<DateTime?> validatedAt,
  Value<String?> createdById,
  Value<DateTime?> deletedAt,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<int> rowid,
});

class $$PaymentTransactionDriftTableFilterComposer
    extends Composer<_$AppDatabase, $PaymentTransactionDriftTable> {
  $$PaymentTransactionDriftTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get sessionId => $composableBuilder(
      column: $table.sessionId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get discountId => $composableBuilder(
      column: $table.discountId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get paymentMethod => $composableBuilder(
      column: $table.paymentMethod, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get amountDue => $composableBuilder(
      column: $table.amountDue, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get amountReceived => $composableBuilder(
      column: $table.amountReceived,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get paidPartCount => $composableBuilder(
      column: $table.paidPartCount, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<Map<String, int>, Map<String, int>, String>
      get paidArticlesQty => $composableBuilder(
          column: $table.paidArticlesQty,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<DateTime> get validatedAt => $composableBuilder(
      column: $table.validatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get createdById => $composableBuilder(
      column: $table.createdById, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));
}

class $$PaymentTransactionDriftTableOrderingComposer
    extends Composer<_$AppDatabase, $PaymentTransactionDriftTable> {
  $$PaymentTransactionDriftTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sessionId => $composableBuilder(
      column: $table.sessionId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get discountId => $composableBuilder(
      column: $table.discountId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get paymentMethod => $composableBuilder(
      column: $table.paymentMethod,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get amountDue => $composableBuilder(
      column: $table.amountDue, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get amountReceived => $composableBuilder(
      column: $table.amountReceived,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get paidPartCount => $composableBuilder(
      column: $table.paidPartCount,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get paidArticlesQty => $composableBuilder(
      column: $table.paidArticlesQty,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get validatedAt => $composableBuilder(
      column: $table.validatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get createdById => $composableBuilder(
      column: $table.createdById, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$PaymentTransactionDriftTableAnnotationComposer
    extends Composer<_$AppDatabase, $PaymentTransactionDriftTable> {
  $$PaymentTransactionDriftTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get sessionId =>
      $composableBuilder(column: $table.sessionId, builder: (column) => column);

  GeneratedColumn<String> get discountId => $composableBuilder(
      column: $table.discountId, builder: (column) => column);

  GeneratedColumn<String> get paymentMethod => $composableBuilder(
      column: $table.paymentMethod, builder: (column) => column);

  GeneratedColumn<int> get amountDue =>
      $composableBuilder(column: $table.amountDue, builder: (column) => column);

  GeneratedColumn<int> get amountReceived => $composableBuilder(
      column: $table.amountReceived, builder: (column) => column);

  GeneratedColumn<int> get paidPartCount => $composableBuilder(
      column: $table.paidPartCount, builder: (column) => column);

  GeneratedColumnWithTypeConverter<Map<String, int>, String>
      get paidArticlesQty => $composableBuilder(
          column: $table.paidArticlesQty, builder: (column) => column);

  GeneratedColumn<DateTime> get validatedAt => $composableBuilder(
      column: $table.validatedAt, builder: (column) => column);

  GeneratedColumn<String> get createdById => $composableBuilder(
      column: $table.createdById, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);
}

class $$PaymentTransactionDriftTableTableManager extends RootTableManager<
    _$AppDatabase,
    $PaymentTransactionDriftTable,
    PaymentTransactionDriftData,
    $$PaymentTransactionDriftTableFilterComposer,
    $$PaymentTransactionDriftTableOrderingComposer,
    $$PaymentTransactionDriftTableAnnotationComposer,
    $$PaymentTransactionDriftTableCreateCompanionBuilder,
    $$PaymentTransactionDriftTableUpdateCompanionBuilder,
    (
      PaymentTransactionDriftData,
      BaseReferences<_$AppDatabase, $PaymentTransactionDriftTable,
          PaymentTransactionDriftData>
    ),
    PaymentTransactionDriftData,
    PrefetchHooks Function()> {
  $$PaymentTransactionDriftTableTableManager(
      _$AppDatabase db, $PaymentTransactionDriftTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$PaymentTransactionDriftTableFilterComposer(
                  $db: db, $table: table),
          createOrderingComposer: () =>
              $$PaymentTransactionDriftTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$PaymentTransactionDriftTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<String> sessionId = const Value.absent(),
            Value<String?> discountId = const Value.absent(),
            Value<String> paymentMethod = const Value.absent(),
            Value<int> amountDue = const Value.absent(),
            Value<int> amountReceived = const Value.absent(),
            Value<int> paidPartCount = const Value.absent(),
            Value<Map<String, int>> paidArticlesQty = const Value.absent(),
            Value<DateTime?> validatedAt = const Value.absent(),
            Value<String?> createdById = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              PaymentTransactionDriftCompanion(
            id: id,
            sessionId: sessionId,
            discountId: discountId,
            paymentMethod: paymentMethod,
            amountDue: amountDue,
            amountReceived: amountReceived,
            paidPartCount: paidPartCount,
            paidArticlesQty: paidArticlesQty,
            validatedAt: validatedAt,
            createdById: createdById,
            deletedAt: deletedAt,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required String sessionId,
            Value<String?> discountId = const Value.absent(),
            Value<String> paymentMethod = const Value.absent(),
            Value<int> amountDue = const Value.absent(),
            Value<int> amountReceived = const Value.absent(),
            Value<int> paidPartCount = const Value.absent(),
            required Map<String, int> paidArticlesQty,
            Value<DateTime?> validatedAt = const Value.absent(),
            Value<String?> createdById = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<int> rowid = const Value.absent(),
          }) =>
              PaymentTransactionDriftCompanion.insert(
            id: id,
            sessionId: sessionId,
            discountId: discountId,
            paymentMethod: paymentMethod,
            amountDue: amountDue,
            amountReceived: amountReceived,
            paidPartCount: paidPartCount,
            paidArticlesQty: paidArticlesQty,
            validatedAt: validatedAt,
            createdById: createdById,
            deletedAt: deletedAt,
            createdAt: createdAt,
            updatedAt: updatedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$PaymentTransactionDriftTableProcessedTableManager
    = ProcessedTableManager<
        _$AppDatabase,
        $PaymentTransactionDriftTable,
        PaymentTransactionDriftData,
        $$PaymentTransactionDriftTableFilterComposer,
        $$PaymentTransactionDriftTableOrderingComposer,
        $$PaymentTransactionDriftTableAnnotationComposer,
        $$PaymentTransactionDriftTableCreateCompanionBuilder,
        $$PaymentTransactionDriftTableUpdateCompanionBuilder,
        (
          PaymentTransactionDriftData,
          BaseReferences<_$AppDatabase, $PaymentTransactionDriftTable,
              PaymentTransactionDriftData>
        ),
        PaymentTransactionDriftData,
        PrefetchHooks Function()>;
typedef $$CustomersDriftTableCreateCompanionBuilder = CustomersDriftCompanion
    Function({
  required String id,
  required CustomerType type,
  Value<String?> firstName,
  required String lastName,
  Value<String?> companyName,
  Value<String?> code,
  Value<String?> siret,
  Value<String?> siren,
  Value<String?> vatNumber,
  Value<String?> email,
  Value<String?> phone,
  Value<String?> secondaryPhone,
  Value<String?> address,
  Value<String?> addressComplement,
  Value<String?> postalCode,
  Value<String?> city,
  required String country,
  required String priceList,
  Value<double?> permanentDiscount,
  Value<bool> allowCredit,
  Value<int?> creditLimitCents,
  Value<String?> notes,
  Value<bool> isActive,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});
typedef $$CustomersDriftTableUpdateCompanionBuilder = CustomersDriftCompanion
    Function({
  Value<String> id,
  Value<CustomerType> type,
  Value<String?> firstName,
  Value<String> lastName,
  Value<String?> companyName,
  Value<String?> code,
  Value<String?> siret,
  Value<String?> siren,
  Value<String?> vatNumber,
  Value<String?> email,
  Value<String?> phone,
  Value<String?> secondaryPhone,
  Value<String?> address,
  Value<String?> addressComplement,
  Value<String?> postalCode,
  Value<String?> city,
  Value<String> country,
  Value<String> priceList,
  Value<double?> permanentDiscount,
  Value<bool> allowCredit,
  Value<int?> creditLimitCents,
  Value<String?> notes,
  Value<bool> isActive,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});

class $$CustomersDriftTableFilterComposer
    extends Composer<_$AppDatabase, $CustomersDriftTable> {
  $$CustomersDriftTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnWithTypeConverterFilters<CustomerType, CustomerType, String> get type =>
      $composableBuilder(
          column: $table.type,
          builder: (column) => ColumnWithTypeConverterFilters(column));

  ColumnFilters<String> get firstName => $composableBuilder(
      column: $table.firstName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get lastName => $composableBuilder(
      column: $table.lastName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get companyName => $composableBuilder(
      column: $table.companyName, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get code => $composableBuilder(
      column: $table.code, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get siret => $composableBuilder(
      column: $table.siret, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get siren => $composableBuilder(
      column: $table.siren, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get vatNumber => $composableBuilder(
      column: $table.vatNumber, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get phone => $composableBuilder(
      column: $table.phone, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get secondaryPhone => $composableBuilder(
      column: $table.secondaryPhone,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get address => $composableBuilder(
      column: $table.address, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get addressComplement => $composableBuilder(
      column: $table.addressComplement,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get postalCode => $composableBuilder(
      column: $table.postalCode, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get city => $composableBuilder(
      column: $table.city, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get country => $composableBuilder(
      column: $table.country, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get priceList => $composableBuilder(
      column: $table.priceList, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get permanentDiscount => $composableBuilder(
      column: $table.permanentDiscount,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get allowCredit => $composableBuilder(
      column: $table.allowCredit, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get creditLimitCents => $composableBuilder(
      column: $table.creditLimitCents,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));
}

class $$CustomersDriftTableOrderingComposer
    extends Composer<_$AppDatabase, $CustomersDriftTable> {
  $$CustomersDriftTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<String> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get type => $composableBuilder(
      column: $table.type, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get firstName => $composableBuilder(
      column: $table.firstName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get lastName => $composableBuilder(
      column: $table.lastName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get companyName => $composableBuilder(
      column: $table.companyName, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get code => $composableBuilder(
      column: $table.code, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get siret => $composableBuilder(
      column: $table.siret, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get siren => $composableBuilder(
      column: $table.siren, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get vatNumber => $composableBuilder(
      column: $table.vatNumber, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get email => $composableBuilder(
      column: $table.email, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get phone => $composableBuilder(
      column: $table.phone, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get secondaryPhone => $composableBuilder(
      column: $table.secondaryPhone,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get address => $composableBuilder(
      column: $table.address, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get addressComplement => $composableBuilder(
      column: $table.addressComplement,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get postalCode => $composableBuilder(
      column: $table.postalCode, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get city => $composableBuilder(
      column: $table.city, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get country => $composableBuilder(
      column: $table.country, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get priceList => $composableBuilder(
      column: $table.priceList, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get permanentDiscount => $composableBuilder(
      column: $table.permanentDiscount,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get allowCredit => $composableBuilder(
      column: $table.allowCredit, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get creditLimitCents => $composableBuilder(
      column: $table.creditLimitCents,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get notes => $composableBuilder(
      column: $table.notes, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));
}

class $$CustomersDriftTableAnnotationComposer
    extends Composer<_$AppDatabase, $CustomersDriftTable> {
  $$CustomersDriftTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<String> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumnWithTypeConverter<CustomerType, String> get type =>
      $composableBuilder(column: $table.type, builder: (column) => column);

  GeneratedColumn<String> get firstName =>
      $composableBuilder(column: $table.firstName, builder: (column) => column);

  GeneratedColumn<String> get lastName =>
      $composableBuilder(column: $table.lastName, builder: (column) => column);

  GeneratedColumn<String> get companyName => $composableBuilder(
      column: $table.companyName, builder: (column) => column);

  GeneratedColumn<String> get code =>
      $composableBuilder(column: $table.code, builder: (column) => column);

  GeneratedColumn<String> get siret =>
      $composableBuilder(column: $table.siret, builder: (column) => column);

  GeneratedColumn<String> get siren =>
      $composableBuilder(column: $table.siren, builder: (column) => column);

  GeneratedColumn<String> get vatNumber =>
      $composableBuilder(column: $table.vatNumber, builder: (column) => column);

  GeneratedColumn<String> get email =>
      $composableBuilder(column: $table.email, builder: (column) => column);

  GeneratedColumn<String> get phone =>
      $composableBuilder(column: $table.phone, builder: (column) => column);

  GeneratedColumn<String> get secondaryPhone => $composableBuilder(
      column: $table.secondaryPhone, builder: (column) => column);

  GeneratedColumn<String> get address =>
      $composableBuilder(column: $table.address, builder: (column) => column);

  GeneratedColumn<String> get addressComplement => $composableBuilder(
      column: $table.addressComplement, builder: (column) => column);

  GeneratedColumn<String> get postalCode => $composableBuilder(
      column: $table.postalCode, builder: (column) => column);

  GeneratedColumn<String> get city =>
      $composableBuilder(column: $table.city, builder: (column) => column);

  GeneratedColumn<String> get country =>
      $composableBuilder(column: $table.country, builder: (column) => column);

  GeneratedColumn<String> get priceList =>
      $composableBuilder(column: $table.priceList, builder: (column) => column);

  GeneratedColumn<double> get permanentDiscount => $composableBuilder(
      column: $table.permanentDiscount, builder: (column) => column);

  GeneratedColumn<bool> get allowCredit => $composableBuilder(
      column: $table.allowCredit, builder: (column) => column);

  GeneratedColumn<int> get creditLimitCents => $composableBuilder(
      column: $table.creditLimitCents, builder: (column) => column);

  GeneratedColumn<String> get notes =>
      $composableBuilder(column: $table.notes, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);
}

class $$CustomersDriftTableTableManager extends RootTableManager<
    _$AppDatabase,
    $CustomersDriftTable,
    CustomersDriftData,
    $$CustomersDriftTableFilterComposer,
    $$CustomersDriftTableOrderingComposer,
    $$CustomersDriftTableAnnotationComposer,
    $$CustomersDriftTableCreateCompanionBuilder,
    $$CustomersDriftTableUpdateCompanionBuilder,
    (
      CustomersDriftData,
      BaseReferences<_$AppDatabase, $CustomersDriftTable, CustomersDriftData>
    ),
    CustomersDriftData,
    PrefetchHooks Function()> {
  $$CustomersDriftTableTableManager(
      _$AppDatabase db, $CustomersDriftTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$CustomersDriftTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$CustomersDriftTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$CustomersDriftTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<String> id = const Value.absent(),
            Value<CustomerType> type = const Value.absent(),
            Value<String?> firstName = const Value.absent(),
            Value<String> lastName = const Value.absent(),
            Value<String?> companyName = const Value.absent(),
            Value<String?> code = const Value.absent(),
            Value<String?> siret = const Value.absent(),
            Value<String?> siren = const Value.absent(),
            Value<String?> vatNumber = const Value.absent(),
            Value<String?> email = const Value.absent(),
            Value<String?> phone = const Value.absent(),
            Value<String?> secondaryPhone = const Value.absent(),
            Value<String?> address = const Value.absent(),
            Value<String?> addressComplement = const Value.absent(),
            Value<String?> postalCode = const Value.absent(),
            Value<String?> city = const Value.absent(),
            Value<String> country = const Value.absent(),
            Value<String> priceList = const Value.absent(),
            Value<double?> permanentDiscount = const Value.absent(),
            Value<bool> allowCredit = const Value.absent(),
            Value<int?> creditLimitCents = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CustomersDriftCompanion(
            id: id,
            type: type,
            firstName: firstName,
            lastName: lastName,
            companyName: companyName,
            code: code,
            siret: siret,
            siren: siren,
            vatNumber: vatNumber,
            email: email,
            phone: phone,
            secondaryPhone: secondaryPhone,
            address: address,
            addressComplement: addressComplement,
            postalCode: postalCode,
            city: city,
            country: country,
            priceList: priceList,
            permanentDiscount: permanentDiscount,
            allowCredit: allowCredit,
            creditLimitCents: creditLimitCents,
            notes: notes,
            isActive: isActive,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
            required CustomerType type,
            Value<String?> firstName = const Value.absent(),
            required String lastName,
            Value<String?> companyName = const Value.absent(),
            Value<String?> code = const Value.absent(),
            Value<String?> siret = const Value.absent(),
            Value<String?> siren = const Value.absent(),
            Value<String?> vatNumber = const Value.absent(),
            Value<String?> email = const Value.absent(),
            Value<String?> phone = const Value.absent(),
            Value<String?> secondaryPhone = const Value.absent(),
            Value<String?> address = const Value.absent(),
            Value<String?> addressComplement = const Value.absent(),
            Value<String?> postalCode = const Value.absent(),
            Value<String?> city = const Value.absent(),
            required String country,
            required String priceList,
            Value<double?> permanentDiscount = const Value.absent(),
            Value<bool> allowCredit = const Value.absent(),
            Value<int?> creditLimitCents = const Value.absent(),
            Value<String?> notes = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              CustomersDriftCompanion.insert(
            id: id,
            type: type,
            firstName: firstName,
            lastName: lastName,
            companyName: companyName,
            code: code,
            siret: siret,
            siren: siren,
            vatNumber: vatNumber,
            email: email,
            phone: phone,
            secondaryPhone: secondaryPhone,
            address: address,
            addressComplement: addressComplement,
            postalCode: postalCode,
            city: city,
            country: country,
            priceList: priceList,
            permanentDiscount: permanentDiscount,
            allowCredit: allowCredit,
            creditLimitCents: creditLimitCents,
            notes: notes,
            isActive: isActive,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
            rowid: rowid,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (e.readTable(table), BaseReferences(db, table, e)))
              .toList(),
          prefetchHooksCallback: null,
        ));
}

typedef $$CustomersDriftTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $CustomersDriftTable,
    CustomersDriftData,
    $$CustomersDriftTableFilterComposer,
    $$CustomersDriftTableOrderingComposer,
    $$CustomersDriftTableAnnotationComposer,
    $$CustomersDriftTableCreateCompanionBuilder,
    $$CustomersDriftTableUpdateCompanionBuilder,
    (
      CustomersDriftData,
      BaseReferences<_$AppDatabase, $CustomersDriftTable, CustomersDriftData>
    ),
    CustomersDriftData,
    PrefetchHooks Function()>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CategoriesDriftTableTableManager get categoriesDrift =>
      $$CategoriesDriftTableTableManager(_db, _db.categoriesDrift);
  $$SuppliersDriftTableTableManager get suppliersDrift =>
      $$SuppliersDriftTableTableManager(_db, _db.suppliersDrift);
  $$ProductsDriftTableTableManager get productsDrift =>
      $$ProductsDriftTableTableManager(_db, _db.productsDrift);
  $$OptionsDriftTableTableManager get optionsDrift =>
      $$OptionsDriftTableTableManager(_db, _db.optionsDrift);
  $$ItemsDriftTableTableManager get itemsDrift =>
      $$ItemsDriftTableTableManager(_db, _db.itemsDrift);
  $$ProductsOptionsDriftTableTableManager get productsOptionsDrift =>
      $$ProductsOptionsDriftTableTableManager(_db, _db.productsOptionsDrift);
  $$AuditLogsDriftTableTableManager get auditLogsDrift =>
      $$AuditLogsDriftTableTableManager(_db, _db.auditLogsDrift);
  $$PlanDriftTableTableManager get planDrift =>
      $$PlanDriftTableTableManager(_db, _db.planDrift);
  $$RestaurantTableDriftTableTableManager get restaurantTableDrift =>
      $$RestaurantTableDriftTableTableManager(_db, _db.restaurantTableDrift);
  $$DiscountsDriftTableTableManager get discountsDrift =>
      $$DiscountsDriftTableTableManager(_db, _db.discountsDrift);
  $$OrderDriftTableTableManager get orderDrift =>
      $$OrderDriftTableTableManager(_db, _db.orderDrift);
  $$OrderItemDriftTableTableManager get orderItemDrift =>
      $$OrderItemDriftTableTableManager(_db, _db.orderItemDrift);
  $$OrderItemOptionsDriftTableTableManager get orderItemOptionsDrift =>
      $$OrderItemOptionsDriftTableTableManager(_db, _db.orderItemOptionsDrift);
  $$PaymentSessionDriftTableTableManager get paymentSessionDrift =>
      $$PaymentSessionDriftTableTableManager(_db, _db.paymentSessionDrift);
  $$PaymentTransactionDriftTableTableManager get paymentTransactionDrift =>
      $$PaymentTransactionDriftTableTableManager(
          _db, _db.paymentTransactionDrift);
  $$CustomersDriftTableTableManager get customersDrift =>
      $$CustomersDriftTableTableManager(_db, _db.customersDrift);
}
