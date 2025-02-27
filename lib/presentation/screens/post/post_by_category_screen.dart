import 'package:flutter/material.dart';
import 'package:truequealo/config/helpers/test_data.dart';

class PostByCategoryScreen extends StatelessWidget {
  final int categoryId;

  const PostByCategoryScreen({super.key, required this.categoryId});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(title: Text("Lo ultimo en vehiculos")),
      body: GridView.builder(
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: testingPosts.length,
        itemBuilder: (context, index) {
          final post = testingPosts[index];
          return GridTile(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FadeInImage(
                    height: 130,
                    fit: BoxFit.cover,
                    placeholder: const AssetImage(
                        'assets/loaders/image_placeholder.gif'),
                    image: NetworkImage(post.portraitImage),
                  ),
                  SizedBox(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 4),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            post.title,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          Row(
                            children: [
                              const Icon(
                                Icons.location_pin,
                                size: 10,
                                color: Colors.black45,
                              ),
                              const SizedBox(width: 3),
                              Text(
                                post.location,
                                style: textStyle.labelSmall
                                    ?.copyWith(color: Colors.black45),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
