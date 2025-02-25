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
            Stack(
              children: [
                Card(
                  child: SizedBox(
                    width: 250,
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Row(
                            children: [
                              CircleAvatar(
                                maxRadius: 16,
                                child: Text(
                                  "A",
                                ),
                              ),
                              SizedBox(width: 4),
                              Text("Roberto Galipan"),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Image.network(
                            "https://scontent.fccs3-2.fna.fbcdn.net/v/t39.30808-6/480957331_2702570956604350_3419773857079888296_n.jpg?stp=cp6_dst-jpg_tt6&_nc_cat=110&ccb=1-7&_nc_sid=aa7b47&_nc_ohc=ZTo_KnPu8NMQ7kNvgFO38EN&_nc_oc=AdjlJtrXQAkLe5xd0y3BJMYRCoaezjnNLGZA2ops50-Nhh2Eqz6fkTzZtV6wvUJWdD0&_nc_zt=23&_nc_ht=scontent.fccs3-2.fna&_nc_gid=Ag9Fcm47-JLY4wkT2drvw6O&oh=00_AYB-pfc5TWFkM7ZsRWzSNx3oHB_HoiwkaSDmJUDSpahq5w&oe=67C28F63",
                            fit: BoxFit.cover,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 16.0),
                            child: Text(
                              "Cambio moto por carro mas diferencia o cambio por ",
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              style: textStyles.bodySmall
                                  ?.copyWith(color: Colors.grey.shade700),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
                Positioned(
                  top: 14,
                  right: 20,
                  child: Text(
                    "12/02/22",
                    style: textStyles.bodySmall
                        ?.copyWith(color: Colors.grey.shade700),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
