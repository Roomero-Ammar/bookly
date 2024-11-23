import 'package:bookly/Features/home/presentation/manger/similar_books_cubit/similar_books_cubit.dart';
import 'package:bookly/Features/home/presentation/views/widgets/similar_books_item.dart';
import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:bookly/core/widgets/custom_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SimilarBooksListView extends StatelessWidget {
  const SimilarBooksListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SimilarBooksCubit, SimilarBooksState>(
      builder: (context, state) {
        if (state is SimilarBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * .15,
            child: ListView.builder(
              itemCount: state.books.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) {
                final book = state.books[index];
                return Padding(
                  padding: EdgeInsets.symmetric(horizontal: 5.0),
                  child:
                  
                  // CustomListViewItem(
                  //       imageUrl: state.books[index].volumeInfo?.imageLinks ?.thumbnail ??
                  //           'https://th.bing.com/th/id/OIP.laGV5aXAMIByTtixM4coKgHaLH?rs=1&pid=ImgDetMain'),

                   SimilarBooksItem(
                    imageUrl: book.volumeInfo?.imageLinks?.thumbnail ??
                        'https://th.bing.com/th/id/OIP.laGV5aXAMIByTtixM4coKgHaLH?rs=1&pid=ImgDetMain',
                    bookModel: book,
                  ),
                );
              },
            ),
          );
        } else if (state is SimilarBooksFailure) {
          return CustomErrorWidget(errMessage: state.errMessage);
        } else {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: const CustomShimmer(),
          );
        }
      },
    );
  }
}
