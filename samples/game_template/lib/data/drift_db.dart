// DATA MODEL
//GRATITUDES
// content - text
// date - DateTime


//Use [ flutter pub run build_runner build ] to generate db_g file 
//https://drift.simonbinder.eu/docs/getting-started/starting_with_sql/#what-drift-generates
import 'dart:ffi';
import 'package:drift/drift.dart';
import 'package:game_template/constants/strings.dart';
import 'dart:io'; // needed to generate/find a path to db
import 'package:drift/native.dart';
//import 'package:flutter/material.dart' as prefix;
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p; // needed to generate/find a path to db
// import generated file by drift
part 'drift_db.g.dart';

class Gratitudes extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get content => text().nullable()();
  DateTimeColumn get date => dateTime().nullable()();

}

@DriftDatabase(tables: [Gratitudes])
class GratitudesDatabase extends _$GratitudesDatabase {
  GratitudesDatabase() : super(_openConnection());
  int get schemaVersion => 1;

  // QUERIES
  //MARK: POSTS
  //CREATE
  Future insertNewGratitude(Gratitude gratitude) => into(gratitudes).insert(gratitude);
  //Create using companion -  to create gratitude since id is an autoincrement and cannot be entered manually
  Future<int> insertNewCompanionGratitude(GratitudesCompanion gratitude) =>
      into(gratitudes).insert(gratitude);
  //READ
  Future<List<Gratitude>> getAllGratitudes() => select(gratitudes).get();
  Stream<List<Gratitude>> watchAllGratitudes() => select(gratitudes)
      .watch(); //automatically emits new values when underlying table changes

  //UPDATE
  Future updateNewGratitude(Gratitude gratitude) => update(gratitudes).replace(gratitude);
//DELETE
  Future deleteGratitude(Gratitude gratitude) => delete(gratitudes).delete(gratitude);

}
LazyDatabase _openConnection() {
  // the LazyDatabase util lets us find the right location for the file async.
  return LazyDatabase(() async {
    // put the database file, called db.sqlite here, into the documents folder
    // for your app.
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'gratitudedb.sqlite'));
    return NativeDatabase(file,
        logStatements: true); // STEP 5 - SET logs to true
  });
}