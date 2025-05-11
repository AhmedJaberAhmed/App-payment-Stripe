import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ButtonHero extends StatelessWidget {
  const ButtonHero({
    super.key,
    this.isLoading = false,
    this.onPressed, // تم تعريف onPressed
  });

  final bool isLoading;
  final void Function()? onPressed; // ✅ إصلاح الخطأ هنا

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: isLoading ? null : onPressed, // ✅ تعطيل الزر عند التحميل
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.green, // ✅ لون الخلفية أخضر
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12), // ✅ زوايا مستديرة
        ),
        minimumSize: const Size(double.infinity, 70), // ✅ عرض الزر كامل
      ),
      child: isLoading
          ? const CircularProgressIndicator(
        color: Colors.white, // ✅ جعل التحميل واضحًا
      )
          : const Text(
        "Continue",
        style: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.bold,
          color: Colors.white, // ✅ لون النص أبيض
        ),
      ),
    );
  }
}
