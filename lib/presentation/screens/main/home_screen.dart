import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  static const name = "home-screen";

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentStep = 0;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textStyles = Theme.of(context).textTheme;
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.transparent,
        title: Image.asset(
          "assets/images/logo.png",
          width: 150,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: CircleAvatar(
              backgroundColor: colors.secondaryContainer,
              child: Icon(
                Icons.person,
                color: Colors.grey.shade700,
              ),
            ),
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        child: Column(
          children: [
            TextButton(
              onPressed: () {},
              child: Text(
                "Novedades del dia",
                style: textStyles.titleLarge,
              ),
            ),
            _PostCard(),
          ],
        ),
      ),
    );
  }
}

class _PostCard extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textStyles = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;
    return Stack(
      children: [
        Card(
          child: SizedBox(
            width: 250,
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
                                const Text("Roberto Galipan"),
                                Row(
                                  children: [
                                    const Icon(Icons.location_pin, size: 12),
                                    const SizedBox(width: 4),
                                    Text(
                                      "Ciudad Guayana",
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
                          image: NetworkImage(
                            "https://scontent.fccs3-2.fna.fbcdn.net/v/t39.30808-6/480957331_2702570956604350_3419773857079888296_n.jpg?stp=cp6_dst-jpg_tt6&_nc_cat=110&ccb=1-7&_nc_sid=aa7b47&_nc_ohc=ZTo_KnPu8NMQ7kNvgFO38EN&_nc_oc=AdjlJtrXQAkLe5xd0y3BJMYRCoaezjnNLGZA2ops50-Nhh2Eqz6fkTzZtV6wvUJWdD0&_nc_zt=23&_nc_ht=scontent.fccs3-2.fna&_nc_gid=Ag9Fcm47-JLY4wkT2drvw6O&oh=00_AYB-pfc5TWFkM7ZsRWzSNx3oHB_HoiwkaSDmJUDSpahq5w&oe=67C28F63",
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(
                            top: 16.0,
                          ),
                          child: Text(
                            "Cambio moto por carro mas diferencia o cambio por ",
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
                              Text("34", style: textStyles.labelMedium),
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
                                "4",
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
            "12/02/22",
            style: textStyles.bodySmall?.copyWith(color: Colors.grey.shade700),
          ),
        ),
      ],
    );
  }
}
