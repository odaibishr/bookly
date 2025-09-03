import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/home/presentation/views/widgets/books_simaller_list_view.dart';
import 'package:flutter/material.dart';

class SimallerBooksSection extends StatelessWidget {
  const SimallerBooksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20),
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "You can also like",
            style: Styles.textStyle14.copyWith(fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(height: 16),
        const BookSimallerListView(),
      ],
    );
  }
}
