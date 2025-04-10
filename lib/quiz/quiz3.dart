import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:convert';
import 'package:crypto/crypto.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: AuthScreen(),
    );
  }
}

class DatabaseHelper {
  static Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await initDB();
    return _database!;
  }

  Future<Database> initDB() async {
    String path = join(await getDatabasesPath(), 'users.db');
    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute(
            'CREATE TABLE users(id INTEGER PRIMARY KEY AUTOINCREMENT, email TEXT UNIQUE, firstName TEXT, lastName TEXT, username TEXT UNIQUE, password TEXT)'
        );
      },
    );
  }

  Future<int> registerUser(String email, String firstName, String lastName, String username, String password) async {
    final db = await database;
    String hashedPassword = sha256.convert(utf8.encode(password)).toString();
    try {
      return await db.insert('users', {
        'email': email,
        'firstName': firstName,
        'lastName': lastName,
        'username': username,
        'password': hashedPassword,
      });
    } catch (e) {
      return -1; // Return -1 if a unique constraint is violated
    }
  }

  Future<bool> loginUser(String username, String password) async {
    final db = await database;
    String hashedPassword = sha256.convert(utf8.encode(password)).toString();
    List<Map<String, dynamic>> result = await db.query(
      'users',
      where: 'username = ? AND password = ?',
      whereArgs: [username, hashedPassword],
    );
    return result.isNotEmpty;
  }
}

class AuthScreen extends StatefulWidget {
  @override
  _AuthScreenState createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  final _dbHelper = DatabaseHelper();
  final _emailController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();
  bool isLogin = true;

  void _register() async {
    int result = await _dbHelper.registerUser(
      _emailController.text.trim(),
      _firstNameController.text.trim(),
      _lastNameController.text.trim(),
      _usernameController.text.trim(),
      _passwordController.text.trim(),
    );
    if (result != -1) {
      ScaffoldMessenger.of(context as BuildContext).showSnackBar(
        SnackBar(content: Text('User Registered Successfully!')),
      );
    } else {
      ScaffoldMessenger.of(context as BuildContext).showSnackBar(
        SnackBar(content: Text('Error: Username or Email already exists!')),
      );
    }
  }

  void _login() async {
    bool success = await _dbHelper.loginUser(
      _usernameController.text.trim(),
      _passwordController.text.trim(),
    );
    if (success) {
      ScaffoldMessenger.of(context as BuildContext).showSnackBar(
        SnackBar(content: Text('Login Successful!')),
      );
    } else {
      ScaffoldMessenger.of(context as BuildContext).showSnackBar(
        SnackBar(content: Text('Invalid Username or Password!')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(isLogin ? 'Login' : 'Register')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            if (!isLogin) ...[
              TextField(controller: _emailController, decoration: InputDecoration(labelText: 'Email')),
              TextField(controller: _firstNameController, decoration: InputDecoration(labelText: 'First Name')),
              TextField(controller: _lastNameController, decoration: InputDecoration(labelText: 'Last Name')),
            ],
            TextField(controller: _usernameController, decoration: InputDecoration(labelText: 'Username')),
            TextField(controller: _passwordController, decoration: InputDecoration(labelText: 'Password'), obscureText: true),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: isLogin ? _login : _register,
              child: Text(isLogin ? 'Login' : 'Register'),
            ),
            TextButton(
              onPressed: () {
                setState(() {
                  isLogin = !isLogin;
                });
              },
              child: Text(isLogin ? 'Create an account' : 'Already have an account? Login'),
            ),
          ],
        ),
      ),
    );
  }
}
