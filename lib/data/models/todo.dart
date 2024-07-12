import 'package:floor/floor.dart';
import 'package:todoapps/domain/entity/todo.dart';

@Entity(tableName: 'todo',primaryKeys: ['id'])
class ToDoModel extends ToDoEntity{
  const ToDoModel({
    int? id,
    String? title,
    String? description,
    String? createdAt,
    String? updatedAt,
    bool? status
  }): super(
    id: id,
    title: title,
    description: description,
    createdAt: createdAt,
    updatedAt: updatedAt,
    status: status
  );

  factory ToDoModel.fromEntity(ToDoEntity entity){
    return ToDoModel(
      id: entity.id,
      title: entity.title,
      description: entity.description,
      createdAt: entity.createdAt,
      updatedAt: entity.updatedAt,
      status: entity.status,
    );
  }
}