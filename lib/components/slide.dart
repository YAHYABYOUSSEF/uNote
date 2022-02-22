import 'package:flutter/material.dart';

class Slide {
  final String imageUrl;
  final String title;
  final String description;

  Slide({
    @required this.imageUrl,
    @required this.title,
    this.description,
  });
}

final slideList = [
  Slide(
    imageUrl: 'images/signup.png',
    title: 'سجل',
    description: 'أنشئ حسابك بخطوات بسيطة',
  ),
  Slide(
    imageUrl: 'images/search.png',
    title: 'ابحث',
    description: 'تصفح العديد من المذكرات لجميع موادك الجامعية',
  ),
  Slide(
    imageUrl: 'images/download.png',
    title: 'إرفع',
    description: "إرفع مذكراتك الشخصية لمساعدة الآخرين  ",
  ),
];
