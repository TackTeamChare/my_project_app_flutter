class Article {
  String title;
  String content;
  // String category;
  
  List<String>
      imageUrl; // ใช้ List<String> แทน String เพื่อเก็บรายการ URL ของรูปภาพ

  Article({
    required this.title,
    // required this.category,
    required this.content,
    required this.imageUrl, // ปรับให้รับ List<String>
  });
}
