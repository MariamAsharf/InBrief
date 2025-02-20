import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'package:news_app/bloc/home_state.dart';
import 'package:news_app/repository/repo.dart';

import '../home_screen.dart';
import '../model/constant.dart';
import '../model/newsResponse.dart';
import '../model/source_response.dart';

class HomeCubit extends Cubit<HomeState> {
  SourcesResponse? sourcesResponse;
  NewsResponse? newsResponse;
  int selectedIndex = 0;
  String? selectedCategory;

  HomeRepo repo;

  static HomeCubit get(context) => BlocProvider.of(context);


  HomeCubit(this.repo) : super(HomeInitState());

  void changeTab(int index) async {
    selectedIndex = index;
    await getNews();
    emit(GetChangeTabState());
  }

  List<Articles> article = [];

  void getSource(String categoryName) async {
    try {
      emit(GetSourceLoadingState());
      sourcesResponse = await repo.getSource(categoryName);
      if (sourcesResponse!.status == "ok") {
        await getNews();
        emit(GetSourceSuccesState());
      } else {
        emit(GetSourceErrorState(sourcesResponse?.message ?? ""));
      }
    } catch (e) {
      emit(
        GetSourceErrorState("Something Went Wrong"),
      );
    }
  }

  Future<void> getNews() async {
    try {
      emit(GetNewsLoadingState());
      newsResponse =
          await repo.getNews(sourcesResponse?.sources?[selectedIndex].id ?? "");
      if (newsResponse!.status == "ok") {
        emit(GetNewsSuccesState());
      } else {
        emit(GetNewsErrorState(newsResponse?.message ?? ""));
      }
    } catch (e) {
      emit(GetNewsErrorState("Something Went Wrong"));
    }
  }

  void onCategoryClicked(String category) {
    selectedCategory = category;
    emit(CategorySelectedState());
  }

  void onBack(context) {
    selectedCategory = null;
    selectedIndex = 0;
    sourcesResponse = null;
    newsResponse = null;
    emit(HomeInitState());
    Navigator.popUntil(context, ModalRoute.withName(HomeScreen.routeName));
  }


  List<Articles> searchItem = [];
  void getSearchNews({required String input}) async {
    try {
      if (input.isEmpty) {
        searchItem = [];
        emit(SearchSuccessStates());
        return;
      }
      emit(GetNewsLoadingState());

      newsResponse = await repo.getSearchNews(input);

      if (newsResponse!.status == "ok") {
        searchItem = newsResponse!.articles ?? [];
        emit(SearchSuccessStates());
      } else {
        emit(GetNewsErrorState(newsResponse?.message ?? "Error fetching search results"));
      }
    } catch (e) {
      emit(GetNewsErrorState("Something went wrong"));
    }
  }


}
