import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_actions.dart';
import 'package:bookly/features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly/features/home/presentation/views/widgets/custom_book_item.dart';
import 'package:flutter/material.dart';

class BookDetailsSection extends StatelessWidget {
  const BookDetailsSection({super.key, required this.book});
  final BookModel book;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        const SizedBox(height: 20),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * 0.2),
          child: CustomBookItem(imageUrl: book.volumeInfo.imageLinks.thumbnail),
        ),
        const SizedBox(height: 43),
        Text(
          book.volumeInfo.title!,
          style: Styles.textStyle30.copyWith(fontWeight: FontWeight.bold),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 6),
        Opacity(
          opacity: 0.7,
          child: Text(
            book.volumeInfo.authors![0],
            style: Styles.textStyle18.copyWith(fontStyle: FontStyle.italic),
          ),
        ),
        const SizedBox(height: 18),
        const BookRating(mainAxisAlignment: MainAxisAlignment.center),
        const SizedBox(height: 37),
        const BookActions(),
      ],
    );
  }
}
