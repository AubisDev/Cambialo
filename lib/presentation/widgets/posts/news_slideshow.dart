import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:truequealo/domain/entities/entities.dart';

class PostsSlideShow extends StatelessWidget {
  final List<Post> posts;

  const PostsSlideShow({super.key, required this.posts});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;

    return SizedBox(
      height: 210,
      width: double.infinity,
      child: Swiper(
        viewportFraction: 0.8,
        scale: 0.9,
        pagination: SwiperPagination(
          margin: const EdgeInsets.only(top: 0),
          builder: DotSwiperPaginationBuilder(
            activeColor: colors.primary,
            color: colors.secondary,
          ),
        ),
        itemCount: posts.length,
        itemBuilder: (context, index) => _Slide(post: posts[index]),
      ),
    );
  }
}

class _Slide extends StatelessWidget {
  final Post post;

  const _Slide({super.key, required this.post});

  @override
  Widget build(BuildContext context) {
    final decoration = BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        boxShadow: const [
          BoxShadow(
            color: Colors.black45,
            blurRadius: 10,
            offset: Offset(0, 10),
          ),
        ]);

    return Padding(
      padding: const EdgeInsets.only(bottom: 30),
      child: DecoratedBox(
        decoration: decoration,
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: GestureDetector(
            // onTap: () => context.push('/home/0/movie/${post.id}'),
            onTap: () {},
            child: FadeInImage(
              fit: BoxFit.cover,
              placeholder:
                  const AssetImage('assets/loaders/ìmage_placeholder.gif'),
              image: NetworkImage(post.portraitImage),
            ),
          ),
        ),
      ),
    );
  }
}
