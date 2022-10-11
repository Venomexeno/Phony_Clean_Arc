import 'package:clean_arc_phony/home/presentation/components/brands_list.dart';
import 'package:clean_arc_phony/core/utils/app_constance.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(AppConstance.appName),
        centerTitle: true,
        actions: [
          ElevatedButton(
            onPressed: () {},
            child: const Icon(Icons.search),
          )
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {
                showModalBottomSheet(
                  shape: RoundedRectangleBorder(
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(25.0.r)),
                  ),
                  context: context,
                  builder: (context) {
                    return const BrandsList();
                  },
                );
              },
              child: const Text(AppConstance.brands),
            ),
          )
        ],
      ),
    );
  }
}
