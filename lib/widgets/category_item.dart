import 'package:flutter/material.dart';

class CategoryItem extends StatelessWidget {
  String imageName;
  bool isRight;

  CategoryItem({super.key, required this.imageName, required this.isRight});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: !isRight ? Alignment.bottomRight : Alignment.bottomLeft,
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(24),
          child: Image.asset("assets/images/${imageName}.png"),
        ),
        Padding(
          padding:  EdgeInsets.only(bottom: 16, left: isRight ? 16 : 0, right: isRight ? 0 : 16),
          child: Container(
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(84),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: !isRight
                  ? [
                      Padding(
                        padding: EdgeInsets.only(left: !isRight ? 16 : 0),
                        child: Text(
                          "View All",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                      SizedBox(width: 10),
                      CircleAvatar(
                        maxRadius: double.infinity,
                        backgroundColor:
                            Theme.of(context).scaffoldBackgroundColor,
                        child: IconButton(
                          onPressed: () {},
                          icon: Icon(
                            !isRight
                                ? Icons.arrow_forward_ios
                                : Icons.arrow_back_ios,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ]
                  : [
                      CircleAvatar(
                        maxRadius: double.infinity,
                        backgroundColor:
                            Theme.of(context).scaffoldBackgroundColor,
                        child: Center(
                          child: IconButton(
                            onPressed: () {},
                            icon: Icon(
                              !isRight
                                  ? Icons.arrow_forward_ios
                                  : Icons.arrow_back_ios,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 10),
                      Padding(
                        padding: EdgeInsets.only(right: isRight ? 16 : 0),
                        child: Text(
                          "View All",
                          style: Theme.of(context).textTheme.titleLarge,
                        ),
                      ),
                    ],
            ),
          ),
        ),
      ],
    );
  }
}
