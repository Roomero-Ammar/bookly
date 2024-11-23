import 'package:bookly/Features/home/presentation/manger/newest_books_cubit/newest_books_cubit.dart';
import 'package:bookly/Features/home/presentation/views/widgets/best_seller_list_view_item.dart';
import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:bookly/core/widgets/custom_loading_indicator.dart';
import 'package:bookly/core/widgets/custom_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BestSellerListView extends StatelessWidget {
  const BestSellerListView({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewestBooksCubit, NewestBooksState>(
      builder: (context, state) {
        if (state is NewestBooksSuccess) {
  return ListView.builder(
    padding: EdgeInsets.zero,
    physics: AlwaysScrollableScrollPhysics(),
    //  shrinkWrap: true,  // only take the height of your childs  // we can don't use it when we wrap the widget with Sliver fill remaining(without it it will not scroll) to reduce heavy
    itemCount: state.books.length,
    itemBuilder: (context, index) {
      return  Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: BestSellerListViewItem(
          bookModel: state.books[index],
        ),
      );
    },
  );
} else if (state is NewestBooksFailure)
{return CustomErrorWidget(errMessage: state.errMessage);
} else 
{
  return CustomShimmer();
}
      },
    );
  }
}
