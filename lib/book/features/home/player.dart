import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class PlayerScreen extends StatefulWidget {
  const PlayerScreen({super.key});

  @override
  State<PlayerScreen> createState() => _PlayerScreenState();
}

class _PlayerScreenState extends State<PlayerScreen> {
  double _sliderValue = 0.0;
  bool _isPlaying = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F0F0F),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.keyboard_arrow_down_rounded, color: Colors.white, size: 32),
          onPressed: () => context.pop(), 
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.more_vert, color: Colors.white),
            onPressed: () {},
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.asset(
                  'assets/images/futurama_cover.png',
                  width: MediaQuery.of(context).size.width * 0.7,
                  height: MediaQuery.of(context).size.width * 0.9,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 40),

            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Futurama',
                style: TextStyle(color: Colors.white, fontSize: 26, fontWeight: FontWeight.bold),
              ),
            ),
            const SizedBox(height: 6),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'By Kory Kogon, Suzette Blakemore, and James wood',
                style: TextStyle(color: Colors.white60, fontSize: 14),
              ),
            ),
            const SizedBox(height: 24),

            // Progress Slider
            SliderTheme(
              data: SliderTheme.of(context).copyWith(
                trackHeight: 4,
                thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 6),
                activeTrackColor: Colors.white,
                inactiveTrackColor: Colors.white24,
                thumbColor: Colors.white,
              ),
              child: Slider(
                value: _sliderValue,
                onChanged: (value) {
                  setState(() => _sliderValue = value);
                },
              ),
            ),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text('0:00', style: TextStyle(color: Colors.white60, fontSize: 12)),
                Text('-2:08', style: TextStyle(color: Colors.white60, fontSize: 12)),
              ],
            ),
            const SizedBox(height: 24),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.skip_previous_rounded, color: Colors.white, size: 36),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.replay_10_rounded, color: Colors.white, size: 36),
                  onPressed: () {},
                ),
                
                GestureDetector(
                  onTap: () {
                    setState(() => _isPlaying = !_isPlaying);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: const BoxDecoration(
                      color: Color(0xFFD0E7C5),
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      _isPlaying ? Icons.pause_rounded : Icons.play_arrow_rounded,
                      color: Colors.black,
                      size: 40,
                    ),
                  ),
                ),
                
                IconButton(
                  icon: const Icon(Icons.forward_10_rounded, color: Colors.white, size: 36),
                  onPressed: () {},
                ),
                IconButton(
                  icon: const Icon(Icons.skip_next_rounded, color: Colors.white, size: 36),
                  onPressed: () {},
                ),
              ],
            ),
            const SizedBox(height: 32),

            // Pastki Sleep va Speed qismi
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: const Icon(Icons.dark_mode_outlined, color: Colors.white60, size: 24),
                  onPressed: () {},
                ),
                const Text(
                  '1.0x',
                  style: TextStyle(color: Colors.white60, fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}