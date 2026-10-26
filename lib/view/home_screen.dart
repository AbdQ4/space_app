import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:space_app/controller/planet_selector.dart';
import 'package:space_app/core/colors_manager.dart';
import 'package:space_app/model/planet_model.dart';
import 'package:space_app/view/details_screen.dart';
import 'package:space_app/widgets/change_planet_button.dart';
import 'package:space_app/widgets/custom_elevated_button.dart';
import 'package:space_app/widgets/header.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  static const String routeName = '/home';

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late final PageController _pageController;

  @override
  void initState() {
    super.initState();
    final selector = context.read<PlanetSelector>();
    _pageController = PageController(initialPage: selector.selectedIndex);
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _showPlanet(int index) {
    _pageController.animateToPage(
      index,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final planetSelector = context.watch<PlanetSelector>();
    final selectedIndex = planetSelector.selectedIndex;
    final selectedPlanet = PlanetModel.planets[selectedIndex];

    return Scaffold(
      body: SafeArea(
        bottom: false,
        child: Column(
          children: [
            const Header(title: 'Explore'),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.only(bottom: 24),
                child: Center(
                  child: ConstrainedBox(
                    constraints: const BoxConstraints(maxWidth: 560),
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(24, 8, 24, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Text(
                            'Which planet\nwould you like to explore?',
                            style: TextStyle(
                              color: ColorsManager.white,
                              fontSize: 24,
                              height: 1.2,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 16),
                          SizedBox(
                            height: 280,
                            child: PageView.builder(
                              controller: _pageController,
                              itemCount: PlanetModel.planets.length,
                              onPageChanged: planetSelector.selectPlanet,
                              itemBuilder: (context, index) {
                                return Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 12,
                                  ),
                                  child: Image.asset(
                                    PlanetModel.planets[index].imagePath,
                                    fit: BoxFit.contain,
                                  ),
                                );
                              },
                            ),
                          ),
                          const SizedBox(height: 16),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              ChangePlanetButton(
                                icon: Icons.arrow_back_ios_new,
                                onPressed: selectedIndex == 0
                                    ? null
                                    : () => _showPlanet(selectedIndex - 1),
                              ),
                              Text(
                                selectedPlanet.planetName,
                                style: const TextStyle(
                                  color: ColorsManager.white,
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              ChangePlanetButton(
                                icon: Icons.arrow_forward_ios,
                                onPressed:
                                    selectedIndex ==
                                        PlanetModel.planets.length - 1
                                    ? null
                                    : () => _showPlanet(selectedIndex + 1),
                              ),
                            ],
                          ),
                          const SizedBox(height: 24),
                          CustomElevatedButton(
                            title: 'Explore',
                            subTitle: selectedPlanet.planetName,
                            onPressed: () {
                              Navigator.pushNamed(
                                context,
                                DetailsScreen.routeName,
                                arguments: selectedPlanet,
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
