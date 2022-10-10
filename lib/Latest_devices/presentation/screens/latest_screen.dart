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
                  gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 2 / 2.4,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
                  itemCount: state.latestDevices.length,
                  itemBuilder: (BuildContext context, int index) {
                    final latestDevice = state.latestDevices[index];
                    return GestureDetector(
                      onTap: () {},
                      child: Container(
                        margin: EdgeInsets.only(left: 10.r,top: 10.r),
                        padding: EdgeInsets.all(5.r),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: Colors.grey.shade600,
                        ),
                        child: Column(
                          children: [
                            Expanded(
                              child: Image.network(latestDevice.image),
                            ),
                            SizedBox(height: 10.h),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Text(
                                latestDevice.deviceName,
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
                  child: Text(state.latestDevicesMessage),
                );
            }
          },
        ),
      ),
    );
  }
}
