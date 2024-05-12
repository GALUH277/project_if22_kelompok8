import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project_if22a/config/asset.dart';
import 'package:project_if22a/screen/admin/list_mahasiswa.dart';



class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: EdgeInsets.all(10),
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              // Hapus properti color untuk menghilangkan warna latar belakang
              borderRadius: BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Image(
              
              image: NetworkImage('https://raw.githubusercontent.com/GALUH277/project_if22a_kel8/main/img/BN.jpg'),
              //fit: BoxFit.cover,// Sesuaikan dengan nama dan path gambar Anda
            ),
            
          ),

          SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Text(
              "Type Rumah",
              style: TextStyle(
                color: Asset.colorPrimaryDark,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
          ),
          SizedBox(height: 10),
          SizedBox(
            height: 250, // Ubah tinggi CarouselSlider
            child: CarouselSlider(
              items: [
                BeritaTerkini(
                    '../asset/images/image/saphire.jpg',
                    'Cluster Saphire',
                    '22/11/2023'),
                BeritaTerkini(
                    '../asset/images/image/tulip.jpg',
                    'Cluster Tulip',
                    '20/10/2023'),
                BeritaTerkini(
                    '../asset/images/image/VF.jpg',
                    'Gate',
                    '17/04/2024'),
                BeritaTerkini(
                    '../asset/images/image/VG.jpg',
                    'Gate 2',
                    '03/04/2024'),
                BeritaTerkini(
                    '../asset/images/image/lily.jpg',
                    'Cluster Lily',
                    '12/02/2024'),
                BeritaTerkini(
                    '../asset/images/image/BN.jpg',
                    'Vaganza Village',
                    '12/02/2024'),
                BeritaTerkini(
                    '../asset/images/image/alamanda.jpg',
                    'Cluster Alamanda',
                    '12/02/2024'),
                BeritaTerkini(
                    '../asset/images/image/50.jpg',
                    'Vaganza Village',
                    '12/02/2024'),
                BeritaTerkini(
                    '../asset/images/image/38.jpg',
                    'Vaganza Village',
                    '12/02/2024'),
              ],
              options: CarouselOptions(
                height: 220.0,
                enlargeCenterPage: true,
                autoPlay: true,
                aspectRatio: 16 / 9,
                autoPlayCurve: Curves.fastOutSlowIn,
                enableInfiniteScroll: true,
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                viewportFraction: 0.8,
              ),
            ),
          ),
          SizedBox(height: 70),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly, // Ubah menjadi spaceEvenly
              children: [
                IconButton('type rumah', Icons.house, 0),
                IconButton('list harga', Icons.attach_money_sharp, 0),
                IconButton('maps', Icons.location_on_outlined, 0),
                IconButton('contact us', Icons.call, 0),
              ],
            ),
          ),
          SizedBox(height: 30),
        ],
      ),
    );
  }
}


class IconButton extends StatelessWidget {
  final String nameLabel;
  final IconData iconLabel;
  final int index;

  IconButton(this.nameLabel, this.iconLabel, this.index);

  List<Map> _fragment = [
    {'title': 'Data Mahasiswa', 'view': ListMahasiswa()},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            // margin: EdgeInsets.only(bottom: 5),
            child: Material(
              borderRadius: BorderRadius.all(
                Radius.circular(40),
              ),
              color: Colors.transparent,
              child: InkWell(
                borderRadius: BorderRadius.all(
                  Radius.circular(40),
                ),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => _fragment[index]['view'],
                    ),
                  );
                },
                child: Container(
                  // margin: EdgeInsets.all(5),
                  height: 60,
                  width: 60,
                  decoration: BoxDecoration(
                    color: Asset.colorPrimaryDark,
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                  ),
                  child: Center(
                    child: Stack(
                      children: [
                        Icon(
                          iconLabel,
                          color: Colors.white,
                          size: 40,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 5, bottom: 5),
            child: Text(
              nameLabel,
              style: TextStyle(fontSize: 14),
            ),
          )
        ],
      ),
    );
  }
}

class BeritaTerkini extends StatelessWidget {
  final String img;
  final String judul;
  final String tanggal;

  BeritaTerkini(this.img, this.judul, this.tanggal);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10),
      height: MediaQuery.of(context).size.height,
      child: Stack(
        children: [
          Positioned.fill(
            child: Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                image: DecorationImage(
                  image: NetworkImage(img),
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          Positioned.fill(
            child: Container(
              padding: EdgeInsets.all(10.0),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),

              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    judul,
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    tanggal,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.white,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  )
                ],
              ),
            ),
          ),
        ],
      ),
      // alignment: Alignment(1, 1),
    );
  }
}
