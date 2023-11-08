import 'package:flutter/material.dart';

class ProfileWidget extends StatelessWidget {
  const ProfileWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          const CircleAvatar(
            radius: 100,
            backgroundImage: AssetImage("assets/images/profile.jpg"),
          ),
          Positioned(
            bottom: 0,
            right: 8,
            child: IconButton(
              onPressed: () {},
              icon: const CircleAvatar(
                radius: 30,
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.camera_alt,
                  color: Color(0xFF96798A),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
