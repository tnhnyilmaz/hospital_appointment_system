import 'package:flutter/material.dart';

import '../../constant/colors.dart';

class SearchInput extends StatelessWidget {
  const SearchInput({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 5,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: TextField(
        textAlignVertical: TextAlignVertical.center, // Dikey olarak ortala
        decoration: InputDecoration(
          contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          border: InputBorder.none,
          hintText: "Search",
          prefixIcon: Icon(
            Icons.search,
            size: 25,
            color: ProjectColors.black.withOpacity(0.5),
          ),
        ),
      ),
    );
  }
}
