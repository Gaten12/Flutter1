import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue.shade900, Colors.blue.shade600],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              ),
            ),
          ),

          SafeArea(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Bagian Atas (Foto Profil + Nama)
                  Container(
                    padding: EdgeInsets.symmetric(vertical: 20),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 50,
                          backgroundImage: AssetImage('images/profile.jpg'),
                        ),
                        SizedBox(height: 10),
                        Text(
                          "Gaten Isnan Abdurrozaq",
                          style: GoogleFonts.poppins(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          "230103102",
                          style: GoogleFonts.poppins(
                            fontSize: 16,
                            color: Colors.white70,
                          ),
                        ),
                      ],
                    ),
                  ),

                  SizedBox(height: 10),

                  // Tombol "Lihat Profil Saya"
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        _isExpanded = !_isExpanded;
                      });
                    },
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(25),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            blurRadius: 5,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.person, color: Colors.blue.shade900),
                          SizedBox(width: 10),
                          Text(
                            "Lihat Profil Saya",
                            style: GoogleFonts.poppins(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                              color: Colors.blue.shade900,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 10),

                  // Profil Detail (Expand/Collapse)
                  AnimatedSize(
                    duration: Duration(milliseconds: 400),
                    curve: Curves.fastOutSlowIn,
                    child: _isExpanded
                        ? Container(
                      width: double.infinity,
                      padding: EdgeInsets.all(16),
                      margin: EdgeInsets.symmetric(horizontal: 20),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.9),
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.1),
                            blurRadius: 8,
                            offset: Offset(0, 4),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _profileCard(Icons.school, "Fakultas", "Ilmu Komputer"),
                          _profileCard(Icons.book, "Jurusan", "Teknologi Informatika"),
                          _profileCard(Icons.calendar_today, "Tanggal Lahir", "25 Mei 2004"),
                          _profileCard(Icons.email, "Email", "230103102@mhs.udb.ac.id"),
                          _profileCard(Icons.phone, "Nomor Telepon", "085222538826"),
                          _profileCard(Icons.home, "Alamat", "Klaten, Jawa Tengah"),
                          SizedBox(height: 10),

                          // Kotak "Tentang Saya"
                          Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.blue.shade100,
                              borderRadius: BorderRadius.circular(12),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Tentang Saya:",
                                  style: GoogleFonts.poppins(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.blue.shade900,
                                  ),
                                ),
                                SizedBox(height: 5),
                                Text(
                                  "Saya seorang mahasiswa Teknologi Informasi yang memiliki ketertarikan di bidang game development dan ingin bekerja di Singapura atau menjadi developer game independen. Saya suka belajar hal baru dan terus mencari peluang untuk berkembang.",
                                  style: GoogleFonts.poppins(
                                    fontSize: 14,
                                    color: Colors.blueGrey.shade800,
                                  ),
                                  textAlign: TextAlign.justify,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                        : SizedBox.shrink(),
                  ),

                  SizedBox(height: 20),

                  // Footer
                  Container(
                    width: double.infinity,
                    padding: EdgeInsets.symmetric(vertical: 12),
                    color: Colors.blue.shade800,
                    child: Center(
                      child: Text(
                        "Universitas Duta Bangsa Surakarta",
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Widget untuk Kartu Profil
  Widget _profileCard(IconData icon, String title, String value) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6),
      padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.blue.shade50,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: Colors.blue.shade900),
          SizedBox(width: 10),
          Expanded(
            child: Text(
              "$title: $value",
              style: GoogleFonts.poppins(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.blueGrey.shade900,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
