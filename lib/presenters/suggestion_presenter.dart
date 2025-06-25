// Hàm tạo danh sách các từ gợi ý từ danh sách các chuỗi (tên sản phẩm hoặc mô tả sản phẩm ...)
Future<List<String>> createSuggestion(
  List<String> datas,
  String keyword,
) async {
  // Nếu từ khóa rỗng, trả về danh sách các chuỗi
  if (keyword.isEmpty) {
    return datas;
  }

  // Tạo một Map để đếm số lần xuất hiện của các cụm từ gợi ý
  Map<String, int> combinationCounts = {};

  // Duyệt qua từng giá trị trong danh sách dữ liệu
  for (var value in datas) {
    // Chuyển toàn bộ chuỗi thành chữ thường và tách thành danh sách từ
    List<String> words = value.toLowerCase().split(' ');

    // Tạo một Set để lưu các cụm từ gợi ý (tránh trùng lặp)
    Set<String> combinations = {};

    // Lặp qua từng từ trong chuỗi
    for (int start = 0; start < words.length; start++) {
      // Nếu từ hiện tại không chứa keyword và keyword không chứa từ hiện tại => bỏ qua
      if (!words[start].contains(keyword) && !keyword.contains(words[start])) {
        continue;
      }

      // Khởi tạo biến lưu cụm từ gợi ý
      String combination = '';

      // Tạo các cụm từ gợi ý từ vị trí start đến cuối chuỗi
      for (int end = start; end < words.length; end++) {
        // Nếu số từ trong keyword + 1 nhỏ hơn độ dài cụm từ => thêm cả cụm gốc vào danh sách gợi ý
        if (keyword.split(' ').length + 1 < (end - start)) {
          if (!RegExp(r'[a-zA-Z0-9]$').hasMatch(value)) {
            value = value.substring(0, value.length - 1);
          }
          combinations.add(value.toLowerCase());

          break;
        } else {
          // Ghép từ lại thành một cụm
          combination =
              combination.isEmpty ? words[end] : '$combination ${words[end]}';
          // Thêm cụm từ vào danh sách gợi ý
          if (!RegExp(r'[a-zA-Z0-9]$').hasMatch(combination)) {
            combination = combination.substring(0, combination.length - 1);

            combinations.add(combination);
            break;
          }
          combinations.add(combination);
        }
      }
    }

    // Đếm số lần xuất hiện của mỗi cụm từ gợi ý
    for (var combination in combinations) {
      combinationCounts[combination] =
          (combinationCounts[combination] ?? 0) + 1;
    }
  }

  // Gọi hàm getTopSuggestions để lấy danh sách gợi ý tối ưu theo keyword
  List<String> topSuggestions =
      getTopSuggestions(combinationCounts, keyword).toList();

  // Trả về danh sách gợi ý
  return topSuggestions;
}

// Hàm sắp xếp danh sách các gợi ý theo độ phổ biến giảm dần
List<String> getTopSuggestions(
  Map<String, int> combinationCounts,
  String keyword,
) {
  List<MapEntry<String, int>> sortedCombinations =
      combinationCounts.entries
          .where(
            (entry) =>
                keyword.isEmpty || entry.key.contains(keyword.toLowerCase()),
          )
          .toList()
        ..sort((a, b) => b.value.compareTo(a.value));

  return sortedCombinations.map((entry) => entry.key).toList();
}
