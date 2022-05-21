import 'package:flutter/material.dart';
import 'package:social_demo_ui/data/data.dart';
import 'package:social_demo_ui/screens/home_screen.dart';
import 'package:social_demo_ui/screens/login_screen.dart';

class CustomDrawer extends StatelessWidget {
  const CustomDrawer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    _buildDrawerOption(Icon icon, String title, Function() onTap) {
      return ListTile(
        leading: icon,
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 20.0,
          ),
        ),
        onTap: onTap,
      );
    }

    return Column(
      children: [
        Stack(
          children: [
            Image(
              height: 200.0,
              width: double.infinity,
              image: AssetImage(currentUser.backgroundImageUrl!),
              fit: BoxFit.cover,
            ),
            Positioned(
              left: 20.0,
              bottom: 20.0,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Container(
                    height: 100.0,
                    width: 100.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        width: 3.0,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                    child: ClipOval(
                      child: Image(
                        image: AssetImage(
                          currentUser.profileImageUrl!,
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(width: 6.0),
                  Text(
                    currentUser.name!,
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 25.0,
                      letterSpacing: 1.5,
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        _buildDrawerOption(
          const Icon(Icons.dashboard),
          'Home',
          () => {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const HomeScreen(),
              ),
            ),
          },
        ),
        _buildDrawerOption(const Icon(Icons.chat), 'Chat', () => {}),
        _buildDrawerOption(const Icon(Icons.location_on), 'Map', () => {}),
        _buildDrawerOption(
            const Icon(Icons.account_circle), 'Your Profile', () => {}),
        _buildDrawerOption(const Icon(Icons.settings), 'Settings', () => {}),
        Expanded(
          child: Align(
            alignment: FractionalOffset.bottomCenter,
            child: _buildDrawerOption(
              const Icon(Icons.directions_run),
              'Logout',
              () => {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const LoginScreen(),
                  ),
                )
              },
            ),
          ),
        ),
      ],
    );
  }
}
