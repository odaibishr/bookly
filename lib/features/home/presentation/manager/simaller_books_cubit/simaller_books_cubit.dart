import 'package:bloc/bloc.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/data/repos/home_repo.dart';
import 'package:equatable/equatable.dart';

part 'simaller_books_state.dart';

class SimallerBooksCubit extends Cubit<SimallerBooksState> {
  SimallerBooksCubit(this.homeRepo) : super(SimallerBooksInitial());

  final HomeRepo homeRepo;

  Future<void> fetchSimallerBooks({required String category}) async {
    emit(SimallerBooksLoading());
    var result = await homeRepo.fetchSimallerBooks(category: category);

    result.fold(
      (failure) => emit(SimallerBooksFailure(failure.errorMessage)),
      (books) => emit(SimallerBooksSuccess(books)),
    );
  }
}
