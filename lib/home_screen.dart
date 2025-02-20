import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/home_cubit.dart';
import 'package:news_app/bloc/home_state.dart';
import 'package:news_app/widgets/category_section.dart';
import 'package:news_app/widgets/news_search.dart';
import 'package:news_app/widgets/tab_section.dart';
import 'widgets/app_drawer.dart';

class HomeScreen extends StatelessWidget {
  static const String routeName = "Home Screen";

  HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeCubit, HomeState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = BlocProvider.of<HomeCubit>(context);

        return Scaffold(
          drawer: AppDrawer(onBack: () {
            cubit.onBack(context);
          }),
          appBar: AppBar(
            centerTitle: true,
            title: Text(cubit.selectedCategory ?? "Home"),
            actions: [
              IconButton(
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) => BlocProvider.value(
                      value: cubit,
                      child: NewsSearch(),
                    ),
                  );
                },
                icon: Icon(Icons.search),
              ),
            ],
          ),
          body: cubit.selectedCategory == null
              ? CategorySection(onCatigoryClick: cubit.onCategoryClicked)
              : TabSection(
            categoryName: cubit.selectedCategory!,
            onTap: cubit.onBack,
          ),
        );
      },
    );
  }
}
