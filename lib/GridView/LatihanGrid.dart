import 'package:flutter/material.dart';


class SocialFeedPage extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Social Media',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFFFF8FF),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  final List<Map<String, String>> stories = const [
    {
      'name': 'Story 1',
      'image':
          'https://images.unsplash.com/photo-1500530855697-b586d89ba3ee?w=300',
    },
    {
      'name': 'Story 2',
      'image':
          'https://images.unsplash.com/photo-1497366754035-f200968a6e72?w=300',
    },
    {
      'name': 'Story 3',
      'image':
          'https://images.unsplash.com/photo-1495474472287-4d71bcdd2085?w=300',
    },
    {
      'name': 'Story 4',
      'image':
          'https://images.unsplash.com/photo-1514888286974-6c03e2ca1dba?w=300',
    },
    {
      'name': 'Story 5',
      'image':
          'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=300',
    },
  ];

  final List<Map<String, String>> posts = const [
    {
      'username': 'user_1',
      'location': 'Bandung, Indonesia',
      'profile':
          'https://images.unsplash.com/photo-1500530855697-b586d89ba3ee?w=200',
      'image':
          'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=800',
    },
    {
      'username': 'user_2',
      'location': 'Bandung, Indonesia',
      'profile':
          'https://images.unsplash.com/photo-1497366754035-f200968a6e72?w=200',
      'image':
          'https://images.unsplash.com/photo-1511818966892-d7d671e672a2?w=800',
    },
    {
      'username': 'user_3',
      'location': 'Bandung, Indonesia',
      'profile':
          'https://images.unsplash.com/photo-1514888286974-6c03e2ca1dba?w=200',
      'image':
          'https://images.unsplash.com/photo-1470770841072-f978cf4d019e?w=800',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // BAGIAN STORY
            SizedBox(
              height: 155,
              child: GridView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.all(10),
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisSpacing: 12,
                  childAspectRatio: 1.1,
                ),
                itemCount: stories.length,
                itemBuilder: (context, index) {
                  final story = stories[index];

                  return Column(
                    children: [
                      ClipOval(
                        child: Image.network(
                          story['image']!,
                          width: 85,
                          height: 85,
                          fit: BoxFit.cover,
                          errorBuilder: (_, __, ___) =>
                              const Icon(Icons.image),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        story['name']!,
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  );
                },
              ),
            ),

            const Divider(thickness: 1),

            // BAGIAN POSTINGAN MENGGUNAKAN GRIDVIEW
            Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(16),
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 1,
                  mainAxisSpacing: 20,
                  mainAxisExtent: 570,
                ),
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  final post = posts[index];

                  return Container(
                    decoration: BoxDecoration(
                      color: const Color(0xFFF8F1FA),
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                        color: Colors.black12,
                      ),
                    ),
                    clipBehavior: Clip.antiAlias,
                    child: Column(
                      children: [
                        // HEADER POSTINGAN
                        ListTile(
                          leading: CircleAvatar(
                            backgroundImage:
                                NetworkImage(post['profile']!),
                          ),
                          title: Text(
                            post['username']!,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          subtitle: Text(post['location']!),
                          trailing: const Icon(Icons.more_vert),
                        ),

                        // FOTO POSTINGAN
                        Expanded(
                          child: Image.network(
                            post['image']!,
                            width: double.infinity,
                            fit: BoxFit.cover,
                            errorBuilder: (_, __, ___) =>
                                const Center(
                              child: Icon(Icons.broken_image),
                            ),
                          ),
                        ),

                        // IKON INTERAKSI
                        const Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                            vertical: 10,
                          ),
                          child: Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceBetween,
                            children: [
                              Icon(
                                Icons.favorite_border,
                                size: 30,
                              ),
                              Icon(
                                Icons.chat_bubble_outline,
                                size: 28,
                              ),
                              Icon(
                                Icons.bookmark_border,
                                size: 28,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}