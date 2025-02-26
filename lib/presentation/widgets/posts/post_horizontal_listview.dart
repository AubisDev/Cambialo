import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:truequealo/config/helpers/human_format.dart';
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

  // @override
  // void initState() {
  //   super.initState();
  //   scrollController.addListener(() {
  //     if (widget.loadNextPage == null) return;
  //
  //     if ((scrollController.position.pixels + 200) >=
  //         scrollController.position.maxScrollExtent) {
  //       print('load next movies');
  //       widget.loadNextPage!();
  //     }
  //   });
  // }

  // @override
  // void dispose() {
  //   super.dispose();
  //   scrollController.dispose();
  // }

  @override
  Widget build(BuildContext context) {
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
    final colors = Theme.of(context).colorScheme;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Stack(
        children: [
          Card(
            child: SizedBox(
              width: 225,
              height: 260,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                      padding: const EdgeInsets.only(
                        top: 24,
                        left: 20,
                        right: 20,
                      ),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              const CircleAvatar(
                                maxRadius: 16,
                                child: Text(
                                  "A",
                                ),
                              ),
                              const SizedBox(width: 6),
                              Column(
                                children: [
                                  Text(
                                      "${post.createdBy.firstName} ${post.createdBy.lastName}"),
                                  Row(
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
                                  )
                                ],
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          FadeInImage(
                            fit: BoxFit.cover,
                            placeholder: const AssetImage(
                                'assets/loaders/image_placeholder.gif'),
                            // image: NetworkImage(
                            //   "https://scontent.fccs3-2.fna.fbcdn.net/v/t39.30808-6/480957331_2702570956604350_3419773857079888296_n.jpg?stp=cp6_dst-jpg_tt6&_nc_cat=110&ccb=1-7&_nc_sid=aa7b47&_nc_ohc=ZTo_KnPu8NMQ7kNvgFO38EN&_nc_oc=AdjlJtrXQAkLe5xd0y3BJMYRCoaezjnNLGZA2ops50-Nhh2Eqz6fkTzZtV6wvUJWdD0&_nc_zt=23&_nc_ht=scontent.fccs3-2.fna&_nc_gid=Ag9Fcm47-JLY4wkT2drvw6O&oh=00_AYB-pfc5TWFkM7ZsRWzSNx3oHB_HoiwkaSDmJUDSpahq5w&oe=67C28F63",
                            // ),
                            image: NetworkImage(post.portraitImage),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                              top: 16.0,
                            ),
                            child: Text(
                              post.title,
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: textStyles.bodySmall
                                  ?.copyWith(color: Colors.grey.shade700),
                            ),
                          ),
                          const SizedBox(height: 8),
                        ],
                      )),
                  Container(
                    decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(color: Colors.black26),
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
                          color: Colors.black26,
                          height: double.infinity,
                        ),
                        Expanded(
                          child: TextButton(
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  post.commentsAmount.toString(),
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
          Positioned(
            top: 14,
            right: 20,
            child: Text(
              HumanFormat.formatDate(post.createdAt),
              style:
                  textStyles.bodySmall?.copyWith(color: Colors.grey.shade700),
            ),
          ),
        ],
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Post post;
  const _Slide({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;

    return FadeInRight(
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // IMAGE
            SizedBox(
              width: 150,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: GestureDetector(
                  onTap: () {},
                  child: FadeInImage(
                      height: 220,
                      fit: BoxFit.cover,
                      placeholder: const AssetImage(
                          'assets/loaders/image_placeholder.gif'),
                      image: NetworkImage(post.portraitImage)),
                ),
              ),
            ),
            // TITLE
            const SizedBox(height: 5),
            SizedBox(
              width: 150,
              child: Text(
                post.title,
                maxLines: 2,
                style: textStyle.titleSmall,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
