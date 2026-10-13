import 'package:flutter/material.dart';

class ProfileApp extends StatelessWidget {
  const ProfileApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Profile',
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: Colors.black,
        useMaterial3: true,
      ),
      home: const ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              children: [
                SizedBox(   
                  height: 300,
                  width: double.infinity,
                  child: Image.asset(
                    'assets/images/image3.png',
                    fit: BoxFit.cover,
                  ),
                ),

                Expanded(
                  child: Container(
                    width: double.infinity,
                    color: Colors.black,
                    padding: const EdgeInsets.only(
                      left: 38,
                      right: 30,
                      top: 295,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Wandiaja',
                          style: TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),

                        const SizedBox(height: 8),

                        const Text(
                          '@Wandiaja_',
                          style: TextStyle(
                            fontSize: 27,
                            color: Colors.grey,
                          ),
                        ),

                        const SizedBox(height: 42),

                        Row(
                          children: [
                            const Icon(
                              Icons.location_on_outlined,
                              size: 29,
                              color: Colors.grey,
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              'Bandung, Jawa Barat',
                              style: TextStyle(
                                fontSize: 26,
                                color: Colors.grey,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 42),

                        Row(
                          children: [
                            const Icon(
                              Icons.link,
                              size: 30,
                              color: Colors.blue,
                            ),
                            const SizedBox(width: 8),
                            const Expanded(
                              child: Text(
                                'medium.com/@Wandiaja_',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 25,
                                  color: Colors.blue,
                                ),
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 48),

                        Row(
                          children: [
                            const Icon(
                              Icons.circle_outlined,
                              size: 27,
                              color: Colors.grey,
                            ),
                            const SizedBox(width: 8),
                            const Text(
                              'Born August 30, 2008',
                              style: TextStyle(
                                fontSize: 22,
                                color: Colors.grey,
                              ),
                            ),

                            const SizedBox(width: 22),

                            const Icon(
                              Icons.calendar_month_outlined,
                              size: 27,
                              color: Colors.grey,
                            ),
                            const SizedBox(width: 7),

                            const Expanded(
                              child: Text(
                                'Joined November 20, 2022',
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  fontSize: 22,
                                  color: Colors.grey,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            // Tombol kembali
            Positioned(
              top: 25,
              left: 35,
              child: _topButton(
                icon: Icons.arrow_back,
              ),
            ),

            // Tombol kanan atas
            Positioned(
              top: 25,
              right: 35,
              child: Row(
                children: [
                  _topButton(
                    icon: Icons.visibility_off_outlined,
                  ),
                  const SizedBox(width: 12),
                  _topButton(
                    icon: Icons.search,
                  ),
                  const SizedBox(width: 12),
                  _topButton(
                    icon: Icons.more_horiz,
                  ),
                ],
              ),
            ),

            // Foto profile
            Positioned(
              top: 285,
              left: 35,
              child: Container(
                width: 245,
                height: 245,
                padding: const EdgeInsets.all(8),
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black,
                ),
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/image2.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  static Widget _topButton({
    required IconData icon,
  }) {
    return Container(
      width: 62,
      height: 62,
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.55),
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        color: Colors.white,
        size: 31,
      ),
    );
  }
}