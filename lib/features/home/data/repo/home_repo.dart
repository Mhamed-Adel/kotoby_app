
import 'package:dartz/dartz.dart';
import 'package:kotoby_app/core/error/failure.dart';
import 'package:kotoby_app/features/home/data/model/book_model.dart';

abstract class HomeRepository {

  Future<Either<Failure,List<BookModel>>> fetchBestSellerBooks();
  Future<Either<Failure,List<BookModel>>> fetchFeaturedBooks();

}