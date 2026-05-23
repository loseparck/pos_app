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
  final bool isActive;
  final String? parentId;
  final String? createdById;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  const CategoriesDriftData(
      {required this.id,
      required this.name,
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
          bool? isActive,
          Value<String?> parentId = const Value.absent(),
          Value<String?> createdById = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt,
          Value<DateTime?> deletedAt = const Value.absent()}) =>
      CategoriesDriftData(
        id: id ?? this.id,
        name: name ?? this.name,
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
  int get hashCode => Object.hash(id, name, isActive, parentId, createdById,
      createdAt, updatedAt, deletedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is CategoriesDriftData &&
          other.id == this.id &&
          other.name == this.name &&
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
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
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
  static const VerificationMeta _codeBarresMeta =
      const VerificationMeta('codeBarres');
  @override
  late final GeneratedColumn<String> codeBarres = GeneratedColumn<String>(
      'code_barres', aliasedName, true,
      type: DriftSqlType.string,
      requiredDuringInsert: false,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _priceMeta = const VerificationMeta('price');
  @override
  late final GeneratedColumn<double> price = GeneratedColumn<double>(
      'price', aliasedName, false,
      type: DriftSqlType.double, requiredDuringInsert: true);
  static const VerificationMeta _vatMeta = const VerificationMeta('vat');
  @override
  late final GeneratedColumn<double> vat = GeneratedColumn<double>(
      'vat', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
  static const VerificationMeta _stockQuantityMeta =
      const VerificationMeta('stockQuantity');
  @override
  late final GeneratedColumn<double> stockQuantity = GeneratedColumn<double>(
      'stock_quantity', aliasedName, true,
      type: DriftSqlType.double, requiredDuringInsert: false);
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
        codeBarres,
        price,
        vat,
        stockQuantity,
        image,
        color,
        isActive,
        categoryId,
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
    if (data.containsKey('code_barres')) {
      context.handle(
          _codeBarresMeta,
          codeBarres.isAcceptableOrUnknown(
              data['code_barres']!, _codeBarresMeta));
    }
    if (data.containsKey('price')) {
      context.handle(
          _priceMeta, price.isAcceptableOrUnknown(data['price']!, _priceMeta));
    } else if (isInserting) {
      context.missing(_priceMeta);
    }
    if (data.containsKey('vat')) {
      context.handle(
          _vatMeta, vat.isAcceptableOrUnknown(data['vat']!, _vatMeta));
    }
    if (data.containsKey('stock_quantity')) {
      context.handle(
          _stockQuantityMeta,
          stockQuantity.isAcceptableOrUnknown(
              data['stock_quantity']!, _stockQuantityMeta));
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
      codeBarres: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}code_barres']),
      price: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}price'])!,
      vat: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}vat']),
      stockQuantity: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}stock_quantity']),
      image: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}image']),
      color: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}color']),
      isActive: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_active'])!,
      categoryId: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}category_id']),
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
  final String? codeBarres;
  final double price;
  final double? vat;
  final double? stockQuantity;
  final String? image;
  final int? color;
  final bool isActive;
  final String? categoryId;
  final String? createdById;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  const ProductsDriftData(
      {required this.id,
      required this.name,
      this.description,
      this.sku,
      this.codeBarres,
      required this.price,
      this.vat,
      this.stockQuantity,
      this.image,
      this.color,
      required this.isActive,
      this.categoryId,
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
    if (!nullToAbsent || codeBarres != null) {
      map['code_barres'] = Variable<String>(codeBarres);
    }
    map['price'] = Variable<double>(price);
    if (!nullToAbsent || vat != null) {
      map['vat'] = Variable<double>(vat);
    }
    if (!nullToAbsent || stockQuantity != null) {
      map['stock_quantity'] = Variable<double>(stockQuantity);
    }
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
      codeBarres: codeBarres == null && nullToAbsent
          ? const Value.absent()
          : Value(codeBarres),
      price: Value(price),
      vat: vat == null && nullToAbsent ? const Value.absent() : Value(vat),
      stockQuantity: stockQuantity == null && nullToAbsent
          ? const Value.absent()
          : Value(stockQuantity),
      image:
          image == null && nullToAbsent ? const Value.absent() : Value(image),
      color:
          color == null && nullToAbsent ? const Value.absent() : Value(color),
      isActive: Value(isActive),
      categoryId: categoryId == null && nullToAbsent
          ? const Value.absent()
          : Value(categoryId),
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
      codeBarres: serializer.fromJson<String?>(json['codeBarres']),
      price: serializer.fromJson<double>(json['price']),
      vat: serializer.fromJson<double?>(json['vat']),
      stockQuantity: serializer.fromJson<double?>(json['stockQuantity']),
      image: serializer.fromJson<String?>(json['image']),
      color: serializer.fromJson<int?>(json['color']),
      isActive: serializer.fromJson<bool>(json['isActive']),
      categoryId: serializer.fromJson<String?>(json['categoryId']),
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
      'codeBarres': serializer.toJson<String?>(codeBarres),
      'price': serializer.toJson<double>(price),
      'vat': serializer.toJson<double?>(vat),
      'stockQuantity': serializer.toJson<double?>(stockQuantity),
      'image': serializer.toJson<String?>(image),
      'color': serializer.toJson<int?>(color),
      'isActive': serializer.toJson<bool>(isActive),
      'categoryId': serializer.toJson<String?>(categoryId),
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
          Value<String?> codeBarres = const Value.absent(),
          double? price,
          Value<double?> vat = const Value.absent(),
          Value<double?> stockQuantity = const Value.absent(),
          Value<String?> image = const Value.absent(),
          Value<int?> color = const Value.absent(),
          bool? isActive,
          Value<String?> categoryId = const Value.absent(),
          Value<String?> createdById = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt,
          Value<DateTime?> deletedAt = const Value.absent()}) =>
      ProductsDriftData(
        id: id ?? this.id,
        name: name ?? this.name,
        description: description.present ? description.value : this.description,
        sku: sku.present ? sku.value : this.sku,
        codeBarres: codeBarres.present ? codeBarres.value : this.codeBarres,
        price: price ?? this.price,
        vat: vat.present ? vat.value : this.vat,
        stockQuantity:
            stockQuantity.present ? stockQuantity.value : this.stockQuantity,
        image: image.present ? image.value : this.image,
        color: color.present ? color.value : this.color,
        isActive: isActive ?? this.isActive,
        categoryId: categoryId.present ? categoryId.value : this.categoryId,
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
      codeBarres:
          data.codeBarres.present ? data.codeBarres.value : this.codeBarres,
      price: data.price.present ? data.price.value : this.price,
      vat: data.vat.present ? data.vat.value : this.vat,
      stockQuantity: data.stockQuantity.present
          ? data.stockQuantity.value
          : this.stockQuantity,
      image: data.image.present ? data.image.value : this.image,
      color: data.color.present ? data.color.value : this.color,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
      categoryId:
          data.categoryId.present ? data.categoryId.value : this.categoryId,
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
          ..write('codeBarres: $codeBarres, ')
          ..write('price: $price, ')
          ..write('vat: $vat, ')
          ..write('stockQuantity: $stockQuantity, ')
          ..write('image: $image, ')
          ..write('color: $color, ')
          ..write('isActive: $isActive, ')
          ..write('categoryId: $categoryId, ')
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
      codeBarres,
      price,
      vat,
      stockQuantity,
      image,
      color,
      isActive,
      categoryId,
      createdById,
      createdAt,
      updatedAt,
      deletedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ProductsDriftData &&
          other.id == this.id &&
          other.name == this.name &&
          other.description == this.description &&
          other.sku == this.sku &&
          other.codeBarres == this.codeBarres &&
          other.price == this.price &&
          other.vat == this.vat &&
          other.stockQuantity == this.stockQuantity &&
          other.image == this.image &&
          other.color == this.color &&
          other.isActive == this.isActive &&
          other.categoryId == this.categoryId &&
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
  final Value<String?> codeBarres;
  final Value<double> price;
  final Value<double?> vat;
  final Value<double?> stockQuantity;
  final Value<String?> image;
  final Value<int?> color;
  final Value<bool> isActive;
  final Value<String?> categoryId;
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
    this.codeBarres = const Value.absent(),
    this.price = const Value.absent(),
    this.vat = const Value.absent(),
    this.stockQuantity = const Value.absent(),
    this.image = const Value.absent(),
    this.color = const Value.absent(),
    this.isActive = const Value.absent(),
    this.categoryId = const Value.absent(),
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
    this.codeBarres = const Value.absent(),
    required double price,
    this.vat = const Value.absent(),
    this.stockQuantity = const Value.absent(),
    this.image = const Value.absent(),
    this.color = const Value.absent(),
    this.isActive = const Value.absent(),
    this.categoryId = const Value.absent(),
    this.createdById = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        price = Value(price),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<ProductsDriftData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<String>? description,
    Expression<String>? sku,
    Expression<String>? codeBarres,
    Expression<double>? price,
    Expression<double>? vat,
    Expression<double>? stockQuantity,
    Expression<String>? image,
    Expression<int>? color,
    Expression<bool>? isActive,
    Expression<String>? categoryId,
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
      if (codeBarres != null) 'code_barres': codeBarres,
      if (price != null) 'price': price,
      if (vat != null) 'vat': vat,
      if (stockQuantity != null) 'stock_quantity': stockQuantity,
      if (image != null) 'image': image,
      if (color != null) 'color': color,
      if (isActive != null) 'is_active': isActive,
      if (categoryId != null) 'category_id': categoryId,
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
      Value<String?>? codeBarres,
      Value<double>? price,
      Value<double?>? vat,
      Value<double?>? stockQuantity,
      Value<String?>? image,
      Value<int?>? color,
      Value<bool>? isActive,
      Value<String?>? categoryId,
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
      codeBarres: codeBarres ?? this.codeBarres,
      price: price ?? this.price,
      vat: vat ?? this.vat,
      stockQuantity: stockQuantity ?? this.stockQuantity,
      image: image ?? this.image,
      color: color ?? this.color,
      isActive: isActive ?? this.isActive,
      categoryId: categoryId ?? this.categoryId,
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
    if (codeBarres.present) {
      map['code_barres'] = Variable<String>(codeBarres.value);
    }
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (vat.present) {
      map['vat'] = Variable<double>(vat.value);
    }
    if (stockQuantity.present) {
      map['stock_quantity'] = Variable<double>(stockQuantity.value);
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
          ..write('codeBarres: $codeBarres, ')
          ..write('price: $price, ')
          ..write('vat: $vat, ')
          ..write('stockQuantity: $stockQuantity, ')
          ..write('image: $image, ')
          ..write('color: $color, ')
          ..write('isActive: $isActive, ')
          ..write('categoryId: $categoryId, ')
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
  OptionsDriftData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return OptionsDriftData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
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
  $OptionsDriftTable createAlias(String alias) {
    return $OptionsDriftTable(attachedDatabase, alias);
  }
}

class OptionsDriftData extends DataClass
    implements Insertable<OptionsDriftData> {
  final String id;
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
  const OptionsDriftData(
      {required this.id,
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
    map['id'] = Variable<String>(id);
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

  OptionsDriftCompanion toCompanion(bool nullToAbsent) {
    return OptionsDriftCompanion(
      id: Value(id),
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

  factory OptionsDriftData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return OptionsDriftData(
      id: serializer.fromJson<String>(json['id']),
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
      'id': serializer.toJson<String>(id),
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

  OptionsDriftData copyWith(
          {String? id,
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
      OptionsDriftData(
        id: id ?? this.id,
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
  OptionsDriftData copyWithCompanion(OptionsDriftCompanion data) {
    return OptionsDriftData(
      id: data.id.present ? data.id.value : this.id,
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
    return (StringBuffer('OptionsDriftData(')
          ..write('id: $id, ')
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
      (other is OptionsDriftData &&
          other.id == this.id &&
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

class OptionsDriftCompanion extends UpdateCompanion<OptionsDriftData> {
  final Value<String> id;
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
  final Value<int> rowid;
  const OptionsDriftCompanion({
    this.id = const Value.absent(),
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
    this.rowid = const Value.absent(),
  });
  OptionsDriftCompanion.insert({
    required String id,
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
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        isMandatory = Value(isMandatory),
        minToSelect = Value(minToSelect),
        maxToSelect = Value(maxToSelect),
        multipleSelect = Value(multipleSelect),
        isActive = Value(isActive),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<OptionsDriftData> custom({
    Expression<String>? id,
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
    Expression<int>? rowid,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
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
      if (rowid != null) 'rowid': rowid,
    });
  }

  OptionsDriftCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<bool>? isMandatory,
      Value<int>? minToSelect,
      Value<int>? maxToSelect,
      Value<bool>? multipleSelect,
      Value<bool>? isActive,
      Value<String?>? createdById,
      Value<DateTime?>? deletedAt,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<int>? rowid}) {
    return OptionsDriftCompanion(
      id: id ?? this.id,
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
          ..write('isMandatory: $isMandatory, ')
          ..write('minToSelect: $minToSelect, ')
          ..write('maxToSelect: $maxToSelect, ')
          ..write('multipleSelect: $multipleSelect, ')
          ..write('isActive: $isActive, ')
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
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
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
        price,
        vat,
        isActive,
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
      price: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}price'])!,
      vat: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}vat']),
      isActive: attachedDatabase.typeMapping
          .read(DriftSqlType.bool, data['${effectivePrefix}is_active'])!,
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
  final double price;
  final double? vat;
  final bool isActive;
  final String optionId;
  final String? createdById;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  const ItemsDriftData(
      {required this.id,
      required this.name,
      required this.price,
      this.vat,
      required this.isActive,
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
    map['price'] = Variable<double>(price);
    if (!nullToAbsent || vat != null) {
      map['vat'] = Variable<double>(vat);
    }
    map['is_active'] = Variable<bool>(isActive);
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
      price: Value(price),
      vat: vat == null && nullToAbsent ? const Value.absent() : Value(vat),
      isActive: Value(isActive),
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
      price: serializer.fromJson<double>(json['price']),
      vat: serializer.fromJson<double?>(json['vat']),
      isActive: serializer.fromJson<bool>(json['isActive']),
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
      'price': serializer.toJson<double>(price),
      'vat': serializer.toJson<double?>(vat),
      'isActive': serializer.toJson<bool>(isActive),
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
          double? price,
          Value<double?> vat = const Value.absent(),
          bool? isActive,
          String? optionId,
          Value<String?> createdById = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt,
          Value<DateTime?> deletedAt = const Value.absent()}) =>
      ItemsDriftData(
        id: id ?? this.id,
        name: name ?? this.name,
        price: price ?? this.price,
        vat: vat.present ? vat.value : this.vat,
        isActive: isActive ?? this.isActive,
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
      price: data.price.present ? data.price.value : this.price,
      vat: data.vat.present ? data.vat.value : this.vat,
      isActive: data.isActive.present ? data.isActive.value : this.isActive,
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
          ..write('price: $price, ')
          ..write('vat: $vat, ')
          ..write('isActive: $isActive, ')
          ..write('optionId: $optionId, ')
          ..write('createdById: $createdById, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, price, vat, isActive, optionId,
      createdById, createdAt, updatedAt, deletedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is ItemsDriftData &&
          other.id == this.id &&
          other.name == this.name &&
          other.price == this.price &&
          other.vat == this.vat &&
          other.isActive == this.isActive &&
          other.optionId == this.optionId &&
          other.createdById == this.createdById &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt);
}

class ItemsDriftCompanion extends UpdateCompanion<ItemsDriftData> {
  final Value<String> id;
  final Value<String> name;
  final Value<double> price;
  final Value<double?> vat;
  final Value<bool> isActive;
  final Value<String> optionId;
  final Value<String?> createdById;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<int> rowid;
  const ItemsDriftCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.price = const Value.absent(),
    this.vat = const Value.absent(),
    this.isActive = const Value.absent(),
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
    this.price = const Value.absent(),
    this.vat = const Value.absent(),
    this.isActive = const Value.absent(),
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
    Expression<double>? price,
    Expression<double>? vat,
    Expression<bool>? isActive,
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
      if (price != null) 'price': price,
      if (vat != null) 'vat': vat,
      if (isActive != null) 'is_active': isActive,
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
      Value<double>? price,
      Value<double?>? vat,
      Value<bool>? isActive,
      Value<String>? optionId,
      Value<String?>? createdById,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<DateTime?>? deletedAt,
      Value<int>? rowid}) {
    return ItemsDriftCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      vat: vat ?? this.vat,
      isActive: isActive ?? this.isActive,
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
    if (price.present) {
      map['price'] = Variable<double>(price.value);
    }
    if (vat.present) {
      map['vat'] = Variable<double>(vat.value);
    }
    if (isActive.present) {
      map['is_active'] = Variable<bool>(isActive.value);
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
          ..write('price: $price, ')
          ..write('vat: $vat, ')
          ..write('isActive: $isActive, ')
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
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
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
      [id, name, isActive, createdById, createdAt, updatedAt, deletedAt];
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
  PlanDriftData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return PlanDriftData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
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
  $PlanDriftTable createAlias(String alias) {
    return $PlanDriftTable(attachedDatabase, alias);
  }
}

class PlanDriftData extends DataClass implements Insertable<PlanDriftData> {
  final String id;
  final String name;
  final bool isActive;
  final String? createdById;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  const PlanDriftData(
      {required this.id,
      required this.name,
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

  PlanDriftCompanion toCompanion(bool nullToAbsent) {
    return PlanDriftCompanion(
      id: Value(id),
      name: Value(name),
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

  factory PlanDriftData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return PlanDriftData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
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
      'isActive': serializer.toJson<bool>(isActive),
      'createdById': serializer.toJson<String?>(createdById),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  PlanDriftData copyWith(
          {String? id,
          String? name,
          bool? isActive,
          Value<String?> createdById = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt,
          Value<DateTime?> deletedAt = const Value.absent()}) =>
      PlanDriftData(
        id: id ?? this.id,
        name: name ?? this.name,
        isActive: isActive ?? this.isActive,
        createdById: createdById.present ? createdById.value : this.createdById,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
      );
  PlanDriftData copyWithCompanion(PlanDriftCompanion data) {
    return PlanDriftData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
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
    return (StringBuffer('PlanDriftData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
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
      id, name, isActive, createdById, createdAt, updatedAt, deletedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is PlanDriftData &&
          other.id == this.id &&
          other.name == this.name &&
          other.isActive == this.isActive &&
          other.createdById == this.createdById &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt);
}

class PlanDriftCompanion extends UpdateCompanion<PlanDriftData> {
  final Value<String> id;
  final Value<String> name;
  final Value<bool> isActive;
  final Value<String?> createdById;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<int> rowid;
  const PlanDriftCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdById = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  PlanDriftCompanion.insert({
    required String id,
    required String name,
    this.isActive = const Value.absent(),
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
      if (isActive != null) 'is_active': isActive,
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
      Value<bool>? isActive,
      Value<String?>? createdById,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<DateTime?>? deletedAt,
      Value<int>? rowid}) {
    return PlanDriftCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
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
    return (StringBuffer('PlanDriftCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
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
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
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
  late final GeneratedColumn<double> width = GeneratedColumn<double>(
      'width', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(100));
  static const VerificationMeta _heightMeta = const VerificationMeta('height');
  @override
  late final GeneratedColumn<double> height = GeneratedColumn<double>(
      'height', aliasedName, false,
      type: DriftSqlType.double,
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
          .read(DriftSqlType.double, data['${effectivePrefix}width'])!,
      height: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}height'])!,
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
  final double width;
  final double height;
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
    map['width'] = Variable<double>(width);
    map['height'] = Variable<double>(height);
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
      width: serializer.fromJson<double>(json['width']),
      height: serializer.fromJson<double>(json['height']),
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
      'width': serializer.toJson<double>(width),
      'height': serializer.toJson<double>(height),
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
          double? width,
          double? height,
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
  final Value<double> width;
  final Value<double> height;
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
    Expression<double>? width,
    Expression<double>? height,
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
      Value<double>? width,
      Value<double>? height,
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
      map['width'] = Variable<double>(width.value);
    }
    if (height.present) {
      map['height'] = Variable<double>(height.value);
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
      type: DriftSqlType.string,
      requiredDuringInsert: true,
      defaultConstraints: GeneratedColumn.constraintIsAlways('UNIQUE'));
  static const VerificationMeta _nameMeta = const VerificationMeta('name');
  @override
  late final GeneratedColumn<String> name = GeneratedColumn<String>(
      'name', aliasedName, false,
      type: DriftSqlType.string, requiredDuringInsert: true);
  static const VerificationMeta _valueMeta = const VerificationMeta('value');
  @override
  late final GeneratedColumn<double> value = GeneratedColumn<double>(
      'value', aliasedName, false,
      type: DriftSqlType.double,
      requiredDuringInsert: false,
      defaultValue: const Constant(0));
  static const VerificationMeta _discountTypeMeta =
      const VerificationMeta('discountType');
  @override
  late final GeneratedColumn<String> discountType = GeneratedColumn<String>(
      'discount_type', aliasedName, false,
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
        value,
        discountType,
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
    if (data.containsKey('value')) {
      context.handle(
          _valueMeta, value.isAcceptableOrUnknown(data['value']!, _valueMeta));
    }
    if (data.containsKey('discount_type')) {
      context.handle(
          _discountTypeMeta,
          discountType.isAcceptableOrUnknown(
              data['discount_type']!, _discountTypeMeta));
    } else if (isInserting) {
      context.missing(_discountTypeMeta);
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
  DiscountsDriftData map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return DiscountsDriftData(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}id'])!,
      name: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}name'])!,
      value: attachedDatabase.typeMapping
          .read(DriftSqlType.double, data['${effectivePrefix}value'])!,
      discountType: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}discount_type'])!,
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
  $DiscountsDriftTable createAlias(String alias) {
    return $DiscountsDriftTable(attachedDatabase, alias);
  }
}

class DiscountsDriftData extends DataClass
    implements Insertable<DiscountsDriftData> {
  final String id;
  final String name;
  final double value;
  final String discountType;
  final bool isActive;
  final String? createdById;
  final DateTime createdAt;
  final DateTime updatedAt;
  final DateTime? deletedAt;
  const DiscountsDriftData(
      {required this.id,
      required this.name,
      required this.value,
      required this.discountType,
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
    map['value'] = Variable<double>(value);
    map['discount_type'] = Variable<String>(discountType);
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

  DiscountsDriftCompanion toCompanion(bool nullToAbsent) {
    return DiscountsDriftCompanion(
      id: Value(id),
      name: Value(name),
      value: Value(value),
      discountType: Value(discountType),
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

  factory DiscountsDriftData.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return DiscountsDriftData(
      id: serializer.fromJson<String>(json['id']),
      name: serializer.fromJson<String>(json['name']),
      value: serializer.fromJson<double>(json['value']),
      discountType: serializer.fromJson<String>(json['discountType']),
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
      'value': serializer.toJson<double>(value),
      'discountType': serializer.toJson<String>(discountType),
      'isActive': serializer.toJson<bool>(isActive),
      'createdById': serializer.toJson<String?>(createdById),
      'createdAt': serializer.toJson<DateTime>(createdAt),
      'updatedAt': serializer.toJson<DateTime>(updatedAt),
      'deletedAt': serializer.toJson<DateTime?>(deletedAt),
    };
  }

  DiscountsDriftData copyWith(
          {String? id,
          String? name,
          double? value,
          String? discountType,
          bool? isActive,
          Value<String?> createdById = const Value.absent(),
          DateTime? createdAt,
          DateTime? updatedAt,
          Value<DateTime?> deletedAt = const Value.absent()}) =>
      DiscountsDriftData(
        id: id ?? this.id,
        name: name ?? this.name,
        value: value ?? this.value,
        discountType: discountType ?? this.discountType,
        isActive: isActive ?? this.isActive,
        createdById: createdById.present ? createdById.value : this.createdById,
        createdAt: createdAt ?? this.createdAt,
        updatedAt: updatedAt ?? this.updatedAt,
        deletedAt: deletedAt.present ? deletedAt.value : this.deletedAt,
      );
  DiscountsDriftData copyWithCompanion(DiscountsDriftCompanion data) {
    return DiscountsDriftData(
      id: data.id.present ? data.id.value : this.id,
      name: data.name.present ? data.name.value : this.name,
      value: data.value.present ? data.value.value : this.value,
      discountType: data.discountType.present
          ? data.discountType.value
          : this.discountType,
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
    return (StringBuffer('DiscountsDriftData(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('value: $value, ')
          ..write('discountType: $discountType, ')
          ..write('isActive: $isActive, ')
          ..write('createdById: $createdById, ')
          ..write('createdAt: $createdAt, ')
          ..write('updatedAt: $updatedAt, ')
          ..write('deletedAt: $deletedAt')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, name, value, discountType, isActive,
      createdById, createdAt, updatedAt, deletedAt);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is DiscountsDriftData &&
          other.id == this.id &&
          other.name == this.name &&
          other.value == this.value &&
          other.discountType == this.discountType &&
          other.isActive == this.isActive &&
          other.createdById == this.createdById &&
          other.createdAt == this.createdAt &&
          other.updatedAt == this.updatedAt &&
          other.deletedAt == this.deletedAt);
}

class DiscountsDriftCompanion extends UpdateCompanion<DiscountsDriftData> {
  final Value<String> id;
  final Value<String> name;
  final Value<double> value;
  final Value<String> discountType;
  final Value<bool> isActive;
  final Value<String?> createdById;
  final Value<DateTime> createdAt;
  final Value<DateTime> updatedAt;
  final Value<DateTime?> deletedAt;
  final Value<int> rowid;
  const DiscountsDriftCompanion({
    this.id = const Value.absent(),
    this.name = const Value.absent(),
    this.value = const Value.absent(),
    this.discountType = const Value.absent(),
    this.isActive = const Value.absent(),
    this.createdById = const Value.absent(),
    this.createdAt = const Value.absent(),
    this.updatedAt = const Value.absent(),
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  });
  DiscountsDriftCompanion.insert({
    required String id,
    required String name,
    this.value = const Value.absent(),
    required String discountType,
    this.isActive = const Value.absent(),
    this.createdById = const Value.absent(),
    required DateTime createdAt,
    required DateTime updatedAt,
    this.deletedAt = const Value.absent(),
    this.rowid = const Value.absent(),
  })  : id = Value(id),
        name = Value(name),
        discountType = Value(discountType),
        createdAt = Value(createdAt),
        updatedAt = Value(updatedAt);
  static Insertable<DiscountsDriftData> custom({
    Expression<String>? id,
    Expression<String>? name,
    Expression<double>? value,
    Expression<String>? discountType,
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
      if (value != null) 'value': value,
      if (discountType != null) 'discount_type': discountType,
      if (isActive != null) 'is_active': isActive,
      if (createdById != null) 'created_by_id': createdById,
      if (createdAt != null) 'created_at': createdAt,
      if (updatedAt != null) 'updated_at': updatedAt,
      if (deletedAt != null) 'deleted_at': deletedAt,
      if (rowid != null) 'rowid': rowid,
    });
  }

  DiscountsDriftCompanion copyWith(
      {Value<String>? id,
      Value<String>? name,
      Value<double>? value,
      Value<String>? discountType,
      Value<bool>? isActive,
      Value<String?>? createdById,
      Value<DateTime>? createdAt,
      Value<DateTime>? updatedAt,
      Value<DateTime?>? deletedAt,
      Value<int>? rowid}) {
    return DiscountsDriftCompanion(
      id: id ?? this.id,
      name: name ?? this.name,
      value: value ?? this.value,
      discountType: discountType ?? this.discountType,
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
    if (value.present) {
      map['value'] = Variable<double>(value.value);
    }
    if (discountType.present) {
      map['discount_type'] = Variable<String>(discountType.value);
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
    return (StringBuffer('DiscountsDriftCompanion(')
          ..write('id: $id, ')
          ..write('name: $name, ')
          ..write('value: $value, ')
          ..write('discountType: $discountType, ')
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

abstract class _$AppDatabase extends GeneratedDatabase {
  _$AppDatabase(QueryExecutor e) : super(e);
  $AppDatabaseManager get managers => $AppDatabaseManager(this);
  late final $CategoriesDriftTable categoriesDrift =
      $CategoriesDriftTable(this);
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
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [
        categoriesDrift,
        productsDrift,
        optionsDrift,
        itemsDrift,
        productsOptionsDrift,
        auditLogsDrift,
        planDrift,
        restaurantTableDrift,
        discountsDrift
      ];
}

typedef $$CategoriesDriftTableCreateCompanionBuilder = CategoriesDriftCompanion
    Function({
  required String id,
  required String name,
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
      db.categoriesDrift.createAlias($_aliasNameGenerator(
          db.categoriesDrift.parentId, db.categoriesDrift.id));

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
              aliasName: $_aliasNameGenerator(
                  db.categoriesDrift.id, db.productsDrift.categoryId));

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
typedef $$ProductsDriftTableCreateCompanionBuilder = ProductsDriftCompanion
    Function({
  required String id,
  required String name,
  Value<String?> description,
  Value<String?> sku,
  Value<String?> codeBarres,
  required double price,
  Value<double?> vat,
  Value<double?> stockQuantity,
  Value<String?> image,
  Value<int?> color,
  Value<bool> isActive,
  Value<String?> categoryId,
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
  Value<String?> codeBarres,
  Value<double> price,
  Value<double?> vat,
  Value<double?> stockQuantity,
  Value<String?> image,
  Value<int?> color,
  Value<bool> isActive,
  Value<String?> categoryId,
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
      db.categoriesDrift.createAlias($_aliasNameGenerator(
          db.productsDrift.categoryId, db.categoriesDrift.id));

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

  static MultiTypedResultKey<$ProductsOptionsDriftTable,
      List<ProductsOptionsDriftData>> _productsOptionsDriftRefsTable(
          _$AppDatabase db) =>
      MultiTypedResultKey.fromTable(db.productsOptionsDrift,
          aliasName: $_aliasNameGenerator(
              db.productsDrift.id, db.productsOptionsDrift.productId));

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

  ColumnFilters<String> get codeBarres => $composableBuilder(
      column: $table.codeBarres, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get price => $composableBuilder(
      column: $table.price, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get vat => $composableBuilder(
      column: $table.vat, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get stockQuantity => $composableBuilder(
      column: $table.stockQuantity, builder: (column) => ColumnFilters(column));

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

  ColumnOrderings<String> get codeBarres => $composableBuilder(
      column: $table.codeBarres, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get price => $composableBuilder(
      column: $table.price, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get vat => $composableBuilder(
      column: $table.vat, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get stockQuantity => $composableBuilder(
      column: $table.stockQuantity,
      builder: (column) => ColumnOrderings(column));

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

  GeneratedColumn<String> get codeBarres => $composableBuilder(
      column: $table.codeBarres, builder: (column) => column);

  GeneratedColumn<double> get price =>
      $composableBuilder(column: $table.price, builder: (column) => column);

  GeneratedColumn<double> get vat =>
      $composableBuilder(column: $table.vat, builder: (column) => column);

  GeneratedColumn<double> get stockQuantity => $composableBuilder(
      column: $table.stockQuantity, builder: (column) => column);

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
    PrefetchHooks Function({bool categoryId, bool productsOptionsDriftRefs})> {
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
            Value<String?> codeBarres = const Value.absent(),
            Value<double> price = const Value.absent(),
            Value<double?> vat = const Value.absent(),
            Value<double?> stockQuantity = const Value.absent(),
            Value<String?> image = const Value.absent(),
            Value<int?> color = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            Value<String?> categoryId = const Value.absent(),
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
            codeBarres: codeBarres,
            price: price,
            vat: vat,
            stockQuantity: stockQuantity,
            image: image,
            color: color,
            isActive: isActive,
            categoryId: categoryId,
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
            Value<String?> codeBarres = const Value.absent(),
            required double price,
            Value<double?> vat = const Value.absent(),
            Value<double?> stockQuantity = const Value.absent(),
            Value<String?> image = const Value.absent(),
            Value<int?> color = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            Value<String?> categoryId = const Value.absent(),
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
            codeBarres: codeBarres,
            price: price,
            vat: vat,
            stockQuantity: stockQuantity,
            image: image,
            color: color,
            isActive: isActive,
            categoryId: categoryId,
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
              {categoryId = false, productsOptionsDriftRefs = false}) {
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
    PrefetchHooks Function({bool categoryId, bool productsOptionsDriftRefs})>;
typedef $$OptionsDriftTableCreateCompanionBuilder = OptionsDriftCompanion
    Function({
  required String id,
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
  Value<int> rowid,
});
typedef $$OptionsDriftTableUpdateCompanionBuilder = OptionsDriftCompanion
    Function({
  Value<String> id,
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
  Value<int> rowid,
});

final class $$OptionsDriftTableReferences extends BaseReferences<_$AppDatabase,
    $OptionsDriftTable, OptionsDriftData> {
  $$OptionsDriftTableReferences(super.$_db, super.$_table, super.$_typedResult);

  static MultiTypedResultKey<$ItemsDriftTable, List<ItemsDriftData>>
      _itemsDriftRefsTable(_$AppDatabase db) => MultiTypedResultKey.fromTable(
          db.itemsDrift,
          aliasName:
              $_aliasNameGenerator(db.optionsDrift.id, db.itemsDrift.optionId));

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
          aliasName: $_aliasNameGenerator(
              db.optionsDrift.id, db.productsOptionsDrift.optionId));

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
            Value<bool> isMandatory = const Value.absent(),
            Value<int> minToSelect = const Value.absent(),
            Value<int> maxToSelect = const Value.absent(),
            Value<bool> multipleSelect = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            Value<String?> createdById = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              OptionsDriftCompanion(
            id: id,
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
            rowid: rowid,
          ),
          createCompanionCallback: ({
            required String id,
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
            Value<int> rowid = const Value.absent(),
          }) =>
              OptionsDriftCompanion.insert(
            id: id,
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
  Value<double> price,
  Value<double?> vat,
  Value<bool> isActive,
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
  Value<double> price,
  Value<double?> vat,
  Value<bool> isActive,
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
      db.optionsDrift.createAlias(
          $_aliasNameGenerator(db.itemsDrift.optionId, db.optionsDrift.id));

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

  ColumnFilters<double> get price => $composableBuilder(
      column: $table.price, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get vat => $composableBuilder(
      column: $table.vat, builder: (column) => ColumnFilters(column));

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

  ColumnOrderings<double> get price => $composableBuilder(
      column: $table.price, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get vat => $composableBuilder(
      column: $table.vat, builder: (column) => ColumnOrderings(column));

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

  GeneratedColumn<double> get price =>
      $composableBuilder(column: $table.price, builder: (column) => column);

  GeneratedColumn<double> get vat =>
      $composableBuilder(column: $table.vat, builder: (column) => column);

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
            Value<double> price = const Value.absent(),
            Value<double?> vat = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
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
            price: price,
            vat: vat,
            isActive: isActive,
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
            Value<double> price = const Value.absent(),
            Value<double?> vat = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
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
            price: price,
            vat: vat,
            isActive: isActive,
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

  static $ProductsDriftTable _productIdTable(_$AppDatabase db) =>
      db.productsDrift.createAlias($_aliasNameGenerator(
          db.productsOptionsDrift.productId, db.productsDrift.id));

  $$ProductsDriftTableProcessedTableManager get productId {
    final $_column = $_itemColumn<String>('product_id')!;

    final manager = $$ProductsDriftTableTableManager($_db, $_db.productsDrift)
        .filter((f) => f.id.sqlEquals($_column));
    final item = $_typedResult.readTableOrNull(_productIdTable($_db));
    if (item == null) return manager;
    return ProcessedTableManager(
        manager.$state.copyWith(prefetchedData: [item]));
  }

  static $OptionsDriftTable _optionIdTable(_$AppDatabase db) =>
      db.optionsDrift.createAlias($_aliasNameGenerator(
          db.productsOptionsDrift.optionId, db.optionsDrift.id));

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
  Value<bool> isActive,
  Value<String?> createdById,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});
typedef $$PlanDriftTableUpdateCompanionBuilder = PlanDriftCompanion Function({
  Value<String> id,
  Value<String> name,
  Value<bool> isActive,
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
          aliasName: $_aliasNameGenerator(
              db.planDrift.id, db.restaurantTableDrift.planId));

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
            Value<bool> isActive = const Value.absent(),
            Value<String?> createdById = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              PlanDriftCompanion(
            id: id,
            name: name,
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
            Value<bool> isActive = const Value.absent(),
            Value<String?> createdById = const Value.absent(),
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              PlanDriftCompanion.insert(
            id: id,
            name: name,
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
  Value<double> width,
  Value<double> height,
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
  Value<double> width,
  Value<double> height,
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

  static $PlanDriftTable _planIdTable(_$AppDatabase db) =>
      db.planDrift.createAlias($_aliasNameGenerator(
          db.restaurantTableDrift.planId, db.planDrift.id));

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

  ColumnFilters<double> get width => $composableBuilder(
      column: $table.width, builder: (column) => ColumnFilters(column));

  ColumnFilters<double> get height => $composableBuilder(
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

  ColumnOrderings<double> get width => $composableBuilder(
      column: $table.width, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<double> get height => $composableBuilder(
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

  GeneratedColumn<double> get width =>
      $composableBuilder(column: $table.width, builder: (column) => column);

  GeneratedColumn<double> get height =>
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
            Value<double> width = const Value.absent(),
            Value<double> height = const Value.absent(),
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
            Value<double> width = const Value.absent(),
            Value<double> height = const Value.absent(),
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
  Value<double> value,
  required String discountType,
  Value<bool> isActive,
  Value<String?> createdById,
  required DateTime createdAt,
  required DateTime updatedAt,
  Value<DateTime?> deletedAt,
  Value<int> rowid,
});
typedef $$DiscountsDriftTableUpdateCompanionBuilder = DiscountsDriftCompanion
    Function({
  Value<String> id,
  Value<String> name,
  Value<double> value,
  Value<String> discountType,
  Value<bool> isActive,
  Value<String?> createdById,
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

  ColumnFilters<double> get value => $composableBuilder(
      column: $table.value, builder: (column) => ColumnFilters(column));

  ColumnFilters<String> get discountType => $composableBuilder(
      column: $table.discountType, builder: (column) => ColumnFilters(column));

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

  ColumnOrderings<double> get value => $composableBuilder(
      column: $table.value, builder: (column) => ColumnOrderings(column));

  ColumnOrderings<String> get discountType => $composableBuilder(
      column: $table.discountType,
      builder: (column) => ColumnOrderings(column));

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

  GeneratedColumn<double> get value =>
      $composableBuilder(column: $table.value, builder: (column) => column);

  GeneratedColumn<String> get discountType => $composableBuilder(
      column: $table.discountType, builder: (column) => column);

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
            Value<double> value = const Value.absent(),
            Value<String> discountType = const Value.absent(),
            Value<bool> isActive = const Value.absent(),
            Value<String?> createdById = const Value.absent(),
            Value<DateTime> createdAt = const Value.absent(),
            Value<DateTime> updatedAt = const Value.absent(),
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DiscountsDriftCompanion(
            id: id,
            name: name,
            value: value,
            discountType: discountType,
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
            Value<double> value = const Value.absent(),
            required String discountType,
            Value<bool> isActive = const Value.absent(),
            Value<String?> createdById = const Value.absent(),
            required DateTime createdAt,
            required DateTime updatedAt,
            Value<DateTime?> deletedAt = const Value.absent(),
            Value<int> rowid = const Value.absent(),
          }) =>
              DiscountsDriftCompanion.insert(
            id: id,
            name: name,
            value: value,
            discountType: discountType,
            isActive: isActive,
            createdById: createdById,
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

class $AppDatabaseManager {
  final _$AppDatabase _db;
  $AppDatabaseManager(this._db);
  $$CategoriesDriftTableTableManager get categoriesDrift =>
      $$CategoriesDriftTableTableManager(_db, _db.categoriesDrift);
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
}
