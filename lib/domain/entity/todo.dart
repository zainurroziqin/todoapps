import 'package:equatable/equatable.dart';

class ToDoEntity extends Equatable{
  final int? id;
  final String? title;
  final String? description;
  final String? createdAt;
  final String? updatedAt;
  final bool? status;

  const ToDoEntity({
    this.id,
    this.title,
    this.description,
    this.createdAt,
    this.updatedAt,
    this.status
  });
  
  @override
  List<Object?> get props => [id, title, description, createdAt, updatedAt];
}