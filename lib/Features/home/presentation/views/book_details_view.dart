import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly/Features/home/presentation/views/widgets/book_details_view_body.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manger/similar_books_cubit/similar_books_cubit.dart';

class BookDetailsView extends StatefulWidget {
  const BookDetailsView({
    super.key,
    required this.bookModel,
  });
  final BookModel bookModel;

  @override
  State<BookDetailsView> createState() => _BookDetailsViewState();
}

class _BookDetailsViewState extends State<BookDetailsView> {
  @override
  void initState() {
    super.initState();
    
    // Retrieve categories from the book model
    final categories = widget.bookModel.volumeInfo?.categories;

    // Check if categories are available and non-empty
    if (categories != null && categories.isNotEmpty) {
      BlocProvider.of<SimilarBooksCubit>(context).fetchSimilarBooks(
        category: categories.first,
      );
    } else {
      // Log or handle the case where there are no categories
      print('No categories available for this book.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BookDetailsViewBody(bookModel: widget.bookModel),
      ),
    );
  }
}
