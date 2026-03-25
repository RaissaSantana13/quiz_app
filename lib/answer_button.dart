import 'package:flutter/material.dart';

class AnswerButton extends StatelessWidget {
  const AnswerButton({
    super.key,
    required this.answerText,
    required this.onTap,
  });

  final String answerText;
  final void Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5), 
      child: SizedBox(
        width: double.infinity, 
        child: ElevatedButton(
          onPressed: onTap,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
            backgroundColor: const Color.fromARGB(255, 33, 1, 95),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
          ),
          child: Text(
            answerText,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 14), // Fonte um pouco menor para acompanhar o botão
          ),
        ),
      ),
    );
  }
}