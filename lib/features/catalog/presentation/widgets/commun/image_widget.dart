import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pos_app/features/catalog/presentation/widgets/commun/section_widget.dart';

class ImageWidget extends StatefulWidget {
  final String? imagePath;
  final Function(String?) onpressed;

  const ImageWidget({
    super.key,
    this.imagePath,
    required this.onpressed
  });

  @override
  State<ImageWidget> createState() =>
      _ImageWidgetState();
}

class _ImageWidgetState
    extends State<ImageWidget> {

  final ImagePicker _imagePicker = ImagePicker();

  bool _pickingImage = false;

  @override
  Widget build(BuildContext context) {
    return SectionWidget(
      title: 'Image',
      icon: Icons.image_outlined,
      child: SizedBox(
        height: 190,
        child: widget.imagePath == null || widget.imagePath!.isEmpty
            ? InkWell(
                onTap: _pickingImage ? null : _pickImage,
                borderRadius: BorderRadius.circular(14),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xFFFAF8FD),
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: const Color(
                        0xFFDCD6E5,
                      ),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add_photo_alternate_outlined,
                        size: 42,
                        color: const Color(
                          0xFF6841C6,
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        _pickingImage ? 'Chargement...' : 'Ajouter une image',
                        style: const TextStyle(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      Text(
                        'JPG, PNG ou WEBP',
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.grey.shade600,
                        ),
                      ),
                    ],
                  ),
                ),
              )
            : Stack(
                fit: StackFit.expand,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(
                      14,
                    ),
                    child: _localImage(),
                  ),
                  Positioned(
                    top: 8,
                    right: 8,
                    child: Row(
                      children: [
                        _imageAction(
                          Icons.edit_outlined,
                          _pickImage,
                        ),
                        const SizedBox(
                          width: 6,
                        ),
                        _imageAction(
                          Icons.delete_outline,
                          () => widget.onpressed(null),
                          danger: true,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
      ),
    );
  }

  Widget _imageAction(
    IconData icon,
    VoidCallback onTap, {
    bool danger = false,
  }) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(9),
      elevation: 2,
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(9),
        child: Padding(
          padding: const EdgeInsets.all(8),
          child: Icon(
            icon,
            size: 17,
            color: danger ? Colors.red : Colors.black87,
          ),
        ),
      ),
    );
  }

  Widget _localImage() {
    if (widget.imagePath == null) {
      return const SizedBox();
    }

    if (widget.imagePath!.startsWith('http')) {
      return Image.network(
        widget.imagePath!,
        fit: BoxFit.cover,
        errorBuilder: (_, __, ___) => _imageError(),
      );
    }

    return Image.file(
      File(widget.imagePath!),
      fit: BoxFit.cover,
      errorBuilder: (_, __, ___) => _imageError(),
    );
  }

  Widget _imageError() {
    return Container(
      color: const Color(0xFFF0EDF4),
      child: const Center(
        child: Icon(
          Icons.broken_image_outlined,
          size: 42,
          color: Colors.grey,
        ),
      ),
    );
  }

  Future<void> _pickImage() async {
    try {
      setState(() {
        _pickingImage = true;
      });

      final file = await _imagePicker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 85,
        maxWidth: 1200,
        maxHeight: 1200,
      );

      if (file == null) return;

      setState(() {
        widget.onpressed(file.path);
        //widget.imagePath = file.path;
      });
    } finally {
      if (mounted) {
        setState(() {
          _pickingImage = false;
        });
      }
    }
  }

}