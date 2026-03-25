import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            color: const Color.fromARGB(162, 255, 255, 255),
          ),
          const SizedBox(height: 80),
          Text(
            'Learn Flutter the fun way!',
            style: GoogleFonts.montserrat(
              color: const Color.fromARGB(
                255,
                237,
                223,
                252,
              ),
              fontSize: 24,
              fontWeight: FontWeight.bold,
              letterSpacing:
                  0.5,
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),

          ElevatedButton.icon(
            onPressed: () {
              startQuiz();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 151, 92, 235),
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              elevation: 8,
              shadowColor: Colors.black.withOpacity(0.5),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              textStyle: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text('Start Quiz'),
          ),
        ],
      ),
    );
  }
}
