import 'dart:developer';

import 'package:clean_arc_phony/phone_spec/data/datasource/phone_spec_data_source.dart';
import 'package:clean_arc_phony/phone_spec/data/repository/phone_spec_repository.dart';
import 'package:clean_arc_phony/phone_spec/domain/repository/base_phone_spec_repository.dart';
import 'package:clean_arc_phony/phone_spec/domain/usecase/phone_spec_usecase.dart';
import 'package:flutter/material.dart';

class PhoneSpecScreen extends StatefulWidget {
  const PhoneSpecScreen({Key? key}) : super(key: key);

  @override
  State<PhoneSpecScreen> createState() => _PhoneSpecScreenState();
}

class _PhoneSpecScreenState extends State<PhoneSpecScreen> {
  @override
  Widget build(BuildContext context) {
    return const Scaffold();
  }

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    const PhoneSpecParameters parameters = PhoneSpecParameters(slug: 'apple_iphone_14_pro_max-11773');
    BasePhoneSpecRemoteDataSource basePhoneSpecDataSource =
        PhoneSpecRemoteDataSource();
    BasePhoneSpecRepository basePhoneSpecRepository =
        PhoneSpecRepository(basePhoneSpecDataSource);
    final result = await PhoneSpecUseCase(basePhoneSpecRepository)(parameters);
    log(result.toString());
  }
}
