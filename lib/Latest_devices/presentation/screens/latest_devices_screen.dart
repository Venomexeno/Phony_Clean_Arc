import 'package:clean_arc_phony/Latest_devices/presentation/controller/latest_devices_bloc.dart';
import 'package:clean_arc_phony/core/services/services_locator.dart';
import 'package:clean_arc_phony/core/utils/app_constance.dart';
import 'package:clean_arc_phony/core/utils/enums.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LatestDevicesScreen extends StatelessWidget {
  const LatestDevicesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          sl<LatestDevicesBloc>()..add(GetLatestDevicesEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text(AppConstance.latestDevices),
          centerTitle: true,
        ),
        body: BlocBuilder<LatestDevicesBloc, LatestDevicesState>(
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
                      childAspectRatio: 2.3 / 3,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10),
                  itemCount: state.latestDevices.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                      onTap: () {
                        /// TODO: Navigate To Spec Screen
                      },
                      child: Container(
                        margin: EdgeInsets.all(5.r),
                        padding: EdgeInsets.all(5.r),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: Colors.grey.shade600,
                        ),
                        child: Column(
                          children: [
                            Expanded(
                              child: Image.network(state.latestDevices[index].image),
                            ),
                            SizedBox(height: 10.h),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                state.latestDevices[index].deviceName,
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.bold,
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
