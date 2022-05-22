import 'package:flutter/material.dart';
import 'package:social_demo_ui/models/user_model.dart';
import 'package:social_demo_ui/widgets/curve_clipper_profile.dart';
import 'package:social_demo_ui/widgets/custom_drawer.dart';
import 'package:social_demo_ui/widgets/posts_carousel.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({Key? key, required this.user}) : super(key: key);
  final User user;

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  late PageController _yourPostsPageController;
  late PageController _favoritesPageController;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _yourPostsPageController =
        PageController(initialPage: 0, viewportFraction: 0.8);
    _favoritesPageController =
        PageController(initialPage: 0, viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      drawer: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width * 0.85,
        height: double.infinity,
        child: const CustomDrawer(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                ClipPath(
                  clipper: CurveClipperProfile(),
                  child: Image(
                    width: double.infinity,
                    height: 300.0,
                    image: AssetImage(widget.user.backgroundImageUrl!),
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  top: 30.0,
                  left: 20.0,
                  child: IconButton(
                    icon: const Icon(Icons.menu),
                    iconSize: 30.0,
                    color: Theme.of(context).primaryColor,
                    onPressed: () {
                      _scaffoldKey.currentState?.openDrawer();
                    },
                  ),
                ),
                Positioned(
                  bottom: 10.0,
                  child: Container(
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black45,
                          offset: Offset(0, 2),
                          blurRadius: 6.0,
                        ),
                      ],
                    ),
                    child: ClipOval(
                      child: Image(
                        width: 120.0,
                        height: 120.0,
                        image: AssetImage(widget.user.profileImageUrl!),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                widget.user.name!,
                style: const TextStyle(
                  fontSize: 25.0,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 1.5,
                ),
              ),
            ),
            const SizedBox(height: 10.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  children: [
                    const Text(
                      'Following',
                      style: TextStyle(
                        fontSize: 22.0,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 2.0),
                    Text(
                      widget.user.following.toString(),
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                ),
                Column(
                  children: [
                    const Text(
                      'Follower',
                      style: TextStyle(
                        fontSize: 22.0,
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 2.0),
                    Text(
                      widget.user.followers.toString(),
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ],
                )
              ],
            ),
            PostsCarousel(
              pageController: _yourPostsPageController,
              title: 'Your Posts',
              posts: widget.user.posts!,
            ),
            PostsCarousel(
              pageController: _favoritesPageController,
              title: 'Favorites',
              posts: widget.user.favorites!,
            ),
            const SizedBox(height: 50.0),
          ],
        ),
      ),
    );
  }
}
