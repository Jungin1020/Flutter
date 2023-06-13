int findMaxValue(List<int> numbers) {
  if (numbers.isEmpty) {
    throw ArgumentError('The list cannot be empty.');
  }

  return numbers.fold(numbers[0],
      (maxValue, element) => element > maxValue ? element : maxValue);
}
