import 'package:flutter/material.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF121212),
      body: SafeArea(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              // 1. Sarlavha
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'My Library',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // 2. Filter Tablar (Gorizontal skrol bo'ladigan tugmalar)
              SizedBox(
                height: 38,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  children: [
                    _buildFilterChip('Saved Books', isSelected: true, icon: Icons.bookmark_border_rounded),
                    _buildFilterChip('In Progress', isSelected: false, icon: Icons.headphones_outlined),
                    _buildFilterChip('Completed', isSelected: false, icon: Icons.check_circle_outline_rounded),
                  ],
                ),
              ),
              const SizedBox(height: 24),

              // 3. 2 Ustunli Grid shaklidagi kitoblar ro'yxati
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: GridView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 14,
                    mainAxisSpacing: 20,
                    mainAxisExtent: 310, // Har bir elementning umumiy balandligi
                  ),
                  itemCount: _libraryBooks.length,
                  itemBuilder: (context, index) {
                    final book = _libraryBooks[index];
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Kitob muqovasi
                        Expanded(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: Container(
                              color: Colors.grey[900],
                              width: double.infinity,
                              child: Image.asset(
                                book.assetPath,
                                fit: BoxFit.cover,
                                errorBuilder: (context, error, stackTrace) =>
                                    const Icon(Icons.book, color: Colors.white24, size: 40),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 8),
                        // Kitob nomi
                        Text(
                          book.title,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        // Muallif nomi
                        Text(
                          book.author,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 4),
                        // Qisqa tavsif (Description)
                        Text(
                          book.description,
                          style: const TextStyle(
                            color: Colors.white38,
                            fontSize: 10,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 6),
                        // Vaqt ko'rsatkichlari (Audio & Read)
                        Row(
                          children: [
                            _buildInfoBadge(Icons.headphones_outlined, book.audioTime),
                            const SizedBox(width: 8),
                            _buildInfoBadge(Icons.all_inclusive_rounded, book.readTime),
                          ],
                        ),
                      ],
                    );
                  },
                ),
              ),
              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }

  // Yuqoridagi filter tugmalari uchun dizayn
  Widget _buildFilterChip(String label, {required bool isSelected, required IconData icon}) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFFD0E7C5) : const Color(0xFF222222),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        children: [
          Icon(
            icon,
            size: 16,
            color: isSelected ? Colors.black : Colors.white60,
          ),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.black : Colors.white70,
              fontSize: 13,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }

  // Kitob ostidagi yashil fonli mayda belgilar (Badge)
  Widget _buildInfoBadge(IconData icon, String text) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 3),
      decoration: BoxDecoration(
        color: const Color(0xFFD0E7C5).withOpacity(0.15),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Row(
        children: [
          Icon(icon, color: const Color(0xFFD0E7C5), size: 12),
          const SizedBox(width: 3),
          Text(
            text,
            style: const TextStyle(color: Color(0xFFD0E7C5), fontSize: 10, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}

// Dizayndagi ma'lumotlar modeli va test obyektlari
class _LibraryBook {
  final String title;
  final String author;
  final String description;
  final String audioTime;
  final String readTime;
  final String assetPath;

  _LibraryBook({
    required this.title,
    required this.author,
    required this.description,
    required this.audioTime,
    required this.readTime,
    required this.assetPath,
  });
}

final List<_LibraryBook> _libraryBooks = [
  _LibraryBook(
    title: 'The good guy',
    author: 'Mark mcallister',
    description: 'A story about a guy who was very good until the very end when..',
    audioTime: '5m',
    readTime: '8m',
    assetPath: 'assets/images/futurama_cover.png',
  ),
  _LibraryBook(
    title: 'Norse mythology',
    author: 'Neil Gaiman',
    description: 'A story about a guy who was very good until the very end when..',
    audioTime: '5m',
    readTime: '8m',
    assetPath: 'assets/images/futurama_cover.png',
  ),
  _LibraryBook(
    title: 'Futurama',
    author: 'Michael Douglas jr.',
    description: 'Upgrade your brain without breaking your mind. Discover the truth.',
    audioTime: '12m',
    readTime: '9m',
    assetPath: 'assets/images/futurama_cover.png',
  ),
  _LibraryBook(
    title: 'Explore your creative',
    author: 'Royryan Mercado',
    description: 'Mind to positivity. Turn your creativity into your lifestyle.',
    audioTime: '15m',
    readTime: '15m',
    assetPath: 'assets/images/futurama_cover.png',
  ),
];