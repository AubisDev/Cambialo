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
    return Scaffold(body: Center(child: PageView.builder(
      itemBuilder: (context, index) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _HowToUseAppStepper(),
            Padding(
              padding: const EdgeInsets.only(top: 16, bottom: 32),
              child: _CurrentStepsIndicator(currentStep: currentStep),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: colors.primary,
                ),
                onPressed: () {
                  setState(() {
                    if (currentStep == 1) {
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
                    padding: const EdgeInsets.symmetric(vertical: 12),
                    child: Text(
                      "Siguiente",
                      style: textStyle.bodyLarge?.copyWith(
                          color: Colors.white, fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ),
            ),
          ],
        );
      },
    )));
  }
}

class _HowToUseAppStepper extends StatelessWidget {
  const _HowToUseAppStepper({super.key});

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme;
    return Column(
      children: [
        Text(
          "Bienvenido a Truequealo",
          style: textStyle.titleLarge,
        ),
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.blue.withOpacity(0.5),
                  Colors.blue.shade400.withOpacity(0.35),
                  Colors.blue.shade300.withOpacity(0.25),
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
              shape: BoxShape.circle),
          child: Image.asset(
            "assets/images/stepper_2.jpg",
            height: 300,
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(
            textAlign: TextAlign.center,
            "Aca podras, intercambiar tus articulos por otros",
            style: textStyle.titleMedium?.copyWith(
              color: Colors.grey.shade800,
            ),
          ),
        )
      ],
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
