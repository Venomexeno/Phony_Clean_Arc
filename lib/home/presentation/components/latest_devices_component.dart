import 'package:cached_network_image/cached_network_image.dart';
import 'package:clean_arc_phony/core/utils/enums.dart';
import 'package:clean_arc_phony/device_spec/presentation/screens/device_spec_screen.dart';
import 'package:clean_arc_phony/home/presentation/controller/latest_devices_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LatestDevicesComponent extends StatelessWidget {
  const LatestDevicesComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LatestDevicesBloc, LatestDevicesState>(
      builder: (context, state) {
        switch (state.requestState) {
          case RequestState.loading:
            return const Expanded(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          case RequestState.loaded:
            return Expanded(
              child: GridView.builder(
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 2 / 3,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10),
                itemCount: state.latestDevices.length,
                itemBuilder: (BuildContext context, int index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (BuildContext context) => DeviceSpecScreen(
                            slug: state.latestDevices[index].slug,
                            deviceName: state.latestDevices[index].deviceName,
                          ),
                        ),
                      );
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
                            child: CachedNetworkImage(
                                errorWidget: (context, url, error) =>
                                    const Icon(Icons.error),
                                placeholder: (context, url) => const Center(
                                    child: CircularProgressIndicator()),
                                imageUrl: state.latestDevices[index].image),
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
              ),
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
