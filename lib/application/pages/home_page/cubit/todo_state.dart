part of 'todo_cubit.dart';

sealed class HomeState extends Equatable {
  const HomeState();

  @override
  List<Object> get props => [];
}

final class HomeInitial extends HomeState {}
final class HomeLoading extends HomeState{}
final class HomeEmpty extends HomeState{}
final class HomeDone extends HomeState{
  final List<ToDoEntity> listToDo;
  const HomeDone({required this.listToDo});
}
