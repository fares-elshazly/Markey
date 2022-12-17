import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '/Widgets/Shared/cached_image.dart';
import '/Factories/colors_factory.dart';
import '/Utilities/snackbars.dart';
import '/Models/Profile/previous_work.dart';
import '/Models/Shared/message_exception.dart';
import '/Controllers/authentication_controller.dart';
import '/Controllers/profile_controller.dart';

class Portfolio extends StatelessWidget {
  final List<PreviousWork> previousWorks;

  Portfolio({required this.previousWorks, Key? key}) : super(key: key);

  final _authController = Get.find<AuthenticationController>();
  final _profileController = Get.find<ProfileController>();

  final _crossAxisCount = 2;
  final _mainAxisSpacing = 10.0;
  final _crossAxisSpacing = 10.0;

  final _borderRadius = 8.0;
  final _imageHeight = 200.0;

  @override
  Widget build(BuildContext context) {
    return AlignedGridView.count(
      itemCount: previousWorks.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      crossAxisCount: _crossAxisCount,
      mainAxisSpacing: _mainAxisSpacing,
      crossAxisSpacing: _crossAxisSpacing,
      itemBuilder: (BuildContext context, int index) {
        return _buildImage(previousWorks[index]);
      },
    );
  }

  Widget _buildImage(PreviousWork work) {
    return Dismissible(
      key: Key(work.id.toString()),
      background: _buildDismissibleBackground(),
      child: _buildImageContent(work),
      onDismissed: (_) => _delete(work.id),
    );
  }

  Widget _buildDismissibleBackground() {
    return Container(
      decoration: BoxDecoration(
        color: ColorsFactory.danger,
        borderRadius: BorderRadius.circular(_borderRadius),
      ),
    );
  }

  Widget _buildImageContent(PreviousWork work) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(_borderRadius),
      child: CachedImage(
        url: work.image,
        width: double.infinity,
        height: _imageHeight,
        fit: BoxFit.cover,
      ),
    );
  }

  Future<void> _delete(int id) async {
    try {
      await _profileController.deletePreviousWork(id);
      await _authController.getProfile();
    } on MessageException catch (error) {
      Snackbars.danger(error.message);
    }
  }
}
