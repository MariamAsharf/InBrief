import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/home_cubit.dart';
import 'package:news_app/bloc/home_state.dart';
import 'package:news_app/repository/repo_impl.dart';

import 'news_widget.dart';

class TabSection extends StatelessWidget {
  String categoryName;
  Function? onTap;

  TabSection({super.key, required this.categoryName, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => HomeCubit(HomeRepoImpl())..getSource(categoryName),
      child: BlocConsumer<HomeCubit, HomeState>(
        listener: (context, state) {
          if (state is GetSourceLoadingState) {
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (context) => AlertDialog(
                backgroundColor: Colors.transparent,
                title: Center(child: CircularProgressIndicator(),),
              ),
            );
          }
         else if (state is GetSourceErrorState) {
            showDialog(
              context: context,
              builder: (context) => AlertDialog(
                title: Text("Error"),
                content: Text(state.error),
                actions: [
                  ElevatedButton(
                    onPressed: () {
                      onTap!();
                    },
                    child: Text("Go To Home"),
                  ),
                ],
              ),
            );
          }
        },
        builder: (context, state) {
          var cubit = BlocProvider.of<HomeCubit>(context);
          var bloc = cubit.sourcesResponse?.sources ?? [];
          return Column(
            children: [
              DefaultTabController(
                initialIndex: cubit.selectedIndex,
                length: bloc.length ?? 0,
                child: TabBar(
                  indicatorColor: Color(0xFF121212),
                  dividerColor: Colors.transparent,
                  labelStyle: Theme.of(context).textTheme.titleSmall,
                  onTap: (value) {
                    cubit.changeTab(value);
                  },
                  isScrollable: true,
                  tabs: bloc
                      .map(
                        (source) => Tab(
                          text: source.name,
                        ),
                      )
                      .toList(),
                ),
              ),
              Expanded(
                child: NewsWidget(),
              ),
            ],
          );
        },
      ),
    );
  }
}
