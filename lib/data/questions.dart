import 'package:quiz_app_flutter/models/quiz_questions.dart';

const questions = [
  // --- EASY ---
  QuizQuestion(
    'What are the main building blocks of Flutter UIs?',
    ['Widgets', 'Components', 'Blocks', 'Functions'],
    Difficulty.easy,
  ),
  QuizQuestion(
    'Which function is the entry point for every Flutter app?',
    ['main()', 'runApp()', 'startApp()', 'init()'],
    Difficulty.easy,
  ),
  QuizQuestion(
    'What is the purpose of the "pubspec.yaml" file?',
    ['To manage dependencies and assets.', 'To write UI code.', 'To configure the DB.', 'To run the app.'],
    Difficulty.easy,
  ),
  QuizQuestion(
    'Which widget is used for a simple one-line text display?',
    ['Text', 'Label', 'String', 'Paragraph'],
    Difficulty.easy,
  ),

  // --- MEDIUM ---
  QuizQuestion(
    'What is the main difference between StatelessWidget and StatefulWidget?',
    ['StatefulWidget can change its state during runtime.', 'StatelessWidget is faster.', 'StatefulWidget has no build method.', 'StatelessWidget is only for text.'],
    Difficulty.medium,
  ),
  QuizQuestion(
    'Which widget should you use to make a child take up all remaining space?',
    ['Expanded', 'Container', 'SizedBox', 'Padding'],
    Difficulty.medium,
  ),
  QuizQuestion(
    'How do you navigate to a new screen and remove the previous one from the stack?',
    ['Navigator.pushReplacement()', 'Navigator.push()', 'Navigator.pop()', 'Navigator.clear()'],
    Difficulty.medium,
  ),
  QuizQuestion(
    'Which widget is best for creating high-performance, long lists?',
    ['ListView.builder', 'SingleChildScrollView', 'Column', 'ListView.custom'],
    Difficulty.medium,
  ),
  QuizQuestion(
    'What does the "setState" method do?',
    ['It notifies the framework that the internal state has changed.', 'It deletes the widget.', 'It saves data to the cloud.', 'It restarts the application.'],
    Difficulty.medium,
  ),
  QuizQuestion(
    'What is an "InheritedWidget" used for?',
    ['Passing data down the widget tree efficiently.', 'Creating animations.', 'Handling HTTP requests.', 'Styling the application.'],
    Difficulty.medium,
  ),

  // --- HARD ---
  QuizQuestion(
    'What are the three trees that Flutter manages internally?',
    ['Widget, Element, and Render trees.', 'UI, Logic, and Data trees.', 'Material, Cupertino, and Canvas.', 'State, Event, and Object.'],
    Difficulty.hard,
  ),
  QuizQuestion(
    'What is the purpose of the RepaintBoundary widget?',
    ['To isolate a part of the UI from being repainted.', 'To draw borders.', 'To speed up network requests.', 'To fix memory leaks.'],
    Difficulty.hard,
  ),
  QuizQuestion(
    'What is a "Sliver" in Flutter?',
    ['A portion of a scrollable area.', 'A type of animation.', 'A background process.', 'A database model.'],
    Difficulty.hard,
  ),
  QuizQuestion(
    'What is the role of the "RenderObject"?',
    ['It handles the actual painting and layout constraints.', 'It defines the widget configuration.', 'It manages the widget lifecycle.', 'It stores user preferences.'],
    Difficulty.hard,
  ),
  QuizQuestion(
    'Which graphic engine does Flutter use to render the UI on most platforms?',
    ['Skia / Impeller', 'WebKit', 'DirectX', 'Vulkan'],
    Difficulty.hard,
  ),
  QuizQuestion(
    'What is a "GlobalKey" primarily used for?',
    ['Accessing state of a widget from anywhere or preserving state across the tree.', 'Encryption.', 'Setting the app theme.', 'Routing between pages.'],
    Difficulty.hard,
  ),
  QuizQuestion(
    'How do you run a heavy computation without blocking the UI thread?',
    ['Using an Isolate.', 'Using a Future.', 'Using a StatelessWidget.', 'Using a microtask.'],
    Difficulty.hard,
  ),
];