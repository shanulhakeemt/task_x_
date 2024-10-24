import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:task_x/core/theme/app_pallete.dart';
import 'package:task_x/features/home/controller/home_controller.dart';
import 'package:task_x/features/home/model/products_model.dart';
import 'package:task_x/features/home/view/widgets/custom_field.dart';
import 'package:task_x/features/home/view/widgets/product_card.dart';

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  @override
  void initState() {
    super.initState();
  }

  final TextEditingController searchController = TextEditingController();
  final tabBarNames = ["Trending Products", "New Arrivals"];

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final HomeController homeController = Get.put(HomeController());
    return Scaffold(
      body: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
        const SizedBox(
          height: 40,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: CustomField(
            controller: searchController,
            hintText: 'Search',
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Expanded(
          child: SizedBox(
            height: 100,
            child: DefaultTabController(
                length: tabBarNames.length,
                initialIndex: 0,
                child: Column(
                  children: [
                    SizedBox(
                      height: 80,
                      width: double.infinity,
                      child: TabBar(
                          indicator: const BoxDecoration(),
                          onTap: (value) {
                            Get.put(HomeController()).updateTabIndex(value);
                          },
                          tabs: List.generate(
                              2,
                              (index) => SizedBox(
                                    width: 270,
                                    child: Center(
                                      child: GetBuilder<HomeController>(
                                          builder: (controller) {
                                        return Container(
                                            height: 30,
                                            width: 170,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                color: controller
                                                            .currentTabIndex ==
                                                        index
                                                    ? Colors.green
                                                    : Pallete.whiteColor),
                                            child: Center(
                                                child: Text(
                                              tabBarNames[index],
                                              style: GoogleFonts.poppins(
                                                  color: controller
                                                              .currentTabIndex ==
                                                          index
                                                      ? Pallete.whiteColor
                                                      : Pallete.backgroundColor,
                                                  fontWeight: FontWeight.w600),
                                            )));
                                      }),
                                    ),
                                  ))),
                    ),
                    Expanded(
                        child: TabBarView(children: [
                      GetBuilder<HomeController>(builder: (controller) {
                        return CustomGridView(
                          controller: controller,
                        );
                      }),
                      GetBuilder<HomeController>(builder: (controller) {
                        return CustomGridView(
                          isNewArrivels: true,
                          controller: controller,
                        );
                      }),
                    ]))
                  ],
                )),
          ),
        ),
      ]),
    );
  }
}

class CustomGridView extends StatelessWidget {
  final HomeController controller;
  final bool isNewArrivels;
  const CustomGridView({
    super.key,
    required this.controller,
    this.isNewArrivels = false,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount:isNewArrivels?
      controller.productModels.length~/2
      :       controller.productModels.length
,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        mainAxisSpacing: 4,
        crossAxisSpacing: 4,
        childAspectRatio: .69,
        crossAxisCount: 2,
      ),
      itemBuilder: (BuildContext context, int index) {
        List<ProductModel> productModels = [];
        if (isNewArrivels) {
          for (int i = controller.productModels.length - 1;
              i > controller.productModels.length ~/ 2;
              i--) {
            productModels = productModels + [controller.productModels[i]];
          }
        }
     

        return ProductCard(productModel: isNewArrivels?productModels[index]:controller.productModels[index]);
      },
    );
  }
}
