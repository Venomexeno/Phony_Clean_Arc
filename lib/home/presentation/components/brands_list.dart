import 'package:clean_arc_phony/brand_devices/presentation/screens/brand_devices_screem.dart';
import 'package:clean_arc_phony/core/utils/enums.dart';
import 'package:clean_arc_phony/home/presentation/controller/brands_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BrandsList extends StatelessWidget {
  const BrandsList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BrandsBloc, BrandsState>(
      builder: (context, state) {
        switch (state.requestState) {
          case RequestState.loading:
            return const Center(
              child: CircularProgressIndicator(),
            );
          case RequestState.loaded:
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 3 / 2,
                crossAxisSpacing: 20,
                mainAxisSpacing: 20,
              ),
              itemCount: state.brands.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  borderRadius: BorderRadius.circular(20.r),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (BuildContext context) => BrandDevicesScreen(
                          brandName: state.brands[index].brandName,
                          brandSlug: state.brands[index].brandSlug,
                        ),
                      ),
                    );
                  },
                  child: Center(
                    child: Text(
                      state.brands[index].brandName.toUpperCase(),
                    ),
                  ),
                );
              },
            );
          case RequestState.error:
            return Center(
              child: Text(state.errorMessage),
            );
        }
      },
    );
  }
}
