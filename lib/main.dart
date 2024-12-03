import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
              decoration: const BoxDecoration(),
              child: AppBar(
                iconTheme: const IconThemeData(color: Colors.black),
                backgroundColor: Colors
                    .transparent, // Transparent untuk menunjukkan gradient
                elevation: 0, // Menghapus shadow
                centerTitle: true,
                title: const Text(
                  'Portfolio',
                  style: TextStyle(
                    fontSize: 24,
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
                    'Ruth Azaria Ubro',
                    style: TextStyle(color: Colors.black),
                  ),
                  accountEmail: const Text('ruthazaria21@gmail.com',
                      style: TextStyle(color: Colors.black)),
                  currentAccountPicture: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: ClipOval(
                      child: Image.asset(
                        fit: BoxFit.cover,
                        'assets/aza.jpg',
                        width: 90,
                      ),
                    ),
                  ),
                  decoration: const BoxDecoration(
                      color: Colors.cyan,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                              'https://img.freepik.com/free-photo/psychedelic-paper-shapes-with-copy-space_23-2149378246.jpg?'))),
                ),
                ListTile(
                  leading: const Icon(
                    Icons.account_box,
                    color: Colors.purple,
                  ),
                  title: const Text('Portfolio'),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
                ListTile(
                  leading: const Icon(
                    FontAwesomeIcons.whatsapp,
                    color: Colors.purple,
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
                  leading: const Icon(FontAwesomeIcons.instagram,
                      color: Colors.purple),
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
                              shape: BoxShape.circle,
                              gradient: LinearGradient(
                                colors: [
                                  Color(0xFF8134AF), // Ungu dengan hex
                                  Colors.purple, // Ungu bawaan Flutter
                                ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight,
                              ),
                            ),

                            padding:
                                const EdgeInsets.all(4), // Ketebalan outline
                            child: const CircleAvatar(
                              radius: 100, // Ukuran lingkaran avatar
                              backgroundImage: AssetImage('assets/aza.jpg'),
                            ),
                          ),
                          const SizedBox(height: 25),
                          const Text(
                            'Ruth Azaria Ubro',
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF8134AF), // Warna indigo 700
                            ),
                          ),

                          const SizedBox(height: 10),
                          const Text(
                            'Mahasiswa',
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
                                      left: 25, // Padding kiri
                                      right: 25, // Padding kanan
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
                                          color: Color(0xFF2196F3), // Ikon biru
                                        ),
                                        SizedBox(
                                            height:
                                                10), // Jarak antara ikon dan teks
                                        // Teks "Experience"
                                        Text(
                                          'Pengalaman',
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

                              // Project
                              Column(
                                children: [
                                  // Ikon dengan latar belakang lingkaran
                                  Container(
                                    decoration: BoxDecoration(
                                      color: const Color.fromARGB(255, 236, 205,
                                          241), // Warna kuning muda
                                      borderRadius: BorderRadius.circular(10),
                                    ),

                                    padding: const EdgeInsets.only(
                                      top: 25, // Padding atas
                                      bottom: 5, // Padding bawah
                                      left: 45, // Padding kiri
                                      right: 45, // Padding kanan
                                    ), // Ruang di sekitar konten
                                    // ignore: prefer_const_constructors
                                    child: Column(
                                      mainAxisSize: MainAxisSize
                                          .min, // Sesuaikan ukuran dengan konten
                                      children: const [
                                        // Ikon
                                        Icon(
                                          Icons.code,
                                          size: 40,
                                          color: Colors.purple, // Ikon ungu
                                        ),
                                        SizedBox(
                                            height:
                                                10), // Jarak antara ikon dan teks
                                        // Teks "Experience"
                                        Text(
                                          'Projek',
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
                                          '5',
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
                          const Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment
                                  .center, // Menempatkan elemen di tengah
                              children: [
                                Icon(
                                  Icons.school,
                                  color: Colors.green,
                                  size: 40,
                                ),
                                SizedBox(
                                    height:
                                        10), // Memberi jarak antara ikon dan teks
                                Text(
                                  'Tentang Saya',
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  textAlign:
                                      TextAlign.center, // Pusatkan teks judul
                                ),
                                SizedBox(
                                    height:
                                        10), // Memberi jarak antara judul dan deskripsi
                                Text(
                                  'Saya adalah mahasiswa semester 5 di ITB-STIKOM Ambon, '
                                  'dengan fokus pada pengembangan keterampilan teknologi informasi dan komunikasi. '
                                  'Saya memiliki minat yang kuat dalam pengembangan perangkat lunak, '
                                  'serta berkomitmen untuk meningkatkan keahlian di bidang teknologi modern.',
                                  style: TextStyle(
                                    fontSize: 16,
                                    color: Colors.black87,
                                    height: 1.5, // Memberikan spasi antar baris
                                  ),
                                  textAlign: TextAlign
                                      .center, // Pusatkan teks deskripsi
                                ),
                              ],
                            ),
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
