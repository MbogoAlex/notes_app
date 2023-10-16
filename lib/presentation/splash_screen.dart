import 'package:flutter/material.dart';
import 'package:notesapp/presentation/registration_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    loadFirstPage();
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    );

    animation = Tween<double>(begin: 50, end: 150).animate(controller)
      ..addListener(() {
        setState(() {});
      });
    controller.forward();
  }

  Future<void> loadFirstPage() async {
    await Future.delayed(const Duration(seconds: 2));
    if (context.mounted) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => const RegistrationPage(),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFBF4D3),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Row(),
          Image.asset(
            "assets/images/notes_app_logo.jpeg",
            height: animation.value,
            width: animation.value,
          ),
          const SizedBox(
            height: 20,
          ),
          const Text(
            "NotesPal",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic),
          ),
        ],
      ),
    );
  }
}
