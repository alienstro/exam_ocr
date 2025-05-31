import 'package:flutter/material.dart';
import '../features/exam/views/exam_screen.dart';
import '../features/classes/views/classes_screen.dart';
import '../features/settings/views/settings_screen.dart';

class BottomNavScreen extends StatefulWidget {
  @override
  _BottomNavScreenState createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int _currentIndex = 0;

  final List<GlobalKey<NavigatorState>> _navigatorKeys = [
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
    GlobalKey<NavigatorState>(),
  ];

  Widget _buildTabNavigator(int index, Widget child) {
    return Navigator(
      key: _navigatorKeys[index],
      onGenerateRoute: (RouteSettings settings) {
        return MaterialPageRoute(builder: (_) => child);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: [
          _buildTabNavigator(0, ExamScreen()),
          _buildTabNavigator(1, ClassesScreen()),
          _buildTabNavigator(2, SettingsScreen()),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        selectedItemColor: Colors.green,
        onTap: (index) {
          if (_currentIndex == index) {
            // If user clicks the icon again, it will redirect to the root route.
            _navigatorKeys[index].currentState?.popUntil(
              (route) => route.isFirst,
            );
          } else {
            setState(() => _currentIndex = index);
          }
        },
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.article), label: 'Exam'),
          BottomNavigationBarItem(icon: Icon(Icons.group), label: 'Classes'),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
      ),
    );
  }
}
