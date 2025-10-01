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
class MoodModel with ChangeNotifier {
  String _currentMood = 'happy';

  String get currentMood => _currentMood;

  void setHappy() {
    _currentMood = 'happy';
    notifyListeners();
  }

  void setSad() {
    _currentMood = 'sad';
    notifyListeners(); 
  }

  void setExcited() {
    _currentMood = 'excited';
    notifyListeners();
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
            MoodDisplay(),
            SizedBox(height: 50),
          ],
        ),
      ),
    );
  }
}

// Widget that displays the current mood
class MoodDisplay extends StatelessWidget {
  // Image URLs
  final Map<String, String> moodImages = {
    'happy': 'https://t3.ftcdn.net/jpg/02/95/26/46/360_F_295264675_clwKZxogAhxLS9sD163Tgkz1WMHsq1RJ.jpg',
    'sad': 'https://as2.ftcdn.net/v2/jpg/10/62/82/49/1000_F_1062824959_Z1LUjpA33wEjIMGWZbNkA9CVs1lw6ySz.webp',
    'excited': 'https://t3.ftcdn.net/jpg/16/46/28/94/240_F_1646289463_fCM1Kcl6KcxFsiXOnqwE5xyaKl29izcX.jpg',
  };

  @override
  Widget build(BuildContext context) {
    return Consumer<MoodModel>(
      builder: (context, moodModel, child) {
        String imageUrl = moodImages[moodModel.currentMood]!;
        
        return Container(
          padding: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.blue.shade50,
            borderRadius: BorderRadius.circular(20),
          ),
          child: Image.network(
            imageUrl,
            width: 150,
            height: 150,
          ),
        );
      },
    );
  }
}