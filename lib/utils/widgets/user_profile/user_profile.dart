import 'package:flutter/material.dart';
import 'package:sharethechurch/main.dart';
import 'package:sharethechurch/utils/utils.dart';

class UserProfileContainer extends StatelessWidget {
  const UserProfileContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 104,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: primaryColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.0),
            child: Image.asset(
              'assets/images/dp.jpeg',
              width: 88,
              fit: BoxFit.cover,
              height: double.infinity,
            ),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
            child: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  child: WhiteButtonText(
                    text: currentUser!['name'],
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: WhiteButtonText(
                    text: '${currentUser!['city']}, ${currentUser!['state']}',
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
