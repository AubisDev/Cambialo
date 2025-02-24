import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WelcomeScreen extends StatefulWidget {
  static const name = "welcome-screen";

  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  int currentStep = 0;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    final textStyle = Theme.of(context).textTheme;
    return Scaffold(
      backgroundColor: Color.fromRGBO(245, 189, 117, 1.0),
      body: PageView.builder(
        itemBuilder: (context, index) {
          return Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 16.0, top: 80),
                    child: Column(
                      children: [
                        if (currentStep == 0)
                          _HowToUseAppFirstStep()
                        else if (currentStep == 1)
                          _HowToUseAppSecondStep()
                        else if (currentStep == 2)
                          _HowToUseAppThirdStep(),
                        Padding(
                          padding: const EdgeInsets.only(top: 16, bottom: 32),
                          child:
                              _CurrentStepsIndicator(currentStep: currentStep),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6)),
                              backgroundColor: colors.primary,
                            ),
                            onPressed: () {
                              setState(() {
                                if (currentStep == 2) {
                                  context.go("/");
                                } else {
                                  currentStep++;
                                }
                              });
                            },
                            child: Container(
                              alignment: Alignment.center,
                              width: double.infinity,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 12),
                                child: Text(
                                  "Siguiente",
                                  style: textStyle.bodyLarge?.copyWith(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              Positioned(
                top: 40,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: Row(
                    mainAxisAlignment: currentStep != 0
                        ? MainAxisAlignment.spaceBetween
                        : MainAxisAlignment.end,
                    children: [
                      if (currentStep != 0)
                        FadeIn(
                          duration: const Duration(milliseconds: 300),
                          curve: Curves.ease,
                          child: IconButton(
                            onPressed: () {
                              setState(() {
                                currentStep--;
                              });
                            },
                            icon: const Icon(Icons.arrow_back_ios),
                          ),
                        ),
                      TextButton(
                        onPressed: () => context.go("/"),
                        child: Text("Saltar"),
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
  }
}

class _HowToUseAppFirstStep extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;

    return FadeIn(
      delay: const Duration(milliseconds: 300),
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
      child: Column(
        children: [
          Text(
            "Bienvenido a",
            style: textStyle.displaySmall?.copyWith(
              color: Colors.grey.shade800,
            ),
          ),
          Image.asset(
            "assets/images/styled_title.png",
            width: 300,
          ),
          const SizedBox(height: 16),
          Image.asset(
            "assets/images/stepper_2.jpg",
            height: 300,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
            child: Text(
              textAlign: TextAlign.center,
              "Aca podras, intercambiar tus articulos por otros",
              style: textStyle.bodyLarge?.copyWith(
                  color: Colors.grey.shade800, fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
    );
  }
}

class _HowToUseAppSecondStep extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;

    return FadeInRight(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
      child: Column(
        children: [
          Text(
            "Publica tu producto en",
            style: textStyle.displaySmall?.copyWith(
              color: Colors.grey.shade800,
            ),
          ),
          Image.asset(
            "assets/images/styled_title.png",
            width: 300,
          ),
          const SizedBox(height: 16),
          Image.asset(
            "assets/images/stepper_3.png",
            height: 300,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
            child: Text(
              textAlign: TextAlign.center,
              "Escribe una descripcion mas detallada de tu producto y el que quieres",
              style: textStyle.bodyLarge?.copyWith(
                  color: Colors.grey.shade800, fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
    );
  }
}

class _HowToUseAppThirdStep extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    final colors = Theme.of(context).colorScheme;

    return FadeInRight(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeIn,
      child: Column(
        children: [
          Text(
            "Acuerda un sitio",
            style: textStyle.displaySmall?.copyWith(
              color: Colors.grey.shade800,
            ),
          ),
          Image.asset(
            "assets/images/styled_title.png",
            width: 300,
          ),
          const SizedBox(height: 16),
          Image.asset(
            "assets/images/stepper_22.png",
            height: 300,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
            child: Text(
              textAlign: TextAlign.center,
              "Cuando aceptes un intercambio, busca un sitio seguro y realiza el cambio",
              style: textStyle.bodyLarge?.copyWith(
                  color: Colors.grey.shade800, fontWeight: FontWeight.w600),
            ),
          )
        ],
      ),
    );
  }
}

class _CurrentStepsIndicator extends StatelessWidget {
  final int currentStep;

  const _CurrentStepsIndicator({super.key, required this.currentStep});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _StepIndicator(step: 0, currentStep: currentStep),
        const SizedBox(width: 8),
        _StepIndicator(step: 1, currentStep: currentStep),
        const SizedBox(width: 8),
        _StepIndicator(step: 2, currentStep: currentStep),
      ],
    );
  }
}

class _StepIndicator extends StatelessWidget {
  final int currentStep;
  final int step;

  const _StepIndicator(
      {super.key, required this.currentStep, required this.step});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return Container(
      height: 12,
      width: 12,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: currentStep == step
            ? colors.primary.withOpacity(0.75)
            : colors.secondary.withOpacity(0.75),
      ),
    );
  }
}
