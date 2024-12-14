class NearbyPlaceModel {
  final String image;
  final String title;
  final String text;
  final double price;
  
  NearbyPlaceModel({
    required this.image,
    required this.title,
    required this.text,
    required this.price,
  });
}

List<NearbyPlaceModel> nearbyPlaces = [
  NearbyPlaceModel(
    image: "assets/places/kaliurang.png",
    title: "Kaliurang",
    text: "Kaliurang adalah sebuah kawasan wisata alam yang terletak di lereng selatan Gunung Merapi, sekitar 25 kilometer dari pusat Kota Yogyakarta. Tempat ini terkenal dengan udara sejuk dan pemandangan yang indah, menjadikannya destinasi populer untuk bersantai dan menikmati suasana pegunungan.",
    price: 400,
  ),
  NearbyPlaceModel(
    image: "assets/places/bukitbintang.png",
    title: "Bukit Bintang",
    text: "Bukit Bintang adalah salah satu destinasi wisata populer di kawasan Yogyakarta yang terkenal karena menawarkan pemandangan malam kota Yogyakarta yang memukau dari ketinggian. Tempat ini terletak di daerah Patuk, Kabupaten Gunungkidul, dan menjadi tujuan favorit wisatawan untuk bersantai sambil menikmati suasana romantis.",
    price: 350,
  ),
  NearbyPlaceModel(
    image: "assets/places/prambanan.png",
    title: "Prambanan",
    text: "Prambanan adalah kompleks candi Hindu terbesar di Indonesia, terletak sekitar 17 kilometer di sebelah timur Kota Yogyakarta. Candi ini merupakan salah satu warisan budaya dunia yang diakui oleh UNESCO sejak tahun 1991. Dikenal juga sebagai Candi Roro Jonggrang, Prambanan adalah destinasi wisata sejarah yang mengesankan dengan arsitektur megah dan penuh nilai spiritual.",
    price: 200,
  ),
  NearbyPlaceModel(
    image: "assets/places/pantai.png",
    title: "Pantai ParangTritis",
    text: "Parangtritis adalah salah satu pantai paling terkenal di Yogyakarta, terletak sekitar 27 kilometer di selatan kota. Pantai ini menjadi destinasi wisata favorit karena keindahan alamnya, suasana mistis yang melingkupinya, dan kaitannya dengan legenda Kerajaan Laut Selatan. Parangtritis sering dikunjungi oleh wisatawan lokal maupun mancanegara untuk menikmati suasana pantai yang unik.",
    price: 150,
  ),
  NearbyPlaceModel(
    image: "assets/places/malioboro.png",
    title: "Malioboro",
    text: "Malioboro adalah salah satu jalan paling ikonik di Yogyakarta, dikenal sebagai pusat wisata, budaya, dan belanja. Terletak di jantung Kota Yogyakarta, Malioboro membentang sepanjang sekitar 2,5 kilometer dari Tugu Yogyakarta hingga Pasar Beringharjo. Nama Malioboro berasal dari bahasa Sansekerta yang berarti karangan bunga, mencerminkan masa lalu ketika jalan ini sering dihiasi bunga untuk menyambut tamu kerajaan.",
    price: 100,
  ),
  NearbyPlaceModel(
    image: "assets/places/pinus.png",
    title: "Hutan Pinus",
    text: "Hutan Pinus adalah kawasan wisata alam berupa hutan yang didominasi oleh pohon pinus, yang biasanya terletak di dataran tinggi dengan udara sejuk dan suasana yang asri. Hutan ini sering menjadi destinasi wisata populer karena menawarkan keindahan alam, suasana tenang, dan berbagai aktivitas rekreasi. Di Yogyakarta, beberapa hutan pinus yang terkenal berada di kawasan Dlingo, Bantul, seperti Hutan Pinus Mangunan, Pinus Pengger, dan Pinus Asri.",
    price: 250,
  ),
  NearbyPlaceModel(
    image: "assets/places/museum.png",
    title: "Museum Merapi",
    text: "Museum Gunung Merapi adalah sebuah museum edukasi yang terletak di kawasan Kaliurang, Kabupaten Sleman, Yogyakarta. Museum ini didedikasikan untuk memperkenalkan pengunjung pada berbagai aspek Gunung Merapi, salah satu gunung api paling aktif di dunia, serta gunung api lainnya di Indonesia. Dengan tema Merapi Jendela Bumi, museum ini menjadi tempat wisata sekaligus edukasi tentang fenomena vulkanik dan mitigasi bencana.",
    price: 120,
  ),
];
