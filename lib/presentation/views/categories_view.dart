import 'package:flutter/material.dart';
import 'package:truequealo/config/helpers/constants.dart';

class CategoriesView extends StatelessWidget {
  static const name = "categories";

  const CategoriesView({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(
        title: Text("Que estas buscando?", style: textStyles.titleLarge),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: ListView.builder(
          itemCount: categories.length,
          itemBuilder: (context, index) {
            final category = categories[index];
            return Column(
              children: [
                ListTile(
                  onTap: () {
                    // TODO NAVIGATE
                  },
                  title: Text(category.name),
                  leading: Icon(category.icon),
                ),
                const Divider(),
              ],
            );
          },
        ),
      ),
    );
  }
}
