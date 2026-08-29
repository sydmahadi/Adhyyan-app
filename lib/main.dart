import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(const AdhyayanApp());
}

class AdhyayanApp extends StatelessWidget {
  const AdhyayanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'অধ্যয়ন',
      theme: ThemeData(
        brightness: Brightness.dark,
        fontFamily: 'Roboto',
      ),
      home: const HomeScreen(),
    );
  }
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  final List<Map<String, dynamic>> blogData = const [
    {
      'title': 'হোম',
      'url': 'https://oddhayoon.blogspot.com/p/home.html',
      'icon': '১',
      'colors': [Color(0xFFFF512F), Color(0xFFDD2476)],
    },
    {
      'title': 'আজকের পড়া',
      'url': 'https://oddhayoon.blogspot.com/p/box-sizing-border-box-font-family-segoe.html',
      'icon': '২',
      'colors': [Color(0xFF8A2387), Color(0xFFE94057)],
    },
    {
      'title': 'পাঠচক্র',
      'url': 'https://oddhayoon.blogspot.com/p/studycircle.html',
      'icon': '৩',
      'colors': [Color(0xFF00B4DB), Color(0xFF0083B0)],
    },
    {
      'title': 'আলোচনা চক্র',
      'url': 'https://oddhayoon.blogspot.com/p/discussioncircle.html',
      'icon': '৪',
      'colors': [Color(0xFF11998E), Color(0xFF38EF7D)],
    },
    {
      'title': 'পাঠাগার',
      'url': 'https://oddhayoon.blogspot.com/p/library.html',
      'icon': '৫',
      'colors': [Color(0xFFFC4A1A), Color(0xFFF7B733)],
    },
    {
      'title': 'নোটিশ',
      'url': 'https://oddhayoon.blogspot.com/p/notice.html',
      'icon': '৬',
      'colors': [Color(0xFFB92B27), Color(0xFF1565C0)],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Color(0xFF0F2027),
              Color(0xFF203A43),
              Color(0xFF2C5364),
              Color(0xFF1A002C),
            ],
            stops: [0.0, 0.35, 0.70, 1.0],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              const SizedBox(height: 25),
              
              // Header Title
              Column(
                children: [
                  const Text(
                    'অধ্যয়ন',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 36,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 2.5,
                      shadows: [
                        Shadow(color: Colors.cyanAccent, blurRadius: 15),
                        Shadow(color: Colors.black54, offset: Offset(3, 3), blurRadius: 6),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    width: 80,
                    height: 4,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Colors.cyanAccent, Colors.pinkAccent],
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ],
              ),
              
              const SizedBox(height: 35),

              // Grid Buttons Section
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20.0),
                  child: Center(
                    child: GridView.builder(
                      shrinkWrap: true,
                      physics: const BouncingScrollPhysics(),
                      itemCount: blogData.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 3,
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 20,
                        childAspectRatio: 0.82,
                      ),
                      itemBuilder: (context, index) {
                        final blog = blogData[index];
                        final List<Color> bgColors = blog['colors'];

                        return Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(22),
                            gradient: LinearGradient(
                              begin: Alignment.topLeft,
                              end: Alignment.bottomRight,
                              colors: bgColors,
                            ),
                            boxShadow: [
                              BoxShadow(
                                color: bgColors[0].withOpacity(0.5),
                                blurRadius: 12,
                                offset: const Offset(0, 6),
                              ),
                            ],
                          ),
                          child: Material(
                            color: Colors.transparent,
                            child: InkWell(
                              borderRadius: BorderRadius.circular(22),
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => WebViewScreen(
                                      url: blog['url']!,
                                      title: blog['title']!,
                                    ),
                                  ),
                                );
                              },
                              child: Padding(
                                padding: const EdgeInsets.all(10.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 44,
                                      height: 44,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.white.withOpacity(0.25),
                                        border: Border.all(color: Colors.white, width: 1.5),
                                      ),
                                      child: Center(
                                        child: Text(
                                          blog['icon']!,
                                          style: const TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                          ),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(height: 12),
                                    Text(
                                      blog['title']!,
                                      textAlign: TextAlign.center,
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 0.5,
                                        shadows: [
                                          Shadow(color: Colors.black38, offset: Offset(1, 1), blurRadius: 2),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),

              // Search Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 15.0),
                child: Container(
                  width: double.infinity,
                  height: 56,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(28),
                    gradient: const LinearGradient(
                      colors: [Color(0xFFFF416C), Color(0xFF8A2387)],
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: const Color(0xFFFF416C).withOpacity(0.4),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      borderRadius: BorderRadius.circular(28),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const WebViewScreen(
                              url: 'https://www.google.com',
                              title: 'অনলাইনে অনুসন্ধান করুন',
                            ),
                          ),
                        );
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.search, color: Colors.white, size: 24),
                          SizedBox(width: 10),
                          Text(
                            'অনলাইনে অনুসন্ধান করুন',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17,
                              fontWeight: FontWeight.bold,
                              letterSpacing: 0.8,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),

              // Developer Credit
              const Padding(
                padding: EdgeInsets.only(bottom: 20.0, top: 5.0),
                child: Column(
                  children: [
                    Text(
                      'DEVELOPED BY',
                      style: TextStyle(
                        color: Colors.white54,
                        fontSize: 10,
                        letterSpacing: 2.0,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SizedBox(height: 3),
                    Text(
                      'Talpatar sepai',
                      style: TextStyle(
                        color: Colors.cyanAccent,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 1.5,
                        shadows: [
                          Shadow(color: Colors.cyan, blurRadius: 8),
                        ],
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

class WebViewScreen extends StatefulWidget {
  final String url;
  final String title;
  const WebViewScreen({super.key, required this.url, required this.title});

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
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageStarted: (String url) {
            setState(() {
              isLoading = true;
            });
          },
          onPageFinished: (String url) {
            setState(() {
              isLoading = false;
            });
          },
        ),
      )
      ..loadRequest(Uri.parse(widget.url));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF0F2027),
      appBar: AppBar(
        backgroundColor: const Color(0xFF1A002C),
        elevation: 4,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(widget.title, style: const TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
        actions: [
          IconButton(
            icon: const Icon(Icons.home, color: Colors.white),
            onPressed: () => Navigator.pop(context),
          ),
          IconButton(
            icon: const Icon(Icons.refresh, color: Colors.white),
            onPressed: () => controller.reload(),
          ),
        ],
      ),
      body: Column(
        children: [
          isLoading
              ? const LinearProgressIndicator(color: Colors.cyanAccent, backgroundColor: Color(0xFF1A002C))
              : const SizedBox.shrink(),
          Expanded(
            child: WebViewWidget(controller: controller),
          ),
          Container(
            height: 55,
            decoration: const BoxDecoration(
              color: Color(0xFF1A002C),
              boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 5, offset: Offset(0, -2))],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back_ios, color: Colors.cyanAccent),
                  onPressed: () async {
                    if (await controller.canGoBack()) {
                      controller.goBack();
                    }
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.arrow_forward_ios, color: Colors.cyanAccent),
                  onPressed: () async {
                    if (await controller.canGoForward()) {
                      controller.goForward();
                    }
                  },
                ),
                IconButton(
                  icon: const Icon(Icons.home_outlined, color: Colors.cyanAccent),
                  onPressed: () => Navigator.pop(context),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
