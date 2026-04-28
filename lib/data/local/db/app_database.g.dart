// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// ignore_for_file: type=lint
class $ProductGroupsDriftTable extends ProductGroupsDrift
    with TableInfo<$ProductGroupsDriftTable, ProductGroupsDriftData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductGroupsDriftTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _remoteIdMeta =
      const VerificationMeta('remoteId');
  @override
  late final GeneratedColumn<String> remoteId = GeneratedColumn<String>(
      'remote_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
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
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _createdByIdMeta =
      const VerificationMeta('createdById');
  @override
  late final GeneratedColumn<String> createdById = GeneratedColumn<String>(
      'created_by_id', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _productGroupIdMeta =
      const VerificationMeta('productGroupId');
  @override
  late final GeneratedColumn<int> productGroupId = GeneratedColumn<int>(
      'product_group_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES product_groups_drift (id)'));
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
        remoteId,
        name,
        isActive,
        parentId,
        createdById,
        productGroupId,
        createdAt,
        updatedAt,
        deletedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'product_groups_drift';
  @override
  VerificationContext validateIntegrity(
      Insertable<ProductGroupsDriftData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('remote_id')) {
      context.handle(_remoteIdMeta,
          remoteId.isAcceptableOrUnknown(data['remote_id']!, _remoteIdMeta));
    } else if (isInserting) {
      context.missing(_remoteIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
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
    if (data.containsKey('product_group_id')) {
      context.handle(
          _productGroupIdMeta,
          productGroupId.isAcceptableOrUnknown(
              data['product_group_id']!, _productGroupIdMeta));
    } else if (isInserting) {
      context.missing(_productGroupIdMeta);
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
  ProductGroupsDriftData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProductGroupsDriftData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      remoteId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}remote_id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      isActive: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_active'])!,
      parentId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}parent_id']),
      createdById: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}created_by_id']),
      productGroupId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}product_group_id'])!,
      createdAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}created_at'])!,
      updatedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}updated_at'])!,
      deletedAt: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}deleted_at']),
    );
  }

  @override
  $ProductGroupsDriftTable createAlias(String alias) {
    return $ProductGroupsDriftTable(attachedDatabase, alias);
  }
}

class ProductGroupsDriftData extends DataClass
    implements Insertable<ProductGroupsDriftData> {
  final int id;
  final String remoteId;
  final String name;
  final bool isActive;
  final String? parentId;
  final String? createdById;
  final int productGroupId;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  const ProductGroupsDriftData(
      {required this.id,
      required this.remoteId,
      required this.name,
      required this.isActive,
      this.parentId,
      this.createdById,
      required this.productGroupId,
      required this.createdAt,
      required this.updatedAt,
      this.deletedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['remote_id'] = Variable<String>(remoteId);
    map['name'] = Variable<String>(name);
    map['is_active'] = Variable<bool>(isActive);
    if (!nullToAbsent || parentId != null) {
      map['parent_id'] = Variable<String>(parentId);
    }
    if (!nullToAbsent || createdById != null) {
      map['created_by_id'] = Variable<String>(createdById);
    }
    map['product_group_id'] = Variable<int>(productGroupId);
    map['created_at'] = Variable<DateTime>(createdAt);
    map['updated_at'] = Variable<DateTime>(updatedAt);
    if (!nullToAbsent || deletedAt != null) {
      map['deleted_at'] = Variable<DateTime>(deletedAt);
    }
    return map;
  }

  ProductGroupsDriftCompanion toCompanion(bool nullToAbsent) {
    return ProductGroupsDriftCompanion(
      id: Value(id),
      remoteId: Value(remoteId),
      name: Value(name),
      isActive: Value(isActive),
      parentId: parentId == null && nullToAbsent
          ? const Value.absent()
          : Value(parentId),
      createdById: createdById == null && nullToAbsent
          ? const Value.absent()
          : Value(createdById),
      productGroupId: Value(productGroupId),
      createdAt: Value(createdAt),
      updatedAt: Value(updatedAt),
      deletedAt: deletedAt == null && nullToAbsent
          ? const Value.absent()
          : Value(deletedAt),
    );
  }

  factory ProductGroupsDriftData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProductGroupsDriftData(
      id: serializer.fromJson<int>(json['id']),
      remoteId: serializer.fromJson<String>(json['remoteId']),
      name: serializer.fromJson<String>(json['name']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      parentId: serializer.fromJson<String?>(json['parentId']),
      createdById: serializer.fromJson<String?>(json['createdById']),
      productGroupId: serializer.fromJson<int>(json['productGroupId']),
      createdAt: serializer.fromJson<DateTime>(json['createdAt']),
      updatedAt: serializer.fromJson<DateTime>(json['updatedAt']),
      deletedAt: serializer.fromJson<DateTime?>(json['deletedAt']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'remoteId': serializer.toJson<String>(remoteId),
      'name': serializer.toJson<String>(name),
      'isActive': serializer.toJson<bool>(isActive),
      'parentId': serializer.toJson<String?>(parentId),
      'createdById': serializer.toJson<String?>(createdById),
      'productGroupId': serializer.toJson<int>(productGroupId),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  ProductGroupsDriftData copyWith(
          {int? id,
          String? remoteId,
          String? name,
          bool? isActive,
          Value<String?> parentId = const Value.absent(),
          Value<String?> createdById = const Value.absent(),
          int? productGroupId,
          DateTime? createdAt,
          DateTime? updatedAt,
          Value<DateTime?> deletedAt = const Value.absent()}) =>
      ProductGroupsDriftData(
        id: id ?? this.id,
        remoteId: remoteId ?? this.remoteId,
        name: name ?? this.name,
        isActive: isActive ?? this.isActive,
        parentId: parentId.present ? parentId.value : this.parentId,
        createdById: createdById.present ? createdById.value : this.createdById,
        productGroupId: productGroupId ?? this.productGroupId,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
      );
  ProductGroupsDriftData copyWithCompanion(ProductGroupsDriftCompanion data) {
    return ProductGroupsDriftData(
      id: data.id.present ? data.id.value : this.id,
      remoteId: data.remoteId.present ? data.remoteId.value : this.remoteId,
      name: data.name.present ? data.name.value : this.name,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      parentId: data.parentId.present ? data.parentId.value : this.parentId,
      createdById:
          data.createdById.present ? data.createdById.value : this.createdById,
      productGroupId: data.productGroupId.present
          ? data.productGroupId.value
          : this.productGroupId,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProductGroupsDriftData(')
          ..write('id: $id, ')
          ..write('remoteId: $remoteId, ')
          ..write('name: $name, ')
          ..write('isActive: $isActive, ')
          ..write('parentId: $parentId, ')
          ..write('createdById: $createdById, ')
          ..write('productGroupId: $productGroupId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, remoteId, name, isActive, parentId,
      createdById, productGroupId, createdAt, updatedAt, deletedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductGroupsDriftData &&
          other.id == this.id &&
          other.remoteId == this.remoteId &&
          other.name == this.name &&
          other.isActive == this.isActive &&
          other.parentId == this.parentId &&
          other.createdById == this.createdById &&
          other.productGroupId == this.productGroupId &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt);
}

class ProductGroupsDriftCompanion
    extends UpdateCompanion<ProductGroupsDriftData> {
  final Value<int> id;
  final Value<String> remoteId;
  final Value<String> name;
  final Value<bool> isActive;
  final Value<String?> parentId;
  final Value<String?> createdById;
  final Value<int> productGroupId;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  const ProductGroupsDriftCompanion({
    this.id = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.name = const Value.absent(),
    this.isActive = const Value.absent(),
    this.parentId = const Value.absent(),
    this.createdById = const Value.absent(),
    this.productGroupId = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
  });
  ProductGroupsDriftCompanion.insert({
    this.id = const Value.absent(),
    required String remoteId,
    required String name,
    this.isActive = const Value.absent(),
    this.parentId = const Value.absent(),
    this.createdById = const Value.absent(),
    required int productGroupId,
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
  })  : remoteId = Value(remoteId),
        name = Value(name),
        productGroupId = Value(productGroupId),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<ProductGroupsDriftData> custom({
    Expression<int>? id,
    Expression<String>? remoteId,
    Expression<String>? name,
    Expression<bool>? isActive,
    Expression<String>? parentId,
    Expression<String>? createdById,
    Expression<int>? productGroupId,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (remoteId != null) 'remote_id': remoteId,
      if (name != null) 'name': name,
      if (isActive != null) 'is_active': isActive,
      if (parentId != null) 'parent_id': parentId,
      if (createdById != null) 'created_by_id': createdById,
      if (productGroupId != null) 'product_group_id': productGroupId,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
    });
  }

  ProductGroupsDriftCompanion copyWith(
      {Value<int>? id,
      Value<String>? remoteId,
      Value<String>? name,
      Value<bool>? isActive,
      Value<String?>? parentId,
      Value<String?>? createdById,
      Value<int>? productGroupId,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<DateTime?>? deletedAt}) {
    return ProductGroupsDriftCompanion(
      id: id ?? this.id,
      remoteId: remoteId ?? this.remoteId,
      name: name ?? this.name,
      isActive: isActive ?? this.isActive,
      parentId: parentId ?? this.parentId,
      createdById: createdById ?? this.createdById,
      productGroupId: productGroupId ?? this.productGroupId,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (remoteId.present) {
      map['remote_id'] = Variable<String>(remoteId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
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
    if (productGroupId.present) {
      map['product_group_id'] = Variable<int>(productGroupId.value);
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
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductGroupsDriftCompanion(')
          ..write('id: $id, ')
          ..write('remoteId: $remoteId, ')
          ..write('name: $name, ')
          ..write('isActive: $isActive, ')
          ..write('parentId: $parentId, ')
          ..write('createdById: $createdById, ')
          ..write('productGroupId: $productGroupId, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
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
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _remoteIdMeta =
      const VerificationMeta('remoteId');
  @override
  late final GeneratedColumn<String> remoteId = GeneratedColumn<String>(
      'remote_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _productGroupIdMeta =
      const VerificationMeta('productGroupId');
  @override
  late final GeneratedColumn<int> productGroupId = GeneratedColumn<int>(
      'product_group_id', aliasedName, true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES product_groups_drift (id)'));
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
      'price', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _descriptionMeta =
      const VerificationMeta('description');
  @override
  late final GeneratedColumn<String> description = GeneratedColumn<String>(
      'description', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _imageMeta = const VerificationMeta('image');
  @override
  late final GeneratedColumn<String> image = GeneratedColumn<String>(
      'image', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _groupIdMeta =
      const VerificationMeta('groupId');
  @override
  late final GeneratedColumn<String> groupId = GeneratedColumn<String>(
      'group_id', aliasedName, true,
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
  static const VerificationMeta _codeBarresMeta =
      const VerificationMeta('codeBarres');
  @override
  late final GeneratedColumn<String> codeBarres = GeneratedColumn<String>(
      'code_barres', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _skuMeta = const VerificationMeta('sku');
  @override
  late final GeneratedColumn<String> sku = GeneratedColumn<String>(
      'sku', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
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
        remoteId,
        name,
        productGroupId,
        price,
        description,
        image,
        groupId,
        isActive,
        codeBarres,
        sku,
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
    }
    if (data.containsKey('remote_id')) {
      context.handle(_remoteIdMeta,
          remoteId.isAcceptableOrUnknown(data['remote_id']!, _remoteIdMeta));
    } else if (isInserting) {
      context.missing(_remoteIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('product_group_id')) {
      context.handle(
          _productGroupIdMeta,
          productGroupId.isAcceptableOrUnknown(
              data['product_group_id']!, _productGroupIdMeta));
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('description')) {
      context.handle(
          _descriptionMeta,
          description.isAcceptableOrUnknown(
              data['description']!, _descriptionMeta));
    }
    if (data.containsKey('image')) {
      context.handle(
          _imageMeta, image.isAcceptableOrUnknown(data['image']!, _imageMeta));
    }
    if (data.containsKey('group_id')) {
      context.handle(_groupIdMeta,
          groupId.isAcceptableOrUnknown(data['group_id']!, _groupIdMeta));
    }
    if (data.containsKey('is_active')) {
      context.handle(_isActiveMeta,
          isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta));
    }
    if (data.containsKey('code_barres')) {
      context.handle(
          _codeBarresMeta,
          codeBarres.isAcceptableOrUnknown(
              data['code_barres']!, _codeBarresMeta));
    }
    if (data.containsKey('sku')) {
      context.handle(
          _skuMeta, sku.isAcceptableOrUnknown(data['sku']!, _skuMeta));
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
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      remoteId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}remote_id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      productGroupId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}product_group_id']),
      price: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}price'])!,
      description: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}description']),
      image: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image']),
      groupId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}group_id']),
      isActive: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_active'])!,
      codeBarres: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}code_barres']),
      sku: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}sku']),
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
  final int id;
  final String remoteId;
  final String name;
  final int? productGroupId;
  final double price;
  final String? description;
  final String? image;
  final String? groupId;
  final bool isActive;
  final String? codeBarres;
  final String? sku;
  final String? createdById;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  const ProductsDriftData(
      {required this.id,
      required this.remoteId,
      required this.name,
      this.productGroupId,
      required this.price,
      this.description,
      this.image,
      this.groupId,
      required this.isActive,
      this.codeBarres,
      this.sku,
      this.createdById,
      required this.createdAt,
      required this.updatedAt,
      this.deletedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['remote_id'] = Variable<String>(remoteId);
    map['name'] = Variable<String>(name);
    if (!nullToAbsent || productGroupId != null) {
      map['product_group_id'] = Variable<int>(productGroupId);
    }
    map['price'] = Variable<double>(price);
    if (!nullToAbsent || description != null) {
      map['description'] = Variable<String>(description);
    }
    if (!nullToAbsent || image != null) {
      map['image'] = Variable<String>(image);
    }
    if (!nullToAbsent || groupId != null) {
      map['group_id'] = Variable<String>(groupId);
    }
    map['is_active'] = Variable<bool>(isActive);
    if (!nullToAbsent || codeBarres != null) {
      map['code_barres'] = Variable<String>(codeBarres);
    }
    if (!nullToAbsent || sku != null) {
      map['sku'] = Variable<String>(sku);
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
      remoteId: Value(remoteId),
      name: Value(name),
      productGroupId: productGroupId == null && nullToAbsent
          ? const Value.absent()
          : Value(productGroupId),
      price: Value(price),
      description: description == null && nullToAbsent
          ? const Value.absent()
          : Value(description),
      image:
          image == null && nullToAbsent ? const Value.absent() : Value(image),
      groupId: groupId == null && nullToAbsent
          ? const Value.absent()
          : Value(groupId),
      isActive: Value(isActive),
      codeBarres: codeBarres == null && nullToAbsent
          ? const Value.absent()
          : Value(codeBarres),
      sku: sku == null && nullToAbsent ? const Value.absent() : Value(sku),
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
      id: serializer.fromJson<int>(json['id']),
      remoteId: serializer.fromJson<String>(json['remoteId']),
      name: serializer.fromJson<String>(json['name']),
      productGroupId: serializer.fromJson<int?>(json['productGroupId']),
      price: serializer.fromJson<double>(json['price']),
      description: serializer.fromJson<String?>(json['description']),
      image: serializer.fromJson<String?>(json['image']),
      groupId: serializer.fromJson<String?>(json['groupId']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      codeBarres: serializer.fromJson<String?>(json['codeBarres']),
      sku: serializer.fromJson<String?>(json['sku']),
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
      'id': serializer.toJson<int>(id),
      'remoteId': serializer.toJson<String>(remoteId),
      'name': serializer.toJson<String>(name),
      'productGroupId': serializer.toJson<int?>(productGroupId),
      'price': serializer.toJson<double>(price),
      'description': serializer.toJson<String?>(description),
      'image': serializer.toJson<String?>(image),
      'groupId': serializer.toJson<String?>(groupId),
      'isActive': serializer.toJson<bool>(isActive),
      'codeBarres': serializer.toJson<String?>(codeBarres),
      'sku': serializer.toJson<String?>(sku),
      'createdById': serializer.toJson<String?>(createdById),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  ProductsDriftData copyWith(
          {int? id,
          String? remoteId,
          String? name,
          Value<int?> productGroupId = const Value.absent(),
          double? price,
          Value<String?> description = const Value.absent(),
          Value<String?> image = const Value.absent(),
          Value<String?> groupId = const Value.absent(),
          bool? isActive,
          Value<String?> codeBarres = const Value.absent(),
          Value<String?> sku = const Value.absent(),
          Value<String?> createdById = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt,
          Value<DateTime?> deletedAt = const Value.absent()}) =>
      ProductsDriftData(
        id: id ?? this.id,
        remoteId: remoteId ?? this.remoteId,
        name: name ?? this.name,
        productGroupId:
            productGroupId.present ? productGroupId.value : this.productGroupId,
        price: price ?? this.price,
        description: description.present ? description.value : this.description,
        image: image.present ? image.value : this.image,
        groupId: groupId.present ? groupId.value : this.groupId,
        isActive: isActive ?? this.isActive,
        codeBarres: codeBarres.present ? codeBarres.value : this.codeBarres,
        sku: sku.present ? sku.value : this.sku,
        createdById: createdById.present ? createdById.value : this.createdById,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
      );
  ProductsDriftData copyWithCompanion(ProductsDriftCompanion data) {
    return ProductsDriftData(
      id: data.id.present ? data.id.value : this.id,
      remoteId: data.remoteId.present ? data.remoteId.value : this.remoteId,
      name: data.name.present ? data.name.value : this.name,
      productGroupId: data.productGroupId.present
          ? data.productGroupId.value
          : this.productGroupId,
      price: data.price.present ? data.price.value : this.price,
      description:
          data.description.present ? data.description.value : this.description,
      image: data.image.present ? data.image.value : this.image,
      groupId: data.groupId.present ? data.groupId.value : this.groupId,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      codeBarres:
          data.codeBarres.present ? data.codeBarres.value : this.codeBarres,
      sku: data.sku.present ? data.sku.value : this.sku,
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
          ..write('remoteId: $remoteId, ')
          ..write('name: $name, ')
          ..write('productGroupId: $productGroupId, ')
          ..write('price: $price, ')
          ..write('description: $description, ')
          ..write('image: $image, ')
          ..write('groupId: $groupId, ')
          ..write('isActive: $isActive, ')
          ..write('codeBarres: $codeBarres, ')
          ..write('sku: $sku, ')
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
      remoteId,
      name,
      productGroupId,
      price,
      description,
      image,
      groupId,
      isActive,
      codeBarres,
      sku,
      createdById,
      createdAt,
      updatedAt,
      deletedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductsDriftData &&
          other.id == this.id &&
          other.remoteId == this.remoteId &&
          other.name == this.name &&
          other.productGroupId == this.productGroupId &&
          other.price == this.price &&
          other.description == this.description &&
          other.image == this.image &&
          other.groupId == this.groupId &&
          other.isActive == this.isActive &&
          other.codeBarres == this.codeBarres &&
          other.sku == this.sku &&
          other.createdById == this.createdById &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt);
}

class ProductsDriftCompanion extends UpdateCompanion<ProductsDriftData> {
  final Value<int> id;
  final Value<String> remoteId;
  final Value<String> name;
  final Value<int?> productGroupId;
  final Value<double> price;
  final Value<String?> description;
  final Value<String?> image;
  final Value<String?> groupId;
  final Value<bool> isActive;
  final Value<String?> codeBarres;
  final Value<String?> sku;
  final Value<String?> createdById;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  const ProductsDriftCompanion({
    this.id = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.name = const Value.absent(),
    this.productGroupId = const Value.absent(),
    this.price = const Value.absent(),
    this.description = const Value.absent(),
    this.image = const Value.absent(),
    this.groupId = const Value.absent(),
    this.isActive = const Value.absent(),
    this.codeBarres = const Value.absent(),
    this.sku = const Value.absent(),
    this.createdById = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
  });
  ProductsDriftCompanion.insert({
    this.id = const Value.absent(),
    required String remoteId,
    required String name,
    this.productGroupId = const Value.absent(),
    required double price,
    this.description = const Value.absent(),
    this.image = const Value.absent(),
    this.groupId = const Value.absent(),
    this.isActive = const Value.absent(),
    this.codeBarres = const Value.absent(),
    this.sku = const Value.absent(),
    this.createdById = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
  })  : remoteId = Value(remoteId),
        name = Value(name),
        price = Value(price),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<ProductsDriftData> custom({
    Expression<int>? id,
    Expression<String>? remoteId,
    Expression<String>? name,
    Expression<int>? productGroupId,
    Expression<double>? price,
    Expression<String>? description,
    Expression<String>? image,
    Expression<String>? groupId,
    Expression<bool>? isActive,
    Expression<String>? codeBarres,
    Expression<String>? sku,
    Expression<String>? createdById,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (remoteId != null) 'remote_id': remoteId,
      if (name != null) 'name': name,
      if (productGroupId != null) 'product_group_id': productGroupId,
      if (price != null) 'price': price,
      if (description != null) 'description': description,
      if (image != null) 'image': image,
      if (groupId != null) 'group_id': groupId,
      if (isActive != null) 'is_active': isActive,
      if (codeBarres != null) 'code_barres': codeBarres,
      if (sku != null) 'sku': sku,
      if (createdById != null) 'created_by_id': createdById,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
    });
  }

  ProductsDriftCompanion copyWith(
      {Value<int>? id,
      Value<String>? remoteId,
      Value<String>? name,
      Value<int?>? productGroupId,
      Value<double>? price,
      Value<String?>? description,
      Value<String?>? image,
      Value<String?>? groupId,
      Value<bool>? isActive,
      Value<String?>? codeBarres,
      Value<String?>? sku,
      Value<String?>? createdById,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<DateTime?>? deletedAt}) {
    return ProductsDriftCompanion(
      id: id ?? this.id,
      remoteId: remoteId ?? this.remoteId,
      name: name ?? this.name,
      productGroupId: productGroupId ?? this.productGroupId,
      price: price ?? this.price,
      description: description ?? this.description,
      image: image ?? this.image,
      groupId: groupId ?? this.groupId,
      isActive: isActive ?? this.isActive,
      codeBarres: codeBarres ?? this.codeBarres,
      sku: sku ?? this.sku,
      createdById: createdById ?? this.createdById,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (remoteId.present) {
      map['remote_id'] = Variable<String>(remoteId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (productGroupId.present) {
      map['product_group_id'] = Variable<int>(productGroupId.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (description.present) {
      map['description'] = Variable<String>(description.value);
    }
    if (image.present) {
      map['image'] = Variable<String>(image.value);
    }
    if (groupId.present) {
      map['group_id'] = Variable<String>(groupId.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (codeBarres.present) {
      map['code_barres'] = Variable<String>(codeBarres.value);
    }
    if (sku.present) {
      map['sku'] = Variable<String>(sku.value);
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
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductsDriftCompanion(')
          ..write('id: $id, ')
          ..write('remoteId: $remoteId, ')
          ..write('name: $name, ')
          ..write('productGroupId: $productGroupId, ')
          ..write('price: $price, ')
          ..write('description: $description, ')
          ..write('image: $image, ')
          ..write('groupId: $groupId, ')
          ..write('isActive: $isActive, ')
          ..write('codeBarres: $codeBarres, ')
          ..write('sku: $sku, ')
          ..write('createdById: $createdById, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }
}

class $ProductOptionsDriftTable extends ProductOptionsDrift
    with TableInfo<$ProductOptionsDriftTable, ProductOptionsDriftData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $ProductOptionsDriftTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _remoteIdMeta =
      const VerificationMeta('remoteId');
  @override
  late final GeneratedColumn<String> remoteId = GeneratedColumn<String>(
      'remote_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _isMandatoryMeta =
      const VerificationMeta('isMandatory');
  @override
  late final GeneratedColumn<bool> isMandatory = GeneratedColumn<bool>(
      'is_mandatory', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("is_mandatory" IN (0, 1))'));
  static const VerificationMeta _minToSelectMeta =
      const VerificationMeta('minToSelect');
  @override
  late final GeneratedColumn<int> minToSelect = GeneratedColumn<int>(
      'min_to_select', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _maxToSelectMeta =
      const VerificationMeta('maxToSelect');
  @override
  late final GeneratedColumn<int> maxToSelect = GeneratedColumn<int>(
      'max_to_select', aliasedName, false,
      type: DriftSqlType.int, requiredDuringInsert: true);
  static const VerificationMeta _multipleSelectMeta =
      const VerificationMeta('multipleSelect');
  @override
  late final GeneratedColumn<bool> multipleSelect = GeneratedColumn<bool>(
      'multiple_select', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'CHECK ("multiple_select" IN (0, 1))'));
  static const VerificationMeta _isActiveMeta =
      const VerificationMeta('isActive');
  @override
  late final GeneratedColumn<bool> isActive = GeneratedColumn<bool>(
      'is_active', aliasedName, false,
      type: DriftSqlType.bool,
      requiredDuringInsert: true,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('CHECK ("is_active" IN (0, 1))'));
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
        remoteId,
        name,
        isMandatory,
        minToSelect,
        maxToSelect,
        multipleSelect,
        isActive,
        createdById,
        deletedAt,
        createdAt,
        updatedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'product_options_drift';
  @override
  VerificationContext validateIntegrity(
      Insertable<ProductOptionsDriftData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('remote_id')) {
      context.handle(_remoteIdMeta,
          remoteId.isAcceptableOrUnknown(data['remote_id']!, _remoteIdMeta));
    } else if (isInserting) {
      context.missing(_remoteIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('is_mandatory')) {
      context.handle(
          _isMandatoryMeta,
          isMandatory.isAcceptableOrUnknown(
              data['is_mandatory']!, _isMandatoryMeta));
    } else if (isInserting) {
      context.missing(_isMandatoryMeta);
    }
    if (data.containsKey('min_to_select')) {
      context.handle(
          _minToSelectMeta,
          minToSelect.isAcceptableOrUnknown(
              data['min_to_select']!, _minToSelectMeta));
    } else if (isInserting) {
      context.missing(_minToSelectMeta);
    }
    if (data.containsKey('max_to_select')) {
      context.handle(
          _maxToSelectMeta,
          maxToSelect.isAcceptableOrUnknown(
              data['max_to_select']!, _maxToSelectMeta));
    } else if (isInserting) {
      context.missing(_maxToSelectMeta);
    }
    if (data.containsKey('multiple_select')) {
      context.handle(
          _multipleSelectMeta,
          multipleSelect.isAcceptableOrUnknown(
              data['multiple_select']!, _multipleSelectMeta));
    } else if (isInserting) {
      context.missing(_multipleSelectMeta);
    }
    if (data.containsKey('is_active')) {
      context.handle(_isActiveMeta,
          isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta));
    } else if (isInserting) {
      context.missing(_isActiveMeta);
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
  ProductOptionsDriftData map(Map<String, dynamic> data,
      {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return ProductOptionsDriftData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      remoteId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}remote_id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      isMandatory: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_mandatory'])!,
      minToSelect: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}min_to_select'])!,
      maxToSelect: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}max_to_select'])!,
      multipleSelect: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}multiple_select'])!,
      isActive: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_active'])!,
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
  $ProductOptionsDriftTable createAlias(String alias) {
    return $ProductOptionsDriftTable(attachedDatabase, alias);
  }
}

class ProductOptionsDriftData extends DataClass
    implements Insertable<ProductOptionsDriftData> {
  final int id;
  final String remoteId;
  final String name;
  final bool isMandatory;
  final int minToSelect;
  final int maxToSelect;
  final bool multipleSelect;
  final bool isActive;
  final String? createdById;
  final DateTime? deletedAt;
  final DateTime createdAt;
  final DateTime updatedAt;
  const ProductOptionsDriftData(
      {required this.id,
      required this.remoteId,
      required this.name,
      required this.isMandatory,
      required this.minToSelect,
      required this.maxToSelect,
      required this.multipleSelect,
      required this.isActive,
      this.createdById,
      this.deletedAt,
      required this.createdAt,
      required this.updatedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['remote_id'] = Variable<String>(remoteId);
    map['name'] = Variable<String>(name);
    map['is_mandatory'] = Variable<bool>(isMandatory);
    map['min_to_select'] = Variable<int>(minToSelect);
    map['max_to_select'] = Variable<int>(maxToSelect);
    map['multiple_select'] = Variable<bool>(multipleSelect);
    map['is_active'] = Variable<bool>(isActive);
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

  ProductOptionsDriftCompanion toCompanion(bool nullToAbsent) {
    return ProductOptionsDriftCompanion(
      id: Value(id),
      remoteId: Value(remoteId),
      name: Value(name),
      isMandatory: Value(isMandatory),
      minToSelect: Value(minToSelect),
      maxToSelect: Value(maxToSelect),
      multipleSelect: Value(multipleSelect),
      isActive: Value(isActive),
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

  factory ProductOptionsDriftData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return ProductOptionsDriftData(
      id: serializer.fromJson<int>(json['id']),
      remoteId: serializer.fromJson<String>(json['remoteId']),
      name: serializer.fromJson<String>(json['name']),
      isMandatory: serializer.fromJson<bool>(json['isMandatory']),
      minToSelect: serializer.fromJson<int>(json['minToSelect']),
      maxToSelect: serializer.fromJson<int>(json['maxToSelect']),
      multipleSelect: serializer.fromJson<bool>(json['multipleSelect']),
      isActive: serializer.fromJson<bool>(json['isActive']),
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
      'id': serializer.toJson<int>(id),
      'remoteId': serializer.toJson<String>(remoteId),
      'name': serializer.toJson<String>(name),
      'isMandatory': serializer.toJson<bool>(isMandatory),
      'minToSelect': serializer.toJson<int>(minToSelect),
      'maxToSelect': serializer.toJson<int>(maxToSelect),
      'multipleSelect': serializer.toJson<bool>(multipleSelect),
      'isActive': serializer.toJson<bool>(isActive),
      'createdById': serializer.toJson<String?>(createdById),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
    };
  }

  ProductOptionsDriftData copyWith(
          {int? id,
          String? remoteId,
          String? name,
          bool? isMandatory,
          int? minToSelect,
          int? maxToSelect,
          bool? multipleSelect,
          bool? isActive,
          Value<String?> createdById = const Value.absent(),
          Value<DateTime?> deletedAt = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt}) =>
      ProductOptionsDriftData(
        id: id ?? this.id,
        remoteId: remoteId ?? this.remoteId,
        name: name ?? this.name,
        isMandatory: isMandatory ?? this.isMandatory,
        minToSelect: minToSelect ?? this.minToSelect,
        maxToSelect: maxToSelect ?? this.maxToSelect,
        multipleSelect: multipleSelect ?? this.multipleSelect,
        isActive: isActive ?? this.isActive,
        createdById: createdById.present ? createdById.value : this.createdById,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
      );
  ProductOptionsDriftData copyWithCompanion(ProductOptionsDriftCompanion data) {
    return ProductOptionsDriftData(
      id: data.id.present ? data.id.value : this.id,
      remoteId: data.remoteId.present ? data.remoteId.value : this.remoteId,
      name: data.name.present ? data.name.value : this.name,
      isMandatory:
          data.isMandatory.present ? data.isMandatory.value : this.isMandatory,
      minToSelect:
          data.minToSelect.present ? data.minToSelect.value : this.minToSelect,
      maxToSelect:
          data.maxToSelect.present ? data.maxToSelect.value : this.maxToSelect,
      multipleSelect: data.multipleSelect.present
          ? data.multipleSelect.value
          : this.multipleSelect,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      createdById:
          data.createdById.present ? data.createdById.value : this.createdById,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('ProductOptionsDriftData(')
          ..write('id: $id, ')
          ..write('remoteId: $remoteId, ')
          ..write('name: $name, ')
          ..write('isMandatory: $isMandatory, ')
          ..write('minToSelect: $minToSelect, ')
          ..write('maxToSelect: $maxToSelect, ')
          ..write('multipleSelect: $multipleSelect, ')
          ..write('isActive: $isActive, ')
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
      remoteId,
      name,
      isMandatory,
      minToSelect,
      maxToSelect,
      multipleSelect,
      isActive,
      createdById,
      deletedAt,
      createdAt,
      updatedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductOptionsDriftData &&
          other.id == this.id &&
          other.remoteId == this.remoteId &&
          other.name == this.name &&
          other.isMandatory == this.isMandatory &&
          other.minToSelect == this.minToSelect &&
          other.maxToSelect == this.maxToSelect &&
          other.multipleSelect == this.multipleSelect &&
          other.isActive == this.isActive &&
          other.createdById == this.createdById &&
          other.deletedAt == this.deletedAt &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt);
}

class ProductOptionsDriftCompanion
    extends UpdateCompanion<ProductOptionsDriftData> {
  final Value<int> id;
  final Value<String> remoteId;
  final Value<String> name;
  final Value<bool> isMandatory;
  final Value<int> minToSelect;
  final Value<int> maxToSelect;
  final Value<bool> multipleSelect;
  final Value<bool> isActive;
  final Value<String?> createdById;
  final Value<DateTime?> deletedAt;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  const ProductOptionsDriftCompanion({
    this.id = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.name = const Value.absent(),
    this.isMandatory = const Value.absent(),
    this.minToSelect = const Value.absent(),
    this.maxToSelect = const Value.absent(),
    this.multipleSelect = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdById = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
  });
  ProductOptionsDriftCompanion.insert({
    this.id = const Value.absent(),
    required String remoteId,
    required String name,
    required bool isMandatory,
    required int minToSelect,
    required int maxToSelect,
    required bool multipleSelect,
    required bool isActive,
    this.createdById = const Value.absent(),
    this.deletedAt = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
  })  : remoteId = Value(remoteId),
        name = Value(name),
        isMandatory = Value(isMandatory),
        minToSelect = Value(minToSelect),
        maxToSelect = Value(maxToSelect),
        multipleSelect = Value(multipleSelect),
        isActive = Value(isActive),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<ProductOptionsDriftData> custom({
    Expression<int>? id,
    Expression<String>? remoteId,
    Expression<String>? name,
    Expression<bool>? isMandatory,
    Expression<int>? minToSelect,
    Expression<int>? maxToSelect,
    Expression<bool>? multipleSelect,
    Expression<bool>? isActive,
    Expression<String>? createdById,
    Expression<DateTime>? deletedAt,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (remoteId != null) 'remote_id': remoteId,
      if (name != null) 'name': name,
      if (isMandatory != null) 'is_mandatory': isMandatory,
      if (minToSelect != null) 'min_to_select': minToSelect,
      if (maxToSelect != null) 'max_to_select': maxToSelect,
      if (multipleSelect != null) 'multiple_select': multipleSelect,
      if (isActive != null) 'is_active': isActive,
      if (createdById != null) 'created_by_id': createdById,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
    });
  }

  ProductOptionsDriftCompanion copyWith(
      {Value<int>? id,
      Value<String>? remoteId,
      Value<String>? name,
      Value<bool>? isMandatory,
      Value<int>? minToSelect,
      Value<int>? maxToSelect,
      Value<bool>? multipleSelect,
      Value<bool>? isActive,
      Value<String?>? createdById,
      Value<DateTime?>? deletedAt,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt}) {
    return ProductOptionsDriftCompanion(
      id: id ?? this.id,
      remoteId: remoteId ?? this.remoteId,
      name: name ?? this.name,
      isMandatory: isMandatory ?? this.isMandatory,
      minToSelect: minToSelect ?? this.minToSelect,
      maxToSelect: maxToSelect ?? this.maxToSelect,
      multipleSelect: multipleSelect ?? this.multipleSelect,
      isActive: isActive ?? this.isActive,
      createdById: createdById ?? this.createdById,
      deletedAt: deletedAt ?? this.deletedAt,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (remoteId.present) {
      map['remote_id'] = Variable<String>(remoteId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (isMandatory.present) {
      map['is_mandatory'] = Variable<bool>(isMandatory.value);
    }
    if (minToSelect.present) {
      map['min_to_select'] = Variable<int>(minToSelect.value);
    }
    if (maxToSelect.present) {
      map['max_to_select'] = Variable<int>(maxToSelect.value);
    }
    if (multipleSelect.present) {
      map['multiple_select'] = Variable<bool>(multipleSelect.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
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
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('ProductOptionsDriftCompanion(')
          ..write('id: $id, ')
          ..write('remoteId: $remoteId, ')
          ..write('name: $name, ')
          ..write('isMandatory: $isMandatory, ')
          ..write('minToSelect: $minToSelect, ')
          ..write('maxToSelect: $maxToSelect, ')
          ..write('multipleSelect: $multipleSelect, ')
          ..write('isActive: $isActive, ')
          ..write('createdById: $createdById, ')
          ..write('deletedAt: $deletedAt, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt')
          ..write(')'))
        .toString();
  }
}

class $OptionItemsDriftTable extends OptionItemsDrift
    with TableInfo<$OptionItemsDriftTable, OptionItemsDriftData> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $OptionItemsDriftTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _remoteIdMeta =
      const VerificationMeta('remoteId');
  @override
  late final GeneratedColumn<String> remoteId = GeneratedColumn<String>(
      'remote_id', aliasedName, false,
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _productOptionIdMeta =
      const VerificationMeta('productOptionId');
  @override
  late final GeneratedColumn<int> productOptionId = GeneratedColumn<int>(
      'product_option_id', aliasedName, false,
      type: DriftSqlType.int,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways(
          'REFERENCES product_options_drift (id)'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
      'price', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _vatMeta = const VerificationMeta('vat');
  @override
  late final GeneratedColumn<double> vat = GeneratedColumn<double>(
      'vat', aliasedName, true,
      type: DriftSqlType.double,
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
  static const VerificationMeta _groupIdMeta =
      const VerificationMeta('groupId');
  @override
  late final GeneratedColumn<String> groupId = GeneratedColumn<String>(
      'group_id', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
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
        remoteId,
        productOptionId,
        name,
        price,
        vat,
        isActive,
        groupId,
        createdById,
        createdAt,
        updatedAt,
        deletedAt
      ];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'option_items_drift';
  @override
  VerificationContext validateIntegrity(
      Insertable<OptionItemsDriftData> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('remote_id')) {
      context.handle(_remoteIdMeta,
          remoteId.isAcceptableOrUnknown(data['remote_id']!, _remoteIdMeta));
    } else if (isInserting) {
      context.missing(_remoteIdMeta);
    }
    if (data.containsKey('product_option_id')) {
      context.handle(
          _productOptionIdMeta,
          productOptionId.isAcceptableOrUnknown(
              data['product_option_id']!, _productOptionIdMeta));
    } else if (isInserting) {
      context.missing(_productOptionIdMeta);
    }
    if (data.containsKey('name')) {
      context.handle(
          _nameMeta, name.isAcceptableOrUnknown(data['name']!, _nameMeta));
    } else if (isInserting) {
      context.missing(_nameMeta);
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    }
    if (data.containsKey('vat')) {
      context.handle(
          _vatMeta, vat.isAcceptableOrUnknown(data['vat']!, _vatMeta));
    }
    if (data.containsKey('is_active')) {
      context.handle(_isActiveMeta,
          isActive.isAcceptableOrUnknown(data['is_active']!, _isActiveMeta));
    }
    if (data.containsKey('group_id')) {
      context.handle(_groupIdMeta,
          groupId.isAcceptableOrUnknown(data['group_id']!, _groupIdMeta));
    } else if (isInserting) {
      context.missing(_groupIdMeta);
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
  OptionItemsDriftData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OptionItemsDriftData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      remoteId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}remote_id'])!,
      productOptionId: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}product_option_id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      price: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}price'])!,
      vat: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}vat']),
      isActive: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_active'])!,
      groupId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}group_id'])!,
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
  $OptionItemsDriftTable createAlias(String alias) {
    return $OptionItemsDriftTable(attachedDatabase, alias);
  }
}

class OptionItemsDriftData extends DataClass
    implements Insertable<OptionItemsDriftData> {
  final int id;
  final String remoteId;
  final int productOptionId;
  final String name;
  final double price;
  final double? vat;
  final bool isActive;
  final String groupId;
  final String? createdById;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  const OptionItemsDriftData(
      {required this.id,
      required this.remoteId,
      required this.productOptionId,
      required this.name,
      required this.price,
      this.vat,
      required this.isActive,
      required this.groupId,
      this.createdById,
      required this.createdAt,
      required this.updatedAt,
      this.deletedAt});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    map['remote_id'] = Variable<String>(remoteId);
    map['product_option_id'] = Variable<int>(productOptionId);
    map['name'] = Variable<String>(name);
    map['price'] = Variable<double>(price);
    if (!nullToAbsent || vat != null) {
      map['vat'] = Variable<double>(vat);
    }
    map['is_active'] = Variable<bool>(isActive);
    map['group_id'] = Variable<String>(groupId);
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

  OptionItemsDriftCompanion toCompanion(bool nullToAbsent) {
    return OptionItemsDriftCompanion(
      id: Value(id),
      remoteId: Value(remoteId),
      productOptionId: Value(productOptionId),
      name: Value(name),
      price: Value(price),
      vat: vat == null && nullToAbsent ? const Value.absent() : Value(vat),
      isActive: Value(isActive),
      groupId: Value(groupId),
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

  factory OptionItemsDriftData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OptionItemsDriftData(
      id: serializer.fromJson<int>(json['id']),
      remoteId: serializer.fromJson<String>(json['remoteId']),
      productOptionId: serializer.fromJson<int>(json['productOptionId']),
      name: serializer.fromJson<String>(json['name']),
      price: serializer.fromJson<double>(json['price']),
      vat: serializer.fromJson<double?>(json['vat']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      groupId: serializer.fromJson<String>(json['groupId']),
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
      'id': serializer.toJson<int>(id),
      'remoteId': serializer.toJson<String>(remoteId),
      'productOptionId': serializer.toJson<int>(productOptionId),
      'name': serializer.toJson<String>(name),
      'price': serializer.toJson<double>(price),
      'vat': serializer.toJson<double?>(vat),
      'isActive': serializer.toJson<bool>(isActive),
      'groupId': serializer.toJson<String>(groupId),
      'createdById': serializer.toJson<String?>(createdById),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  OptionItemsDriftData copyWith(
          {int? id,
          String? remoteId,
          int? productOptionId,
          String? name,
          double? price,
          Value<double?> vat = const Value.absent(),
          bool? isActive,
          String? groupId,
          Value<String?> createdById = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt,
          Value<DateTime?> deletedAt = const Value.absent()}) =>
      OptionItemsDriftData(
        id: id ?? this.id,
        remoteId: remoteId ?? this.remoteId,
        productOptionId: productOptionId ?? this.productOptionId,
        name: name ?? this.name,
        price: price ?? this.price,
        vat: vat.present ? vat.value : this.vat,
        isActive: isActive ?? this.isActive,
        groupId: groupId ?? this.groupId,
        createdById: createdById.present ? createdById.value : this.createdById,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
      );
  OptionItemsDriftData copyWithCompanion(OptionItemsDriftCompanion data) {
    return OptionItemsDriftData(
      id: data.id.present ? data.id.value : this.id,
      remoteId: data.remoteId.present ? data.remoteId.value : this.remoteId,
      productOptionId: data.productOptionId.present
          ? data.productOptionId.value
          : this.productOptionId,
      name: data.name.present ? data.name.value : this.name,
      price: data.price.present ? data.price.value : this.price,
      vat: data.vat.present ? data.vat.value : this.vat,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      groupId: data.groupId.present ? data.groupId.value : this.groupId,
      createdById:
          data.createdById.present ? data.createdById.value : this.createdById,
      createdAt: data.createdAt.present ? data.createdAt.value : this.createdAt,
      updatedAt: data.updatedAt.present ? data.updatedAt.value : this.updatedAt,
      deletedAt: data.deletedAt.present ? data.deletedAt.value : this.deletedAt,
    );
  }

  @override
  String toString() {
    return (StringBuffer('OptionItemsDriftData(')
          ..write('id: $id, ')
          ..write('remoteId: $remoteId, ')
          ..write('productOptionId: $productOptionId, ')
          ..write('name: $name, ')
          ..write('price: $price, ')
          ..write('vat: $vat, ')
          ..write('isActive: $isActive, ')
          ..write('groupId: $groupId, ')
          ..write('createdById: $createdById, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, remoteId, productOptionId, name, price,
      vat, isActive, groupId, createdById, createdAt, updatedAt, deletedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is OptionItemsDriftData &&
          other.id == this.id &&
          other.remoteId == this.remoteId &&
          other.productOptionId == this.productOptionId &&
          other.name == this.name &&
          other.price == this.price &&
          other.vat == this.vat &&
          other.isActive == this.isActive &&
          other.groupId == this.groupId &&
          other.createdById == this.createdById &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt);
}

class OptionItemsDriftCompanion extends UpdateCompanion<OptionItemsDriftData> {
  final Value<int> id;
  final Value<String> remoteId;
  final Value<int> productOptionId;
  final Value<String> name;
  final Value<double> price;
  final Value<double?> vat;
  final Value<bool> isActive;
  final Value<String> groupId;
  final Value<String?> createdById;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  const OptionItemsDriftCompanion({
    this.id = const Value.absent(),
    this.remoteId = const Value.absent(),
    this.productOptionId = const Value.absent(),
    this.name = const Value.absent(),
    this.price = const Value.absent(),
    this.vat = const Value.absent(),
    this.isActive = const Value.absent(),
    this.groupId = const Value.absent(),
    this.createdById = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
  });
  OptionItemsDriftCompanion.insert({
    this.id = const Value.absent(),
    required String remoteId,
    required int productOptionId,
    required String name,
    this.price = const Value.absent(),
    this.vat = const Value.absent(),
    this.isActive = const Value.absent(),
    required String groupId,
    this.createdById = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
  })  : remoteId = Value(remoteId),
        productOptionId = Value(productOptionId),
        name = Value(name),
        groupId = Value(groupId),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<OptionItemsDriftData> custom({
    Expression<int>? id,
    Expression<String>? remoteId,
    Expression<int>? productOptionId,
    Expression<String>? name,
    Expression<double>? price,
    Expression<double>? vat,
    Expression<bool>? isActive,
    Expression<String>? groupId,
    Expression<String>? createdById,
    Expression<DateTime>? createdAt,
    Expression<DateTime>? updatedAt,
    Expression<DateTime>? deletedAt,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (remoteId != null) 'remote_id': remoteId,
      if (productOptionId != null) 'product_option_id': productOptionId,
      if (name != null) 'name': name,
      if (price != null) 'price': price,
      if (vat != null) 'vat': vat,
      if (isActive != null) 'is_active': isActive,
      if (groupId != null) 'group_id': groupId,
      if (createdById != null) 'created_by_id': createdById,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
    });
  }

  OptionItemsDriftCompanion copyWith(
      {Value<int>? id,
      Value<String>? remoteId,
      Value<int>? productOptionId,
      Value<String>? name,
      Value<double>? price,
      Value<double?>? vat,
      Value<bool>? isActive,
      Value<String>? groupId,
      Value<String?>? createdById,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<DateTime?>? deletedAt}) {
    return OptionItemsDriftCompanion(
      id: id ?? this.id,
      remoteId: remoteId ?? this.remoteId,
      productOptionId: productOptionId ?? this.productOptionId,
      name: name ?? this.name,
      price: price ?? this.price,
      vat: vat ?? this.vat,
      isActive: isActive ?? this.isActive,
      groupId: groupId ?? this.groupId,
      createdById: createdById ?? this.createdById,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      deletedAt: deletedAt ?? this.deletedAt,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (remoteId.present) {
      map['remote_id'] = Variable<String>(remoteId.value);
    }
    if (productOptionId.present) {
      map['product_option_id'] = Variable<int>(productOptionId.value);
    }
    if (name.present) {
      map['name'] = Variable<String>(name.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (vat.present) {
      map['vat'] = Variable<double>(vat.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
    }
    if (groupId.present) {
      map['group_id'] = Variable<String>(groupId.value);
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
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('OptionItemsDriftCompanion(')
          ..write('id: $id, ')
          ..write('remoteId: $remoteId, ')
          ..write('productOptionId: $productOptionId, ')
          ..write('name: $name, ')
          ..write('price: $price, ')
          ..write('vat: $vat, ')
          ..write('isActive: $isActive, ')
          ..write('groupId: $groupId, ')
          ..write('createdById: $createdById, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }
}

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $ProductGroupsDriftTable productGroupsDrift =
      $ProductGroupsDriftTable(this);
  late final $ProductsDriftTable productsDrift = $ProductsDriftTable(this);
  late final $ProductOptionsDriftTable productOptionsDrift =
      $ProductOptionsDriftTable(this);
  late final $OptionItemsDriftTable optionItemsDrift =
      $OptionItemsDriftTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        productGroupsDrift,
        productsDrift,
        productOptionsDrift,
        optionItemsDrift
      ];
}

typedef $$ProductGroupsDriftTableCreateCompanionBuilder
    = ProductGroupsDriftCompanion Function({
  Value<int> id,
  required String remoteId,
  required String name,
  Value<bool> isActive,
  Value<String?> parentId,
  Value<String?> createdById,
  required int productGroupId,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<DateTime?> deletedAt,
});
typedef $$ProductGroupsDriftTableUpdateCompanionBuilder
    = ProductGroupsDriftCompanion Function({
  Value<int> id,
  Value<String> remoteId,
  Value<String> name,
  Value<bool> isActive,
  Value<String?> parentId,
  Value<String?> createdById,
  Value<int> productGroupId,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
});

final class $$ProductGroupsDriftTableReferences extends BaseReferences<
    _$AppDatabase, $ProductGroupsDriftTable, ProductGroupsDriftData> {
  $$ProductGroupsDriftTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $ProductGroupsDriftTable _productGroupIdTable(_$AppDatabase db) =>
      db.productGroupsDrift.createAlias($_aliasNameGenerator(
          db.productGroupsDrift.productGroupId, db.productGroupsDrift.id));

  $$ProductGroupsDriftTableProcessedTableManager get productGroupId {
    final $_column = $_itemColumn<int>('product_group_id')!;

    final manager =
        $$ProductGroupsDriftTableTableManager($_db, $_db.productGroupsDrift)
            .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_productGroupIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static MultiTypedResultKey<$ProductsDriftTable, List<ProductsDriftData>>
      _productsDriftRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.productsDrift,
              aliasName: $_aliasNameGenerator(
                  db.productGroupsDrift.id, db.productsDrift.productGroupId));

  $$ProductsDriftTableProcessedTableManager get productsDriftRefs {
    final manager = $$ProductsDriftTableTableManager($_db, $_db.productsDrift)
        .filter((f) => f.productGroupId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache = $_typedResult.readTableOrNull(_productsDriftRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$ProductGroupsDriftTableFilterComposer
    extends Composer<_$AppDatabase, $ProductGroupsDriftTable> {
  $$ProductGroupsDriftTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get remoteId => $composableBuilder(
      column: $table.remoteId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get parentId => $composableBuilder(
      column: $table.parentId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get createdById => $composableBuilder(
      column: $table.createdById, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));

  $$ProductGroupsDriftTableFilterComposer get productGroupId {
    final $$ProductGroupsDriftTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.productGroupId,
        referencedTable: $db.productGroupsDrift,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProductGroupsDriftTableFilterComposer(
              $db: $db,
              $table: $db.productGroupsDrift,
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
        getReferencedColumn: (t) => t.productGroupId,
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

class $$ProductGroupsDriftTableOrderingComposer
    extends Composer<_$AppDatabase, $ProductGroupsDriftTable> {
  $$ProductGroupsDriftTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get remoteId => $composableBuilder(
      column: $table.remoteId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get parentId => $composableBuilder(
      column: $table.parentId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get createdById => $composableBuilder(
      column: $table.createdById, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));

  $$ProductGroupsDriftTableOrderingComposer get productGroupId {
    final $$ProductGroupsDriftTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.productGroupId,
        referencedTable: $db.productGroupsDrift,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProductGroupsDriftTableOrderingComposer(
              $db: $db,
              $table: $db.productGroupsDrift,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$ProductGroupsDriftTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProductGroupsDriftTable> {
  $$ProductGroupsDriftTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get remoteId =>
      $composableBuilder(column: $table.remoteId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<String> get parentId =>
      $composableBuilder(column: $table.parentId, builder: (column) => column);

  GeneratedColumn<String> get createdById => $composableBuilder(
      column: $table.createdById, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  $$ProductGroupsDriftTableAnnotationComposer get productGroupId {
    final $$ProductGroupsDriftTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.productGroupId,
            referencedTable: $db.productGroupsDrift,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$ProductGroupsDriftTableAnnotationComposer(
                  $db: $db,
                  $table: $db.productGroupsDrift,
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
        getReferencedColumn: (t) => t.productGroupId,
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

class $$ProductGroupsDriftTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ProductGroupsDriftTable,
    ProductGroupsDriftData,
    $$ProductGroupsDriftTableFilterComposer,
    $$ProductGroupsDriftTableOrderingComposer,
    $$ProductGroupsDriftTableAnnotationComposer,
    $$ProductGroupsDriftTableCreateCompanionBuilder,
    $$ProductGroupsDriftTableUpdateCompanionBuilder,
    (ProductGroupsDriftData, $$ProductGroupsDriftTableReferences),
    ProductGroupsDriftData,
    PrefetchHooks Function({bool productGroupId, bool productsDriftRefs})> {
  $$ProductGroupsDriftTableTableManager(
      _$AppDatabase db, $ProductGroupsDriftTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProductGroupsDriftTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProductGroupsDriftTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProductGroupsDriftTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> remoteId = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            Value<String?> parentId = const Value.absent(),
            Value<String?> createdById = const Value.absent(),
            Value<int> productGroupId = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
          }) =>
              ProductGroupsDriftCompanion(
            id: id,
            remoteId: remoteId,
            name: name,
            isActive: isActive,
            parentId: parentId,
            createdById: createdById,
            productGroupId: productGroupId,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String remoteId,
            required String name,
            Value<bool> isActive = const Value.absent(),
            Value<String?> parentId = const Value.absent(),
            Value<String?> createdById = const Value.absent(),
            required int productGroupId,
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<DateTime?> deletedAt = const Value.absent(),
          }) =>
              ProductGroupsDriftCompanion.insert(
            id: id,
            remoteId: remoteId,
            name: name,
            isActive: isActive,
            parentId: parentId,
            createdById: createdById,
            productGroupId: productGroupId,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$ProductGroupsDriftTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: (
              {productGroupId = false, productsDriftRefs = false}) {
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
                if (productGroupId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.productGroupId,
                    referencedTable: $$ProductGroupsDriftTableReferences
                        ._productGroupIdTable(db),
                    referencedColumn: $$ProductGroupsDriftTableReferences
                        ._productGroupIdTable(db)
                        .id,
                  ) as T;
                }

                return state;
              },
              getPrefetchedDataCallback: (items) async {
                return [
                  if (productsDriftRefs)
                    await $_getPrefetchedData<ProductGroupsDriftData,
                            $ProductGroupsDriftTable, ProductsDriftData>(
                        currentTable: table,
                        referencedTable: $$ProductGroupsDriftTableReferences
                            ._productsDriftRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$ProductGroupsDriftTableReferences(db, table, p0)
                                .productsDriftRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.productGroupId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$ProductGroupsDriftTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ProductGroupsDriftTable,
    ProductGroupsDriftData,
    $$ProductGroupsDriftTableFilterComposer,
    $$ProductGroupsDriftTableOrderingComposer,
    $$ProductGroupsDriftTableAnnotationComposer,
    $$ProductGroupsDriftTableCreateCompanionBuilder,
    $$ProductGroupsDriftTableUpdateCompanionBuilder,
    (ProductGroupsDriftData, $$ProductGroupsDriftTableReferences),
    ProductGroupsDriftData,
    PrefetchHooks Function({bool productGroupId, bool productsDriftRefs})>;
typedef $$ProductsDriftTableCreateCompanionBuilder = ProductsDriftCompanion
    Function({
  Value<int> id,
  required String remoteId,
  required String name,
  Value<int?> productGroupId,
  required double price,
  Value<String?> description,
  Value<String?> image,
  Value<String?> groupId,
  Value<bool> isActive,
  Value<String?> codeBarres,
  Value<String?> sku,
  Value<String?> createdById,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<DateTime?> deletedAt,
});
typedef $$ProductsDriftTableUpdateCompanionBuilder = ProductsDriftCompanion
    Function({
  Value<int> id,
  Value<String> remoteId,
  Value<String> name,
  Value<int?> productGroupId,
  Value<double> price,
  Value<String?> description,
  Value<String?> image,
  Value<String?> groupId,
  Value<bool> isActive,
  Value<String?> codeBarres,
  Value<String?> sku,
  Value<String?> createdById,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
});

final class $$ProductsDriftTableReferences extends BaseReferences<_$AppDatabase,
    $ProductsDriftTable, ProductsDriftData> {
  $$ProductsDriftTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $ProductGroupsDriftTable _productGroupIdTable(_$AppDatabase db) =>
      db.productGroupsDrift.createAlias($_aliasNameGenerator(
          db.productsDrift.productGroupId, db.productGroupsDrift.id));

  $$ProductGroupsDriftTableProcessedTableManager? get productGroupId {
    final $_column = $_itemColumn<int>('product_group_id');
    if ($_column == null) return null;
    final manager =
        $$ProductGroupsDriftTableTableManager($_db, $_db.productGroupsDrift)
            .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_productGroupIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
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
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get remoteId => $composableBuilder(
      column: $table.remoteId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get price => $composableBuilder(
      column: $table.price, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get image => $composableBuilder(
      column: $table.image, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get groupId => $composableBuilder(
      column: $table.groupId, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get codeBarres => $composableBuilder(
      column: $table.codeBarres, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get sku => $composableBuilder(
      column: $table.sku, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get createdById => $composableBuilder(
      column: $table.createdById, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));

  $$ProductGroupsDriftTableFilterComposer get productGroupId {
    final $$ProductGroupsDriftTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.productGroupId,
        referencedTable: $db.productGroupsDrift,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProductGroupsDriftTableFilterComposer(
              $db: $db,
              $table: $db.productGroupsDrift,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
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
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get remoteId => $composableBuilder(
      column: $table.remoteId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get price => $composableBuilder(
      column: $table.price, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get image => $composableBuilder(
      column: $table.image, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get groupId => $composableBuilder(
      column: $table.groupId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get codeBarres => $composableBuilder(
      column: $table.codeBarres, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get sku => $composableBuilder(
      column: $table.sku, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get createdById => $composableBuilder(
      column: $table.createdById, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));

  $$ProductGroupsDriftTableOrderingComposer get productGroupId {
    final $$ProductGroupsDriftTableOrderingComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.productGroupId,
        referencedTable: $db.productGroupsDrift,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProductGroupsDriftTableOrderingComposer(
              $db: $db,
              $table: $db.productGroupsDrift,
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
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get remoteId =>
      $composableBuilder(column: $table.remoteId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<double> get price =>
      $composableBuilder(column: $table.price, builder: (column) => column);

  GeneratedColumn<String> get description => $composableBuilder(
      column: $table.description, builder: (column) => column);

  GeneratedColumn<String> get image =>
      $composableBuilder(column: $table.image, builder: (column) => column);

  GeneratedColumn<String> get groupId =>
      $composableBuilder(column: $table.groupId, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<String> get codeBarres => $composableBuilder(
      column: $table.codeBarres, builder: (column) => column);

  GeneratedColumn<String> get sku =>
      $composableBuilder(column: $table.sku, builder: (column) => column);

  GeneratedColumn<String> get createdById => $composableBuilder(
      column: $table.createdById, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  $$ProductGroupsDriftTableAnnotationComposer get productGroupId {
    final $$ProductGroupsDriftTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.productGroupId,
            referencedTable: $db.productGroupsDrift,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$ProductGroupsDriftTableAnnotationComposer(
                  $db: $db,
                  $table: $db.productGroupsDrift,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
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
    PrefetchHooks Function({bool productGroupId})> {
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
            Value<int> id = const Value.absent(),
            Value<String> remoteId = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<int?> productGroupId = const Value.absent(),
            Value<double> price = const Value.absent(),
            Value<String?> description = const Value.absent(),
            Value<String?> image = const Value.absent(),
            Value<String?> groupId = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            Value<String?> codeBarres = const Value.absent(),
            Value<String?> sku = const Value.absent(),
            Value<String?> createdById = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
          }) =>
              ProductsDriftCompanion(
            id: id,
            remoteId: remoteId,
            name: name,
            productGroupId: productGroupId,
            price: price,
            description: description,
            image: image,
            groupId: groupId,
            isActive: isActive,
            codeBarres: codeBarres,
            sku: sku,
            createdById: createdById,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String remoteId,
            required String name,
            Value<int?> productGroupId = const Value.absent(),
            required double price,
            Value<String?> description = const Value.absent(),
            Value<String?> image = const Value.absent(),
            Value<String?> groupId = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            Value<String?> codeBarres = const Value.absent(),
            Value<String?> sku = const Value.absent(),
            Value<String?> createdById = const Value.absent(),
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<DateTime?> deletedAt = const Value.absent(),
          }) =>
              ProductsDriftCompanion.insert(
            id: id,
            remoteId: remoteId,
            name: name,
            productGroupId: productGroupId,
            price: price,
            description: description,
            image: image,
            groupId: groupId,
            isActive: isActive,
            codeBarres: codeBarres,
            sku: sku,
            createdById: createdById,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$ProductsDriftTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({productGroupId = false}) {
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
                if (productGroupId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.productGroupId,
                    referencedTable:
                        $$ProductsDriftTableReferences._productGroupIdTable(db),
                    referencedColumn: $$ProductsDriftTableReferences
                        ._productGroupIdTable(db)
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
    PrefetchHooks Function({bool productGroupId})>;
typedef $$ProductOptionsDriftTableCreateCompanionBuilder
    = ProductOptionsDriftCompanion Function({
  Value<int> id,
  required String remoteId,
  required String name,
  required bool isMandatory,
  required int minToSelect,
  required int maxToSelect,
  required bool multipleSelect,
  required bool isActive,
  Value<String?> createdById,
  Value<DateTime?> deletedAt,
  required DateTime createdAt,
  required DateTime updatedAt,
});
typedef $$ProductOptionsDriftTableUpdateCompanionBuilder
    = ProductOptionsDriftCompanion Function({
  Value<int> id,
  Value<String> remoteId,
  Value<String> name,
  Value<bool> isMandatory,
  Value<int> minToSelect,
  Value<int> maxToSelect,
  Value<bool> multipleSelect,
  Value<bool> isActive,
  Value<String?> createdById,
  Value<DateTime?> deletedAt,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
});

final class $$ProductOptionsDriftTableReferences extends BaseReferences<
    _$AppDatabase, $ProductOptionsDriftTable, ProductOptionsDriftData> {
  $$ProductOptionsDriftTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$OptionItemsDriftTable, List<OptionItemsDriftData>>
      _optionItemsDriftRefsTable(_$AppDatabase db) =>
          MultiTypedResultKey.fromTable(db.optionItemsDrift,
              aliasName: $_aliasNameGenerator(db.productOptionsDrift.id,
                  db.optionItemsDrift.productOptionId));

  $$OptionItemsDriftTableProcessedTableManager get optionItemsDriftRefs {
    final manager =
        $$OptionItemsDriftTableTableManager($_db, $_db.optionItemsDrift).filter(
            (f) => f.productOptionId.id.sqlEquals($_itemColumn<int>('id')!));

    final cache =
        $_typedResult.readTableOrNull(_optionItemsDriftRefsTable($_db));
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: cache));
  }
}

class $$ProductOptionsDriftTableFilterComposer
    extends Composer<_$AppDatabase, $ProductOptionsDriftTable> {
  $$ProductOptionsDriftTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get remoteId => $composableBuilder(
      column: $table.remoteId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isMandatory => $composableBuilder(
      column: $table.isMandatory, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get minToSelect => $composableBuilder(
      column: $table.minToSelect, builder: (column) => ColumnFilters(column));

  ColumnFilters<int> get maxToSelect => $composableBuilder(
      column: $table.maxToSelect, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get multipleSelect => $composableBuilder(
      column: $table.multipleSelect,
      builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get createdById => $composableBuilder(
      column: $table.createdById, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  Expression<bool> optionItemsDriftRefs(
      Expression<bool> Function($$OptionItemsDriftTableFilterComposer f) f) {
    final $$OptionItemsDriftTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.optionItemsDrift,
        getReferencedColumn: (t) => t.productOptionId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$OptionItemsDriftTableFilterComposer(
              $db: $db,
              $table: $db.optionItemsDrift,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$ProductOptionsDriftTableOrderingComposer
    extends Composer<_$AppDatabase, $ProductOptionsDriftTable> {
  $$ProductOptionsDriftTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get remoteId => $composableBuilder(
      column: $table.remoteId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isMandatory => $composableBuilder(
      column: $table.isMandatory, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get minToSelect => $composableBuilder(
      column: $table.minToSelect, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<int> get maxToSelect => $composableBuilder(
      column: $table.maxToSelect, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get multipleSelect => $composableBuilder(
      column: $table.multipleSelect,
      builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get createdById => $composableBuilder(
      column: $table.createdById, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));
}

class $$ProductOptionsDriftTableAnnotationComposer
    extends Composer<_$AppDatabase, $ProductOptionsDriftTable> {
  $$ProductOptionsDriftTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get remoteId =>
      $composableBuilder(column: $table.remoteId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<bool> get isMandatory => $composableBuilder(
      column: $table.isMandatory, builder: (column) => column);

  GeneratedColumn<int> get minToSelect => $composableBuilder(
      column: $table.minToSelect, builder: (column) => column);

  GeneratedColumn<int> get maxToSelect => $composableBuilder(
      column: $table.maxToSelect, builder: (column) => column);

  GeneratedColumn<bool> get multipleSelect => $composableBuilder(
      column: $table.multipleSelect, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<String> get createdById => $composableBuilder(
      column: $table.createdById, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  Expression<T> optionItemsDriftRefs<T extends Object>(
      Expression<T> Function($$OptionItemsDriftTableAnnotationComposer a) f) {
    final $$OptionItemsDriftTableAnnotationComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.id,
        referencedTable: $db.optionItemsDrift,
        getReferencedColumn: (t) => t.productOptionId,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$OptionItemsDriftTableAnnotationComposer(
              $db: $db,
              $table: $db.optionItemsDrift,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return f(composer);
  }
}

class $$ProductOptionsDriftTableTableManager extends RootTableManager<
    _$AppDatabase,
    $ProductOptionsDriftTable,
    ProductOptionsDriftData,
    $$ProductOptionsDriftTableFilterComposer,
    $$ProductOptionsDriftTableOrderingComposer,
    $$ProductOptionsDriftTableAnnotationComposer,
    $$ProductOptionsDriftTableCreateCompanionBuilder,
    $$ProductOptionsDriftTableUpdateCompanionBuilder,
    (ProductOptionsDriftData, $$ProductOptionsDriftTableReferences),
    ProductOptionsDriftData,
    PrefetchHooks Function({bool optionItemsDriftRefs})> {
  $$ProductOptionsDriftTableTableManager(
      _$AppDatabase db, $ProductOptionsDriftTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$ProductOptionsDriftTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$ProductOptionsDriftTableOrderingComposer(
                  $db: db, $table: table),
          createComputedFieldComposer: () =>
              $$ProductOptionsDriftTableAnnotationComposer(
                  $db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> remoteId = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<bool> isMandatory = const Value.absent(),
            Value<int> minToSelect = const Value.absent(),
            Value<int> maxToSelect = const Value.absent(),
            Value<bool> multipleSelect = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            Value<String?> createdById = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
          }) =>
              ProductOptionsDriftCompanion(
            id: id,
            remoteId: remoteId,
            name: name,
            isMandatory: isMandatory,
            minToSelect: minToSelect,
            maxToSelect: maxToSelect,
            multipleSelect: multipleSelect,
            isActive: isActive,
            createdById: createdById,
            deletedAt: deletedAt,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String remoteId,
            required String name,
            required bool isMandatory,
            required int minToSelect,
            required int maxToSelect,
            required bool multipleSelect,
            required bool isActive,
            Value<String?> createdById = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            required DateTime createdAt,
            required DateTime updatedAt,
          }) =>
              ProductOptionsDriftCompanion.insert(
            id: id,
            remoteId: remoteId,
            name: name,
            isMandatory: isMandatory,
            minToSelect: minToSelect,
            maxToSelect: maxToSelect,
            multipleSelect: multipleSelect,
            isActive: isActive,
            createdById: createdById,
            deletedAt: deletedAt,
            createdAt: createdAt,
            updatedAt: updatedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$ProductOptionsDriftTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({optionItemsDriftRefs = false}) {
            return PrefetchHooks(
              db: db,
              explicitlyWatchedTables: [
                if (optionItemsDriftRefs) db.optionItemsDrift
              ],
              addJoins: null,
              getPrefetchedDataCallback: (items) async {
                return [
                  if (optionItemsDriftRefs)
                    await $_getPrefetchedData<ProductOptionsDriftData,
                            $ProductOptionsDriftTable, OptionItemsDriftData>(
                        currentTable: table,
                        referencedTable: $$ProductOptionsDriftTableReferences
                            ._optionItemsDriftRefsTable(db),
                        managerFromTypedResult: (p0) =>
                            $$ProductOptionsDriftTableReferences(db, table, p0)
                                .optionItemsDriftRefs,
                        referencedItemsForCurrentItem:
                            (item, referencedItems) => referencedItems
                                .where((e) => e.productOptionId == item.id),
                        typedResults: items)
                ];
              },
            );
          },
        ));
}

typedef $$ProductOptionsDriftTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $ProductOptionsDriftTable,
    ProductOptionsDriftData,
    $$ProductOptionsDriftTableFilterComposer,
    $$ProductOptionsDriftTableOrderingComposer,
    $$ProductOptionsDriftTableAnnotationComposer,
    $$ProductOptionsDriftTableCreateCompanionBuilder,
    $$ProductOptionsDriftTableUpdateCompanionBuilder,
    (ProductOptionsDriftData, $$ProductOptionsDriftTableReferences),
    ProductOptionsDriftData,
    PrefetchHooks Function({bool optionItemsDriftRefs})>;
typedef $$OptionItemsDriftTableCreateCompanionBuilder
    = OptionItemsDriftCompanion Function({
  Value<int> id,
  required String remoteId,
  required int productOptionId,
  required String name,
  Value<double> price,
  Value<double?> vat,
  Value<bool> isActive,
  required String groupId,
  Value<String?> createdById,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<DateTime?> deletedAt,
});
typedef $$OptionItemsDriftTableUpdateCompanionBuilder
    = OptionItemsDriftCompanion Function({
  Value<int> id,
  Value<String> remoteId,
  Value<int> productOptionId,
  Value<String> name,
  Value<double> price,
  Value<double?> vat,
  Value<bool> isActive,
  Value<String> groupId,
  Value<String?> createdById,
  Value<DateTime> createdAt,
  Value<DateTime> updatedAt,
  Value<DateTime?> deletedAt,
});

final class $$OptionItemsDriftTableReferences extends BaseReferences<
    _$AppDatabase, $OptionItemsDriftTable, OptionItemsDriftData> {
  $$OptionItemsDriftTableReferences(
      super.$_db, super.$_table, super.$_typedResult);

  static $ProductOptionsDriftTable _productOptionIdTable(_$AppDatabase db) =>
      db.productOptionsDrift.createAlias($_aliasNameGenerator(
          db.optionItemsDrift.productOptionId, db.productOptionsDrift.id));

  $$ProductOptionsDriftTableProcessedTableManager get productOptionId {
    final $_column = $_itemColumn<int>('product_option_id')!;

    final manager =
        $$ProductOptionsDriftTableTableManager($_db, $_db.productOptionsDrift)
            .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_productOptionIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }
}

class $$OptionItemsDriftTableFilterComposer
    extends Composer<_$AppDatabase, $OptionItemsDriftTable> {
  $$OptionItemsDriftTableFilterComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnFilters<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get remoteId => $composableBuilder(
      column: $table.remoteId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get price => $composableBuilder(
      column: $table.price, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get vat => $composableBuilder(
      column: $table.vat, builder: (column) => ColumnFilters(column));

  ColumnFilters<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get groupId => $composableBuilder(
      column: $table.groupId, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get createdById => $composableBuilder(
      column: $table.createdById, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnFilters(column));

  ColumnFilters<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnFilters(column));

  $$ProductOptionsDriftTableFilterComposer get productOptionId {
    final $$ProductOptionsDriftTableFilterComposer composer = $composerBuilder(
        composer: this,
        getCurrentColumn: (t) => t.productOptionId,
        referencedTable: $db.productOptionsDrift,
        getReferencedColumn: (t) => t.id,
        builder: (joinBuilder,
                {$addJoinBuilderToRootComposer,
                $removeJoinBuilderFromRootComposer}) =>
            $$ProductOptionsDriftTableFilterComposer(
              $db: $db,
              $table: $db.productOptionsDrift,
              $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
              joinBuilder: joinBuilder,
              $removeJoinBuilderFromRootComposer:
                  $removeJoinBuilderFromRootComposer,
            ));
    return composer;
  }
}

class $$OptionItemsDriftTableOrderingComposer
    extends Composer<_$AppDatabase, $OptionItemsDriftTable> {
  $$OptionItemsDriftTableOrderingComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  ColumnOrderings<int> get id => $composableBuilder(
      column: $table.id, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get remoteId => $composableBuilder(
      column: $table.remoteId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get name => $composableBuilder(
      column: $table.name, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get price => $composableBuilder(
      column: $table.price, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get vat => $composableBuilder(
      column: $table.vat, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<bool> get isActive => $composableBuilder(
      column: $table.isActive, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get groupId => $composableBuilder(
      column: $table.groupId, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get createdById => $composableBuilder(
      column: $table.createdById, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get createdAt => $composableBuilder(
      column: $table.createdAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get updatedAt => $composableBuilder(
      column: $table.updatedAt, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<DateTime> get deletedAt => $composableBuilder(
      column: $table.deletedAt, builder: (column) => ColumnOrderings(column));

  $$ProductOptionsDriftTableOrderingComposer get productOptionId {
    final $$ProductOptionsDriftTableOrderingComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.productOptionId,
            referencedTable: $db.productOptionsDrift,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$ProductOptionsDriftTableOrderingComposer(
                  $db: $db,
                  $table: $db.productOptionsDrift,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }
}

class $$OptionItemsDriftTableAnnotationComposer
    extends Composer<_$AppDatabase, $OptionItemsDriftTable> {
  $$OptionItemsDriftTableAnnotationComposer({
    required super.$db,
    required super.$table,
    super.joinBuilder,
    super.$addJoinBuilderToRootComposer,
    super.$removeJoinBuilderFromRootComposer,
  });
  GeneratedColumn<int> get id =>
      $composableBuilder(column: $table.id, builder: (column) => column);

  GeneratedColumn<String> get remoteId =>
      $composableBuilder(column: $table.remoteId, builder: (column) => column);

  GeneratedColumn<String> get name =>
      $composableBuilder(column: $table.name, builder: (column) => column);

  GeneratedColumn<double> get price =>
      $composableBuilder(column: $table.price, builder: (column) => column);

  GeneratedColumn<double> get vat =>
      $composableBuilder(column: $table.vat, builder: (column) => column);

  GeneratedColumn<bool> get isActive =>
      $composableBuilder(column: $table.isActive, builder: (column) => column);

  GeneratedColumn<String> get groupId =>
      $composableBuilder(column: $table.groupId, builder: (column) => column);

  GeneratedColumn<String> get createdById => $composableBuilder(
      column: $table.createdById, builder: (column) => column);

  GeneratedColumn<DateTime> get createdAt =>
      $composableBuilder(column: $table.createdAt, builder: (column) => column);

  GeneratedColumn<DateTime> get updatedAt =>
      $composableBuilder(column: $table.updatedAt, builder: (column) => column);

  GeneratedColumn<DateTime> get deletedAt =>
      $composableBuilder(column: $table.deletedAt, builder: (column) => column);

  $$ProductOptionsDriftTableAnnotationComposer get productOptionId {
    final $$ProductOptionsDriftTableAnnotationComposer composer =
        $composerBuilder(
            composer: this,
            getCurrentColumn: (t) => t.productOptionId,
            referencedTable: $db.productOptionsDrift,
            getReferencedColumn: (t) => t.id,
            builder: (joinBuilder,
                    {$addJoinBuilderToRootComposer,
                    $removeJoinBuilderFromRootComposer}) =>
                $$ProductOptionsDriftTableAnnotationComposer(
                  $db: $db,
                  $table: $db.productOptionsDrift,
                  $addJoinBuilderToRootComposer: $addJoinBuilderToRootComposer,
                  joinBuilder: joinBuilder,
                  $removeJoinBuilderFromRootComposer:
                      $removeJoinBuilderFromRootComposer,
                ));
    return composer;
  }
}

class $$OptionItemsDriftTableTableManager extends RootTableManager<
    _$AppDatabase,
    $OptionItemsDriftTable,
    OptionItemsDriftData,
    $$OptionItemsDriftTableFilterComposer,
    $$OptionItemsDriftTableOrderingComposer,
    $$OptionItemsDriftTableAnnotationComposer,
    $$OptionItemsDriftTableCreateCompanionBuilder,
    $$OptionItemsDriftTableUpdateCompanionBuilder,
    (OptionItemsDriftData, $$OptionItemsDriftTableReferences),
    OptionItemsDriftData,
    PrefetchHooks Function({bool productOptionId})> {
  $$OptionItemsDriftTableTableManager(
      _$AppDatabase db, $OptionItemsDriftTable table)
      : super(TableManagerState(
          db: db,
          table: table,
          createFilteringComposer: () =>
              $$OptionItemsDriftTableFilterComposer($db: db, $table: table),
          createOrderingComposer: () =>
              $$OptionItemsDriftTableOrderingComposer($db: db, $table: table),
          createComputedFieldComposer: () =>
              $$OptionItemsDriftTableAnnotationComposer($db: db, $table: table),
          updateCompanionCallback: ({
            Value<int> id = const Value.absent(),
            Value<String> remoteId = const Value.absent(),
            Value<int> productOptionId = const Value.absent(),
            Value<String> name = const Value.absent(),
            Value<double> price = const Value.absent(),
            Value<double?> vat = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            Value<String> groupId = const Value.absent(),
            Value<String?> createdById = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
          }) =>
              OptionItemsDriftCompanion(
            id: id,
            remoteId: remoteId,
            productOptionId: productOptionId,
            name: name,
            price: price,
            vat: vat,
            isActive: isActive,
            groupId: groupId,
            createdById: createdById,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
          ),
          createCompanionCallback: ({
            Value<int> id = const Value.absent(),
            required String remoteId,
            required int productOptionId,
            required String name,
            Value<double> price = const Value.absent(),
            Value<double?> vat = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            required String groupId,
            Value<String?> createdById = const Value.absent(),
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<DateTime?> deletedAt = const Value.absent(),
          }) =>
              OptionItemsDriftCompanion.insert(
            id: id,
            remoteId: remoteId,
            productOptionId: productOptionId,
            name: name,
            price: price,
            vat: vat,
            isActive: isActive,
            groupId: groupId,
            createdById: createdById,
            createdAt: createdAt,
            updatedAt: updatedAt,
            deletedAt: deletedAt,
          ),
          withReferenceMapper: (p0) => p0
              .map((e) => (
                    e.readTable(table),
                    $$OptionItemsDriftTableReferences(db, table, e)
                  ))
              .toList(),
          prefetchHooksCallback: ({productOptionId = false}) {
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
                if (productOptionId) {
                  state = state.withJoin(
                    currentTable: table,
                    currentColumn: table.productOptionId,
                    referencedTable: $$OptionItemsDriftTableReferences
                        ._productOptionIdTable(db),
                    referencedColumn: $$OptionItemsDriftTableReferences
                        ._productOptionIdTable(db)
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

typedef $$OptionItemsDriftTableProcessedTableManager = ProcessedTableManager<
    _$AppDatabase,
    $OptionItemsDriftTable,
    OptionItemsDriftData,
    $$OptionItemsDriftTableFilterComposer,
    $$OptionItemsDriftTableOrderingComposer,
    $$OptionItemsDriftTableAnnotationComposer,
    $$OptionItemsDriftTableCreateCompanionBuilder,
    $$OptionItemsDriftTableUpdateCompanionBuilder,
    (OptionItemsDriftData, $$OptionItemsDriftTableReferences),
    OptionItemsDriftData,
    PrefetchHooks Function({bool productOptionId})>;

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$ProductGroupsDriftTableTableManager get productGroupsDrift =>
      $$ProductGroupsDriftTableTableManager(_db, _db.productGroupsDrift);
  $$ProductsDriftTableTableManager get productsDrift =>
      $$ProductsDriftTableTableManager(_db, _db.productsDrift);
  $$ProductOptionsDriftTableTableManager get productOptionsDrift =>
      $$ProductOptionsDriftTableTableManager(_db, _db.productOptionsDrift);
  $$OptionItemsDriftTableTableManager get optionItemsDrift =>
      $$OptionItemsDriftTableTableManager(_db, _db.optionItemsDrift);
}
