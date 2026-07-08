import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class BookDetailScreen extends StatelessWidget {
  final String bookId;

  const BookDetailScreen({super.key, required this.bookId});

  @override
  Widget build(BuildContext context) {
    // Rasmga asoslangan namuna ma'lumotlar (Aslida bu id bo'yicha bazadan keladi)
    final String currentTitle = "Project Management for the Unofficial Project Manager";
    final String currentAuthor = "Kory Kogon, Suzette Blakemore, and James Wood";
    final String currentCover = "assets/images/futurama_cover.png";

    return Scaffold(
      backgroundColor: const Color(0xFF121212),
     
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white, size: 20),
          onPressed: () => context.pop(),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onPressed: () {},
          )
        ],
      ),
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // 1. Tepadagi Xiralashgan Effektiv Muqova Qismi (Blur Effect)
            Stack(
              children: [
              
                Container(
                  height: 290,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage(currentCover),
                      fit: BoxFit.cover,
                    ),
                  ),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                    child: Container(color: Colors.black.withOpacity(0.4)),
                  ),
                ),
              
                Positioned(
                  bottom: 20,
                  left: 0,
                  right: 0,
                  child: Center(
                    child: Container(
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.4),
                            blurRadius: 12,
                            offset: const Offset(0, 4),
                          )
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(4),
                        child: Image.asset(
                          currentCover,
                          height: 160,
                          width: 125,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFF1D2235), // To'q ko'k-binafsha rang fon
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.menu_book_rounded, color: Colors.white70, size: 18),
                        label: const Text('Read Nexus', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
                      ),
                    ),
                    Container(width: 1, height: 24, color: Colors.white10),
                    Expanded(
                      child: TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.headphones, color: Colors.white70, size: 18),
                        label: const Text('Play Nexus', style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600)),
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 20),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          currentTitle,
                          style: const TextStyle(color: Colors.white, fontSize: 21, fontWeight: FontWeight.bold, height: 1.3),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          currentAuthor,
                          style: const TextStyle(color: Colors.white70, fontSize: 13, fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(height: 2),
                        const Text(
                          'A FranklinCovey Title',
                          style: TextStyle(color: Colors.white38, fontSize: 12),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Icon(Icons.bookmark_border_rounded, color: Colors.white60, size: 24),
                ],
              ),
            ),

            const SizedBox(height: 16),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                decoration: BoxDecoration(
                  color: const Color(0xFF1A1A24),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  children: [
                    const Icon(Icons.access_time, color: Colors.white60, size: 18),
                    const SizedBox(width: 6),
                    const Text('18 min', style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w500)),
                    const SizedBox(width: 24),
                    Container(width: 1, height: 16, color: Colors.white10),
                    const SizedBox(width: 24),
                    const Icon(Icons.lightbulb_outline_rounded, color: Colors.white60, size: 18),
                    const SizedBox(width: 6),
                    const Text('6 key ideas', style: TextStyle(color: Colors.white, fontSize: 13, fontWeight: FontWeight.w500)),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 24),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Text('About this Book', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text(
                    'Getting Along (2022) describes the importance of workplace interactions and their effects on productivity and creativity.',
                    style: TextStyle(color: Colors.white60, fontSize: 13.5, height: 1.4),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            SizedBox(
              height: 34,
              child: ListView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _buildInfoChip('Personal growth'),
                  _buildInfoChip('Culture & Society'),
                  _buildInfoChip('Fiction'),
                  _buildInfoChip('Mind & Philosophy'),
                ],
              ),
            ),

            const SizedBox(height: 28),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Text('56 Chapters', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            const SizedBox(height: 12),
            _buildChapterItem(number: '01', title: 'Introducion', subtitle: 'Subscribe to unlock all 2 key ideas fro..', isLocked: false),
            _buildChapterItem(number: '02', title: 'Creating the', subtitle: 'Subscribe to unlock all 2 key ideas fro..', isLocked: true),
            _buildChapterItem(number: '03', title: 'Introducion', subtitle: 'Subscribe to unlock all 2 key ideas fro..', isLocked: true),
            _buildChapterItem(number: '', title: 'Final Summary', subtitle: '', isLocked: true, isSummary: true),

            const SizedBox(height: 24),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Container(
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: const Color(0xFF161A26),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    const CircleAvatar(
                      radius: 24,
                      backgroundImage: AssetImage('assets/images/futurama_cover.png'),
                    ),
                    const SizedBox(width: 14),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: const [
                          Text('James wood', style: TextStyle(color: Colors.white, fontSize: 15, fontWeight: FontWeight.bold)),
                          Text('A FranklinCovey Title', style: TextStyle(color: Colors.white38, fontSize: 11)),
                          SizedBox(height: 4),
                          Text(
                            'Managers who want to create positive work enviroments',
                            style: TextStyle(color: Colors.white60, fontSize: 11.5),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),

            const SizedBox(height: 28),

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Similar Books', style: TextStyle(color: Colors.white, fontSize: 19, fontWeight: FontWeight.bold)),
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
              height: 235,
              child: ListView(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                children: [
                  _buildSimilarBookCard('Explore your create..', 'Royryan Mercado', 'assets/images/futurama_cover.png'),
                  _buildSimilarBookCard('Futurama', 'Michael Douglas jr.', 'assets/images/futurama_cover.png'),
                  _buildSimilarBookCard('The good guy', 'Mark mcallister', 'assets/images/futurama_cover.png'),
                ],
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }


  Widget _buildInfoChip(String label) {
    return Container(
      margin: const EdgeInsets.only(right: 8),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 6),
      decoration: BoxDecoration(
        color: const Color(0xFF1E1E1E),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: Colors.white10),
      ),
      child: Text(
        label,
        style: const TextStyle(color: Colors.white60, fontSize: 12, fontWeight: FontWeight.w500),
      ),
    );
  }

  Widget _buildChapterItem({
    required String number,
    required String title,
    required String subtitle,
    required bool isLocked,
    bool isSummary = false,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        children: [
          if (!isSummary) ...[
            Text(
              number,
              style: const TextStyle(color: Colors.white30, fontSize: 15, fontWeight: FontWeight.bold),
            ),
            const SizedBox(width: 16),
          ],
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    color: isSummary ? Colors.white70 : Colors.white, 
                    fontSize: 14.5, 
                    fontWeight: FontWeight.bold,
                  ),
                ),
                if (subtitle.isNotEmpty) ...[
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: const TextStyle(color: Colors.white38, fontSize: 11.5),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ]
              ],
            ),
          ),
          const SizedBox(width: 8),
          Icon(
            isLocked 
                ? Icons.lock_outline_rounded 
                : Icons.play_circle_fill_rounded,
            color: isLocked ? Colors.white30 : const Color(0xFFD0E7C5),
            size: isSummary ? 20 : 24,
          ),
        ],
      ),
    );
  }

  Widget _buildSimilarBookCard(String title, String author, String assetPath) {
    return Container(
      width: 130,
      margin: const EdgeInsets.only(right: 14),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(4),
            child: Image.asset(assetPath, height: 160, width: 130, fit: BoxFit.cover),
          ),
          const SizedBox(height: 6),
          Text(
            title,
            style: const TextStyle(color: Colors.white, fontSize: 12.5, fontWeight: FontWeight.bold),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          Text(
            author,
            style: const TextStyle(color: Colors.white60, fontSize: 10.5),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
          const SizedBox(height: 4),
          Row(
            children: const [
              Icon(Icons.headphones_outlined, color: Colors.white38, size: 11),
              SizedBox(width: 2),
              Text('5m', style: TextStyle(color: Colors.white38, fontSize: 10)),
              SizedBox(width: 10),
              Icon(Icons.all_inclusive_rounded, color: Colors.white38, size: 11),
              SizedBox(width: 2),
              Text('5m', style: TextStyle(color: Colors.white38, fontSize: 10)),
            ],
          )
        ],
      ),
    );
  }
}