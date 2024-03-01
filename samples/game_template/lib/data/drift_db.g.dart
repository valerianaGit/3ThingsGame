// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'drift_db.dart';

// ignore_for_file: type=lint
class $GratitudesTable extends Gratitudes
    with TableInfo<$GratitudesTable, Gratitude> {
  @override
  final GeneratedDatabase attachedDatabase;
  final String? _alias;
  $GratitudesTable(this.attachedDatabase, [this._alias]);
  static const VerificationMeta _idMeta = const VerificationMeta('id');
  @override
  late final GeneratedColumn<int> id = GeneratedColumn<int>(
      'id', aliasedName, false,
      hasAutoIncrement: true,
      type: DriftSqlType.int,
      requiredDuringInsert: false,
      defaultConstraints:
          GeneratedColumn.constraintIsAlways('PRIMARY KEY AUTOINCREMENT'));
  static const VerificationMeta _gratitudeEntry1Meta =
      const VerificationMeta('gratitudeEntry1');
  @override
  late final GeneratedColumn<String> gratitudeEntry1 = GeneratedColumn<String>(
      'gratitude_entry1', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _gratitudeEntry2Meta =
      const VerificationMeta('gratitudeEntry2');
  @override
  late final GeneratedColumn<String> gratitudeEntry2 = GeneratedColumn<String>(
      'gratitude_entry2', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _gratitudeEntry3Meta =
      const VerificationMeta('gratitudeEntry3');
  @override
  late final GeneratedColumn<String> gratitudeEntry3 = GeneratedColumn<String>(
      'gratitude_entry3', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns =>
      [id, gratitudeEntry1, gratitudeEntry2, gratitudeEntry3, date];
  @override
  String get aliasedName => _alias ?? actualTableName;
  @override
  String get actualTableName => $name;
  static const String $name = 'gratitudes';
  @override
  VerificationContext validateIntegrity(Insertable<Gratitude> instance,
      {bool isInserting = false}) {
    final context = VerificationContext();
    final data = instance.toColumns(true);
    if (data.containsKey('id')) {
      context.handle(_idMeta, id.isAcceptableOrUnknown(data['id']!, _idMeta));
    }
    if (data.containsKey('gratitude_entry1')) {
      context.handle(
          _gratitudeEntry1Meta,
          gratitudeEntry1.isAcceptableOrUnknown(
              data['gratitude_entry1']!, _gratitudeEntry1Meta));
    }
    if (data.containsKey('gratitude_entry2')) {
      context.handle(
          _gratitudeEntry2Meta,
          gratitudeEntry2.isAcceptableOrUnknown(
              data['gratitude_entry2']!, _gratitudeEntry2Meta));
    }
    if (data.containsKey('gratitude_entry3')) {
      context.handle(
          _gratitudeEntry3Meta,
          gratitudeEntry3.isAcceptableOrUnknown(
              data['gratitude_entry3']!, _gratitudeEntry3Meta));
    }
    if (data.containsKey('date')) {
      context.handle(
          _dateMeta, date.isAcceptableOrUnknown(data['date']!, _dateMeta));
    }
    return context;
  }

  @override
  Set<GeneratedColumn> get $primaryKey => {id};
  @override
  Gratitude map(Map<String, dynamic> data, {String? tablePrefix}) {
    final effectivePrefix = tablePrefix != null ? '$tablePrefix.' : '';
    return Gratitude(
      id: attachedDatabase.typeMapping
          .read(DriftSqlType.int, data['${effectivePrefix}id'])!,
      gratitudeEntry1: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}gratitude_entry1']),
      gratitudeEntry2: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}gratitude_entry2']),
      gratitudeEntry3: attachedDatabase.typeMapping.read(
          DriftSqlType.string, data['${effectivePrefix}gratitude_entry3']),
      date: attachedDatabase.typeMapping
          .read(DriftSqlType.dateTime, data['${effectivePrefix}date']),
    );
  }

  @override
  $GratitudesTable createAlias(String alias) {
    return $GratitudesTable(attachedDatabase, alias);
  }
}

class Gratitude extends DataClass implements Insertable<Gratitude> {
  final int id;
  final String? gratitudeEntry1;
  final String? gratitudeEntry2;
  final String? gratitudeEntry3;
  final DateTime? date;
  const Gratitude(
      {required this.id,
      this.gratitudeEntry1,
      this.gratitudeEntry2,
      this.gratitudeEntry3,
      this.date});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || gratitudeEntry1 != null) {
      map['gratitude_entry1'] = Variable<String>(gratitudeEntry1);
    }
    if (!nullToAbsent || gratitudeEntry2 != null) {
      map['gratitude_entry2'] = Variable<String>(gratitudeEntry2);
    }
    if (!nullToAbsent || gratitudeEntry3 != null) {
      map['gratitude_entry3'] = Variable<String>(gratitudeEntry3);
    }
    if (!nullToAbsent || date != null) {
      map['date'] = Variable<DateTime>(date);
    }
    return map;
  }

  GratitudesCompanion toCompanion(bool nullToAbsent) {
    return GratitudesCompanion(
      id: Value(id),
      gratitudeEntry1: gratitudeEntry1 == null && nullToAbsent
          ? const Value.absent()
          : Value(gratitudeEntry1),
      gratitudeEntry2: gratitudeEntry2 == null && nullToAbsent
          ? const Value.absent()
          : Value(gratitudeEntry2),
      gratitudeEntry3: gratitudeEntry3 == null && nullToAbsent
          ? const Value.absent()
          : Value(gratitudeEntry3),
      date: date == null && nullToAbsent ? const Value.absent() : Value(date),
    );
  }

  factory Gratitude.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Gratitude(
      id: serializer.fromJson<int>(json['id']),
      gratitudeEntry1: serializer.fromJson<String?>(json['gratitudeEntry1']),
      gratitudeEntry2: serializer.fromJson<String?>(json['gratitudeEntry2']),
      gratitudeEntry3: serializer.fromJson<String?>(json['gratitudeEntry3']),
      date: serializer.fromJson<DateTime?>(json['date']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'gratitudeEntry1': serializer.toJson<String?>(gratitudeEntry1),
      'gratitudeEntry2': serializer.toJson<String?>(gratitudeEntry2),
      'gratitudeEntry3': serializer.toJson<String?>(gratitudeEntry3),
      'date': serializer.toJson<DateTime?>(date),
    };
  }

  Gratitude copyWith(
          {int? id,
          Value<String?> gratitudeEntry1 = const Value.absent(),
          Value<String?> gratitudeEntry2 = const Value.absent(),
          Value<String?> gratitudeEntry3 = const Value.absent(),
          Value<DateTime?> date = const Value.absent()}) =>
      Gratitude(
        id: id ?? this.id,
        gratitudeEntry1: gratitudeEntry1.present
            ? gratitudeEntry1.value
            : this.gratitudeEntry1,
        gratitudeEntry2: gratitudeEntry2.present
            ? gratitudeEntry2.value
            : this.gratitudeEntry2,
        gratitudeEntry3: gratitudeEntry3.present
            ? gratitudeEntry3.value
            : this.gratitudeEntry3,
        date: date.present ? date.value : this.date,
      );
  @override
  String toString() {
    return (StringBuffer('Gratitude(')
          ..write('id: $id, ')
          ..write('gratitudeEntry1: $gratitudeEntry1, ')
          ..write('gratitudeEntry2: $gratitudeEntry2, ')
          ..write('gratitudeEntry3: $gratitudeEntry3, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode =>
      Object.hash(id, gratitudeEntry1, gratitudeEntry2, gratitudeEntry3, date);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Gratitude &&
          other.id == this.id &&
          other.gratitudeEntry1 == this.gratitudeEntry1 &&
          other.gratitudeEntry2 == this.gratitudeEntry2 &&
          other.gratitudeEntry3 == this.gratitudeEntry3 &&
          other.date == this.date);
}

class GratitudesCompanion extends UpdateCompanion<Gratitude> {
  final Value<int> id;
  final Value<String?> gratitudeEntry1;
  final Value<String?> gratitudeEntry2;
  final Value<String?> gratitudeEntry3;
  final Value<DateTime?> date;
  const GratitudesCompanion({
    this.id = const Value.absent(),
    this.gratitudeEntry1 = const Value.absent(),
    this.gratitudeEntry2 = const Value.absent(),
    this.gratitudeEntry3 = const Value.absent(),
    this.date = const Value.absent(),
  });
  GratitudesCompanion.insert({
    this.id = const Value.absent(),
    this.gratitudeEntry1 = const Value.absent(),
    this.gratitudeEntry2 = const Value.absent(),
    this.gratitudeEntry3 = const Value.absent(),
    this.date = const Value.absent(),
  });
  static Insertable<Gratitude> custom({
    Expression<int>? id,
    Expression<String>? gratitudeEntry1,
    Expression<String>? gratitudeEntry2,
    Expression<String>? gratitudeEntry3,
    Expression<DateTime>? date,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (gratitudeEntry1 != null) 'gratitude_entry1': gratitudeEntry1,
      if (gratitudeEntry2 != null) 'gratitude_entry2': gratitudeEntry2,
      if (gratitudeEntry3 != null) 'gratitude_entry3': gratitudeEntry3,
      if (date != null) 'date': date,
    });
  }

  GratitudesCompanion copyWith(
      {Value<int>? id,
      Value<String?>? gratitudeEntry1,
      Value<String?>? gratitudeEntry2,
      Value<String?>? gratitudeEntry3,
      Value<DateTime?>? date}) {
    return GratitudesCompanion(
      id: id ?? this.id,
      gratitudeEntry1: gratitudeEntry1 ?? this.gratitudeEntry1,
      gratitudeEntry2: gratitudeEntry2 ?? this.gratitudeEntry2,
      gratitudeEntry3: gratitudeEntry3 ?? this.gratitudeEntry3,
      date: date ?? this.date,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (gratitudeEntry1.present) {
      map['gratitude_entry1'] = Variable<String>(gratitudeEntry1.value);
    }
    if (gratitudeEntry2.present) {
      map['gratitude_entry2'] = Variable<String>(gratitudeEntry2.value);
    }
    if (gratitudeEntry3.present) {
      map['gratitude_entry3'] = Variable<String>(gratitudeEntry3.value);
    }
    if (date.present) {
      map['date'] = Variable<DateTime>(date.value);
    }
    return map;
  }

  @override
  String toString() {
    return (StringBuffer('GratitudesCompanion(')
          ..write('id: $id, ')
          ..write('gratitudeEntry1: $gratitudeEntry1, ')
          ..write('gratitudeEntry2: $gratitudeEntry2, ')
          ..write('gratitudeEntry3: $gratitudeEntry3, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }
}

abstract class _$GratitudesDatabase extends GeneratedDatabase {
  _$GratitudesDatabase(QueryExecutor e) : super(e);
  late final $GratitudesTable gratitudes = $GratitudesTable(this);
  @override
  Iterable<TableInfo<Table, Object?>> get allTables =>
      allSchemaEntities.whereType<TableInfo<Table, Object?>>();
  @override
  List<DatabaseSchemaEntity> get allSchemaEntities => [gratitudes];
}
