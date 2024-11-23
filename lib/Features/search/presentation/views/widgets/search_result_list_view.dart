import 'package:bookly/Features/home/presentation/views/widgets/best_seller_list_view_item.dart';
import 'package:bookly/Features/search/presentation/manager/cubit/get_fetch_search_book_cubit.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:bookly/core/widgets/custom_loading_indicator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchResultListView extends StatelessWidget {
  const SearchResultListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FetchSearchBookCubit, FetchSearchBookState>(
      builder: (context, state) {
        if (state is FetchSearchBookStateLoading) {
          return const CustomLoadingIndicator();
        } else if (state is FetchSearchBookStateFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else if (state is FetchSearchBookStateSuccess) {
          if (state.bookModel.isEmpty) {
            return const Center(child: Text("No results found", style: Styles.textStyle18));
          }
          return ListView.builder(
            padding: EdgeInsets.zero,
            itemCount: state.bookModel.length,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: BestSellerListViewItem(bookModel: state.bookModel[index]),
              );
            },
          );
        } else {
          return const Center(child: Text("Search for any book", style: Styles.textStyle18, textAlign: TextAlign.center));
        }
      },
    );
  }
}

/////////////

// import 'package:flutter/cupertino.dart';

// class SearchResultListView extends StatelessWidget {
//   const SearchResultListView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return ListView.builder(
//       padding: EdgeInsets.zero,
//       itemCount: 10,
//       itemBuilder: (context, index) {
//         return const Padding(
//           padding: EdgeInsets.symmetric(vertical: 10),
//           // child: BookListViewItem(),
//           child: Text('data'),
//         );
//       },
//     );
//   }
// }