import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:teach_edge/components/colors.dart';
import 'package:teach_edge/providers/screen_provider.dart';
import 'package:teach_edge/screens/discussions_screen.dart';
import 'package:teach_edge/screens/live_class_screen.dart';
import 'package:teach_edge/screens/login_page.dart';
import 'package:teach_edge/screens/profile_screen.dart';
import 'package:teach_edge/screens/quiz_screen.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
   int _selectedIndex = 0;
  final List<Widget> _screens = const [
    HomeScreen(), // Home screen
    QuizScreen(), // Quiz screen
    LiveClassScreen(), // Live class screen
    DiscussionsScreen(), // Discussions screen
    ProfileScreen(), // Profile screen
  ];

  @override
  Widget build(BuildContext context) {
    

    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        automaticallyImplyLeading: false,
        elevation: 0,
        title: Text(
          'Dashboard',
          style: GoogleFonts.lato(fontWeight: FontWeight.bold, fontSize: 22),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.list_alt_sharp),
          ),
          PopupMenuButton<String>(
            iconSize: 30,
            offset: const Offset(0, 52),
            onSelected: (value) {
              if (value == 'settings') {
              } else if (value == 'help_support') {
              } else if (value == 'logout') {}
            },
            itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
              const PopupMenuItem<String>(
                value: 'settings',
                child: Text('Settings'),
              ),
              const PopupMenuItem<String>(
                value: 'help_support',
                child: Text('Help and Support'),
              ),
              const PopupMenuItem<String>(
                value: 'logout',
                child: Text('Logout'),
              ),
            ],
          ),
        ],
      ),
      
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          const String url = 'https://ndl.iitkgp.ac.in/';
          final Uri uri = Uri.parse(url);
          if (await canLaunchUrl(uri)) {
            await launchUrl(uri);
          } else {
            throw 'Could not launc $url';
          }
        },
        backgroundColor: Colors.lightBlue[300],
        child: const Icon(
          Icons.local_library,
          size: 35,
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (int index) {
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.home,
              color: Colors.black,
            ),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.quiz_rounded,
              color: Colors.black,
            ),
            label: 'Quiz',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.video_call,
              color: Colors.black,
              size: 25.0,
            ),
            label: 'Live Class',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.people_alt,
              color: Colors.black,
            ),
            label: 'Discussions',
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.person_2_outlined,
              color: Colors.black,
            ),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
