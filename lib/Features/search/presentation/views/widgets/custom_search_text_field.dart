import 'package:bookly/Features/search/presentation/manager/cubit/get_fetch_search_book_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomSearchTextField extends StatelessWidget {
  CustomSearchTextField({super.key});
  
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      onSubmitted: (data) {
        BlocProvider.of<FetchSearchBookCubit>(context).getFetchSimilarBooksCubit(category: data);
      },
      decoration: InputDecoration(
        focusedBorder: buildOutlineInputBorder(),
        enabledBorder: buildOutlineInputBorder(),
        hintText: "Search",
        suffixIcon: IconButton(
          onPressed: () {
            // تنفيذ البحث باستخدام النص المدخل
            final searchQuery = _controller.text;
            BlocProvider.of<FetchSearchBookCubit>(context).getFetchSimilarBooksCubit(category: searchQuery);
          },
          icon: const Opacity(
            opacity: 0.8,
            child: FaIcon(
              FontAwesomeIcons.magnifyingGlass,
              size: 22,
            ),
          ),
        ),
      ),
    );
  }

  OutlineInputBorder buildOutlineInputBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: const BorderSide(
        color: Colors.white,
      ),
    );
  }
}
