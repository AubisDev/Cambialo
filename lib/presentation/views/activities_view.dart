import 'package:flutter/material.dart';
import 'package:truequealo/config/helpers/constants.dart';

class ActivitiesView extends StatelessWidget {
  static const name = "activities";

  const ActivitiesView({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        title: Text("Mi actividad"),
      ),
      body: GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: activities.length,
        itemBuilder: (context, index) {
          final activity = activities[index];
          return GridTile(
            child: Card(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Badge(
                    child: Icon(
                      activity.icon,
                      size: 32,
                      color: colors.primary.withOpacity(0.70),
                    ),
                  ),
                  Text(activity.name),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
