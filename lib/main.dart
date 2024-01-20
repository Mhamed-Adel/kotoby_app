import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kotoby_app/core/utils/service_locator.dart';
import 'package:kotoby_app/features/home/data/repo/home_repo_imp.dart';
import 'package:kotoby_app/features/home/presentation/view_model/cubit/newest_books_cubit_cubit.dart';
import 'package:kotoby_app/features/home/presentation/view_model/features_cubit/features_book_cubit_cubit.dart';

import 'constants.dart';
import 'core/utils/app_router.dart';

void main() {
  init();
  runApp(const Bookly());
}

class Bookly extends StatelessWidget {
  const Bookly({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => FeaturesBookCubit(getIt.get<HomeRepoImp>())..getFeaturesBooks(),),
        BlocProvider(create: (context) => NewestBooksCubitCubit(getIt.get<HomeRepoImp>()),),

      ],
      child: MaterialApp.router(
        routerConfig: AppRouter.router,
        debugShowCheckedModeBanner: false,
        theme: ThemeData.dark().copyWith(
          scaffoldBackgroundColor: kPrimaryColor,
          textTheme: GoogleFonts.montserratTextTheme(ThemeData.dark().textTheme),
        ),
      ),
    );
  }
}
