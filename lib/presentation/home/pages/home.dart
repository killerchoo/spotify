import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_advanced_drawer/flutter_advanced_drawer.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:spotify/common/helper/is_darkmode.dart';
import 'package:spotify/common/widget/app_bar/app_bar.dart';
import 'package:spotify/core/configs/assets/app_images.dart';
import 'package:spotify/core/configs/assets/app_vectors.dart';
import 'package:spotify/core/configs/theme/app_colors.dart';
import 'package:spotify/presentation/auth/page/signin.dart';
import 'package:spotify/presentation/choose_mode/bloc/theme_cubit.dart';
import 'package:spotify/presentation/home/widget/news_songs.dart';
import 'package:spotify/presentation/intro/get_started.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 4, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return AdvancedDrawer(
      backdrop: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [Colors.green, Colors.green.withOpacity(0.1)])),
      ),
      controller: drawController,
      animationCurve: Curves.easeInOut,
      animationDuration: const Duration(milliseconds: 300),
      animateChildDecoration: true,
      rtlOpening: false,
      disabledGestures: false,
      childDecoration: const BoxDecoration(boxShadow: [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 1.0,
        )
      ], borderRadius: BorderRadius.all(Radius.circular(15))),
      drawer: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, top: 50),
          child: ListTileTheme(
            textColor: Colors.white,
            iconColor: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Container(
                      width: 100,
                      height: 100,
                      margin: const EdgeInsets.only(top: 20, bottom: 20),
                      clipBehavior: Clip.antiAlias,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade800,
                        shape: BoxShape.circle,
                      ),
                      child: const FlutterLogo()),
                ),
                const SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 50,
                  width: double.infinity,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        "Change The Mode",
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.w800),
                      ),
                      BlocBuilder<ThemeCubit, ThemeMode>(
                        builder: (context, themeMode) {
                          return Switch(
                              activeColor: AppColors.primary,
                              value: themeMode == ThemeMode.dark,

                              onChanged: (bool isDark) {
                               setState(() {
                                 context.read<ThemeCubit>().updateTheme(isDark ? ThemeMode.dark : ThemeMode.light);
                               });

                              });
                        },
                      )
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                ListTile(
                  leading: const Icon(Icons.home),
                  title: const Text('Home'),
                  onTap: () {},
                ),
                const SizedBox(
                  height: 20,
                ),
                ListTile(
                  leading: const Icon(Icons.settings),
                  title: const Text('Settings'),
                  onTap: () {},
                ),
                const SizedBox(
                  height: 20,
                ),
                ListTile(
                  leading: const Icon(Icons.info),
                  title: const Text('About'),
                  onTap: () {},
                ),
                const SizedBox(
                  height: 20,
                ),
                ListTile(
                  leading: const Icon(Icons.logout),
                  title: const Text('Log Out'),
                  onTap: () {
                    FirebaseAuth.instance.signOut();
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => GetStarted()));
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      child: Scaffold(
        appBar: BasicAppBar(
          hideback: true,
          title: SvgPicture.asset(AppVectors.logo),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              _homeTopCard(),
              _tabs(),
              SizedBox(
                height: 260,
                child: TabBarView(
                  controller: _tabController,
                  children: [
                    const NewsSongs(),
                    Container(),
                    Container(),
                    Container(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _homeTopCard() {
    return Center(
      child: SizedBox(
        height: 140,
        child: Stack(
          children: [
            Align(
                alignment: Alignment.bottomCenter,
                child: SvgPicture.asset(AppVectors.hometopcard)),
            Align(
                alignment: Alignment.topRight,
                child: Padding(
                  padding: const EdgeInsets.only(right: 60),
                  child: Image.asset(AppImages.hometopartist),
                )),
          ],
        ),
      ),
    );
  }

  Widget _tabs() {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 40,
      ),
      child: TabBar(
          isScrollable: true,
          unselectedLabelColor: Colors.grey.shade700,
          indicatorSize: TabBarIndicatorSize.tab,
          indicatorColor: AppColors.primary,
          dividerColor: Colors.transparent,
          controller: _tabController,
          labelColor: context.isDarkMode ? Colors.white : Colors.black,
          tabs: const [
            Text(
              "News",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
            Text(
              "Video",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
            Text(
              "Artist",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
            Text(
              "Podcast",
              style: TextStyle(fontWeight: FontWeight.w500, fontSize: 16),
            ),
          ]),
    );
  }
}
