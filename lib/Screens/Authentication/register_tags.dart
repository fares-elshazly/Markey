import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/Screens/Shared/home.dart';
import '/Widgets/Shared/background.dart';
import '/Widgets/Shared/submit_button.dart';
import '/Widgets/Shared/back_app_bar.dart';
import '/Resources/strings.dart';
import '/Factories/text_factory.dart';
import '/Factories/colors_factory.dart';
import '/Utilities/progress_indicator.dart';
import '/Utilities/snackbars.dart';
import '/DTOs/Authentication/register.dart';
import '/DTOs/Authentication/login.dart';
import '/DTOs/Shared/pagination.dart';
import '/Models/Tags/tag.dart';
import '/Models/Shared/message_exception.dart';
import '/Controllers/authentication_controller.dart';
import '/Controllers/tags_controller.dart';

class RegisterTagsScreen extends StatefulWidget {
  static const routeName = '/RegisterTags';

  const RegisterTagsScreen({super.key});

  @override
  State<RegisterTagsScreen> createState() => _RegisterTagsScreenState();
}

class _RegisterTagsScreenState extends State<RegisterTagsScreen> {
  int _currentPage = 1;
  bool _isLoadingMore = false;

  final _authController = Get.find<AuthenticationController>();
  final _tagsController = Get.find<TagsController>();

  final _tags = Get.find<TagsController>().tagsList;
  final RegisterDTO _dto = Get.arguments;

  final List<Tag> _selected = [];

  final _bodyHorizontalMargin = 15.0;
  final _bodyVerticalMargin = 15.0;
  final _contentMargin = 20.0;
  final _internalMargin = 5.0;

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsFactory.secondaryBackground,
      appBar: _buildAppBar(),
      body: _buildLayout(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return const BackAppBar(title: MRKStrings.registerTagsTitle);
  }

  Widget _buildLayout() {
    return Stack(
      children: [
        const Background(),
        _buildBody(),
      ],
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
    if (_tags.value == null) {
      return _buildLoading();
    }
    return _buildContent();
  }

  Widget _buildLoading() {
    return ProgressIndicators.loadingIndicator();
  }

  Widget _buildContent() {
    return Column(
      children: [
        _buildSubtitle(),
        SizedBox(height: _contentMargin),
        _buildTags(),
        SizedBox(height: _contentMargin),
        _buildIsLoadingMore(),
        _buildSubmit(),
        SizedBox(height: _bodyVerticalMargin),
      ],
    );
  }

  Widget _buildSubtitle() {
    return TextFactory.buildTitle2(
      MRKStrings.registerTagsSubtitle,
      weight: FontWeights.medium,
      color: ColorsFactory.primary,
      align: TextAlign.center,
    );
  }

  Widget _buildTags() {
    return Expanded(
      child: NotificationListener<ScrollNotification>(
        onNotification: _scrollNotify,
        child: _buildTagsContent(),
      ),
    );
  }

  Widget _buildTagsContent() {
    return SingleChildScrollView(
      child: Wrap(
        spacing: _internalMargin,
        runSpacing: _internalMargin,
        children: _tags.value!.tags.map((tag) => _buildTagChip(tag)).toList(),
      ),
    );
  }

  Widget _buildTagChip(Tag tag) {
    return ChoiceChip(
      elevation: double.minPositive,
      pressElevation: double.minPositive,
      selectedColor: ColorsFactory.primary,
      label: _buildTagLabel(tag),
      selected: _selected.contains(tag),
      onSelected: (selected) => _onSelect(selected, tag),
    );
  }

  Widget _buildTagLabel(Tag tag) {
    return TextFactory.buildNormalText3(
      tag.name,
      color: _getChipLabelColor(tag),
    );
  }

  Widget _buildIsLoadingMore() {
    return Visibility(
      visible: _isLoadingMore,
      child: Padding(
        padding: EdgeInsets.only(bottom: _contentMargin),
        child: ProgressIndicators.loadingIndicator(),
      ),
    );
  }

  Widget _buildSubmit() {
    return SafeArea(
      child: SubmitButton(
        label: MRKStrings.registerTagsSubmit,
        behaviour: _submit,
        isEnabled: _selected.isNotEmpty,
      ),
    );
  }

  Color _getChipLabelColor(Tag tag) {
    if (_selected.contains(tag)) return ColorsFactory.secondary;
    return ColorsFactory.secondaryText;
  }

  Future<void> _loadData() async {
    final dto = _generatePaginationDTO();
    await _tagsController.getTagsList(dto);
  }

  PaginationDTO _generatePaginationDTO() {
    return PaginationDTO(page: _currentPage);
  }

  bool _scrollNotify(ScrollNotification scroll) {
    if (_isLoadingMore) return true;
    if (_tags.value!.pagination.currentPage >=
        _tags.value!.pagination.totalPages) {
      return true;
    }
    if (scroll.metrics.pixels == scroll.metrics.maxScrollExtent) {
      _loadMore();
    }
    return true;
  }

  Future<void> _loadMore() async {
    setState(() => _isLoadingMore = true);
    _currentPage++;
    await _loadData();
    setState(() => _isLoadingMore = false);
  }

  void _onSelect(bool selected, Tag tag) {
    if (selected) return setState(() => _selected.add(tag));
    return setState(() => _selected.remove(tag));
  }

  Future<void> _submit() async {
    ProgressIndicators.loadingDialog();
    try {
      _dto.tagsIds.addAll(_selected.map((tag) => tag.id));
      await _authController.register(_dto);
      final loginDTO = _generateLoginDTO();
      await _authController.login(loginDTO);
      await _authController.getProfile();
      Get.offAllNamed(HomeScreen.routeName);
    } on MessageException catch (error) {
      Get.back();
      Snackbars.danger(error.message);
    }
  }

  LoginDTO _generateLoginDTO() {
    return LoginDTO(email: _dto.email, password: _dto.password);
  }
}
