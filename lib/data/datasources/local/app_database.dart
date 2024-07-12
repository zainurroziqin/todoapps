import 'package:floor/floor.dart';
import 'package:todoapps/data/datasources/local/DAO/todo_dao.dart';
import 'package:todoapps/data/models/todo.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'dart:async';
part 'app_database.g.dart';

@Database(version: 1, entities: [ToDoModel])
abstract class AppDatabase extends FloorDatabase {
  ToDoDao get todoDao;
}