import 'package:clean_arc_phony/brand_devices/presentation/controller/brand_devices_bloc.dart';
import 'package:clean_arc_phony/core/services/services_locator.dart';
import 'package:clean_arc_phony/core/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BrandDevicesScreen extends StatelessWidget {
  final String brandName;
  final String brandSlug;

  const BrandDevicesScreen(
      {Key? key, required this.brandName, required this.brandSlug})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<BrandDevicesBloc>()..add(GetBrandDevicesEvent(brandSlug)),
      child: Scaffold(
        appBar: AppBar(
          title: Text(brandName.toUpperCase()),
          centerTitle: true,
        ),
        body: BlocBuilder<BrandDevicesBloc, BrandDevicesState>(
          builder: (context, state) {
            switch (state.requestState) {
              case RequestState.loading:
                return const Center(
                  child: CircularProgressIndicator(),
                );
              case RequestState.loaded:
                return ListView.builder(
                  itemCount: state.brandDevices.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        ///TODO: Navigate To PhoneSpec Screen
                      },
                      child: Container(
                        margin: EdgeInsets.all(10.r),
                        height: 200.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.all(10.r),
                                child: Container(
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.circular(10.r)),
                                  padding: EdgeInsets.symmetric(vertical: 5.h),
                                  child: Image.network(
                                      state.brandDevices[index].image),
                                ),
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.all(10.r),
                                child: Text(
                                  state.brandDevices[index].deviceName,
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.sp,
                                  ),
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            ),
                          ],
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
        ),
      ),
    );
  }
}
