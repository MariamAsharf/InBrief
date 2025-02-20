import 'package:flutter/material.dart';
import 'package:news_app/widgets/category_item.dart';

class CategorySection extends StatelessWidget {
  Function onCatigoryClick;
  CategorySection({super.key,required this.onCatigoryClick});

  List<String> catigory = [
    "general",
    "business",
    "entertainment",
    "health",
    "science",
    "technology",
    "sports",
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        children: [
          Text(
            "Good Morning \nHere is Some News For You",
            style: Theme.of(context).textTheme.titleLarge,
          ),
          SizedBox(height: 16),
          Expanded(
            child: ListView.separated(
              itemBuilder: (context, index) {
                return GestureDetector(
                  onTap: (){
                    onCatigoryClick(catigory[index]);
                  },
                    child: CategoryItem(imageName: catigory[index], isRight: index.isOdd));
              },
              separatorBuilder: (context, index) => SizedBox(height: 16),
              itemCount: catigory.length,
            ),
          ),
          SizedBox(height: 16),
        ],
      ),
    );
  }
}
