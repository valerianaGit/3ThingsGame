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
  static const VerificationMeta _contentMeta =
      const VerificationMeta('content');
  @override
  late final GeneratedColumn<String> content = GeneratedColumn<String>(
      'content', aliasedName, true,
      type: DriftSqlType.string, requiredDuringInsert: false);
  static const VerificationMeta _dateMeta = const VerificationMeta('date');
  @override
  late final GeneratedColumn<DateTime> date = GeneratedColumn<DateTime>(
      'date', aliasedName, true,
      type: DriftSqlType.dateTime, requiredDuringInsert: false);
  @override
  List<GeneratedColumn> get $columns => [id, content, date];
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
    if (data.containsKey('content')) {
      context.handle(_contentMeta,
          content.isAcceptableOrUnknown(data['content']!, _contentMeta));
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
      content: attachedDatabase.typeMapping
          .read(DriftSqlType.string, data['${effectivePrefix}content']),
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
  final String? content;
  final DateTime? date;
  const Gratitude({required this.id, this.content, this.date});
  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    map['id'] = Variable<int>(id);
    if (!nullToAbsent || content != null) {
      map['content'] = Variable<String>(content);
    }
    if (!nullToAbsent || date != null) {
      map['date'] = Variable<DateTime>(date);
    }
    return map;
  }

  GratitudesCompanion toCompanion(bool nullToAbsent) {
    return GratitudesCompanion(
      id: Value(id),
      content: content == null && nullToAbsent
          ? const Value.absent()
          : Value(content),
      date: date == null && nullToAbsent ? const Value.absent() : Value(date),
    );
  }

  factory Gratitude.fromJson(Map<String, dynamic> json,
      {ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return Gratitude(
      id: serializer.fromJson<int>(json['id']),
      content: serializer.fromJson<String?>(json['content']),
      date: serializer.fromJson<DateTime?>(json['date']),
    );
  }
  @override
  Map<String, dynamic> toJson({ValueSerializer? serializer}) {
    serializer ??= driftRuntimeOptions.defaultSerializer;
    return <String, dynamic>{
      'id': serializer.toJson<int>(id),
      'content': serializer.toJson<String?>(content),
      'date': serializer.toJson<DateTime?>(date),
    };
  }

  Gratitude copyWith(
          {int? id,
          Value<String?> content = const Value.absent(),
          Value<DateTime?> date = const Value.absent()}) =>
      Gratitude(
        id: id ?? this.id,
        content: content.present ? content.value : this.content,
        date: date.present ? date.value : this.date,
      );
  @override
  String toString() {
    return (StringBuffer('Gratitude(')
          ..write('id: $id, ')
          ..write('content: $content, ')
          ..write('date: $date')
          ..write(')'))
        .toString();
  }

  @override
  int get hashCode => Object.hash(id, content, date);
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      (other is Gratitude &&
          other.id == this.id &&
          other.content == this.content &&
          other.date == this.date);
}

class GratitudesCompanion extends UpdateCompanion<Gratitude> {
  final Value<int> id;
  final Value<String?> content;
  final Value<DateTime?> date;
  const GratitudesCompanion({
    this.id = const Value.absent(),
    this.content = const Value.absent(),
    this.date = const Value.absent(),
  });
  GratitudesCompanion.insert({
    this.id = const Value.absent(),
    this.content = const Value.absent(),
    this.date = const Value.absent(),
  });
  static Insertable<Gratitude> custom({
    Expression<int>? id,
    Expression<String>? content,
    Expression<DateTime>? date,
  }) {
    return RawValuesInsertable({
      if (id != null) 'id': id,
      if (content != null) 'content': content,
      if (date != null) 'date': date,
    });
  }

  GratitudesCompanion copyWith(
      {Value<int>? id, Value<String?>? content, Value<DateTime?>? date}) {
    return GratitudesCompanion(
      id: id ?? this.id,
      content: content ?? this.content,
      date: date ?? this.date,
    );
  }

  @override
  Map<String, Expression> toColumns(bool nullToAbsent) {
    final map = <String, Expression>{};
    if (id.present) {
      map['id'] = Variable<int>(id.value);
    }
    if (content.present) {
      map['content'] = Variable<String>(content.value);
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
          ..write('content: $content, ')
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
