import 'package:flutter/material.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

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
              // 1. Sarlavha (Explore)
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Explore',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 0.5,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // 2. Qidiruv paneli (Search TextField)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: TextField(
                  style: const TextStyle(color: Colors.white),
                  decoration: InputDecoration(
                    hintText: 'Title, author or keyword',
                    hintStyle: const TextStyle(color: Colors.white38, fontSize: 14),
                    prefixIcon: const Icon(Icons.search, color: Colors.white38, size: 22),
                    filled: true,
                    fillColor: const Color(0xFF222222),
                    contentPadding: const EdgeInsets.symmetric(vertical: 14),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 28),

              // 3. Topics (Mavzular) Seksiyasi
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  'Topics',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 12),
              
              // Mavzular paneli (Wrap yordamida chiroyli joylashuv)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Wrap(
                  spacing: 8.0,
                  runSpacing: 10.0,
                  children: [
                    _buildTopicChip('Personal growth'),
                    _buildTopicChip('Culture & Society'),
                    _buildTopicChip('Fiction'),
                    _buildTopicChip('Mind & Philosophy'),
                    _buildTopicChip('Health & Fitness'),
                    _buildTopicChip('Biographies'),
                    _buildTopicChip('Education'),
                    _buildTopicChip('History'),
                    _buildTopicChip('Future'),
                    _buildTopicChip('Technology'),
                    _buildTopicChip('Life style'),
                  ],
                ),
              ),
              const SizedBox(height: 32),

              // 4. Fiction Seksiyasi
              _buildCategorySection(
                title: 'Fiction',
                books: [
                  _BookModel('The good guy', 'Mark mcallister', '5m', '8m', 'assets/images/futurama_cover.png'),
                  _BookModel('Futurama', 'Michael Douglas jr.', '12m', '9m', 'assets/images/futurama_cover.png'),
                  _BookModel('Explore your creative', 'Royryan Mercado', '15m', '15m', 'assets/images/futurama_cover.png'),
                ],
              ),
              const SizedBox(height: 24),

              // 5. Culture & Society Seksiyasi
              _buildCategorySection(
                title: 'Culture & Society',
                books: [
                  _BookModel('Norse mythology', 'Neil Gaiman', '5m', '8m', 'assets/images/futurama_cover.png'),
                  _BookModel('Explore your creative', 'Royryan Mercado', '5m', '8m', 'assets/images/futurama_cover.png'),
                  _BookModel('Futurama', 'Michael Douglas jr.', '5m', '8m', 'assets/images/futurama_cover.png'),
                ],
              ),
              const SizedBox(height: 24),

              // 6. Life style Seksiyasi
              _buildCategorySection(
                title: 'Life style',
                books: [
                  _BookModel('Explore your creative', 'Royryan Mercado', '5m', '5m', 'assets/images/futurama_cover.png'),
                  _BookModel('Futurama', 'Michael Douglas jr.', '5m', '5m', 'assets/images/futurama_cover.png'),
                  _BookModel('The good guy', 'Mark mcallister', '5m', '5m', 'assets/images/futurama_cover.png'),
                ],
              ),
              const SizedBox(height: 32),
            ],
          ),
        ),
      ),
    );
  }

  // Mavzular uchun yordamchi chip vidjeti
  Widget _buildTopicChip(String label) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 8),
      decoration: BoxDecoration(
        color: const Color(0xFF222222),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white70,
          fontSize: 13,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  // Kategoriya bloki va uning ichidagi gorizontal ro'yxat
  Widget _buildCategorySection({required String title, required List<_BookModel> books}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(color: Colors.white, fontSize: 19, fontWeight: FontWeight.bold),
              ),
              Row(
                children: const [
                  Text('Show all', style: TextStyle(color: Color(0xFFD0E7C5), fontSize: 12, fontWeight: FontWeight.bold)),
                  SizedBox(width: 4),
                  Icon(Icons.arrow_circle_right_outlined, color: Color(0xFFD0E7C5), size: 16),
                ],
              )
            ],
          ),
        ),
        const SizedBox(height: 14),
        SizedBox(
          height: 240,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 16),
            itemCount: books.length,
          
            itemBuilder: (context, index) {
              final book = books[index];
              return Container(
                width: 135,
                margin: const EdgeInsets.only(right: 14),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(4),
                      child: Container(
                        color: Colors.grey[900],
                        height: 165,
                        width: 135,
                        child: Image.asset(
                          book.assetPath,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => const Icon(Icons.book, color: Colors.white24),
                        ),
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      book.title,
                      style: const TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.bold),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      book.author,
                      style: const TextStyle(color: Colors.white60, fontSize: 11),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Row(
                      children: [
                        const Icon(Icons.headphones_outlined, color: Colors.white38, size: 12),
                        const SizedBox(width: 2),
                        Text(book.audioTime, style: const TextStyle(color: Colors.white38, fontSize: 10)),
                        const SizedBox(width: 10),
                        const Icon(Icons.all_inclusive_rounded, color: Colors.white38, size: 12),
                        const SizedBox(width: 2),
                        Text(book.readTime, style: const TextStyle(color: Colors.white38, fontSize: 10)),
                      ],
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}

// Ma'lumotlarni tartibli uzatish uchun lokal model class
class _BookModel {
  final String title;
  final String author;
  final String audioTime;
  final String readTime;
  final String assetPath;

  _BookModel(this.title, this.author, this.audioTime, this.readTime, this.assetPath);
}