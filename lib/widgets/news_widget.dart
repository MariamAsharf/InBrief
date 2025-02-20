import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/home_cubit.dart';
import 'package:news_app/bloc/home_state.dart';

import 'bottom_screen_sheet.dart';
import 'news_item.dart';

class NewsWidget extends StatelessWidget {
  NewsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
      if (state is GetNewsLoadingState) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            backgroundColor: Colors.transparent,
            title: Center(
              child: CircularProgressIndicator(),
            ),
          ),
        );
      } else if (state is GetNewsErrorState) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text("Error"),
            content: Text(state.error),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("OK"),
              ),
            ],
          ),
        );
      }
    },
        builder: (context, state) {
      var cubit = BlocProvider.of<HomeCubit>(context);
      var list = cubit.newsResponse?.articles ?? [];
      return ListView.separated(
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              showModalBottomSheet(
                backgroundColor: Colors.transparent,
                context: context,
                builder: (context) => BottomScreenSheet(
                  articles: list[index],
                ),
              );
            },
            child: NewsItem(
              articles: list[index],
            ),
          );
        },
        separatorBuilder: (context, index) => SizedBox(height: 16),
        itemCount: list.length ?? 0,
      );
    });
  }
}
