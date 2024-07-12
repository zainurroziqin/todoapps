part of 'detail_cubit.dart';

sealed class DetailState extends Equatable {
  const DetailState();

  @override
  List<Object> get props => [];
}

final class DetailInitial extends DetailState {}
final class DetailLoading extends DetailState{}
final class DetailDone extends DetailState{}

