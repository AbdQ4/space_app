import 'package:space_app/core/assets_manager.dart';

class PlanetModel {
  final String planetName;
  final String title;
  final String about;
  final double distanceFromSun;
  final double lengthOfDay;
  final double orbitalPeriod;
  final double radius;
  final String mass;
  final double gravity;
  final String surfaceArea;
  final String imagePath;
  final String modelPath;

  PlanetModel({
    required this.planetName,
    required this.title,
    required this.about,
    required this.distanceFromSun,
    required this.lengthOfDay,
    required this.orbitalPeriod,
    required this.radius,
    required this.mass,
    required this.gravity,
    required this.surfaceArea,
    required this.imagePath,
    required this.modelPath,
  });

  static final List<PlanetModel> planets = [
    PlanetModel(
      planetName: "Sun",
      title: "The Sun: Our Solar System's Star",
      about:
          "The Sun is the heart of our solar system — a giant sphere of glowing plasma that provides heat, light, and life to Earth. Its powerful gravity holds all planets in orbit, while nuclear fusion at its core releases enormous energy every second.",
      distanceFromSun: 0,
      lengthOfDay: 0,
      orbitalPeriod: 0,
      radius: 695700,
      mass: "1.989 × 10³⁰",
      gravity: 274,
      surfaceArea: "6.09 × 10¹²",
      imagePath: AssetsManager.sun,
      modelPath: AssetsManager.sunModel,
    ),

    PlanetModel(
      planetName: "Mercury",
      title: "Mercury: The Swiftest Planet",
      about:
          "Mercury is the closest planet to the Sun and the smallest in our solar system. It races around the Sun faster than any other planet, completing an orbit in just 88 days. Its surface is covered with craters, much like Earth's Moon.",
      distanceFromSun: 57909227,
      lengthOfDay: 1407.6,
      orbitalPeriod: 0.24,
      radius: 2439.7,
      mass: "3.301 × 10²³",
      gravity: 3.7,
      surfaceArea: "7.48 × 10⁷",
      imagePath: AssetsManager.mercury,
      modelPath: AssetsManager.mercuryModel,
    ),

    PlanetModel(
      planetName: "Venus",
      title: "Venus: Earth’s Toxic Twin",
      about:
          "Venus is nearly the same size as Earth but covered in thick clouds of sulfuric acid and a dense carbon dioxide atmosphere. It traps heat in a runaway greenhouse effect, making it the hottest planet in our solar system.",
      distanceFromSun: 108209475,
      lengthOfDay: 5832.5,
      orbitalPeriod: 0.62,
      radius: 6051.8,
      mass: "4.867 × 10²⁴",
      gravity: 8.87,
      surfaceArea: "4.6 × 10⁸",
      imagePath: AssetsManager.venus,
      modelPath: AssetsManager.venusModel,
    ),

    PlanetModel(
      planetName: "Earth",
      title: "Earth: Our Home Planet",
      about:
          "Earth is the only known planet to support life, with vast oceans, diverse climates, and a protective atmosphere. Its magnetic field shields it from harmful solar radiation while the Moon stabilizes its rotation.",
      distanceFromSun: 149598262,
      lengthOfDay: 24,
      orbitalPeriod: 1.0,
      radius: 6371,
      mass: "5.972 × 10²⁴",
      gravity: 9.8,
      surfaceArea: "5.1 × 10⁸",
      imagePath: AssetsManager.earth,
      modelPath: AssetsManager.earthModel,
    ),

    PlanetModel(
      planetName: "Mars",
      title: "Mars: The Red Planet",
      about:
          "Mars is a cold, desert world with iron-rich soil giving it a reddish color. It has the largest volcano and canyon in the solar system, and evidence suggests it once had liquid water on its surface.",
      distanceFromSun: 227943824,
      lengthOfDay: 24.6,
      orbitalPeriod: 1.88,
      radius: 3389.5,
      mass: "6.417 × 10²³",
      gravity: 3.71,
      surfaceArea: "1.45 × 10⁸",
      imagePath: AssetsManager.mars,
      modelPath: AssetsManager.marsModel,
    ),

    PlanetModel(
      planetName: "Jupiter",
      title: "Jupiter: The Gas Giant",
      about:
          "Jupiter is the largest planet, a gas giant with swirling clouds and the Great Red Spot — a storm larger than Earth that has raged for centuries. It has more than 90 moons and immense magnetic fields.",
      distanceFromSun: 778340821,
      lengthOfDay: 9.9,
      orbitalPeriod: 11.86,
      radius: 69911,
      mass: "1.898 × 10²⁷",
      gravity: 24.79,
      surfaceArea: "6.14 × 10¹⁰",
      imagePath: AssetsManager.jupiter,
      modelPath: AssetsManager.jupiterModel,
    ),

    PlanetModel(
      planetName: "Saturn",
      title: "Saturn: The Ringed Wonder",
      about:
          "Saturn is famous for its beautiful rings made of ice and rock. It’s a massive gas giant with strong winds and dozens of moons — including Titan, which has a thick atmosphere and lakes of liquid methane.",
      distanceFromSun: 1426666422,
      lengthOfDay: 10.7,
      orbitalPeriod: 29.46,
      radius: 58232,
      mass: "5.683 × 10²⁶",
      gravity: 10.44,
      surfaceArea: "4.27 × 10¹⁰",
      imagePath: AssetsManager.saturn,
      modelPath: AssetsManager.saturnModel,
    ),

    PlanetModel(
      planetName: "Uranus",
      title: "Uranus: The Sideways Planet",
      about:
          "Uranus rotates on its side, making its seasons last over 20 years each. It has a pale blue-green color due to methane gas in its atmosphere and is one of the coldest planets in the solar system.",
      distanceFromSun: 2870658186,
      lengthOfDay: 17.2,
      orbitalPeriod: 84.01,
      radius: 25362,
      mass: "8.681 × 10²⁵",
      gravity: 8.69,
      surfaceArea: "8.1 × 10⁹",
      imagePath: AssetsManager.uranus,
      modelPath: AssetsManager.uranusModel,
    ),

    PlanetModel(
      planetName: "Neptune",
      title: "Neptune: The Windy Giant",
      about:
          "Neptune is the farthest planet from the Sun, with deep blue clouds and the strongest winds in the solar system. Its storms can reach speeds over 2,000 km/h, and it has faint rings and 14 known moons.",
      distanceFromSun: 4498396441,
      lengthOfDay: 16.1,
      orbitalPeriod: 164.8,
      radius: 24622,
      mass: "1.024 × 10²⁶",
      gravity: 11.15,
      surfaceArea: "7.6 × 10⁹",
      imagePath: AssetsManager.neptune,
      modelPath: AssetsManager.neptuneModel,
    ),
  ];
}
