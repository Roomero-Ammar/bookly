import 'package:bookly/Features/home/presentation/views/widgets/custom_list_view_item.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/widgets/custom_error_widget.dart';
import 'package:bookly/core/widgets/custom_loading_indicator.dart';
import 'package:bookly/core/widgets/custom_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../manger/featured_books_cubit/featured_books_cubit.dart';

class FutureItemsListView extends StatelessWidget {
  const FutureItemsListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<FeaturedBooksCubit, FeaturedBooksState>(
      builder: (context, state) {
        if (state is FeaturedBooksSuccess) {
          return SizedBox(
            height: MediaQuery.of(context).size.height * 0.3,
            child: ListView.builder(
                physics: const BouncingScrollPhysics(),
                itemCount: state.books.length,
                scrollDirection: Axis.horizontal,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: GestureDetector(
                      onTap: () {
        GoRouter.of(context).push(AppRouter.kBookDetailsView , extra:state.books[index] );
      },
                      child: CustomListViewItem(
                        imageUrl: state
                                .books[index].volumeInfo?.imageLinks?.thumbnail ??
                            'https://scontent.fcai19-3.fna.fbcdn.net/v/t39.30808-6/369593159_3529271277346539_2479990707842420826_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=cc71e4&_nc_ohc=LoyFma0rwcQQ7kNvgHY9bBf&_nc_zt=23&_nc_ht=scontent.fcai19-3.fna&_nc_gid=AMbhXlZ-kcVUzt2ry74hKFT&oh=00_AYAQ2kpqf0ftaxrzvlDzF031zOpBmUGBLtYUqLSmp1SAIA&oe=671ED0CC', // صورة افتراضية عند وجود null
                      ),
                    ),
                  );
                }),
          );
        } else if (state is FeaturedBooksFailure) {
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
