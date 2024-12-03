import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_application_1/movie_list.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Builder(builder: (context) {
        return Scaffold(
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(kToolbarHeight),
            child: Container(
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.yellow, Colors.lime],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
              child: AppBar(
                iconTheme: const IconThemeData(color: Colors.black),
                backgroundColor: Colors
                    .transparent, // Transparent untuk menunjukkan gradient
                elevation: 0, // Menghapus shadow
                centerTitle: true,
                title: const Text(
                  'Portfolio',
                  style: TextStyle(
                    fontSize: 20,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
          endDrawer: Drawer(
            child: ListView(
              padding: EdgeInsets.zero,
              children: [
                UserAccountsDrawerHeader(
                  accountName: const Text(
                    'Melda Olivia Lesbatta',
                    style: TextStyle(color: Colors.black),
                  ),
                  accountEmail: const Text('meldaoliv31@gmail.com',
                      style: TextStyle(color: Colors.black)),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: ClipOval(
                      child: Image.asset(
                        fit: BoxFit.cover,
                        'assets/logo.jpeg',
                        width: 90,
                      ),
                    ),
                  ),
                  decoration: const BoxDecoration(
                      color: Colors.cyan,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              'https://img.freepik.com/free-photo/hand-painted-watercolor-background-with-sky-clouds-shape_24972-1095.jpg'))),
                ),
                ListTile(
                  leading: const Icon(
                    Icons.account_box,
                    color: Colors.blue,
                  ),
                  title: const Text('About'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(
                    Icons.movie,
                    color: Colors.blue,
                  ),
                  title: const Text('Movie List'),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MovieListPage()),
                    );
                  },
                ),
                ListTile(
                  leading: const Icon(
                    FontAwesomeIcons.whatsapp,
                    color: Colors.blue,
                  ),
                  title: const Text('WhatsApp'),
                  onTap: () async {
                    final Uri url =
                        Uri.parse('https://wa.me/6285256410809?text=Hello');
                    if (await canLaunchUrl(url)) {
                      await launchUrl(url,
                          mode: LaunchMode.externalApplication);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                ),
                ListTile(
                  leading: const Icon(
                    FontAwesomeIcons.instagram,
                    color: Colors.blue,
                  ),
                  title: const Text('Instagram'),
                  onTap: () async {
                    final Uri url = Uri.parse(
                        'https://www.instagram.com/mlsbtta_?igsh=MTc3cTR0MG41bnZo');
                    if (await canLaunchUrl(url)) {
                      await launchUrl(url,
                          mode: LaunchMode.externalApplication);
                    } else {
                      throw 'Could not launch $url';
                    }
                  },
                ),
                const SizedBox(
                  height: 15,
                ),
                const Divider(
                  thickness: 1, // Ketebalan garis
                  color: Colors.blue, // Warna garis
                  indent: 16, // Jarak dari sisi kiri
                  endIndent: 16, // Jarak dari sisi kanan
                ),
                const SizedBox(
                  height: 15,
                ),
                ListTile(
                  leading: const Icon(
                    Icons.logout,
                    color: Colors.red,
                  ),
                  title: const Text('Logout'),
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        title: const Text('Logout'),
                        content: const Text('Apakah anda yakin ingin keluar?'),
                        actions: [
                          TextButton(
                            child: const Text('Batal'),
                            onPressed: () {
                              Navigator.pop(context);
                            },
                          ),
                          TextButton(
                            child: const Text(
                              'Keluar',
                              style: TextStyle(color: Colors.red),
                            ),
                            onPressed: () {
                              SystemNavigator.pop();
                            },
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
          body: Center(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Card Content
                  Card(
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    margin: const EdgeInsets.symmetric(horizontal: 30),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        children: [
                          const SizedBox(height: 5),
                          // Profile Avatar
                          Container(
                            decoration: const BoxDecoration(
                              shape: BoxShape
                                  .circle, // Membuat outline berbentuk lingkaran
                              gradient: LinearGradient(
                                colors: [
                                  Color(0xFFF58529), // Warna gradasi Instagram
                                  Color(0xFFDD2A7B),
                                  Color(0xFF8134AF),
                                  Color(0xFF515BD4),
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                            ),
                            padding:
                                const EdgeInsets.all(4), // Ketebalan outline
                            child: const CircleAvatar(
                              radius: 100, // Ukuran lingkaran avatar
                              backgroundImage: AssetImage('assets/melda.jpg'),
                            ),
                          ),
                          const SizedBox(height: 25),
                          const Text(
                            'Melda Olivia',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF303F9F), // Warna indigo 700
                            ),
                          ),

                          const SizedBox(height: 10),
                          const Text(
                            'Student',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey, // Warna indigo 700
                            ),
                          ),

                          // Setelah deskripsi tentang saya
                          const SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              // Experience
                              Column(
                                children: [
                                  // Ikon dengan latar belakang lingkaran
                                  Container(
                                    decoration: BoxDecoration(
                                      color: const Color(
                                          0xFFE3F2FD), // Warna latar belakang biru muda
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    padding: const EdgeInsets.only(
                                      top: 25, // Padding atas
                                      bottom: 5, // Padding bawah
                                      left: 30, // Padding kiri
                                      right: 30, // Padding kanan
                                    ), // Ruang di sekitar konten
                                    // ignore: prefer_const_constructors
                                    child: Column(
                                      mainAxisSize: MainAxisSize
                                          .min, // Sesuaikan ukuran dengan konten
                                      children: const [
                                        // Ikon
                                        Icon(
                                          Icons.school,
                                          size: 40,
                                          color: Color(0xFF2196F3), // Ikon biru
                                        ),
                                        SizedBox(
                                            height:
                                                10), // Jarak antara ikon dan teks
                                        // Teks "Experience"
                                        Text(
                                          'Semester',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(
                                            height:
                                                5), // Jarak antara teks judul dan deskripsi
                                        // Teks "3+ Years"
                                        Text(
                                          '5th',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),

                              // Project
                              Column(
                                children: [
                                  // Ikon dengan latar belakang lingkaran
                                  Container(
                                    decoration: BoxDecoration(
                                      color: const Color(
                                          0xFFFFF9C4), // Warna kuning muda
                                      borderRadius: BorderRadius.circular(10),
                                    ),

                                    padding: const EdgeInsets.only(
                                      top: 25, // Padding atas
                                      bottom: 5, // Padding bawah
                                      left: 32, // Padding kiri
                                      right: 32, // Padding kanan
                                    ), // Ruang di sekitar konten
                                    // ignore: prefer_const_constructors
                                    child: Column(
                                      mainAxisSize: MainAxisSize
                                          .min, // Sesuaikan ukuran dengan konten
                                      children: const [
                                        // Ikon
                                        Icon(
                                          Icons.work,
                                          size: 40,
                                          color: Colors.yellow, // Ikon ungu
                                        ),
                                        SizedBox(
                                            height:
                                                10), // Jarak antara ikon dan teks
                                        // Teks "Experience"
                                        Text(
                                          'Experience',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(
                                            height:
                                                5), // Jarak antara teks judul dan deskripsi
                                        // Teks "3+ Years"
                                        Text(
                                          '1+',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.grey,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Column(
                            children: [
                              // Alamat
                              ListTile(
                                leading: Icon(
                                  Icons.home,
                                  color: Colors.blue,
                                  size: 30,
                                ),
                                title: Text(
                                  'Alamat',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Text('Wainitu'),
                              ),
                              Divider(), // Garis pemisah

                              // Kampus
                              ListTile(
                                leading: Icon(
                                  Icons.school,
                                  color: Colors.green,
                                  size: 30,
                                ),
                                title: Text(
                                  'Kampus',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Text('ITB-STIKOM Ambon'),
                              ),
                              Divider(), // Garis pemisah

                              // Gender
                              ListTile(
                                leading: Icon(
                                  Icons.person,
                                  color: Colors.purple,
                                  size: 30,
                                ),
                                title: Text(
                                  'Gender',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Text('Perempuan'),
                              ),
                              Divider(), // Garis pemisah

                              // Tanggal Lahir
                              ListTile(
                                leading: Icon(
                                  Icons.cake,
                                  color: Colors.red,
                                  size: 30,
                                ),
                                title: Text(
                                  'Tanggal Lahir',
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                subtitle: Text('31 Oktober 2003'),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
