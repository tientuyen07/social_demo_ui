import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:social_demo_ui/data/data.dart';
import 'package:social_demo_ui/widgets/custom_drawer.dart';
import 'package:social_demo_ui/widgets/following_users.dart';
import 'package:social_demo_ui/widgets/posts_carousel.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _pageController = PageController(initialPage: 0, viewportFraction: 0.8);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle.light,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(
          color: Theme.of(context).primaryColor,
        ),
        title: Text(
          'FRENZY',
          style: TextStyle(
            color: Theme.of(context).primaryColor,
            fontWeight: FontWeight.bold,
            letterSpacing: 10.0,
          ),
        ),
        centerTitle: true,
        bottom: TabBar(
          controller: _tabController,
          indicatorWeight: 3.0,
          tabs: const [
            Tab(text: 'Trending'),
            Tab(text: 'Latest'),
          ],
          labelColor: Theme.of(context).primaryColor,
          labelStyle: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.w600,
          ),
          unselectedLabelStyle: const TextStyle(fontSize: 18.0),
        ),
      ),
      drawer: Container(
        color: Colors.white,
        width: MediaQuery.of(context).size.width * 0.85,
        height: double.infinity,
        child: const CustomDrawer(),
      ),
      body: ListView(
        children: [
          const FollowingUsers(),
          PostsCarousel(
            pageController: _pageController,
            title: 'Posts',
            posts: posts,
          ),
        ],
      ),
    );
  }
}
