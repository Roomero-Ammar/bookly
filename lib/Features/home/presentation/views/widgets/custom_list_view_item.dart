import 'package:bookly/core/utils/assets.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomListViewItem extends StatelessWidget {
  const CustomListViewItem({super.key, required this.imageUrl});

  final String imageUrl;

  @override
  Widget build(BuildContext context) {
    // we deleted the  SizedBox(
    // height:MediaQuery.of(context).size.height * 0.3,), to use the item in list view
    return ClipRRect(
       borderRadius: BorderRadius.circular(15),
      child: AspectRatio(
        aspectRatio: 2.6 / 4, //width / height
        child: CachedNetworkImage(imageUrl: imageUrl ,
         fit: BoxFit.fill,
         errorWidget: (context, url, error) => const Icon(
            Icons.error,
         ),
        ),
        
        
        
        
        //  Container(
        //   // height: MediaQuery.of(context).size.height * 0.25,
        //   // width: MediaQuery.of(context).size.width * 0.25,
        //   decoration: BoxDecoration(
        //     borderRadius: BorderRadius.circular(15),
        //    // color: Colors.red,
        //     image:  DecorationImage(
        //       fit: BoxFit.fill,
        //       image: 
        //       NetworkImage(imageUrl),
        //       // AssetImage(AssetsData.bookImage),
        //     ),
        //   ),
        // ),
      
      
      
      ),
    );
  }
}
