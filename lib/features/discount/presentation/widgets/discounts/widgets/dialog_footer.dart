import 'package:flutter/material.dart';

class DialogFooter extends StatelessWidget {
  final VoidCallback onCancel;
  final VoidCallback onSubmit;
  final String submitText;
  final Color submitColor;
  final bool enabled;
  final bool loading;

  const DialogFooter({
    super.key,
    required this.onCancel,
    required this.onSubmit,
    this.submitText = 'Enregistrer',
    this.submitColor = const Color(0xFF7C3AED),
    this.enabled = true,
    this.loading = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        OutlinedButton(
          onPressed: onCancel,
          style: OutlinedButton.styleFrom(
            minimumSize: const Size(120, 46),
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            side: const BorderSide(
              color: Color(0xFFE2E8F0),
            ),
          ),
          child: const Text(
            'Annuler',
            style: TextStyle(
              color: Color(0xFF475569),
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
        const SizedBox(width: 12),
        ElevatedButton(
          onPressed:
              enabled && !loading ? onSubmit : null,
          style: ElevatedButton.styleFrom(
            backgroundColor: submitColor,
            foregroundColor: Colors.white,
            disabledBackgroundColor:
                submitColor.withValues(alpha: 0.5),
            minimumSize: const Size(150, 46),
            elevation: 0,
            padding: const EdgeInsets.symmetric(
              horizontal: 22,
            ),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: loading
              ? const SizedBox(
                  width: 19,
                  height: 19,
                  child: CircularProgressIndicator(
                    strokeWidth: 2,
                    color: Colors.white,
                  ),
                )
              : Text(
                  submitText,
                  style: const TextStyle(
                    fontWeight: FontWeight.w600,
                  ),
                ),
        ),
      ],
    );
  }
}