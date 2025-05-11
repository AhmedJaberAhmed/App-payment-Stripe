
import 'package:flutter/material.dart';

class Payment_method_item extends StatelessWidget {
  const Payment_method_item({
    super.key,    required this.isActive, required this.image,
  });
final bool isActive;
final String image;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
duration: Duration(milliseconds: 300),
      width: 90,
      height: 80,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF34A853), Color(0xFFB7E4C7)], // Gradient colors
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
        borderRadius: BorderRadius.circular(15),
        boxShadow: const [
          BoxShadow(
            color: Color(0x55000000), // Softer shadow
            blurRadius: 10,
            offset: Offset(4, 4), // Offset for depth
          ),
        ],
      ),
      child: Center(
        child: Container(
          padding: const EdgeInsets.all(4), // Add padding for a thick border
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: isActive? Color(0xFF34A853) :Color(0xFF808080) // Equivalent to RGB (128, 128, 128)
              , // Border color
              width: 4, // Increased border thickness
            ),
          ),
          child: Stack(
            fit: StackFit.expand,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(11), // Matches inner radius
                child: Image.asset(
                  image,
                  fit: BoxFit.cover,
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
