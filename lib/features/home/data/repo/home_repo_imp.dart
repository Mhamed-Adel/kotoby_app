// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import 'package:kotoby_app/core/error/failure.dart';
import 'package:kotoby_app/core/network/api_service.dart';
import 'package:kotoby_app/features/home/data/model/book_model.dart';
import 'package:kotoby_app/features/home/data/repo/home_repo.dart';

class HomeRepoImp implements HomeRepository {

  late ApiService apiService; 
  HomeRepoImp({
    required this.apiService,
  });

  @override
  Future<Either<Failure, List<BookModel>>> fetchBestSellerBooks() async{

    String endPoint = 'volumes?Filtering=free-ebooks&Sorting=newest&q=computer science';

    try {
  var response =await apiService.get(endPoint: endPoint);
  
  List<BookModel> books = [];
  for (var element in response['items']) {
    books.add(BookModel.fromJson(element));
  }
  return right(books);
} on DioException catch (e) {
  return left(ServerFailure.fromDioError(e));
}
    
  }

  @override
  Future<Either<Failure, List<BookModel>>> fetchFeaturedBooks()async {
  
    String endPoint = 'volumes?Filtering=free-ebooks&q=computer science';

    try {
  var response =await apiService.get(endPoint: endPoint);
  
  List<BookModel> books = [];
  for (var element in response['items']) {
    books.add(BookModel.fromJson(element));
  }
  return right(books);
} on DioException catch (e) {
  return left(ServerFailure.fromDioError(e));
}
  }
  
}
