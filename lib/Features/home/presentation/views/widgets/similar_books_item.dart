import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly/core/utils/assets.dart';
import 'package:bookly/core/utils/function/launch_url.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SimilarBooksItem extends StatelessWidget {
  const SimilarBooksItem({super.key, required this.imageUrl, required this.bookModel});

  // @override
  // Widget build(BuildContext context) {
  //   // we deleted the  SizedBox(
  //   // height:MediaQuery.of(context).size.height * 0.3,), to use the item in list view
  //   return AspectRatio(
  //     aspectRatio: 2.6 / 4, //width / height
  //     child: Container(
  //       // height: MediaQuery.of(context).size.height * 0.25,
  //       // width: MediaQuery.of(context).size.width * 0.25,
  //       decoration: BoxDecoration(
  //         borderRadius: BorderRadius.circular(15),
  //         color: Colors.red,
  //         image: const DecorationImage(
  //           fit: BoxFit.fill,
  //           image: AssetImage(AssetsData.marvel3Image),
  //         ),
  //       ),
  //     ),
  //   );
  // }



    final BookModel bookModel;
   final String imageUrl;
  @override
  Widget build(BuildContext context) {
    // we deleted the  SizedBox(
    // height:MediaQuery.of(context).size.height * 0.3,), to use the item in list view
    return GestureDetector(

      onTap: () async {
        // Use the same action as in the BooksAction button
        await launchCustomUr(context, bookModel.volumeInfo?.previewLink);
      },

      child: ClipRRect(
         borderRadius: BorderRadius.circular(15),
        child: AspectRatio(
          aspectRatio: 2.6 / 4, //width / height
          child: CachedNetworkImage(imageUrl: imageUrl ,
           fit: BoxFit.fill,
           errorWidget: (context, url, error) => const Icon(
              Icons.error,
           ),
          ),
          
          
        
        
        
        ),
      ),
    );
  }
}
