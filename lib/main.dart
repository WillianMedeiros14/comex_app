import 'package:comex_app/features/bottomNavigation/presentation/pages/BottomNavigationBar.dart';
import 'package:comex_app/features/home/presentation/pages/home_screen.dart';
import 'package:comex_app/features/home/presentation/pages/product_details.dart';
import 'package:comex_app/features/onboarding/presentation/pages/onboarding_screen.dart';
import 'package:comex_app/features/orderCart/presentation/pages/order_cart_screen.dart';
import 'package:comex_app/features/orderHistory/presentation/pages/order_history_details_screen.dart';
import 'package:comex_app/shared/stores/cart_store.dart';
import 'package:comex_app/shared/themes/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  runApp(
    MultiProvider(
      providers: [
        Provider<CartStore>(create: (_) => CartStore()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: myTheme,
      initialRoute: '/',
      routes: {
        '/': (context) => const OnboardingScreen(),
        '/bottomNavigationScreenHome': (context) =>
            const BottomNavigationScreen(),
        '/home': (context) => const HomeScreen(),
        '/productDetails': (context) => const ProductDetails(),
        '/orderCartScreen': (context) => const OrderCartScreen(),
        '/orderHistoryDetailsScreen': (context) =>
            const OrderHistoryDetailsScreen(),
      },
    );
  }
}
