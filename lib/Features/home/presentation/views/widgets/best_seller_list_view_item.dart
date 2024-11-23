import 'package:bookly/Features/home/data/models/book_model/book_model.dart';
import 'package:bookly/Features/home/presentation/views/widgets/book_rating.dart';
import 'package:bookly/Features/home/presentation/views/widgets/custom_list_view_item.dart';
import 'package:bookly/core/utils/app_router.dart';
import 'package:bookly/core/utils/assets.dart';
import 'package:bookly/core/utils/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BestSellerListViewItem extends StatelessWidget {
  const BestSellerListViewItem({super.key, required this.bookModel});

  final BookModel bookModel;
  // final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    // تحديد المؤلف هنا، باستخدام '?.' للتحقق من وجود العناصر
    
//     هنا، أنت تسأل:

// هل الغرفة مفتوحة؟ (هل volumeInfo ليست فارغة؟)
// إذا كانت الغرفة مفتوحة، هل يوجد شخص داخلها؟ (هل authors ليست فارغة؟)
// إذا كانت الغرفة مغلقة أو فارغة، ستقول: "لا يوجد أحد هنا، سأعتبره 'J.K. Rowling'".


    
    final author = bookModel.volumeInfo?.authors?.isNotEmpty == true
        ? bookModel.volumeInfo!.authors!.first
        //  ? bookModel.volumeInfo!.authors![0]

        : 'J.K. Rowling';

    return GestureDetector(
      onTap: () {
        GoRouter.of(context).push(AppRouter.kBookDetailsView, extra: bookModel);
      },
      child: SizedBox(
        height: 125,
        child: Row(
          children: [
            CustomListViewItem(
              imageUrl: bookModel.volumeInfo?.imageLinks?.thumbnail ??
                  'https://scontent.fcai19-3.fna.fbcdn.net/v/t39.30808-6/369593159_3529271277346539_2479990707842420826_n.jpg?_nc_cat=111&ccb=1-7&_nc_sid=cc71e4&_nc_ohc=LoyFma0rwcQQ7kNvgHY9bBf&_nc_zt=23&_nc_ht=scontent.fcai19-3.fna&_nc_gid=AMbhXlZ-kcVUzt2ry74hKFT&oh=00_AYAQ2kpqf0ftaxrzvlDzF031zOpBmUGBLtYUqLSmp1SAIA&oe=671ED0CC',
            ),
            const SizedBox(width: 30),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .5,
                    child: Text(
                      bookModel.volumeInfo?.title ?? 'Harry Potter And Goblet Of Fire',
                      style: Styles.textStyle20,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  const SizedBox(height: 3),

                  //  Text(
                  //  bookModel.volumeInfo?.authors![0]?? 'J.K. Rowling',
                  //   style: Styles.textStyle14,
                    
                  // ),

                  Text(
                    author, // استخدم المتغير هنا
                    style: Styles.textStyle14,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),

                  
                  Row(
                    children: [
                      const SizedBox(height: 3),
                      Text(
                        'Free',
                        style: Styles.textStyle20.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const Spacer(),
                      const BookRating(
                        rating: 5,
                        count: 20,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
