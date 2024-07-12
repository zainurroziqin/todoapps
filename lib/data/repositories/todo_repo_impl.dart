import 'package:todoapps/data/datasources/local/app_database.dart';
import 'package:todoapps/data/models/todo.dart';
import 'package:todoapps/domain/entity/todo.dart';
import 'package:todoapps/domain/repositories/todo_repo.dart';

class ToDoRepositoryImpl implements ToDoRepository {
  final AppDatabase _appDatabase;

  const ToDoRepositoryImpl(this._appDatabase);

  @override
  Future<List<ToDoEntity>> getToDos() async {
    return _appDatabase.todoDao.getToDo();
  }

  @override
  Future<void> removeToDo(ToDoEntity toDoEntity) {
    return _appDatabase.todoDao.deleteToDo(ToDoModel.fromEntity(toDoEntity));
  }

  @override
  Future<void> saveToDo(ToDoEntity toDoEntity) {
    return _appDatabase.todoDao.insertToDo(ToDoModel.fromEntity(toDoEntity));
  }

  @override
  Future<void> updateStatus(ToDoEntity toDoEntity, bool status) {
    return _appDatabase.todoDao.updateToDo(ToDoModel(
        id: toDoEntity.id,
        title: toDoEntity.title,
        description: toDoEntity.description,
        createdAt: toDoEntity.createdAt,
        updatedAt: toDoEntity.updatedAt,
        status: status));
  }

  @override
  Future<void> updateToDo(ToDoEntity toDoEntity) {
    return _appDatabase.todoDao.updateToDo(ToDoModel.fromEntity(toDoEntity));
  }
}
