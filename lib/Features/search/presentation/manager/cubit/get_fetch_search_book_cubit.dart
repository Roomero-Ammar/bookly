import 'package:bloc/bloc.dart';
import 'package:bookly/Features/Splash/data/repos/search_repos.dart';
import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:equatable/equatable.dart';

part 'get_fetch_search_book_state.dart';

class FetchSearchBookCubit extends Cubit<FetchSearchBookState> {
  FetchSearchBookCubit(this.searchRepo) : super(FetchSearchBookStateInitial());
  final SearchRepo searchRepo;

  Future<void> getFetchSimilarBooksCubit({required String category}) async {
    emit(FetchSearchBookStateLoading());
    
    // Fetch search books from the repository
    final result = await searchRepo.fetchSearchBooks(category: category);
    
    result.fold(
      (failure) {
        emit(FetchSearchBookStateFailure(failure.errMessage));
      },
      (books) {
        emit(FetchSearchBookStateSuccess(books));
      },
    );
  }
}