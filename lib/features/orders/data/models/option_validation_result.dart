class OptionValidationResult {

  final bool isValid;

  final String? message;


  const OptionValidationResult({
    required this.isValid,
    this.message,
  });


  const OptionValidationResult.valid()
      : isValid = true,
        message = null;



  const OptionValidationResult.invalid(
    String message,
  )
      : isValid = false,
        message = message;

}