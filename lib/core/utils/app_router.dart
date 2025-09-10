import 'package:bookly/core/utils/service_locator.dart';
import 'package:bookly/features/home/data/models/book_model/book_model.dart';
import 'package:bookly/features/home/data/repos/home_repo_impl.dart';
import 'package:bookly/features/home/presentation/manager/simaller_books_cubit/simaller_books_cubit.dart';
import 'package:bookly/features/home/presentation/views/book_details_view.dart';
import 'package:bookly/features/home/presentation/views/home_view.dart';
import 'package:bookly/features/search/presentation/views/search_view.dart';
import 'package:bookly/features/splash/presentation/views/splash_view.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

abstract class AppRouter {
  static const String splashRoute = '/';
  static const String homeRoute = '/home';
  static const String bookDetails = '/book-details';
  static const String searchView = '/searchView';

  static GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: splashRoute,
        builder: (context, state) => const SplashView(),
      ),

      GoRoute(path: homeRoute, builder: (context, state) => const HomeView()),

      GoRoute(
        path: bookDetails,
        builder: (context, state) => BlocProvider(
          create: (context) => SimallerBooksCubit(getIt.get<HomeRepoImpl>()),
          child: BookDetailsView(bookModel: state.extra as BookModel),
        ),
      ),

      GoRoute(
        path: searchView,
        builder: (context, state) => const SearchView(),
      ),
    ],
  );
}
