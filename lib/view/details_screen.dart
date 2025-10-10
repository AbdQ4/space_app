import 'package:flutter/material.dart';
import 'package:flutter_3d_controller/flutter_3d_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:space_app/core/colors_manager.dart';
import 'package:space_app/model/planet_model.dart';
import 'package:space_app/widgets/custom_elevated_button.dart';
import 'package:space_app/widgets/header.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  static const String routeName = '/details';

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  @override
  Widget build(BuildContext context) {
    final planet = ModalRoute.of(context)!.settings.arguments as PlanetModel;

    return Scaffold(
      backgroundColor: ColorsManager.black,
      body: SingleChildScrollView(
        child: Padding(
          padding: REdgeInsets.all(5.w),
          child: Column(
            children: [
              Header(title: planet.planetName),
              Padding(
                padding: REdgeInsets.only(right: 60),
                child: Text(
                  planet.title,
                  style: TextStyle(
                    color: ColorsManager.white,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),
              SizedBox(height: 20.h),
              SizedBox(
                height: 300.h,
                child: Flutter3DViewer(src: planet.modelPath),
              ),
              SizedBox(height: 20),
              Padding(
                padding: REdgeInsets.only(right: 260),
                child: Text(
                  "About",
                  style: TextStyle(
                    color: ColorsManager.white,
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 10.h),
              Padding(
                padding: REdgeInsets.only(left: 20),
                child: Text(
                  planet.about,
                  style: TextStyle(color: ColorsManager.white, fontSize: 16.sp),
                ),
              ),
              SizedBox(height: 20.h),
              Padding(
                padding: REdgeInsets.only(right: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Distance from Sun(KM) : ${planet.distanceFromSun}",
                      style: TextStyle(
                        color: ColorsManager.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      "Lenght of day(Hrs) : ${planet.lenghtOfDay}",
                      style: TextStyle(
                        color: ColorsManager.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      "Oribital Period : ${planet.orbitalPeriod}",
                      style: TextStyle(
                        color: ColorsManager.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      "Radius(KM) : ${planet.radius}",
                      style: TextStyle(
                        color: ColorsManager.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      "Mass(KG) : ${planet.mass}",
                      style: TextStyle(
                        color: ColorsManager.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      "Gravity : ${planet.gravity}",
                      style: TextStyle(
                        color: ColorsManager.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    Text(
                      "Surface Area(kM²) : ${planet.surfaceArea}",
                      style: TextStyle(
                        color: ColorsManager.white,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    Padding(
                      padding: REdgeInsets.only(bottom: 20),
                      child: CustomElevatedButton(
                        title: "Go Back",
                        onPressed: () => Navigator.pop(context),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
