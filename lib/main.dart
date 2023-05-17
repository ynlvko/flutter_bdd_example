import 'dart:convert';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:http/http.dart' as http;
import 'package:iat_example/firebase_options.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'main.g.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configure();
  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}

Future<void> configure() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  final remoteConfig = FirebaseRemoteConfig.instance;
  await remoteConfig.setConfigSettings(RemoteConfigSettings(
    fetchTimeout: const Duration(minutes: 1),
    minimumFetchInterval: const Duration(hours: 1),
  ));

  await remoteConfig.fetchAndActivate();
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends ConsumerWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('Go to Account'),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const AccountPage(),
                  ),
                );
              },
            ),
            OutlinedButton(
              child: const Text('Go to Info'),
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => const InfoPage(),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class AccountPage extends ConsumerWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final accountValue = ref.watch(accountDataProvider);

    return Scaffold(
      body: accountValue.when(
        data: (data) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('First Name'),
                  Text(data.$1),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Last Name'),
                  Text(data.$2),
                ],
              ),
            ],
          );
        },
        error: (error, stackTrace) => const Center(
          child: Text('error'),
        ),
        loading: () => const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}

class InfoPage extends ConsumerWidget {
  const InfoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final companyName = ref.watch(companyNameProvider);

    return Scaffold(
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Text('Company Name: '),
            Text(companyName),
          ],
        ),
      ),
    );
  }
}

typedef Person = (String firstName, String lastName);

@riverpod
FutureOr<Person> accountData(AccountDataRef ref) async {
  final response = await http.get(
    Uri.parse('https://api.sampleapis.com/futurama/characters'),
  );
  final json = jsonDecode(response.body) as List;
  final person = json.first as Map<String, dynamic>;
  return (person['name']['first'] as String, person['name']['last'] as String);
}

@Riverpod(keepAlive: true)
FirebaseRemoteConfig firebaseRC(FirebaseRCRef ref) {
  return FirebaseRemoteConfig.instance;
}

@riverpod
String companyName(CompanyNameRef ref) {
  final firebaseRC = ref.watch(firebaseRCProvider);
  return ref.watch(firebaseRCProvider).getString('company_name');
}
