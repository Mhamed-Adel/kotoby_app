part of 'features_book_cubit_cubit.dart';

sealed class FeaturesBookCubitState extends Equatable {
  const FeaturesBookCubitState();

  @override
  List<Object> get props => [];
}

final class FeaturesBookCubitInitial extends FeaturesBookCubitState {}
final class FeaturesBookCubitSuccessState extends FeaturesBookCubitState {
  final List<BookModel> books;

  const FeaturesBookCubitSuccessState(this.books);
}
final class FeaturesBookCubitFailureState extends FeaturesBookCubitState {
 final String error;

  const FeaturesBookCubitFailureState(this.error);
}
final class FeaturesBookCubitLoadingState extends FeaturesBookCubitState {}
