import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly/core/utils/function/launch_url.dart';
import 'package:bookly/core/widgets/custom_button.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class BooksAction extends StatelessWidget {
  const BooksAction({super.key, required this.bookModel});

  final BookModel bookModel;

  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Row(
        children: [
          const Expanded(
            child: CustomButton(
              text: 'Free ',
              backgroundColor: Colors.white,
              textColor: Colors.black,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(12),
                bottomLeft: Radius.circular(12),
              ),
            ),
          ),
          Expanded(
            child: CustomButton(
  onPressed: () async {
    // Check if previewLink is not null before proceeding
    // final previewLink = bookModel.volumeInfo?.previewLink;
    // if (previewLink != null) {
    //   Uri uri = Uri.parse(previewLink);
    //   // Attempt to launch the URL
    //   if (!await launchUrl(uri)) {
    //     await launchUrl(uri);
    //   }
    // } else {
    //   // Handle case where previewLink is null
    //   // You may want to show a message or take some other action
    //   print('Preview link is not available');
    // }

    launchCustomUr(context, bookModel.volumeInfo?.previewLink);
  },

              text: getText(bookModel),
              
              fontSize: 16,
              backgroundColor: const Color(0xffEF8262),
              textColor: Colors.white,
              borderRadius: const BorderRadius.only(
                topRight: Radius.circular(12),
                bottomRight: Radius.circular(12),
              ),
            ),
          ),
        ],
      ),
    );
  }
  
   String getText(BookModel bookModel) {
    if (bookModel.volumeInfo?.previewLink == null) {
      return 'Not Avaliable';
    } else {
      return 'Preview';
    }
  }
}

