import 'package:flutter/material.dart';
import 'package:testovoe/features/app/theme/style.dart';
import 'package:testovoe/features/photo/presentation/pages/photos_page.dart';
import 'package:testovoe/features/post/presentation/pages/posts_page.dart';
import 'package:testovoe/features/todo/presentation/pages/todo_page.dart';
import 'package:testovoe/features/user/presentation/pages/users_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  TabController? _tabController;
  int _currentTabIndex = 0;

  @override
  void initState() {
    WidgetsBinding.instance.addObserver(this);
    _tabController = TabController(length: 4, vsync: this);

    _tabController!.addListener(() {
      setState(() {
        _currentTabIndex = _tabController!.index;
      });
    });

    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    _tabController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          labelColor: const Color.fromARGB(255, 134, 94, 202),
          unselectedLabelColor: greyColor,
          indicatorColor: Colors.deepPurple,
          controller: _tabController,
          tabs: const [
            Tab(
              child: Text(
                "Posts",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            Tab(
              child: Text(
                "Photos",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            Tab(
              child: Text(
                "Todo",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
            Tab(
              child: Text(
                "Users",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            ),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          PostsPage(),
          PhotosPage(),
          TodoPage(),
          UsersPage(),
        ],
      ),
    );
  }
}
