import 'package:bookly/features/search/presentation/views/widgets/custom_search_text_filed.dart';
import 'package:flutter/material.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: const Column(children: [CustomSearchTextFiled()]),
    );
  }
}
