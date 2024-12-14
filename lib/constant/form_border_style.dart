part of 'constant.dart';

InputDecoration primary = InputDecoration(
  isDense: true,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Neutral.neutral_300),
    borderRadius: BorderRadius.circular(10),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Primary.main),
    borderRadius: BorderRadius.circular(10),
  ),
  errorBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Error.subtle),
    borderRadius: BorderRadius.circular(10),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Error.subtle),
    borderRadius: BorderRadius.circular(10),
  ),
);

InputDecoration searchStyle = InputDecoration(
  isDense: true,
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Neutral.neutral_300, width: 2),
    borderRadius: BorderRadius.circular(20),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Primary.main, width: 2),
    borderRadius: BorderRadius.circular(20),
  ),
  errorBorder: OutlineInputBorder(
    borderSide: BorderSide(color: Error.subtle, width: 2),
    borderRadius: BorderRadius.circular(20),
  ),
);

InputDecoration textBoxStyle = InputDecoration(
  isDense: true,
  enabledBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: Neutral.neutral_300, width: 1),
    borderRadius: BorderRadius.circular(8),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: Primary.main, width: 1),
    borderRadius: BorderRadius.circular(8),
  ),
  errorBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: Error.subtle, width: 1),
    borderRadius: BorderRadius.circular(8),
  ),
  focusedErrorBorder: OutlineInputBorder(
    borderSide: const BorderSide(color: Error.subtle, width: 1),
    borderRadius: BorderRadius.circular(8),
  ),
);
