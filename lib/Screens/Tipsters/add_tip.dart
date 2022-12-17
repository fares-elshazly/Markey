import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '/Widgets/Shared/back_app_bar.dart';
import '/Widgets/Shared/custom_text_field.dart';
import '/Widgets/Shared/submit_button.dart';
import '/Resources/strings.dart';
import '/Factories/text_factory.dart';
import '/Factories/colors_factory.dart';
import '/Utilities/helpers.dart';
import '/Utilities/validator.dart';
import '/Utilities/progress_indicator.dart';
import '/Utilities/snackbars.dart';
import '/DTOs/Shared/pagination.dart';
import '/DTOs/Tips/add_tip.dart';
import '/Models/Tags/tag.dart';
import '/Models/Shared/message_exception.dart';
import '/Controllers/authentication_controller.dart';
import '/Controllers/tips_controller.dart';
import '/Controllers/tags_controller.dart';

class AddTipScreen extends StatefulWidget {
  static const routeName = '/AddTip';

  const AddTipScreen({super.key});

  @override
  State<AddTipScreen> createState() => _AddTipScreenState();
}

class _AddTipScreenState extends State<AddTipScreen> {
  int _currentPage = 1;
  bool _isLoadingMore = false;

  final List<Tag> _selectedTags = [];

  final _authController = Get.find<AuthenticationController>();
  final _tipsController = Get.find<TipsController>();
  final _tagsController = Get.find<TagsController>();
  final _tags = Get.find<TagsController>().tagsList;

  final _formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();

  final _bodyHorizontalMargin = 15.0;
  final _bodyVerticalMargin = 15.0;
  final _contentMargin = 30.0;
  final _internalMargin = 10.0;
  final _maxLines = 10;

  @override
  void initState() {
    _loadData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
      bottomNavigationBar: _buildSubmit(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return const BackAppBar(
      title: MRKStrings.addTipTitle,
      backgroundColor: ColorsFactory.background,
    );
  }

  Widget _buildBody() {
    return GestureDetector(
      onTap: Helpers.dismissKeyboard,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: _bodyHorizontalMargin),
        child: Obx(() => _buildBodyLayout()),
      ),
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
    return NotificationListener<ScrollNotification>(
      onNotification: _scrollNotify,
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: _buildForm(),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(height: _bodyVerticalMargin),
        _buildTitleField(),
        SizedBox(height: _contentMargin),
        _buildContentField(),
        SizedBox(height: _contentMargin),
        _buildTagsField(),
        _buildIsLoadingMore(),
        SizedBox(height: _bodyVerticalMargin),
      ],
    );
  }

  Widget _buildTitleField() {
    return CustomTextField(
      label: MRKStrings.addTipName,
      hint: MRKStrings.addTipName,
      controller: _titleController,
      validator: Validator.isNotEmpty,
    );
  }

  Widget _buildContentField() {
    return CustomTextField(
      label: MRKStrings.addTipContent,
      hint: MRKStrings.addTipContent,
      controller: _contentController,
      validator: Validator.isNotEmpty,
      maxLines: _maxLines,
    );
  }

  Widget _buildTagsField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTagsLabel(),
        SizedBox(height: _internalMargin),
        _buildTagsContent(),
      ],
    );
  }

  Widget _buildTagsLabel() {
    return TextFactory.buildNormalText3(
      MRKStrings.addTipTags,
      color: ColorsFactory.secondaryText,
    );
  }

  Widget _buildTagsContent() {
    return Wrap(
      spacing: _internalMargin,
      runSpacing: _internalMargin,
      children: _tags.value!.tags.map((tag) => _buildTagChip(tag)).toList(),
    );
  }

  Widget _buildTagChip(Tag tag) {
    return ChoiceChip(
      elevation: double.minPositive,
      pressElevation: double.minPositive,
      selectedColor: ColorsFactory.primary,
      label: _buildTagLabel(tag),
      selected: _selectedTags.contains(tag),
      onSelected: (selected) => _onSelectTag(selected, tag),
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
        padding: EdgeInsets.symmetric(vertical: _contentMargin),
        child: ProgressIndicators.loadingIndicator(),
      ),
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
      label: MRKStrings.addTipSubmit,
      behaviour: _submit,
      isEnabled: _selectedTags.isNotEmpty,
    );
  }

  Color _getChipLabelColor(Tag tag) {
    if (_selectedTags.contains(tag)) return ColorsFactory.secondary;
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

  void _onSelectTag(bool selected, Tag tag) {
    if (selected) return setState(() => _selectedTags.add(tag));
    return setState(() => _selectedTags.remove(tag));
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    ProgressIndicators.loadingDialog();
    try {
      final dto = _generateDTO();
      await _tipsController.addTip(dto);
      await _authController.getProfile();
      Get.back();
      Get.back();
    } on MessageException catch (error) {
      Get.back();
      Snackbars.danger(error.message);
    }
  }

  AddTipDTO _generateDTO() {
    return AddTipDTO(
      title: _titleController.text,
      content: _contentController.text,
      tagsIds: _selectedTags.map((tag) => tag.id).toList(),
      userId: _authController.profile.value!.id,
    );
  }
}
