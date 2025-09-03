import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/features/search/presentation/views/widgets/custom_search_text_filed.dart';
import 'package:bookly/features/search/presentation/views/widgets/search_result_list_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SearchViewBody extends StatelessWidget {
  const SearchViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(height: 10),
          GestureDetector(
            onTap: () {
              GoRouter.of(context).pop();
            },
            child: Opacity(opacity: 0.5, child: Icon(Icons.arrow_back)),
          ),
          const SizedBox(height: 16),
          const CustomSearchTextFiled(),
          const SizedBox(height: 20),
          Text(
            'Search Result',
            style: Styles.textStyle18.copyWith(fontWeight: FontWeight.bold),
          ),
          const Expanded(child: ResultSearchListView()),
          const SizedBox(height: 15),
        ],
      ),
    );
  }
}
