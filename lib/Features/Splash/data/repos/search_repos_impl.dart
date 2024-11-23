import 'package:bookly/Features/Splash/data/repos/search_repos.dart';
import 'package:bookly/core/errors/failures.dart';
import 'package:bookly/core/utils/api_service.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import '../../../home/data/models/book_model/book_model.dart';

class SearchRepoImpl implements SearchRepo {
  final ApiService apiService;

  SearchRepoImpl(this.apiService);

  @override
  Future<Either<Failure, List<BookModel>>> fetchSearchBooks({required String category}) async {
    try {
      var data = await apiService.get(endPoint: 'volumes?q=$category&Sorting=newst&Filtering=free-ebooks');
      List<BookModel> books = [];
      
      if (data["items"] != null) {
        for (var item in data["items"]) {
          books.add(BookModel.fromJson(item));
        }
      }

      return right(books);
    } catch (e) {
      if (e is DioException) {
        return left(ServerFailure.fromDioError(e));
      }

      return left(ServerFailure(e.toString()));
    }
  }
}