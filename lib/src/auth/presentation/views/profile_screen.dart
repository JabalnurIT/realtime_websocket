import 'package:flutter/material.dart';

import '../../../../core/common/widgets/rounded_button.dart';
import '../../../../core/res/colours.dart';
import '../../../../core/res/media_res.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({
    super.key,
  });

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _initListener();
  }

  void _initListener() {
    _searchController.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(
              width: double.infinity,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage(MediaRes.appIcon),
                    backgroundColor: Colours.quaternaryColour30,
                  ),
                  Text(
                    'Name',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: const BoxDecoration(
                      color: Colours.backgroundColour,
                      boxShadow: [
                        BoxShadow(
                          color: Colours.baseColour50,
                          blurRadius: 3,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: TextButton(
                      onPressed: () {},
                      child: const Row(
                        children: [
                          Text(
                            'Lihat Profil',
                            style: TextStyle(
                              color: Colours.txtDarkColour,
                              fontSize: 14,
                            ),
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colours.txtDarkColour,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: const BoxDecoration(
                      color: Colours.backgroundColour,
                      boxShadow: [
                        BoxShadow(
                          color: Colours.baseColour50,
                          blurRadius: 3,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: TextButton(
                      onPressed: () {},
                      child: const Row(
                        children: [
                          Text(
                            'Kebijakan Kami',
                            style: TextStyle(
                              color: Colours.txtDarkColour,
                              fontSize: 14,
                            ),
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colours.txtDarkColour,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: const BoxDecoration(
                      color: Colours.backgroundColour,
                      boxShadow: [
                        BoxShadow(
                          color: Colours.baseColour50,
                          blurRadius: 3,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: TextButton(
                      onPressed: () {},
                      child: const Row(
                        children: [
                          Text(
                            'Kebijakan Privasi',
                            style: TextStyle(
                              color: Colours.txtDarkColour,
                              fontSize: 14,
                            ),
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colours.txtDarkColour,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: const BoxDecoration(
                      color: Colours.backgroundColour,
                      boxShadow: [
                        BoxShadow(
                          color: Colours.baseColour50,
                          blurRadius: 3,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: TextButton(
                      onPressed: () {},
                      child: const Row(
                        children: [
                          Text(
                            'Syarat dan Ketentuan Pengguna',
                            style: TextStyle(
                              color: Colours.txtDarkColour,
                              fontSize: 14,
                            ),
                          ),
                          Spacer(),
                          Icon(
                            Icons.arrow_forward_ios,
                            color: Colours.txtDarkColour,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            RoundedButton(
              text: 'Keluar',
              icon: const Icon(
                Icons.logout,
                color: Colours.primaryColour,
              ),
              onPressed: () {},
              backgroundColor: Colors.transparent,
              foregroundColor: Colours.primaryColour,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.2,
            )
          ],
        ),
      ),
    );
  }
}
