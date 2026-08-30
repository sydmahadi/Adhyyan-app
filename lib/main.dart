import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(const AdhyayanApp());
}

// ============================================================
// APP
// ============================================================

class AdhyayanApp extends StatelessWidget {
  const AdhyayanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'অধ্যয়ন',
      theme: ThemeData(
        useMaterial3: true,
        fontFamily: 'Roboto',
        scaffoldBackgroundColor: const Color(0xFFF4F1E8),
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF123F2A),
        ),
      ),
      home: const HomeScreen(),
    );
  }
}

// ============================================================
// COLORS
// ============================================================

class AppColors {
  static const darkGreen = Color(0xFF082A1D);
  static const green = Color(0xFF123F2A);
  static const lightGreen = Color(0xFF1E5631);

  static const gold = Color(0xFFE8C547);
  static const softGold = Color(0xFFF3D978);

  static const cream = Color(0xFFF4F1E8);
  static const white = Color(0xFFFFFFFF);
}

// ============================================================
// HOME SCREEN
// ============================================================

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static const List<Map<String, dynamic>> blogData = [
    {
      'title': 'হোম',
      'url': 'https://oddhayoon.blogspot.com/p/home.html',
      'icon': Icons.menu_book_rounded,
    },
    {
      'title': 'আজকের পড়া',
      'url':
          'https://oddhayoon.blogspot.com/p/box-sizing-border-box-font-family-segoe.html',
      'icon': Icons.auto_stories_rounded,
    },
    {
      'title': 'পাঠচক্র',
      'url': 'https://oddhayoon.blogspot.com/p/studycircle.html',
      'icon': Icons.groups_rounded,
    },
    {
      'title': 'আলোচনা চক্র',
      'url': 'https://oddhayoon.blogspot.com/p/discussioncircle.html',
      'icon': Icons.record_voice_over_rounded,
    },
    {
      'title': 'পাঠাগার',
      'url': 'https://oddhayoon.blogspot.com/p/library.html',
      'icon': Icons.local_library_rounded,
    },
    {
      'title': 'নোটিশ',
      'url': 'https://oddhayoon.blogspot.com/p/notice.html',
      'icon': Icons.campaign_rounded,
    },
  ];

  Future<void> _showCalendarPicker(BuildContext context) async {
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime(2035),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.green,
              onPrimary: Colors.white,
              onSurface: AppColors.green,
            ),
          ),
          child: child!,
        );
      },
    );

    if (selectedDate != null && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: AppColors.darkGreen,
          behavior: SnackBarBehavior.floating,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(14),
          ),
          content: Text(
            'নির্বাচিত তারিখ: '
            '${selectedDate.day}/${selectedDate.month}/${selectedDate.year}',
          ),
        ),
      );
    }
  }

  void _openPage(
    BuildContext context, {
    required String url,
    required String title,
  }) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => WebViewScreen(
          url: url,
          title: title,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFFF0EEE4),
              Color(0xFFF8F6EF),
              Color(0xFFE7E9DF),
            ],
          ),
        ),
        child: Stack(
          children: [
            // Islamic background pattern
            Positioned.fill(
              child: CustomPaint(
                painter: IslamicBackgroundPainter(),
              ),
            ),

            SafeArea(
              child: Column(
                children: [
                  // ==================================================
                  // TOP HEADER
                  // ==================================================

                  Container(
                    margin: const EdgeInsets.fromLTRB(14, 10, 14, 0),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 13,
                    ),
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [
                          AppColors.darkGreen,
                          AppColors.green,
                        ],
                      ),
                      borderRadius: BorderRadius.circular(24),
                      border: Border.all(
                        color: AppColors.gold.withOpacity(0.55),
                        width: 1,
                      ),
                      boxShadow: [
                        BoxShadow(
                          color: AppColors.darkGreen.withOpacity(0.22),
                          blurRadius: 16,
                          offset: const Offset(0, 7),
                        ),
                      ],
                    ),
                    child: Row(
                      children: [
                        // Logo
                        Container(
                          width: 48,
                          height: 48,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: AppColors.gold.withOpacity(0.13),
                            border: Border.all(
                              color: AppColors.gold.withOpacity(0.65),
                              width: 1,
                            ),
                          ),
                          child: const Icon(
                            Icons.mosque_rounded,
                            color: AppColors.gold,
                            size: 27,
                          ),
                        ),

                        const SizedBox(width: 12),

                        // Title
                        const Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'অধ্যয়ন',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 23,
                                  fontWeight: FontWeight.w800,
                                  letterSpacing: 0.3,
                                ),
                              ),
                              SizedBox(height: 2),
                              Text(
                                'ইলম • চিন্তা • জ্ঞান',
                                style: TextStyle(
                                  color: AppColors.softGold,
                                  fontSize: 10,
                                  letterSpacing: 1.2,
                                ),
                              ),
                            ],
                          ),
                        ),

                        // Calendar
                        InkWell(
                          borderRadius: BorderRadius.circular(18),
                          onTap: () => _showCalendarPicker(context),
                          child: Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 11,
                              vertical: 9,
                            ),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.08),
                              borderRadius: BorderRadius.circular(18),
                              border: Border.all(
                                color: AppColors.gold.withOpacity(0.45),
                              ),
                            ),
                            child: const Column(
                              children: [
                                Icon(
                                  Icons.calendar_month_rounded,
                                  color: AppColors.gold,
                                  size: 20,
                                ),
                                SizedBox(height: 2),
                                Text(
                                  'ক্যালেন্ডার',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 9,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 18),

                  // ==================================================
                  // BISMILLAH / DECORATION
                  // ==================================================

                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      DecorativeLine(),
                      SizedBox(width: 10),
                      Icon(
                        Icons.auto_awesome_rounded,
                        color: AppColors.gold,
                        size: 18,
                      ),
                      SizedBox(width: 10),
                      DecorativeLine(),
                    ],
                  ),

                  const SizedBox(height: 12),

                  // ==================================================
                  // SECTION TITLE
                  // ==================================================

                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        width: 4,
                        height: 24,
                        decoration: BoxDecoration(
                          color: AppColors.green,
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      const SizedBox(width: 9),
                      const Text(
                        'ইলম ও সূচীপত্র',
                        style: TextStyle(
                          color: AppColors.darkGreen,
                          fontSize: 19,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 5),

                  const Text(
                    'জ্ঞান অন্বেষণে প্রতিদিন এক ধাপ',
                    style: TextStyle(
                      color: Color(0xFF657066),
                      fontSize: 11,
                    ),
                  ),

                  const SizedBox(height: 18),

                  // ==================================================
                  // MENU GRID
                  // ==================================================

                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: GridView.builder(
                        padding: const EdgeInsets.only(bottom: 8),
                        itemCount: blogData.length,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 11,
                          mainAxisSpacing: 12,
                          childAspectRatio: 0.78,
                        ),
                        itemBuilder: (context, index) {
                          final item = blogData[index];

                          return IslamicMenuCard(
                            title: item['title'] as String,
                            icon: item['icon'] as IconData,
                            onTap: () {
                              _openPage(
                                context,
                                url: item['url'] as String,
                                title: item['title'] as String,
                              );
                            },
                          );
                        },
                      ),
                    ),
                  ),

                  // ==================================================
                  // SEARCH BUTTON
                  // ==================================================

                  Padding(
                    padding: const EdgeInsets.fromLTRB(18, 4, 18, 8),
                    child: Container(
                      height: 55,
                      decoration: BoxDecoration(
                        gradient: const LinearGradient(
                          colors: [
                            AppColors.darkGreen,
                            AppColors.green,
                            AppColors.lightGreen,
                          ],
                        ),
                        borderRadius: BorderRadius.circular(18),
                        border: Border.all(
                          color: AppColors.gold.withOpacity(0.55),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: AppColors.green.withOpacity(0.25),
                            blurRadius: 12,
                            offset: const Offset(0, 5),
                          ),
                        ],
                      ),
                      child: Material(
                        color: Colors.transparent,
                        child: InkWell(
                          borderRadius: BorderRadius.circular(18),
                          onTap: () {
                            _openPage(
                              context,
                              url: 'https://www.google.com',
                              title: 'অনলাইনে অনুসন্ধান করুন',
                            );
                          },
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.search_rounded,
                                color: AppColors.gold,
                                size: 24,
                              ),
                              SizedBox(width: 9),
                              Text(
                                'অনলাইনে অনুসন্ধান করুন',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 15,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              SizedBox(width: 6),
                              Icon(
                                Icons.arrow_forward_rounded,
                                color: AppColors.softGold,
                                size: 17,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),

                  // ==================================================
                  // DEVELOPER
                  // ==================================================

                  Padding(
                    padding: const EdgeInsets.only(bottom: 9),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'DEVELOPED BY',
                          style: TextStyle(
                            color: Colors.grey.shade600,
                            fontSize: 7,
                            letterSpacing: 1.5,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(width: 5),
                        Container(
                          width: 4,
                          height: 4,
                          decoration: const BoxDecoration(
                            color: AppColors.gold,
                            shape: BoxShape.circle,
                          ),
                        ),
                        const SizedBox(width: 5),
                        const Text(
                          'Talpatar sepai',
                          style: TextStyle(
                            color: AppColors.green,
                            fontSize: 10,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// DECORATIVE LINE
// ============================================================

class DecorativeLine extends StatelessWidget {
  const DecorativeLine({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 55,
      height: 1,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.transparent,
            AppColors.gold.withOpacity(0.8),
          ],
        ),
      ),
    );
  }
}

// ============================================================
// ISLAMIC MENU CARD
// ============================================================

class IslamicMenuCard extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const IslamicMenuCard({
    super.key,
    required this.title,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(22),
        onTap: onTap,
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Colors.white.withOpacity(0.96),
                const Color(0xFFF2F0E7).withOpacity(0.95),
              ],
            ),
            borderRadius: BorderRadius.circular(22),
            border: Border.all(
              color: AppColors.gold.withOpacity(0.38),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: AppColors.green.withOpacity(0.08),
                blurRadius: 10,
                offset: const Offset(0, 5),
              ),
            ],
          ),
          child: Stack(
            children: [
              // Corner decoration
              Positioned(
                top: 5,
                left: 5,
                child: Icon(
                  Icons.auto_awesome,
                  size: 10,
                  color: AppColors.gold.withOpacity(0.55),
                ),
              ),

              Positioned(
                top: 5,
                right: 5,
                child: Icon(
                  Icons.auto_awesome,
                  size: 10,
                  color: AppColors.gold.withOpacity(0.55),
                ),
              ),

              // Main content
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 55,
                      height: 55,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: LinearGradient(
                          colors: [
                            AppColors.green.withOpacity(0.12),
                            AppColors.gold.withOpacity(0.10),
                          ],
                        ),
                        border: Border.all(
                          color: AppColors.gold.withOpacity(0.55),
                          width: 1.2,
                        ),
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Container(
                            width: 43,
                            height: 43,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: AppColors.green.withOpacity(0.12),
                              ),
                            ),
                          ),
                          Icon(
                            icon,
                            color: AppColors.green,
                            size: 26,
                          ),
                        ],
                      ),
                    ),

                    const SizedBox(height: 11),

                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Text(
                        title,
                        textAlign: TextAlign.center,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(
                          color: AppColors.darkGreen,
                          fontSize: 12.5,
                          fontWeight: FontWeight.w800,
                          height: 1.25,
                        ),
                      ),
                    ),

                    const SizedBox(height: 7),

                    Container(
                      width: 22,
                      height: 2,
                      decoration: BoxDecoration(
                        color: AppColors.gold.withOpacity(0.65),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// ============================================================
// ISLAMIC BACKGROUND PAINTER
// ============================================================

class IslamicBackgroundPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    // ---------------------------------------------
    // Very soft geometric pattern
    // ---------------------------------------------

    final patternPaint = Paint()
      ..color = AppColors.green.withOpacity(0.045)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1;

    const spacing = 70.0;

    for (double x = -spacing; x < size.width + spacing; x += spacing) {
      for (double y = -spacing; y < size.height + spacing; y += spacing) {
        _drawIslamicStar(
          canvas,
          Offset(x, y),
          27,
          patternPaint,
        );
      }
    }

    // ---------------------------------------------
    // Large central mandala
    // ---------------------------------------------

    final center = Offset(
      size.width / 2,
      size.height * 0.52,
    );

    final mandalaPaint = Paint()
      ..color = AppColors.green.withOpacity(0.035)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.1;

    for (double radius = 65; radius <= 240; radius += 35) {
      canvas.drawCircle(center, radius, mandalaPaint);
      _drawIslamicStar(
        canvas,
        center,
        radius,
        mandalaPaint,
      );
    }

    // ---------------------------------------------
    // Mosque silhouette
    // ---------------------------------------------

    _drawMosqueSilhouette(canvas, size);
  }

  void _drawIslamicStar(
    Canvas canvas,
    Offset center,
    double radius,
    Paint paint,
  ) {
    final path = Path();

    for (int i = 0; i < 16; i++) {
      final angle = -math.pi / 2 + i * math.pi / 8;

      final currentRadius =
          i.isEven ? radius : radius * 0.46;

      final x = center.dx + currentRadius * math.cos(angle);
      final y = center.dy + currentRadius * math.sin(angle);

      if (i == 0) {
        path.moveTo(x, y);
      } else {
        path.lineTo(x, y);
      }
    }

    path.close();

    canvas.drawPath(path, paint);
  }

  void _drawMosqueSilhouette(
    Canvas canvas,
    Size size,
  ) {
    final paint = Paint()
      ..color = AppColors.green.withOpacity(0.035)
      ..style = PaintingStyle.fill;

    final groundY = size.height - 15;

    // Main mosque
    final mosqueRect = Rect.fromLTWH(
      size.width * 0.22,
      groundY - 105,
      size.width * 0.56,
      105,
    );

    canvas.drawRect(mosqueRect, paint);

    // Main dome
    final domeCenter = Offset(
      size.width / 2,
      groundY - 105,
    );

    canvas.drawArc(
      Rect.fromCenter(
        center: domeCenter,
        width: size.width * 0.30,
        height: 100,
      ),
      math.pi,
      math.pi,
      true,
      paint,
    );

    // Left minaret
    canvas.drawRect(
      Rect.fromLTWH(
        size.width * 0.14,
        groundY - 145,
        17,
        145,
      ),
      paint,
    );

    canvas.drawCircle(
      Offset(size.width * 0.148, groundY - 150),
      12,
      paint,
    );

    // Right minaret
    canvas.drawRect(
      Rect.fromLTWH(
        size.width * 0.79,
        groundY - 145,
        17,
        145,
      ),
      paint,
    );

    canvas.drawCircle(
      Offset(size.width * 0.798, groundY - 150),
      12,
      paint,
    );

    // Door
    final doorRect = Rect.fromCenter(
      center: Offset(
        size.width / 2,
        groundY - 34,
      ),
      width: 38,
      height: 68,
    );

    canvas.drawArc(
      doorRect,
      math.pi,
      math.pi,
      true,
      paint,
    );

    // Small crescent
    final crescentPaint = Paint()
      ..color = AppColors.gold.withOpacity(0.16)
      ..style = PaintingStyle.fill;

    final moonCenter = Offset(
      size.width * 0.82,
      size.height * 0.22,
    );

    canvas.drawCircle(
      moonCenter,
      23,
      crescentPaint,
    );

    final cutPaint = Paint()
      ..color = const Color(0xFFE9E9E0)
      ..style = PaintingStyle.fill;

    canvas.drawCircle(
      moonCenter.translate(9, -7),
      21,
      cutPaint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}

// ============================================================
// WEBVIEW SCREEN
// ============================================================

class WebViewScreen extends StatefulWidget {
  final String url;
  final String title;

  const WebViewScreen({
    super.key,
    required this.url,
    required this.title,
  });

  @override
  State<WebViewScreen> createState() => _WebViewScreenState();
}

class _WebViewScreenState extends State<WebViewScreen> {
  late final WebViewController controller;

  bool isLoading = true;

  @override
  void initState() {
    super.initState();

    controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0xFFF4F1E8))
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            if (mounted) {
              setState(() {
                isLoading = true;
              });
            }
          },
          onPageFinished: (String url) {
            if (mounted) {
              setState(() {
                isLoading = false;
              });
            }
          },
          onWebResourceError: (WebResourceError error) {
            if (mounted) {
              setState(() {
                isLoading = false;
              });
            }
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  Future<void> _goBack() async {
    if (await controller.canGoBack()) {
      await controller.goBack();
    }
  }

  Future<void> _goForward() async {
    if (await controller.canGoForward()) {
      await controller.goForward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.cream,
      appBar: AppBar(
        backgroundColor: AppColors.darkGreen,
        foregroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new_rounded,
            size: 20,
          ),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          widget.title,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
            fontWeight: FontWeight.w800,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.home_rounded,
              color: AppColors.gold,
            ),
            onPressed: () => Navigator.pop(context),
          ),
          IconButton(
            icon: const Icon(
              Icons.refresh_rounded,
              color: Colors.white,
            ),
            onPressed: () => controller.reload(),
          ),
        ],
      ),
      body: Column(
        children: [
          if (isLoading)
            const LinearProgressIndicator(
              minHeight: 2,
              color: AppColors.gold,
              backgroundColor: AppColors.green,
            ),

          Expanded(
            child: WebViewWidget(
              controller: controller,
            ),
          ),

          // Bottom navigation
          Container(
            height: 56,
            decoration: BoxDecoration(
              color: Colors.white,
              border: const Border(
                top: BorderSide(
                  color: Color(0xFFE5E1D5),
                ),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.06),
                  blurRadius: 8,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _WebButton(
                  icon: Icons.arrow_back_ios_rounded,
                  onTap: _goBack,
                ),
                _WebButton(
                  icon: Icons.arrow_forward_ios_rounded,
                  onTap: _goForward,
                ),
                _WebButton(
                  icon: Icons.home_outlined,
                  onTap: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// ============================================================
// WEBVIEW BUTTON
// ============================================================

class _WebButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const _WebButton({
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(14),
        onTap: onTap,
        child: Container(
          width: 48,
          height: 42,
          decoration: BoxDecoration(
            color: AppColors.green.withOpacity(0.07),
            borderRadius: BorderRadius.circular(14),
          ),
          child: Icon(
            icon,
            color: AppColors.green,
            size: 19,
          ),
        ),
      ),
    );
  }
}
