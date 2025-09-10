part of 'simaller_books_cubit.dart';

sealed class SimallerBooksState extends Equatable {
  const SimallerBooksState();

  @override
  List<Object> get props => [];
}

final class SimallerBooksInitial extends SimallerBooksState {}

final class SimallerBooksSuccess extends SimallerBooksState {
  final List<BookModel> books;

  const SimallerBooksSuccess(this.books);
}

final class SimallerBooksFailure extends SimallerBooksState {
  final String errorMessage;

  const SimallerBooksFailure(this.errorMessage);
}

final class SimallerBooksLoading extends SimallerBooksState {}
