import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bookly/features/home/presentation/manager/simaller_books_cubit/simaller_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_list_item_shimmer.dart';

class BookSimallerListView extends StatelessWidget {
  const BookSimallerListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.15,
      child: BlocBuilder<SimallerBooksCubit, SimallerBooksState>(
        builder: (context, state) {
          if (state is SimallerBooksSuccess) {
            return ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: state.books.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 6),
                  child: CustomBookItem(
                    imageUrl:
                        state.books[index].volumeInfo.imageLinks.thumbnail,
                  ),
                );
              },
            );
          } else if (state is SimallerBooksFailure) {
            return Center(
              child: CustomErrorWidget(errorMessage: state.errorMessage),
            );
          } else {
            return const BookListItemShimmer();
          }
        },
      ),
    );
  }
}
