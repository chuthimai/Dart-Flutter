import 'package:flutter/material.dart';
import 'package:chat_app/screens/auth.dart';
import 'package:chat_app/screens/chat.dart';
import 'package:chat_app/screens/splash.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterChat',
      theme: ThemeData().copyWith(
        colorScheme: ColorScheme.fromSeed(
            seedColor: const Color.fromARGB(255, 63, 17, 177)),
      ),
      home: StreamBuilder(
        // tao 1 ma xac thuc cho 1 phien dang nhap
        // nhận vào một luồng dữ liệu, luồng này phát ra dữ liệu về trạng thái xác thực của người dùng, cho biết liệu họ đã đăng nhập hay chưa.
        stream: FirebaseAuth.instance.authStateChanges(),
        // Hàm này được gọi mỗi khi có một sự thay đổi trong luồng dữ liệu
        builder: (ctx, snapshot) {

          if (snapshot.connectionState == ConnectionState.waiting) {
            return const SplashScreen();
          }

          // trả về true, có nghĩa là người dùng đã đăng nhập
          // không có dữ liệu được phát ra từ FirebaseAuth, người dùng chưa đăng nhập hoặc đã đăng xuất
          if (snapshot.hasData) {
            return const ChatScreen();
          }

          return const AuthScreen();
        },
      ), // Tao luong
    );
  }
}
