import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/theme_cubit.dart';

class AppDrawer extends StatelessWidget {
  Function onBack;

  AppDrawer({super.key, required this.onBack});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xFF121212),
      ),
      width: MediaQuery
          .of(context)
          .size
          .width * 0.8,
      child: Column(
        children: [
          Container(
            color: Colors.white,
            height: 166,
            child: Center(
              child: Text(
                "News App",
                style: Theme
                    .of(context)
                    .textTheme
                    .titleLarge,
              ),
            ),
          ),
          SizedBox(height: 16),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                    onBack();
                  },
                  child: Row(
                    children: [
                      Icon(
                        Icons.home_outlined,
                        color: Colors.white,
                      ),
                      SizedBox(width: 8),
                      Text(
                        "Go To Home",
                        style: Theme
                            .of(context)
                            .textTheme
                            .titleMedium!
                            .copyWith(color: Colors.white),
                      ),
                    ],
                  ),
                ),
                Divider(
                  color: Colors.white,
                  endIndent: 20,
                  indent: 20,
                ),
                SizedBox(height: 24),
                Row(
                  children: [
                    Icon(
                      Icons.format_paint_rounded,
                      color: Colors.white,
                    ),
                    SizedBox(width: 8),
                    Text(
                      "Theme",
                      style: Theme
                          .of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                ElevatedButton(
                  style: ButtonStyle(
                    padding: WidgetStatePropertyAll(
                      EdgeInsets.symmetric(vertical: 16),
                    ),
                    backgroundColor: WidgetStatePropertyAll(Colors.transparent),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        side: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                  onPressed: () {
                    context.read<ThemeCubit>().toggleTheme();
                  },
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        BlocBuilder<ThemeCubit, ThemeMode>(
                          builder: (context, themeMode) {
                            return Text(
                              themeMode == ThemeMode.light ? "Light" : "Dark",
                              style: Theme
                                  .of(context)
                                  .textTheme
                                  .titleMedium!
                                  .copyWith(color: Colors.white),
                            );
                          },
                        ),
                        Icon(
                          Icons.arrow_drop_down,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 24),
                Divider(
                  color: Colors.white,
                  endIndent: 20,
                  indent: 20,
                ),
                SizedBox(height: 24),
                Row(
                  children: [
                    Icon(
                      Icons.language,
                      color: Colors.white,
                    ),
                    SizedBox(width: 8),
                    Text(
                      "Language",
                      style: Theme
                          .of(context)
                          .textTheme
                          .titleMedium!
                          .copyWith(color: Colors.white),
                    ),
                  ],
                ),
                SizedBox(height: 8),
                ElevatedButton(
                  style: ButtonStyle(
                    padding: WidgetStatePropertyAll(
                      EdgeInsets.symmetric(vertical: 16),
                    ),
                    backgroundColor: WidgetStatePropertyAll(Colors.transparent),
                    shape: WidgetStatePropertyAll(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16),
                        side: BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                  onPressed: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "English",
                          style: Theme
                              .of(context)
                              .textTheme
                              .titleMedium!
                              .copyWith(color: Colors.white),
                        ),
                        Icon(
                          Icons.arrow_drop_down,
                          color: Colors.white,
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 24),
                Divider(
                  color: Colors.white,
                  endIndent: 20,
                  indent: 20,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
