import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kotoby_app/features/home/data/model/book_model.dart';
import 'package:kotoby_app/features/home/data/repo/home_repo.dart';

part 'features_book_cubit_state.dart';

class FeaturesBookCubit extends Cubit<FeaturesBookCubitState> {
  FeaturesBookCubit(this.homeRepository) : super(FeaturesBookCubitInitial());
  late HomeRepository homeRepository;
  getFeaturesBooks ()async {
    emit(FeaturesBookCubitLoadingState());
    var result =await homeRepository.fetchFeaturedBooks();

    result.fold((error) {
      emit(FeaturesBookCubitFailureState(error.errMessage));
    }, (result) {
      emit(FeaturesBookCubitSuccessState(result));
    });
  }
}
