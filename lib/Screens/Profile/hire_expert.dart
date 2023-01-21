import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/Screens/Bookings/online_payment.dart';
import '/Widgets/Shared/back_app_bar.dart';
import '/Widgets/Shared/submit_button.dart';
import '/Resources/strings.dart';
import '/Factories/text_factory.dart';
import '/Factories/colors_factory.dart';
import '/Utilities/progress_indicator.dart';
import '/Utilities/snackbars.dart';
import '/DTOs/Bookings/booking.dart';
import '/Models/Profile/package.dart';
import '/Models/Shared/message_exception.dart';
import '/Controllers/bookings_controller.dart';
import '/Controllers/profile_controller.dart';

class HireExpertScreen extends StatefulWidget {
  static const routeName = '/HireExpert';

  const HireExpertScreen({super.key});

  @override
  State<HireExpertScreen> createState() => _HireExpertScreenState();
}

class _HireExpertScreenState extends State<HireExpertScreen> {
  int? _selected;

  final _bookingsController = Get.find<BookingsController>();
  final _profile = Get.find<ProfileController>().expert.value;

  final _bodyHorizontalMargin = 15.0;
  final _internalMargin = 5.0;
  final _internalPadding = 10.0;
  final _bottomBarPadding = 15.0;
  final _borderRadius = 8.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BackAppBar(title: MRKStrings.hireTitle),
      body: _buildBody(),
      bottomNavigationBar: _buildBottomBar(),
    );
  }

  Widget _buildBody() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: _bodyHorizontalMargin),
      child: _buildContent(),
    );
  }

  Widget _buildContent() {
    return ListView.builder(
      itemCount: _profile?.packages.length,
      itemBuilder: (BuildContext context, int index) {
        return _buildPackage(_profile!.packages[index]);
      },
    );
  }

  Widget _buildPackage(Package package) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: _internalMargin),
      child: _buildPackageContent(package),
    );
  }

  Widget _buildPackageContent(Package package) {
    return RadioListTile(
      contentPadding: EdgeInsets.all(_internalPadding),
      value: package.id,
      groupValue: _selected,
      onChanged: _onPackageSelect,
      activeColor: ColorsFactory.primary,
      controlAffinity: ListTileControlAffinity.trailing,
      shape: _buildShape(),
      title: _buildTitle(package.title),
      subtitle: _buildInfo(package),
      tileColor: ColorsFactory.secondary,
    );
  }

  ShapeBorder _buildShape() {
    return RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(_borderRadius),
    );
  }

  Widget _buildTitle(String title) {
    return TextFactory.buildNormalText3(
      title,
      weight: FontWeights.medium,
    );
  }

  Widget _buildInfo(Package package) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: _internalMargin),
        _buildDescription(package.description),
        SizedBox(height: _internalMargin),
        _buildDuration(package.duration),
        SizedBox(height: _internalMargin),
        _buildPrice(package.cost),
      ],
    );
  }

  Widget _buildDescription(String description) {
    return TextFactory.buildNormalText4(
      description,
      color: ColorsFactory.secondaryText,
    );
  }

  Widget _buildDuration(int duration) {
    return TextFactory.buildNormalText4(
      MRKStrings.sharedDurationInDays,
      color: ColorsFactory.primary,
      args: ['$duration'],
    );
  }

  Widget _buildPrice(double price) {
    return TextFactory.buildNormalText4(
      MRKStrings.sharedPrice,
      color: ColorsFactory.primary,
      args: ['$price'],
    );
  }

  Widget _buildBottomBar() {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(_bottomBarPadding),
        child: _buildSubmit(),
      ),
    );
  }

  Widget _buildSubmit() {
    return SubmitButton(
      label: MRKStrings.profileHire,
      isEnabled: _selected != null,
      behaviour: _submit,
    );
  }

  void _onPackageSelect(int? id) {
    setState(() => _selected = id);
  }

  Future<void> _submit() async {
    ProgressIndicators.loadingDialog();
    try {
      final dto = _generateDTO();
      final url = await _bookingsController.book(dto);
      Get.back();
      Get.to(OnlinePaymentScreen(url: url));
    } on MessageException catch (error) {
      Get.back();
      Snackbars.danger(error.message);
    }
  }

  BookingDTO _generateDTO() {
    return BookingDTO(packageId: _selected!);
  }
}
