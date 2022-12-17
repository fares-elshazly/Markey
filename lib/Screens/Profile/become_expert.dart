import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/Widgets/Shared/back_app_bar.dart';
import '/Widgets/Shared/submit_button.dart';
import '/Resources/strings.dart';
import '/Factories/text_factory.dart';
import '/Factories/colors_factory.dart';
import '/Utilities/progress_indicator.dart';
import '/Utilities/snackbars.dart';
import '/DTOs/Profile/become_expert.dart';
import '/DTOs/Shared/pagination.dart';
import '/Models/Services/service.dart';
import '/Models/Shared/message_exception.dart';
import '/Controllers/authentication_controller.dart';
import '/Controllers/profile_controller.dart';
import '/Controllers/services_controller.dart';

class BecomeExpertScreen extends StatefulWidget {
  static const routeName = '/BecomeExpert';

  const BecomeExpertScreen({super.key});

  @override
  State<BecomeExpertScreen> createState() => _BecomeExpertScreenState();
}

class _BecomeExpertScreenState extends State<BecomeExpertScreen> {
  Service? _selected;

  final _authController = Get.find<AuthenticationController>();
  final _profileController = Get.find<ProfileController>();
  final _servicesController = Get.find<ServicesController>();
  final _services = Get.find<ServicesController>().services;

  final _bodyHorizontalMargin = 15.0;

  final _maxPerPage = 1000000;

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BackAppBar(title: MRKStrings.becomeExpertTitle),
      body: _buildBody(),
      bottomNavigationBar: _buildSubmit(),
    );
  }

  Widget _buildBody() {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: _bodyHorizontalMargin),
      child: Obx(() => _buildBodyLayout()),
    );
  }

  Widget _buildBodyLayout() {
    if (_services.value == null) {
      return _buildLoading();
    }
    return _buildContent();
  }

  Widget _buildLoading() {
    return ProgressIndicators.loadingIndicator();
  }

  Widget _buildContent() {
    final services = _filteredServices();
    return ListView.builder(
      itemCount: services.length,
      itemBuilder: (BuildContext context, int index) {
        return _buildService(services[index]);
      },
    );
  }

  Widget _buildService(Service service) {
    return Theme(
      data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
      child: ExpansionTile(
        title: TextFactory.buildNormalText3(service.name),
        children: _buildSubservices(service.subservices),
      ),
    );
  }

  List<Widget> _buildSubservices(List<Service>? subservices) {
    if (subservices == null) return [];
    return subservices.map((service) => _buildSubserviceTile(service)).toList();
  }

  Widget _buildSubserviceTile(Service subservice) {
    return RadioListTile(
      value: subservice,
      groupValue: _selected,
      onChanged: _onServiceChange,
      activeColor: ColorsFactory.primary,
      controlAffinity: ListTileControlAffinity.trailing,
      title: TextFactory.buildNormalText4(subservice.name),
    );
  }

  Widget _buildSubmit() {
    return SafeArea(
      child: Padding(
        padding: EdgeInsets.all(_bodyHorizontalMargin),
        child: _buildSubmitButton(),
      ),
    );
  }

  Widget _buildSubmitButton() {
    return SubmitButton(
      label: MRKStrings.becomeExpertSubmit,
      behaviour: _submit,
      isEnabled: _selected != null,
    );
  }

  Future<void> _loadData() async {
    await _servicesController.getServices(
      PaginationDTO(perPage: _maxPerPage),
    );
  }

  List<Service> _filteredServices() {
    if (_services.value == null) return [];
    return _services.value!.where((service) => service.parent == null).toList();
  }

  void _onServiceChange(Service? service) {
    if (service == null) return;
    setState(() => _selected = service);
  }

  Future<void> _submit() async {
    ProgressIndicators.loadingDialog();
    try {
      final dto = _generateDTO();
      await _profileController.becomeExpert(dto);
      await _authController.getProfile();
      Get.back();
      Get.back();
    } on MessageException catch (error) {
      Get.back();
      Snackbars.danger(error.message);
    }
  }

  BecomeExpertDTO _generateDTO() {
    return BecomeExpertDTO(serviceId: _selected!.id);
  }
}
