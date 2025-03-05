import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:truequealo/domain/entities/entities.dart';

class PostHorizontalListView extends StatefulWidget {
  final List<Post> posts;
  final String? title;
  final VoidCallback? loadNextPage;

  const PostHorizontalListView({
    super.key,
    required this.posts,
    this.title,
    this.loadNextPage,
  });

  @override
  State<PostHorizontalListView> createState() =>
      _MovieHorizontalListViewState();
}

class _MovieHorizontalListViewState extends State<PostHorizontalListView> {
  final scrollController = ScrollController();
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
    scrollController.addListener(() async {
      if (widget.loadNextPage == null || isLoading) return;

      if ((scrollController.position.pixels + 200) >=
          scrollController.position.maxScrollExtent) {
        isLoading = true;
        widget.loadNextPage!();
      }
    });
  }

  void resetLoading() {
    setState(() {
      isLoading = false;
    });
  }

  @override
  void dispose() {
    super.dispose();
    scrollController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (widget.posts == null || widget.posts.isEmpty) {
      return const Center(
        child: CircularProgressIndicator(),
      );
    }

    return SizedBox(
      height: 350,
      child: Column(
        children: [
          if (widget.title != null)
            _Title(
              title: widget.title,
            ),
          Expanded(
              child: ListView.builder(
            controller: scrollController,
            physics: const BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            itemCount: widget.posts.length,
            itemBuilder: (context, index) {
              return _PostCard(post: widget.posts[index]);
            },
          ))
        ],
      ),
    );
  }
}

class _Title extends StatelessWidget {
  final String? title;

  const _Title({super.key, this.title});

  @override
  Widget build(BuildContext context) {
    final titleStyle = Theme.of(context).textTheme.titleLarge;

    return Container(
      padding: const EdgeInsets.only(top: 10),
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 3),
      child: Row(
        children: [
          if (title != null) Text(title!, style: titleStyle),
        ],
      ),
    );
  }
}

class _PostCard extends StatelessWidget {
  final Post post;

  const _PostCard({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: GestureDetector(
        onTap: () => context.push("/post", extra: post),
        child: Card(
          shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.grey.shade800),
              borderRadius: BorderRadius.circular(10)),
          child: SizedBox(
            width: 225,
            height: 1000,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    top: 12,
                    left: 20,
                    right: 20,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                              radius: 12,
                              // maxRadius: 16
                              child: Image.network(
                                  post.authorData.profilePicture.toString())),
                          const SizedBox(width: 6),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "${post.authorData.firstName} ${post.authorData.lastName}",
                                style: textStyles.bodyMedium,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  const Icon(Icons.location_pin, size: 12),
                                  const SizedBox(width: 4),
                                  Text(
                                    post.location,
                                    style: textStyles.labelSmall?.copyWith(
                                      color: Colors.grey,
                                      fontStyle: FontStyle.italic,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                      const SizedBox(height: 8),
                      FadeInImage(
                        height: 160,
                        fit: BoxFit.cover,
                        placeholder: const AssetImage(
                            'assets/loaders/image_placeholder.gif'),
                        image: NetworkImage(post.images[0]),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 8.0,
                        ),
                        child: Text(
                          post.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: textStyles.bodyMedium
                              ?.copyWith(color: Colors.grey.shade200),
                        ),
                      ),
                      const SizedBox(height: 8),
                    ],
                  ),
                ),
                const Spacer(),
                Container(
                  decoration: BoxDecoration(
                    border: Border(
                      top: BorderSide(color: Colors.grey.shade800),
                    ),
                  ),
                  height: 40,
                  child: Row(
                    children: [
                      Expanded(
                        child: TextButton(
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(post.likes.toString(),
                                  style: textStyles.labelMedium),
                              const SizedBox(width: 4),
                              const Icon(
                                Icons.thumb_up_alt_outlined,
                                size: 16,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        width: 1,
                        color: Colors.grey.shade800,
                        height: double.infinity,
                      ),
                      Expanded(
                        child: TextButton(
                          onPressed: () {},
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                post.questionsIds.length.toString(),
                                // post.commentsAmount.toString(),
                                style: textStyles.labelMedium,
                                textAlign: TextAlign.center,
                              ),
                              const SizedBox(width: 4),
                              const Icon(
                                Icons.mode_comment_outlined,
                                size: 16,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
