import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:truequealo/config/helpers/human_format.dart';
import 'package:truequealo/domain/entities/entities.dart';
import 'package:truequealo/infrastructure/datasources/post_supabase_datasource.dart';
import 'package:truequealo/infrastructure/repositories/post_repository_impl.dart';
import 'package:truequealo/presentation/blocs/post_cubit/post_cubit.dart';

class PostScreen extends StatelessWidget {
  final int postId;

  const PostScreen({super.key, required this.postId});

  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => PostRepositoryImpl(PostSupabaseDatasource()),
      child: BlocProvider(
        create: (context) => PostCubit(
          context.read<PostRepositoryImpl>(),
        ),
        child: _PostView(postId: postId),
      ),
    );
  }
}

class _PostView extends StatefulWidget {
  final int postId;

  const _PostView({super.key, required this.postId});

  @override
  State<_PostView> createState() => _PostViewState();
}

class _PostViewState extends State<_PostView> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<PostCubit>().getPostData(widget.postId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final colors = Theme.of(context).colorScheme;
    final textStyles = Theme.of(context).textTheme;
    final post = GoRouterState.of(context).extra as Post?;

    if (post == null) {
      const Center(
        child: CircularProgressIndicator(
          strokeWidth: 2,
        ),
      );
    }
    return Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildBuilderDelegate(
                childCount: 1,
                (context, index) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _PostSlideshowImages(post: post),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 16),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              post!.title,
                              style: textStyles.titleLarge,
                            ),
                            const _SectionSeparator(),
                            _LikeAndCommentsButtons(
                              post: post,
                              textStyles: textStyles,
                              colors: colors,
                            ),
                            const _SectionSeparator(),
                            _PostLocation(post: post, textStyles: textStyles),
                            const _SectionSeparator(),
                            _PostDescription(post: post),
                            const _SectionSeparator(),
                            _PostUserInformation(post: post),
                            const _SectionSeparator(),
                            const _CommentsSection(),
                          ],
                        ),
                      )
                    ],
                  );
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _CommentsSection extends StatelessWidget {
  const _CommentsSection({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;

    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Preguntas",
              style:
                  textStyles.titleLarge?.copyWith(fontWeight: FontWeight.bold),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: colors.primary,
              ),
              onPressed: () {},
              child: Text(
                "Hacer una preguntar",
                style:
                    textStyles.labelMedium?.copyWith(color: colors.onPrimary),
              ),
            )
          ],
        ),
        const SizedBox(height: 10),
        Container(
          color: colors.primary.withOpacity(0.1),
          child: TextField(
            decoration: InputDecoration(
              contentPadding: const EdgeInsets.all(8),
              hintText: "Escribe aqui tu pregunta",
            ),
            maxLines: 4,
          ),
        ),
        const SizedBox(height: 6),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            OutlinedButton(onPressed: () {}, child: Text("Enviar")),
          ],
        ),
        const SizedBox(height: 10),
        LayoutBuilder(
          builder: (context, constraints) {
            return ConstrainedBox(
              constraints: const BoxConstraints(maxHeight: 500),
              child: ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: 4,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      ListTile(
                        tileColor: colors.primary.withOpacity(0.30),
                        title: Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: const EdgeInsets.all(4),
                              decoration: BoxDecoration(
                                color: colors.primary.withOpacity(0.60),
                              ),
                              child: Text(
                                "P",
                                style: textStyles.labelMedium,
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Column(
                                  // Usa Column en lugar de Row
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  // Alinea al inicio
                                  children: [
                                    Text(
                                      "Purges a beneficial magic effect from the target. If an effect is purged, the Felhunter heals for a bit?",
                                      softWrap: true,
                                    ),
                                    Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(
                                          "8/11/25",
                                          style:
                                              textStyles.bodyMedium?.copyWith(
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      ListTile(
                        tileColor: colors.primary.withOpacity(0.10),
                        title: Padding(
                          padding: const EdgeInsets.only(left: 12),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(4),
                                decoration: BoxDecoration(
                                  color: colors.secondary,
                                ),
                                child: Text(
                                  "R",
                                  style: textStyles.labelMedium
                                      ?.copyWith(color: colors.onSecondary),
                                ),
                              ),
                              const SizedBox(width: 6),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Column(
                                    // Usa Column en lugar de Row
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    // Alinea al inicio
                                    children: [
                                      Text(
                                        "New Devour Magic ranks are available at levels 30, 38, 46 and 54",
                                        softWrap: true,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Text(
                                            "9/11/25",
                                            style:
                                                textStyles.bodyMedium?.copyWith(
                                              color: Colors.grey,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            );
          },
        ),
      ],
    );
  }
}

class _PostUserInformation extends StatelessWidget {
  final Post post;

  const _PostUserInformation({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;
    return Column(
      children: [
        Text(
          "Informacion del usuario",
          style: textStyles.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(100),
                  child: Image.network(
                    post.images[0],
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(width: 16),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${post.authorData.firstName} ${post.authorData.lastName}",
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "Miembro desde ${HumanFormat.formatDateUserSince(post.createdAt)}",
                  )
                ],
              )
            ],
          ),
        ),
      ],
    );
  }
}

class _PostDescription extends StatelessWidget {
  final Post post;

  const _PostDescription({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;

    return Column(
      children: [
        Text(
          "Descripcion",
          style: textStyles.titleLarge?.copyWith(fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            post.description,
            style: textStyles.bodyMedium,
          ),
        ),
      ],
    );
  }
}

class _PostLocation extends StatelessWidget {
  const _PostLocation({
    super.key,
    required this.post,
    required this.textStyles,
  });

  final Post? post;
  final TextTheme textStyles;

  @override
  Widget build(BuildContext context) {
    return Text(
      "Ubicacion: ${post?.location}",
      style: textStyles.titleMedium,
    );
  }
}

class _ContactButton extends StatelessWidget {
  const _ContactButton({
    super.key,
    required this.colors,
    required this.textStyles,
  });

  final ColorScheme colors;
  final TextTheme textStyles;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: colors.primary,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
      ),
      onPressed: () {},
      child: Text(
        "Contactar para concretar",
        style: textStyles.titleMedium?.copyWith(
          fontWeight: FontWeight.bold,
          color: colors.onPrimary,
        ),
      ),
    );
  }
}

class _LikeAndCommentsButtons extends StatelessWidget {
  const _LikeAndCommentsButtons({
    super.key,
    required this.post,
    required this.textStyles,
    required this.colors,
  });

  final Post? post;
  final TextTheme textStyles;
  final ColorScheme colors;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(
              children: [
                IconButton(
                  onPressed: () {
                    // setState(() {
                    //   if (liked) {
                    //     setState(() {
                    //       liked = false;
                    //     });
                    //   } else if (disliked) {
                    //     setState(() {
                    //       disliked = false;
                    //       liked = true;
                    //     });
                    //   } else {
                    //     setState(() {
                    //       liked = true;
                    //     });
                    //   }
                    // });
                  },
                  icon: Icon(
                    Icons.thumb_up_alt,
                    // liked
                    //     ? Icons.thumb_up_alt
                    //     : Icons.thumb_up_alt_outlined,
                    color: Colors.green,
                  ),
                ),
                Text(
                  post!.likes.toString(),
                  style: textStyles.labelLarge,
                ),
              ],
            ),
            Column(
              children: [
                IconButton(
                  onPressed: () {
                    // if (disliked) {
                    //   setState(() {
                    //     disliked = false;
                    //   });
                    // } else if (liked) {
                    //   setState(() {
                    //     liked = false;
                    //     disliked = true;
                    //   });
                    // } else {
                    //   setState(() {
                    //     disliked = true;
                    //   });
                    // }
                  },
                  icon: Icon(
                    Icons.thumb_down_alt,
                    // disliked
                    //     ? Icons.thumb_down_alt
                    //     : Icons.thumb_down_alt_outlined,
                    color: Colors.red,
                  ),
                ),
                Text(
                  post!.dislikes.toString(),
                  style: textStyles.labelLarge,
                ),
              ],
            ),
            Column(
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.comment_outlined,
                    color: colors.primary,
                  ),
                ),
                Text(
                  "11",
                  style: textStyles.labelLarge,
                ),
              ],
            ),
          ],
        ),
        const SizedBox(height: 20),
        _ContactButton(colors: colors, textStyles: textStyles)
      ],
    );
  }
}

class _PostSlideshowImages extends StatelessWidget {
  const _PostSlideshowImages({
    super.key,
    required this.post,
  });

  final Post? post;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final colors = Theme.of(context).colorScheme;
    return SizedBox(
      height: size.height * 0.5,
      child: Swiper(
        viewportFraction: 1,
        autoplay: false,
        pagination: SwiperPagination(
          margin: const EdgeInsets.only(top: 0),
          builder: DotSwiperPaginationBuilder(
            activeColor: colors.primary,
            color: colors.secondary,
          ),
        ),
        itemCount: post!.images.length,
        itemBuilder: (context, index) => Stack(
          children: [
            FadeInImage(
              height: double.infinity,
              fit: BoxFit.contain,
              placeholder:
                  const AssetImage('assets/loaders/image_placeholder.gif'),
              image: NetworkImage(post!.images[index]),
            ),
            Container(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft, // Ajusta la esquina a oscurecer
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.black.withOpacity(0.4), // Ajusta la opacidad
                    Colors.transparent,
                    Colors.transparent,
                  ],
                ),
              ),
            ),
            Positioned(
              left: 10,
              top: 10,
              child: IconButton(
                onPressed: () {
                  context.pop();
                },
                icon: const Icon(Icons.arrow_back_ios_new_outlined),
                iconSize: 30,
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _SectionSeparator extends StatelessWidget {
  const _SectionSeparator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        SizedBox(height: 10),
        Divider(),
        SizedBox(height: 10),
      ],
    );
  }
}
