import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/Screens/Mall/mall.dart';
import '/Widgets/Shared/back_app_bar.dart';
import '/Widgets/Shared/submit_button.dart';
import '/Resources/strings.dart';
import '/Factories/text_factory.dart';
import '/Factories/colors_factory.dart';
import '/Utilities/progress_indicator.dart';
import '/DTOs/Services/get_experts.dart';
import '/DTOs/Shared/pagination.dart';
import '/Models/Services/service.dart';
import '/Controllers/services_controller.dart';

class SelectServicesScreen extends StatefulWidget {
  static const routeName = '/SelectServices';

  const SelectServicesScreen({super.key});

  @override
  State<SelectServicesScreen> createState() => _SelectServicesScreenState();
}

class _SelectServicesScreenState extends State<SelectServicesScreen> {
  final _servicesController = Get.find<ServicesController>();
  final _services = Get.find<ServicesController>().services;

  final List<Service> _selected = [];

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
      appBar: const BackAppBar(title: MRKStrings.selectServicesTitle),
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
    return CheckboxListTile(
      value: _selected.contains(subservice),
      onChanged: (value) => _onServiceChange(subservice, value),
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
      label: MRKStrings.selectServicesSubmit,
      behaviour: _submit,
      isEnabled: _selected.isNotEmpty,
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

  void _onServiceChange(Service service, bool? value) {
    if (value == null) return;
    if (!value) {
      return setState(() => _selected.remove(service));
    }
    return setState(() => _selected.add(service));
  }

  Future<void> _submit() async {
    final dto = _generateDTO();
    Get.toNamed(MallScreen.routeName, arguments: dto);
  }

  GetExpertsDTO _generateDTO() {
    return GetExpertsDTO(
      servicesIds: _selected.map((service) => service.id).toList(),
    );
  }
}
