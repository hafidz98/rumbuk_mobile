import 'package:flutter/material.dart';

class SimpleUserProfile extends StatelessWidget {
  const SimpleUserProfile({Key? key, required this.profileImageUrl, required this.profileUsername, required this.profileUserID}) : super(key: key);

  final String profileImageUrl;
  final String profileUsername;
  final String profileUserID;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        CircleAvatar(
          radius: 35,
          backgroundImage: profileImageUrl.isNotEmpty ? NetworkImage(profileImageUrl) : null,
          backgroundColor: Colors.grey.shade300,
          child: profileImageUrl.isEmpty ? Icon(color: Colors.grey.shade500,size: 70,Icons.account_circle) : null,
        ),
        const SizedBox(
          width: 16,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  style: const TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.bold,
                      fontSize: 16),
                  profileUsername),
              Text(
                  style: const TextStyle(
                      color: Colors.black87,
                      fontWeight: FontWeight.normal,
                      fontSize: 16),
                  profileUserID)
            ],
          ),
        )
      ],
    );
  }
}
