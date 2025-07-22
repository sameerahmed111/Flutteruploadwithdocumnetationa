import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Keyper Rentals',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Inter',
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            fontWeight: FontWeight.bold,
            height: 1.2,
          ),
          bodyLarge: TextStyle(
            height: 1.5,
          ),
        ),
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;
  late Animation<double> _slideAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1000),
    );

    _fadeAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0, 0.5, curve: Curves.easeInOut),
      ),
    );

    _slideAnimation = Tween<double>(begin: 50, end: 0).animate(
      CurvedAnimation(
        parent: _controller,
        curve: const Interval(0.3, 1, curve: Curves.easeOut),
      ),
    );

    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final bool isMobile = constraints.maxWidth < 700;

            final double horizontalPadding = isMobile ? 20 : 80;
            final double topHeaderPadding = isMobile ? 20 : 56;
            final double heroTopPadding = isMobile ? 50 : 120;

            return SingleChildScrollView(
              child: Column(
                children: [
                  // Gradient Container with Header and Hero
                  Container(
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: [Color(0xFF06418F), Color(0xFF141452)],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // HEADER with animation
                          FadeTransition(
                            opacity: _fadeAnimation,
                            child: SlideTransition(
                              position: Tween<Offset>(
                                begin: const Offset(0, -0.5),
                                end: Offset.zero,
                              ).animate(_controller),
                              child: Padding(
                                padding: EdgeInsets.only(top: topHeaderPadding),
                                child: isMobile
                                    ? Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          SvgPicture.network(
                                            'https://cdn.prod.website-files.com/66ac6355674df55afff1135a/677307dd08235e8c6c8a3114_light-logo.svg',
                                            height: 40,
                                          ),
                                          const SizedBox(height: 20),
                                          Wrap(
                                            spacing: 20,
                                            runSpacing: 10,
                                            children: [
                                              TextButton(
                                                onPressed: () {},
                                                child: const Text(
                                                  'Keyper for tenants',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ),
                                              TextButton(
                                                onPressed: () {},
                                                child: const Text(
                                                  'About RNPL',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ),
                                              ElevatedButton(
                                                onPressed: () {},
                                                style: ElevatedButton.styleFrom(
                                                  backgroundColor: Colors.white,
                                                  foregroundColor: Colors.black,
                                                  padding: const EdgeInsets.symmetric(
                                                      horizontal: 20, vertical: 12),
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(6),
                                                  ),
                                                ),
                                                child: const Text('Apply Now'),
                                              ),
                                            ],
                                          ),
                                        ],
                                      )
                                    : Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Row(
                                            children: [
                                              SvgPicture.network(
                                                'https://cdn.prod.website-files.com/66ac6355674df55afff1135a/677307dd08235e8c6c8a3114_light-logo.svg',
                                                height: 40,
                                              ),
                                              const SizedBox(width: 40),
                                              TextButton(
                                                onPressed: () {},
                                                child: const Text(
                                                  'Keyper for tenants',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ),
                                              const SizedBox(width: 20),
                                              TextButton(
                                                onPressed: () {},
                                                child: const Text(
                                                  'About RNPL',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 16,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          ElevatedButton(
                                            onPressed: () {},
                                            style: ElevatedButton.styleFrom(
                                              backgroundColor: Colors.white,
                                              foregroundColor: Colors.black,
                                              padding: const EdgeInsets.symmetric(
                                                  horizontal: 25, vertical: 15),
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.circular(6),
                                              ),
                                            ),
                                            child: const Text('Apply Now'),
                                          ),
                                        ],
                                      ),
                              ),
                            ),
                          ),

                          // HERO SECTION with staggered animations
                          Padding(
                            padding: EdgeInsets.only(top: heroTopPadding),
                            child: ConstrainedBox(
                              constraints: BoxConstraints(
                                maxWidth: isMobile
                                    ? double.infinity
                                    : size.width * 0.6,
                              ),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  AnimatedBuilder(
                                    animation: _controller,
                                    builder: (context, child) {
                                      return Transform.translate(
                                        offset: Offset(0, _slideAnimation.value),
                                        child: Opacity(
                                          opacity: _fadeAnimation.value,
                                          child: child,
                                        ),
                                      );
                                    },
                                    child: Text(
                                      'A Better Renting\nExperience',
                                      style: TextStyle(
                                        fontSize: isMobile ? 42 : 62,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        height: 1.2,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 20),
                                  AnimatedBuilder(
                                    animation: _controller,
                                    builder: (context, child) {
                                      return Transform.translate(
                                        offset: Offset(0, _slideAnimation.value * 0.8),
                                        child: Opacity(
                                          opacity: _fadeAnimation.value * 0.9,
                                          child: child,
                                        ),
                                      );
                                    },
                                    child: const Text(
                                      'Pay your annual rent monthly with our credit or debit cardssssss.',
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 11),
                                  AnimatedBuilder(
                                    animation: _controller,
                                    builder: (context, child) {
                                      return Transform.translate(
                                        offset: Offset(0, _slideAnimation.value * 0.6),
                                        child: Opacity(
                                          opacity: _fadeAnimation.value * 0.8,
                                          child: child,
                                        ),
                                      );
                                    },
                                    child: const Text(
                                      'No Check, No Stress',
                                      style: TextStyle(
                                        fontSize: 14,
                                        fontStyle: FontStyle.italic,
                                        color: Colors.white70,
                                      ),
                                    ),
                                  ),
                                  const SizedBox(height: 30),
                                  AnimatedBuilder(
                                    animation: _controller,
                                    builder: (context, child) {
                                      return Transform.translate(
                                        offset: Offset(0, _slideAnimation.value * 0.4),
                                        child: Opacity(
                                          opacity: _fadeAnimation.value * 0.7,
                                          child: child,
                                        ),
                                      );
                                    },
                                    child: ElevatedButton(
                                      onPressed: () {},
                                      style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.white,
                                        foregroundColor: Colors.black,
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 30, vertical: 16),
                                        shape: RoundedRectangleBorder(
                                          borderRadius: BorderRadius.circular(6),
                                        ),
                                      ),
                                      child: const Text('Apply Now'),
                                    ),
                                  ),
                                  const SizedBox(height: 100),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  
                  // White sections below
                  const RentPaymentSection(),
                  const PaymentBenefitsSection(),
                  const HowItWorksSection(),
                  const FooterSection(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class RentPaymentSection extends StatelessWidget {
  const RentPaymentSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 80),
      child: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isMobile = constraints.maxWidth < 700;
            
            return AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              width: isMobile ? null : 1200,
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 20 : 40,
              ),
              child: Column(
                children: [
                  FadeInAnimation(
                    delay: 0.3,
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 0.2,
                        ),
                        children: [
                          TextSpan(text: 'Pay Yoursssss '),
                          TextSpan(
                            text: 'Rent ',
                            style: TextStyle(color: Color(0xFF1355A6)),
                          ),
                          TextSpan(text: 'Monthly with your\n'),
                          TextSpan(
                            text: 'Credit Card',
                            style: TextStyle(color: Color(0xFF1355A6)),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 60),
                  isMobile ? _buildMobileLayout() : _buildDesktopLayout(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ScaleAnimation(
          delay: 0.4,
          child: Container(
            width: 280,
            height: 210,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              color: Colors.grey[200],
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 20,
                  offset: const Offset(0, 10),
                ),
              ],
              image: const DecorationImage(
                image: NetworkImage(
                    'https://images.unsplash.com/photo-1560518883-ce09059eeffa?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=600&q=80'),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        const SizedBox(height: 30),
        FadeInAnimation(
          delay: 0.5,
          child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 15,
                  offset: const Offset(0, 5),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'No more upfront payment stress',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                    height: 1.2,
                  ),
                ),
                const SizedBox(height: 12),
                const Text(
                  "Forget the cheques and bulky bank transfers. You're in control with monthly payments directly from your card.",
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black87,
                    height: 1.5,
                  ),
                ),
                const SizedBox(height: 24),
                Row(
                  children: [
                    ScaleAnimation(
                      delay: 0.6,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1355A6),
                          foregroundColor: Colors.white,
                          elevation: 0,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 28, vertical: 14),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.w600),
                        ),
                        child: const Text('Apply Now'),
                      ),
                    ),
                    const SizedBox(width: 10),
                    ScaleAnimation(
                      delay: 0.7,
                      child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          foregroundColor: const Color(0xFF1355A6),
                          side: const BorderSide(
                              color: Color(0xFF1355A6), width: 1.5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 22, vertical: 14),
                          textStyle: const TextStyle(
                              fontWeight: FontWeight.w600),
                        ),
                        child: const Text('Get the App'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildDesktopLayout() {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Expanded(
          child: ScaleAnimation(
            delay: 0.4,
            child: Container(
              height: 400,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 30,
                    offset: const Offset(0, 20),
                  ),
                ],
                image: const DecorationImage(
                  image: NetworkImage(
                      'https://images.unsplash.com/photo-1560518883-ce09059eeffa?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=600&q=80'),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
        const SizedBox(width: 60),
        Expanded(
          child: FadeInAnimation(
            delay: 0.5,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'No more upfront payment stress',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 28,
                    height: 1.3,
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  "Forget the cheques and bulky bank transfers. You're in control with monthly payments directly from your card. Our seamless platform makes managing your rent payments easier than ever before.",
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black87,
                    height: 1.7,
                  ),
                ),
                const SizedBox(height: 30),
                Row(
                  children: [
                    ScaleAnimation(
                      delay: 0.6,
                      child: ElevatedButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF1355A6),
                          foregroundColor: Colors.white,
                          elevation: 0,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 32, vertical: 16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                        child: const Text('Apply Now'),
                      ),
                    ),
                    const SizedBox(width: 15),
                    ScaleAnimation(
                      delay: 0.7,
                      child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          foregroundColor: const Color(0xFF1355A6),
                          side: const BorderSide(
                              color: Color(0xFF1355A6), width: 1.5),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                          padding: const EdgeInsets.symmetric(
                              horizontal: 28, vertical: 16),
                          textStyle: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w600),
                        ),
                        child: const Text('Get the App'),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class PaymentBenefitsSection extends StatelessWidget {
  const PaymentBenefitsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: const EdgeInsets.symmetric(vertical: 80),
      child: Center(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final isMobile = constraints.maxWidth < 700;
            
            return AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              width: isMobile ? null : 1200,
              padding: EdgeInsets.symmetric(
                horizontal: isMobile ? 20 : 40,
              ),
              child: Column(
                children: [
                  FadeInAnimation(
                    delay: 0.3,
                    child: const Text.rich(
                      TextSpan(
                        children: [
                          TextSpan(
                            text: 'Why should you switch to\n',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          TextSpan(
                            text: 'monthly payments?',
                            style: TextStyle(
                              fontSize: 28,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF1355A6),
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(height: 60),
                  isMobile ? _buildMobileLayout() : _buildDesktopLayout(),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildMobileLayout() {
    return Column(
      children: [
        _buildBenefitCard(
          delay: 0.4,
          imageUrl: 'https://images.unsplash.com/photo-1600880292203-757bb62b4baf?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=600&q=80',
          title: 'Cash flow Freedom',
          subtitle: 'Keep more of your cash every month',
        ),
        const SizedBox(height: 30),
        _buildBenefitCard(
          delay: 0.5,
          imageUrl: 'https://images.unsplash.com/photo-1551288049-bebda4e38f71?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=600&q=80',
          title: 'Set it and forget it',
          subtitle: 'Your rent gets paid automatically on time',
        ),
        const SizedBox(height: 30),
        _buildBenefitCard(
          delay: 0.6,
          imageUrl: 'https://images.unsplash.com/photo-1556740738-b6a63e27c4df?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=600&q=80',
          title: 'Get rewards',
          subtitle: 'Earn points, miles, or cashback everytime you pay rent',
        ),
      ],
    );
  }

  Widget _buildDesktopLayout() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _buildBenefitCard(
          delay: 0.4,
          imageUrl: 'https://images.unsplash.com/photo-1600880292203-757bb62b4baf?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=600&q=80',
          title: 'Cash flow Freedom',
          subtitle: 'Keep more of your cash every month',
        ),
        const SizedBox(width: 30),
        _buildBenefitCard(
          delay: 0.5,
          imageUrl: 'https://images.unsplash.com/photo-1551288049-bebda4e38f71?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=600&q=80',
          title: 'Set it and forget it',
          subtitle: 'Your rent gets paid automatically on time',
        ),
        const SizedBox(width: 30),
        _buildBenefitCard(
          delay: 0.6,
          imageUrl: 'https://images.unsplash.com/photo-1556740738-b6a63e27c4df?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=600&q=80',
          title: 'Get rewards',
          subtitle: 'Earn points, miles, or cashback everytime you pay rent',
        ),
      ],
    );
  }

  Widget _buildBenefitCard({
    required double delay,
    required String imageUrl,
    required String title,
    required String subtitle,
  }) {
    return ScaleAnimation(
      delay: delay,
      child: Container(
        width: 360,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 20,
              offset: const Offset(0, 10),
            ),
          ],
        ),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: const BorderRadius.vertical(
                top: Radius.circular(16),
              ),
              child: Image.network(
                imageUrl,
                height: 200,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(24),
              child: Column(
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 12),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.black54,
                      height: 1.5,
                    ),
                    textAlign: TextAlign.center,
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

class HowItWorksSection extends StatelessWidget {
  const HowItWorksSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 700;

    return Container(
      color: Colors.white,
      padding: EdgeInsets.symmetric(vertical: 80),
      child: Center(
        child: SizedBox(
          width: isMobile ? null : 1000,
          child: Column(
            children: [
              FadeInAnimation(
                delay: 0.3,
                child: const Text(
                  "How does it work?",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              const SizedBox(height: 60),
              _buildStep(
                delay: 0.4,
                isMobile: isMobile,
                imageUrl: 'https://images.unsplash.com/photo-1556742049-0cfed4f6a45d?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=600&q=80',
                title: "1. Apply Online",
                description: "Complete our simple application form in just a few minutes. No paperwork required.",
                reverse: false,
              ),
              SizedBox(height: isMobile ? 40 : 80),
              _buildStep(
                delay: 0.5,
                isMobile: isMobile,
                imageUrl: 'https://images.unsplash.com/photo-1556742044-3c52d6e88c62?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=600&q=80',
                title: "2. Get Approved",
                description: "Receive instant approval decision. No credit checks or lengthy waiting periods.",
                reverse: true,
              ),
              SizedBox(height: isMobile ? 40 : 80),
              _buildStep(
                delay: 0.6,
                isMobile: isMobile,
                imageUrl: 'https://images.unsplash.com/photo-1556742044-3c52d6e88c62?ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D&auto=format&fit=crop&w=600&q=80',
                title: "3. Pay Monthly",
                description: "Set up automatic payments with your credit card and enjoy stress-free renting.",
                reverse: false,
              ),
              const SizedBox(height: 60),
              ScaleAnimation(
                delay: 0.7,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF1355A6),
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40, vertical: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                    textStyle: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600),
                  ),
                  child: const Text('Get Started Today'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildStep({
    required double delay,
    required bool isMobile,
    required String imageUrl,
    required String title,
    required String description,
    required bool reverse,
  }) {
    if (isMobile) {
      return FadeInAnimation(
        delay: delay,
        child: Column(
          children: [
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                image: DecorationImage(
                  image: NetworkImage(imageUrl),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1355A6),
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.black87,
                      height: 1.5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    } else {
      return FadeInAnimation(
        delay: delay,
        child: Row(
          children: [
            if (!reverse) ...[
              Expanded(
                child: Container(
                  height: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                      image: NetworkImage(imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 60),
            ],
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1355A6),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Text(
                    description,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.black87,
                      height: 1.6,
                    ),
                  ),
                ],
              ),
            ),
            if (reverse) ...[
              const SizedBox(width: 60),
              Expanded(
                child: Container(
                  height: 300,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    image: DecorationImage(
                      image: NetworkImage(imageUrl),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ],
          ],
        ),
      );
    }
  }
}

class FooterSection extends StatelessWidget {
  const FooterSection({super.key});

  @override
  Widget build(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 700;

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [Color(0xFF06418F), Color(0xFF141452)],
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
        ),
      ),
      padding: const EdgeInsets.symmetric(vertical: 60),
      child: Center(
        child: SizedBox(
          width: isMobile ? null : 1200,
      
          child: Column(
            children: [
              FadeInAnimation(
                delay: 0.3,
                child: SvgPicture.network(
                  'https://cdn.prod.website-files.com/66ac6355674df55afff1135a/677307dd08235e8c6c8a3114_light-logo.svg',
                  height: 50,
                ),
              ),
              const SizedBox(height: 40),
              isMobile ? _buildMobileFooter() : _buildDesktopFooter(),
              const SizedBox(height: 40),
              const Divider(color: Colors.white24),
              const SizedBox(height: 30),
              FadeInAnimation(
                delay: 0.7,
                child: const Text(
                  '© 2023 Keyper Rentals. All rights reserved.',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 14,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildMobileFooter() {
    return Column(
      children: [
        _buildFooterColumn(
          delay: 0.4,
          title: 'Product',
          items: [
            'Features',
            'Pricing',
            'FAQ',
            'Get the App',
          ],
        ),
        const SizedBox(height: 30),
        _buildFooterColumn(
          delay: 0.5,
          title: 'Company',
          items: [
            'About Us',
            'Careers',
            'Contact',
            'Blog',
          ],
        ),
        const SizedBox(height: 30),
        _buildFooterColumn(
          delay: 0.6,
          title: 'Legal',
          items: [
            'Privacy Policy',
            'Terms of Service',
            'Cookie Policy',
          ],
        ),
      ],
    );
  }

  Widget _buildDesktopFooter() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildFooterColumn(
          delay: 0.4,
          title: 'Product',
          items: [
            'Features',
            'Pricing',
            'FAQ',
            'Get the App',
          ],
        ),
        _buildFooterColumn(
          delay: 0.5,
          title: 'Company',
          items: [
            'About Us',
            'Careers',
            'Contact',
            'Blog',
          ],
        ),
        _buildFooterColumn(
          delay: 0.6,
          title: 'Legal',
          items: [
            'Privacy Policy',
            'Terms of Service',
            'Cookie Policy',
          ],
        ),
        FadeInAnimation(
          delay: 0.6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Stay Connected',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  _buildSocialIcon(Icons.facebook),
                  const SizedBox(width: 15),
                  _buildSocialIcon(Icons.camera_alt), // Replaced twitter
                  const SizedBox(width: 15),
                  _buildSocialIcon(Icons.camera), // Replaced instagram
                  const SizedBox(width: 15),
                  _buildSocialIcon(Icons.link), // Replaced linkedin
                ],
              ),
              const SizedBox(height: 20),
              const Text(
                'Subscribe to our newsletter',
                style: TextStyle(
                  color: Colors.white70,
                  fontSize: 14,
                ),
              ),
              const SizedBox(height: 10),
              SizedBox(
                width: 250,
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Your email address',
                    hintStyle: const TextStyle(color: Colors.white54),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.1),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8),
                      borderSide: BorderSide.none,
                    ),
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.send, color: Colors.white),
                      onPressed: () {},
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildFooterColumn({
    required double delay,
    required String title,
    required List<String> items,
  }) {
    return FadeInAnimation(
      delay: delay,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: items.map((item) {
              return Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: Text(
                  item,
                  style: const TextStyle(
                    color: Colors.white70,
                    fontSize: 15,
                  ),
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }

  Widget _buildSocialIcon(IconData icon) {
    return Container(
      width: 40,
      height: 40,
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.1),
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        color: Colors.white,
        size: 20,
      ),
    );
  }
}

// Animation Widgets
class FadeInAnimation extends StatelessWidget {
  final Widget child;
  final double delay;

  const FadeInAnimation({
    super.key,
    required this.child,
    this.delay = 0,
  });

  @override
  Widget build(BuildContext context) {
    final tween = Tween<double>(begin: 0, end: 1);
    final curve = CurvedAnimation(
      parent: kAlwaysCompleteAnimation,
      curve: Interval(delay, 1, curve: Curves.easeInOut),
    );

    return AnimatedBuilder(
      animation: curve,
      builder: (context, child) {
        return Opacity(
          opacity: tween.evaluate(curve),
          child: child,
        );
      },
      child: child,
    );
  }
}

class ScaleAnimation extends StatelessWidget {
  final Widget child;
  final double delay;
  final double scale;

  const ScaleAnimation({
    super.key,
    required this.child,
    this.delay = 0,
    this.scale = 0.95,
  });

  @override
  Widget build(BuildContext context) {
    final tween = Tween<double>(begin: scale, end: 1);
    final curve = CurvedAnimation(
      parent: kAlwaysCompleteAnimation,
      curve: Interval(delay, 1, curve: Curves.easeOutBack),
    );

    return AnimatedBuilder(
      animation: curve,
      builder: (context, child) {
        return Transform.scale(
          scale: tween.evaluate(curve),
          child: child,
        );
      },
      child: child,
    );
  }
}                                                                                                                               