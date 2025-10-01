import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => MoodModel(),
      child: MyApp(),
    ),
  );
}

// Mood Model - The "Brain" of our app
// This class holds the state and notifies listeners when it changes
class MoodModel with ChangeNotifier {
  String _currentMood = 'happy';

  String get currentMood => _currentMood;

  void setHappy() {
    _currentMood = 'happy';
    notifyListeners(); // This tells all listeners to rebuild
  }

  void setSad() {
    _currentMood = 'sad';
    notifyListeners(); // This tells all listeners to rebuild
  }

  void setExcited() {
    _currentMood = 'excited';
    notifyListeners(); // This tells all listeners to rebuild
  }
}

// Main App Widget
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Mood Toggle Challenge',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: HomePage(),
    );
  }
}

// Home Page
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mood Toggle Challenge'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'How are you feeling?',
              style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            Text('Mood'),
            SizedBox(height: 50),
            Text('Buttons'),
          ],
        ),
      ),
    );
  }
}