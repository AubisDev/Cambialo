import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:truequealo/infrastructure/datasources/post_supabase_datasource.dart';
import 'package:truequealo/infrastructure/repositories/post_repository_impl.dart';
import 'package:truequealo/presentation/blocs/posts_by_category_cubit/posts_by_category_cubit.dart';

import '../../../config/helpers/utils.dart';

class PostByCategoryScreen extends StatelessWidget {
  final int categoryId;

  const PostByCategoryScreen({super.key, required this.categoryId});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    final category = getCategoryData(categoryId.toString());

    // TODO Anadir infinite scroll
    return RepositoryProvider(
      create: (context) => PostRepositoryImpl(PostSupabaseDatasource()),
      child: BlocProvider(
        create: (context) =>
            PostsByCategoryCubit(context.read<PostRepositoryImpl>()),
        child:
            _PostByCategoryView(categoryId: categoryId, textStyle: textStyle),
      ),
    );
  }
}

class _PostByCategoryView extends StatefulWidget {
  const _PostByCategoryView({
    super.key,
    required this.categoryId,
    required this.textStyle,
  });

  final int categoryId;
  final TextTheme textStyle;

  @override
  State<_PostByCategoryView> createState() => _PostByCategoryViewState();
}

class _PostByCategoryViewState extends State<_PostByCategoryView> {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context
          .read<PostsByCategoryCubit>()
          .getPostsByCategoryId(widget.categoryId);
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final postsByCategory = context.watch<PostsByCategoryCubit>().state;

    if (postsByCategory.isLoading) {
      return Center(
        child: CircularProgressIndicator(strokeWidth: 2),
      );
    }

    if (postsByCategory.error.isNotEmpty) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text("Something wrong happened"),
          ElevatedButton(
            onPressed: () => context.pop(),
            child: const Text("Go back"),
          )
        ],
      );
    }

    return Scaffold(
      appBar: AppBar(title: Text("Lo ultimo en Categoria")),
      body: GridView.builder(
        physics: const BouncingScrollPhysics(),
        gridDelegate:
            const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: postsByCategory.posts.length,
        itemBuilder: (context, index) {
          final post = postsByCategory.posts[index];
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
                    image: NetworkImage(post.images[0]),
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
                                style: widget.textStyle.labelSmall
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
