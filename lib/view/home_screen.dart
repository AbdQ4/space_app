import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:space_app/controller/planet_selector.dart';
import 'package:space_app/core/colors_manager.dart';
import 'package:space_app/model/planet_model.dart';
import 'package:space_app/view/details_screen.dart';
import 'package:space_app/widgets/change_planet_button.dart';
import 'package:space_app/widgets/custom_elevated_button.dart';
import 'package:space_app/widgets/header.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});
  static const String routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    final selector = Provider.of<PlanetSelector>(context, listen: false);
    _pageController = PageController(initialPage: selector.selectedIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final planetSelector = Provider.of<PlanetSelector>(context);
    PlanetModel? planet;
    return Scaffold(
      body: Column(
        children: [
          // --- HEADER ---
          Header(title: "Explore"),
          Padding(
            padding: REdgeInsets.only(right: 40),
            child: Text(
              "Which planet\nwould you like to explore?",
              style: TextStyle(
                color: ColorsManager.white,
                fontSize: 24.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(height: 20.h),

          // --- PLANET SWIPE SECTION ---
          SizedBox(
            height: 280.h,
            width: 300.w,
            child: PageView.builder(
              controller: _pageController,
              itemCount: PlanetModel.planets.length,
              onPageChanged: (index) {
                planetSelector.selectPlanet(index);
              },
              itemBuilder: (context, index) {
                planet = PlanetModel.planets[index];
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  margin: REdgeInsets.symmetric(horizontal: 10),
                  padding: REdgeInsets.all(12),

                  child: Image.asset(planet!.imagePath, fit: BoxFit.cover),
                );
              },
            ),
          ),

          SizedBox(height: 20.h),

          // --- PLANET NAME ---
          Padding(
            padding: REdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ChangePlanetButton(
                  icon: Icons.arrow_back_ios,
                  onPressed: () {
                    if (planetSelector.selectedIndex > 0) {
                      _pageController.previousPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                ),
                Text(
                  PlanetModel.planets[planetSelector.selectedIndex].planetName,
                  style: TextStyle(
                    color: ColorsManager.white,
                    fontSize: 22.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                ChangePlanetButton(
                  icon: Icons.arrow_forward_ios,
                  onPressed: () {
                    if (planetSelector.selectedIndex <
                        PlanetModel.planets.length - 1) {
                      _pageController.nextPage(
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut,
                      );
                    }
                  },
                ),
              ],
            ),
          ),

          // --- EXPLORE BUTTON ---
          Padding(
            padding: REdgeInsets.symmetric(horizontal: 10, vertical: 33),
            child: CustomElevatedButton(
              title: "Explore",
              onPressed: () {
                Navigator.pushNamed(
                  context,
                  DetailsScreen.routeName,
                  arguments: planet,
                );
              },
              subTitle:
                  PlanetModel.planets[planetSelector.selectedIndex].planetName,
            ),
          ),
        ],
      ),
    );
  }
}
