import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/bloc/home_cubit.dart';
import 'package:news_app/model/newsResponse.dart';
import 'package:news_app/widgets/app_drawer.dart';
import 'package:url_launcher/url_launcher.dart';

class NewsDetails extends StatelessWidget {
  static const String routeName = "News Details";

  NewsDetails({super.key});

  @override
  Widget build(BuildContext context) {
    final articles = ModalRoute.of(context)!.settings.arguments as Articles;
    final cubit = BlocProvider.of<HomeCubit>(context);

    return Scaffold(
      drawer: AppDrawer(onBack: () {
        cubit.onBack(context);
      }),
      appBar: AppBar(
        centerTitle: false,
        title: Text(articles.source!.name ?? ""),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                articles.title ?? "",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(height: 16),
              Text(
                articles.description ?? "",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              SizedBox(height: 22),
              Text(
                "By: ${articles.author}",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              SizedBox(height: 4),
              Text(
                articles.publishedAt?.substring(0, 10) ?? "",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              SizedBox(height: 16),
              Image.network(
                articles.urlToImage ?? "",
                height: 220,
                width: double.infinity,
              ),
              SizedBox(height: 22),
              Text(
                articles.content ?? "",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              GestureDetector(
                onTap: () async {
                  final Uri url = Uri.parse(articles.url ?? "");
                  if (!await launchUrl(url,
                      mode: LaunchMode.externalApplication)) {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Can't Load Link"),
                      ),
                    );
                  }
                },
                child: Text(
                  "See More: ${articles.url}" ?? "",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        color: Colors.blue,
                        decoration: TextDecoration.underline,
                      ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
