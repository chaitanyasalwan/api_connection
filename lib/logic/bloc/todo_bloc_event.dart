part of 'todo_bloc_bloc.dart';

@immutable
sealed class TodoBlocEvent {}

final class TodoFetchEvent extends TodoBlocEvent {}
