import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly/Features/home/presentation/views/widgets/similar_books_item.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/cupertino.dart';

import 'book_rating.dart';
import 'books_action.dart';
import 'custom_book_details_app_bar.dart';
import 'custom_list_view_item.dart';

class BooksDetailsSection extends StatelessWidget {
  const BooksDetailsSection({
    super.key,
    required this.book,
  });

  final BookModel book;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: width * .17),
          child:
              //  SimilarBooksItem(),
              CustomListViewItem(
            imageUrl: book.volumeInfo?.imageLinks?.thumbnail ??
                'https://www.facebook.com/photo/?fbid=3360097424263926&set=pcb.3360098227597179',
          ),
        ),
        const SizedBox(
          height: 43,
        ),
        Text(
          book.volumeInfo?.title ?? 'The Jungle Book',
          style: Styles.textStyle30.copyWith(fontStyle: FontStyle.italic),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 6,
        ),
        Opacity(
          opacity: 0.7,
          child: Text(
            book.volumeInfo?.authors?[0] ?? 'Rudyard Kipling',
            style: Styles.textStyle18.copyWith(
              fontStyle: FontStyle.italic,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        const SizedBox(
          height: 18,
        ),
        const BookRating(
          rating: 4.8,
          count: 2390,
          mainAxisAlignment: MainAxisAlignment.center,
        ),
        const SizedBox(height: 37),
        BooksAction(
          bookModel: book,
        ),
      ],
    );
  }
}
