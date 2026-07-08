import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

// Kitob va Mualliflar uchun ma'lumotlar modeli
class Book {
  final String id;
  final String title;
  final String author;
  final String coverUrl;
  final String audioDuration;
  final String readDuration;

  Book({
    required this.id,
    required this.title,
    required this.author,
    required this.coverUrl,
    required this.audioDuration,
    required this.readDuration,
  });
}

class Author {
  final String name;
  final String avatarUrl;

  Author({required this.name, required this.avatarUrl});
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Author> authors = [
      Author(name: 'Royryan Merc..', avatarUrl: 'assets/images/futurama_cover.png'),
      Author(name: 'Neil Gaiman', avatarUrl: 'assets/images/futurama_cover.png'),
      Author(name: 'Mark mcallister', avatarUrl: 'assets/images/futurama_cover.png'),
      Author(name: 'Michael Doug..', avatarUrl: 'assets/images/futurama_cover.png'),
      Author(name: 'Royryan...', avatarUrl: 'assets/images/futurama_cover.png'),
    ];

    final List<Book> trendingBooks1 = [
      Book(
        id: 'good-guy-1',
        title: 'The good guy',
        author: 'Mark mcallister',
        coverUrl: 'assets/images/futurama_cover.png',
        audioDuration: '5m',
        readDuration: '8m',
      ),
      Book(
        id: 'futurama-123',
        title: 'Futurama',
        author: 'Michael Douglas jr.',
        coverUrl: 'assets/images/futurama_cover.png',
        audioDuration: '12m',
        readDuration: '9m',
      ),
      Book(
        id: 'creative-1',
        title: 'Explore your crea..',
        author: 'Royryan Mercado',
        coverUrl: 'assets/images/futurama_cover.png',
        audioDuration: '15m',
        readDuration: '15m',
      ),
    ];

    final List<Book> trendingBooks2 = [
      Book(
        id: 'norse-1',
        title: 'Norse mythology',
        author: 'Neil Gaiman',
        coverUrl: 'assets/images/futurama_cover.png',
        audioDuration: '5m',
        readDuration: '8m',
      ),
      Book(
        id: 'creative-1',
        title: 'Explore your create..',
        author: 'Royryan Mercado',
        coverUrl: 'assets/images/futurama_cover.png',
        audioDuration: '5m',
        readDuration: '8m',
      ),
      Book(
        id: 'futurama-123',
        title: 'Futurama',
        author: 'Michael Douglas jr.',
        coverUrl: 'assets/images/futurama_cover.png',
        audioDuration: '5m',
        readDuration: '8m',
      ),
    ];

    return Scaffold(
      backgroundColor: const Color(0xFF121212), 
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        scrolledUnderElevation: 0,
        toolbarHeight: 70,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Good Afternoon',
              style: TextStyle(
                fontSize: 26, 
                fontWeight: FontWeight.bold, 
                color: Colors.white,
                letterSpacing: 0.5,
              ),
            ),
         
            Container(
              margin: const EdgeInsets.only(top: 4, left: 2),
              width: 45,
              height: 3,
              decoration: BoxDecoration(
                color: const Color(0xFFD0E7C5),
                borderRadius: BorderRadius.circular(2),
              ),
            )
          ],
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16.0),
            child: CircleAvatar(
              radius: 22,
              backgroundImage: AssetImage('assets/images/john_doe.png'), 
            ),
          )
        ],
      ),
      body: ListView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.only(bottom: 30),
        children: [
          const SizedBox(height: 12),

          SizedBox(
            height: 125,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.symmetric(horizontal: 16),
              itemCount: authors.length,
              itemBuilder: (context, index) {
                final author = authors[index];
                return Padding(
                  padding: const EdgeInsets.only(right: 14.0),
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.all(3),
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: const Color(0xFFD0E7C5).withOpacity(0.5), 
                            width: 1.5,
                          ),
                        ),
                        child: CircleAvatar(
                          radius: 34,
                          backgroundColor: Colors.grey[900],
                          backgroundImage: AssetImage(author.avatarUrl),
                        ),
                      ),
                      const SizedBox(height: 8),
                      SizedBox(
                        width: 78,
                        child: Text(
                          author.name,
                          style: const TextStyle(color: Colors.white70, fontSize: 11),
                          textAlign: TextAlign.center,
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),

          _buildCategoryTags(),

          const SizedBox(height: 24),
  Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      // Rasm chetlari yumaloq bo'lishi uchun ClipRRect ichiga olamiz
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Image.asset(
          'assets/images/books.png', // books.png rasmingizning yo'li
          width: double.infinity,
          fit: BoxFit.cover,
        ),
      ),),
    
            const SizedBox(height: 28),

          _buildSectionHeader(title: 'Trending'),
          const SizedBox(height: 12),
          _buildBookHorizontalList(trendingBooks1),

          const SizedBox(height: 28),

          _buildSectionHeader(title: 'Trending'),
          const SizedBox(height: 12),
          _buildBookHorizontalList(trendingBooks2),

          const SizedBox(height: 28),
          _buildSectionHeader(title: '5-Minutes read'),
          const SizedBox(height: 12),
          _buildBookHorizontalList(trendingBooks1),
        ],
      ),
    );
  }

  Widget _buildCategoryTags() {
    return SizedBox(
      height: 38,
      child: ListView(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        children: [
          _tagItem(label: 'Trending', icon: Icons.local_fire_department, isSelected: true),
          _tagItem(label: '5-Minutes Read', icon: Icons.menu_book_rounded, isSelected: false),
          _tagItem(label: 'Quick Read', icon: Icons.headphones, isSelected: false),
        ],
      ),
    );
  }

  Widget _tagItem({required String label, required IconData icon, required bool isSelected}) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 14),
      decoration: BoxDecoration(
        color: isSelected ? const Color(0xFFD0E7C5) : const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(18),
      ),
      child: Row(
        children: [
          Icon(icon, color: isSelected ? Colors.black87 : Colors.white60, size: 16),
          const SizedBox(width: 6),
          Text(
            label,
            style: TextStyle(
              color: isSelected ? Colors.black87 : Colors.white,
              fontWeight: isSelected ? FontWeight.bold : FontWeight.w500,
              fontSize: 13,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPremiumBanner() {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      padding: const EdgeInsets.only(left: 20, top: 20, bottom: 20, right: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF1C2237), // Rasmdagi maxsus ko'k-binafsha rang fon
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Get unlimited access to\nbooks in just',
                  style: TextStyle(
                    color: Colors.white, 
                    fontSize: 19, 
                    fontWeight: FontWeight.bold, 
                    height: 1.25,
                  ),
                ),
                const SizedBox(height: 10),
                const Text(
                  '\$9.99',
                  style: TextStyle(
                    color: Color(0xFFD0E7C5), 
                    fontSize: 34, 
                    fontWeight: FontWeight.w900,
                  ),
                ),
                const SizedBox(height: 14),
                Text(
                  '*Terms & conditions apply',
                  style: TextStyle(color: Colors.white.withOpacity(0.35), fontSize: 10),
                ),
              ],
            ),
          ),
          
          SizedBox(
            width: 125,
            height: 115,
            child: Stack(
              clipBehavior: Clip.none,
              children: [
                Positioned(right: 0, bottom: 0, child: _bannerMiniCover('assets/images/futurama_cover.png', 65)),
                Positioned(right: 42, bottom: 10, child: _bannerMiniCover('assets/images/futurama_cover.png', 60)),
                Positioned(right: 15, top: 0, child: _bannerMiniCover('assets/images/futurama_cover.png', 72)),
                Positioned(left: 0, top: 15, child: _bannerMiniCover('assets/images/futurama_cover.png', 62)),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _bannerMiniCover(String assetPath, double height) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(color: Colors.black, blurRadius: 6, offset: const Offset(2, 2))
        ]
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(3),
        child: Image.asset(assetPath, height: height, width: height * 0.66, fit: BoxFit.cover),
      ),
    );
  }

  Widget _buildSectionHeader({required String title}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white, 
              fontSize: 22, 
              fontWeight: FontWeight.bold,
              letterSpacing: 0.3,
            ),
          ),
          InkWell(
            onTap: () {},
            child: Row(
              children: const [
                Text(
                  'Show all', 
                  style: TextStyle(color: Color(0xFFD0E7C5), fontSize: 13, fontWeight: FontWeight.bold),
                ),
                SizedBox(width: 4),
                Icon(
                  Icons.arrow_circle_right_outlined, 
                  color: Color(0xFFD0E7C5), 
                  size: 18,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildBookHorizontalList(List<Book> books) {
    return SizedBox(
      height: 245,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: books.length,
        itemBuilder: (context, index) {
          final book = books[index];
          return GestureDetector(
            onTap: () => context.go('/home/book-detail/${book.id}'), 
            child: Container(
              width: 135,
              margin: const EdgeInsets.only(right: 14),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Kitob muqovasi (To'g'ri nisbat va soya bilan)
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(6),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          blurRadius: 4,
                          offset: const Offset(0, 3),
                        )
                      ]
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: Image.asset(
                        book.coverUrl,
                        height: 172,
                        width: 135,
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  
                  // Kitob sarlavhasi
                  Text(
                    book.title,
                    style: const TextStyle(
                      color: Colors.white, 
                      fontSize: 13.5, 
                      fontWeight: FontWeight.w700,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 2),
                  
                  // Muallif ismi
                  Text(
                    book.author,
                    style: const TextStyle(color: Colors.white, fontSize: 11.5),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const SizedBox(height: 5),
                  
                  Row(
                    children: [
                      const Icon(Icons.headphones_outlined, color: Colors.white38, size: 12),
                      const SizedBox(width: 3),
                      Text(
                        book.audioDuration, 
                        style: const TextStyle(color: Colors.white38, fontSize: 11),
                      ),
                      const SizedBox(width: 12),
                      const Icon(Icons.all_inclusive_rounded, color: Colors.white38, size: 12),
                      const SizedBox(width: 3),
                      Text(
                        book.readDuration, 
                        style: const TextStyle(color: Colors.white38, fontSize: 11),
                      ),
                    ],
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}