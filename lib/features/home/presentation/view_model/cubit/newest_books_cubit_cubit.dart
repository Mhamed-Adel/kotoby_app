import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kotoby_app/features/home/data/repo/home_repo.dart';

import '../../../data/model/book_model.dart';

part 'newest_books_cubit_state.dart';

class NewestBooksCubitCubit extends Cubit<NewestBooksCubitState> {
  NewestBooksCubitCubit(this.repo) : super(NewestBooksCubitInitial());
  final  HomeRepository repo;
  getNewestBooks()async {
    emit(NewestBooksCubitLoadingState());
    var result = await repo.fetchBestSellerBooks();
    result.fold((l){
      emit(NewestBooksCubitFailureState(l.errMessage));
    }, (r) {
      emit(NewestBooksCubitSuccessState(r));
    }) ;
  }
}
