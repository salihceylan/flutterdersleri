import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';


class BurcListesi extends StatelessWidget {
  Widget build(BuildContext context) {
    List<Burc> tumBurclar = verileriAl();

    return Scaffold(
      appBar: AppBar(title: Text(Strings.APP_NAME)),
      body: ListView.builder(
        itemCount: tumBurclar.length,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsets.all(3),
          child: Card(
            elevation: 25,
            child: Container(
              color: index % 2 == 0
                  ? Colors.purple.shade200
                  : Colors.purple.shade300,
              child: ListTile(
                onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (BuildContext context) =>
                            BurcGoster(tumBurclar[index]))),
                dense: true,
                selected: true,
                leading: Container(
                  width: 50.0,
                  height: 50.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      fit: BoxFit.fill,
                      image: AssetImage(tumBurclar[index].burcKucukResim),
                    ),
                  ),
                ),
                title: Text(
                  tumBurclar[index].burcAdi,
                  style: TextStyle(
                      fontSize: 21,
                      fontWeight: FontWeight.bold,
                      color: Colors.purple),
                  textAlign: TextAlign.center,
                ),
                subtitle: Text(
                  tumBurclar[index].burcTarihi,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                trailing: Icon(
                  Icons.arrow_right,
                  size: 25,
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  List<Burc> verileriAl() {
    List<Burc> burclar = [];
    for (int i = 0; i < Strings.APP_NAME.length; i++) {
      Burc b = Burc(
          Strings.BURC_ADLARI[i],
          Strings.BURC_TARIHLERI[i],
          Strings.BURC_GENEL_OZELLIKLERI[i],
          "assets/burclar/" +
              "${Strings.BURC_ADLARI[i].toLowerCase()}" +
              (i + 1).toString() +
              ".png",
          "assets/burclar/" +
              "${Strings.BURC_ADLARI[i].toLowerCase()}" +
              "_buyuk" +
              (i + 1).toString() +
              ".png");
      debugPrint(b.burcBuyukResim);
      debugPrint(b.burcKucukResim);

      burclar.add(b);
    }
    return burclar;
  }
}

class Burc {
  String burcAdi;
  String burcTarihi;
  String burcDetayi;
  String burcBuyukResim;
  String burcKucukResim;

  Burc(this.burcAdi, this.burcTarihi, this.burcDetayi, this.burcKucukResim,
      this.burcBuyukResim);
}

class BurcGoster extends StatelessWidget {
  final Burc b;

  BurcGoster(this.b);

  Widget build(BuildContext context) {
    debugPrint(b.burcBuyukResim);
    return Scaffold(
      backgroundColor: Colors.purple.shade200,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            actions: [
              IconButton(
                icon: Icon(Icons.forward),
                onPressed: () => Navigator.pop(context),
              ),
              IconButton(
                icon: Icon(Icons.android),
                onPressed: () => Navigator.pop(context),
              ),
              IconButton(
                icon: Icon(Icons.build),
                onPressed: () => Navigator.pop(context),
              ),
            ],
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () => Navigator.pop(context),
            ),
            flexibleSpace: FlexibleSpaceBar(
              title: Text(b.burcAdi + " Özellikleri"),
              centerTitle: true,
              background: Image.asset(
                b.burcBuyukResim,
                fit: BoxFit.fill,
              ),
            ),
            backgroundColor: Colors.pink.shade300,
            expandedHeight: 210,
            centerTitle: true,
            pinned: true,
          ),
          SliverToBoxAdapter(
            child: Container(
              margin: EdgeInsets.all(3),
              padding: EdgeInsets.all(3),
              decoration: BoxDecoration(
                  color: Colors.purple.shade500,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: SingleChildScrollView(
                child: Text(b.burcDetayi,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 17,
                    )),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Strings {
  static const String APP_NAME = "Burç Rehberi";

  static const List<String> BURC_ADLARI = [
    "Koc",
    "Boga",
    "Ikizler",
    "Yengec",
    "Aslan",
    "Basak",
    "Terazi",
    "Akrep",
    "Yay",
    "Oglak",
    "Kova",
    "Balik"
  ];

  static const List<String> BURC_TARIHLERI = [
    "21 Mart - 20 Nisan",
    "21 Nisan - 21 Mayıs",
    "22 Mayıs - 22 Haziran",
    "23 Haziran - 22 Temmuz",
    "23 Temmuz - 22 Agustos",
    "23 Agustos - 22 Eylül",
    "23 Eylül - 22 Ekim",
    "23 Ekim - 21 Kasım",
    "22 Kasım - 21 Aralık",
    "22 Aralık - 21 Ocak",
    "22 Ocak - 19 Subat",
    "20 Subat - 20 Mart"
  ];

  static const List<String> BURC_GENEL_OZELLIKLERI = [
    "\tGenel Özellikler\n\n"
        "\tYönetici yıldızınız: Mars\n\n"
        "\tGrubunuz: Ateş\n\n"
        "\tUğurlu gününüz: Salı\n\n"
        "\tUğurlu sayınız: 8\n\n"
        "\tUğurlu renginiz: Ateş kırmızısı\n\n"
        "\tUğurlu taşlarınız: Opal, elmas, safir\n\n"
        "\tUğurlu çicekleriniz: Lale, papatya\n\n"
        "\tUğurlu kokularınız: Manolya, lavanta, ıtır\n\n"
        "\tOlumlu özelliğiniz: Cesaret\n\n"
        "\tOlumsuz özelliğiniz: Acelecilik\n\n"
        "\tAnlaştığınız burçlar:Aslan, Yay\n\n"
        "\tAnlaşamadığınız burçlar: Yengeç, Terazi, Oğlak\n\n"
        "\tBaşarılı olacağınız meslekler: Politikacılık, yöneticilik, işletmecilik, mühendislik, ressamlık, müzisyenlik, oyunculuk\n\n"
        "\tBurcunuzdan olan ünlüler: Fatih Sultan Mehmet,Sakıp Sabancı, Descartes, Charlie Chaplin, Vincent Van Gogh, Zeki Alasya\n\n",
    "\tGenel Özellikler\n\n"
        "\tYönetici yıldızınız: Venüs\n\n"
        "\tGrubunuz: Toprak\n\n"
        "\tUğurlu gününüz: Cuma\n\n"
        "\tUğurlu sayınız: 6\n\n"
        "\tUğurlu renginiz: Pastel Mavi, Lila\n\n"
        "\tUğurlu taşlarınız: Krizokol, Turkuaz, Safir\n\n"
        "\tUğurlu çicekleriniz: Kırmızı gül, pembe karanfil ve şebboy\n\n"
        "\tUğurlu kokularınız: Karanfil, elma çiçeği\n\n"
        "\tOlumlu özelliğiniz: Güvenilirlik\n\n"
        "\tOlumsuz özelliğiniz: İnatçılık\n\n"
        "\tAnlaştığınız burçlar: Yengeç, Balık\n\n"
        "\tAnlaşamadığınız burçlar: Kova, Aslan, Akrep\n\n"
        "\tBaşarılı olacağınız meslekler: Askerlik, doktorluk, mimarlık, mühendislik, bankacılık\n\n"
        "\tBurcunuzdan olan ünlüler:  Nükhet Duru, Öztürk Serengil, Salvadore Dali, Karl Marks, Lenin, Sigmund Freud, Shakespare\n\n",
    "\tGenel Özellikler\n\n"
        "\tYönetici yıldızınız: Merkür\n\n"
        "\tGrubunuz: Hava\n\n"
        "\tUğurlu gününüz: Çarşamba\n\n"
        "\tUğurlu sayınız: 5\n\n"
        "\tUğurlu renginiz: Sarı\n\n"
        "\tUğurlu taşlarınız: Kuvars, Akik, Turkuaz\n\n"
        "\tUğurlu çicekleriniz: Çiğdem, mimoza\n\n"
        "\tUğurlu kokularınız: Gardenya, sümbül, yasemin\n\n"
        "\tOlumlu özelliğiniz: Konuşkan olmak\n\n"
        "\tOlumsuz özelliğiniz: Kararsızlık\n\n"
        "\tAnlaştığınız burçlar: Terazi, Kova, Aslan\n\n"
        "\tAnlaşamadığınız burçlar: Başak, Yay\n\n"
        "\tBaşarılı olacağınız meslekler: Yazarlık, bankacılık, avukatlık, gazetecilik, edebiyatçı\n\n"
        "\tBurcunuzdan olan ünlüler: Adile Naşit, Bülent Ecevit, John F. Kennedy, John Wayne, Schumann\n\n",
    "\tGenel Özellikler\n\n"
        "\tYönetici yıldızınız: Ay\n\n"
        "\tGrubunuz: Su\n\n"
        "\tUğurlu gününüz: Pazartesi\n\n"
        "\tUğurlu sayınız: 2\n\n"
        "\tUğurlu renginiz: Beyaz\n\n"
        "\tUğurlu taşlarınız: Ametist, Pembe kuvars\n\n"
        "\tUğurlu çicekleriniz: Nilüfer, beyaz gül, zambak\n\n"
        "\tUğurlu kokularınız: Misk, müge, leylak\n\n"
        "\tOlumlu özelliğiniz: Sabırlı olmak\n\n"
        "\tOlumsuz özelliğiniz: Dikkatsizlik\n\n"
        "\tAnlaştığınız burçlar: Boğa, Balık\n\n"
        "\tAnlaşamadığınız burçlar: Koç, Aslan, Kova\n\n"
        "\tBaşarılı olacağınız meslekler: Eczacılık, turizm, pilotluk, kimyagerlik\n\n"
        "\tBurcunuzdan olan ünlüler: Sezen Aksu, Türkan Şoray, Louis Armstrong, Tom Cruise, Giorgio Armani, Lady Diana\n\n",
    "\tGenel Özellikler\n\n"
        "\tYönetici yıldızınız: Güneş\n\n"
        "\tGrubunuz: Ateş\n\n"
        "\tUğurlu gününüz: Pazartesi\n\n"
        "\tUğurlu sayınız: 1\n\n"
        "\tUğurlu renginiz: Sarı\n\n"
        "\tUğurlu taşlarınız: Sardoniks, Peridot, Krizolit\n\n"
        "\tUğurlu çicekleriniz: Kırmızı gül, sarı krizantem ve orkide\n\n"
        "\tUğurlu kokularınız: Misk, portakal çiçeği ve gül\n\n"
        "\tOlumlu özelliğiniz: Cömertlik\n\n"
        "\tOlumsuz özelliğiniz: Kendini beğenmişlik\n\n"
        "\tAnlaştığınız burçlar: Koç, Yay\n\n"
        "\tAnlaşamadığınız burçlar: Boğa, Akrep, Kova\n\n"
        "\tBaşarılı olacağınız meslekler: Askerlik, doktorluk, yöneticilik\n\n"
        "\tBurcunuzdan olan ünlüler: Uğur Mumcu, Gönül Yazar, Neil Armstrong, Benito Mussolini, Fidel Castro, Henry Ford, Madonna\n\n",
    "\tGenel Özellikler\n\n"
        "\tYönetici yıldızınız: Merkür\n\n"
        "\tGrubunuz: Toprak\n\n"
        "\tUğurlu gününüz: Çarşamba\n\n"
        "\tUğurlu sayınız: 5\n\n"
        "\tUğurlu renginiz: Kobalt mavisi\n\n"
        "\tUğurlu taşlarınız: Ametist, Akik, Yeşim Taşı, Zümrüt\n\n"
        "\tUğurlu çicekleriniz: Açelya, sarı menekşe, lavanta çiçeği\n\n"
        "\tUğurlu kokularınız: Leylak, limon ve sardunya\n\n"
        "\tOlumlu özelliğiniz: Titizlik\n\n"
        "\tOlumsuz özelliğiniz: Çekingenlik\n\n"
        "\tAnlaştığınız burçlar: Boğa, Oğlak\n\n"
        "\tAnlaşamadığınız burçlar: İkizler, Yay, Balık\n\n"
        "\tBaşarılı olacağınız meslekler: Edebiyat alanı, yazarlık, eczacılık, muhasebecilik , araştırmacılık\n\n"
        "\tBurcunuzdan olan ünlüler: Büyük İskender, Uğur Dündar, Sophia Loren, Michael Jackson, Vitali Hakko, Richard Gere, Sean Connery\n\n",
    "\tGenel Özellikler\n\n"
        "\tYönetici yıldızınız: Venüs\n\n"
        "\tGrubunuz: Hava\n\n"
        "\tUğurlu gününüz: Cuma\n\n"
        "\tUğurlu sayınız: 6\n\n"
        "\tUğurlu renginiz: Turkuaz ve mat renkler\n\n"
        "\tUğurlu taşlarınız: Lapis Lazuli, Mercan, Opal\n\n"
        "\tUğurlu çicekleriniz: Pembe krizantem, pembe gül\n\n"
        "\tUğurlu kokularınız: Gardenya, yasemin ve orkide\n\n"
        "\tOlumlu özelliğiniz: Zariflik\n\n"
        "\tOlumsuz özelliğiniz: Gösteriş meraklısı olmak\n\n"
        "\tAnlaştığınız burçlar: İkizler, Kova\n\n"
        "\tAnlaşamadığınız burçlar: Koç, Yengeç, Oğlak\n\n"
        "\tBaşarılı olacağınız meslekler: Müzisyenlik, ressamlık, mimarlık, bankacılık, politikacılık, hukukçuluk, heykeltraşlık\n\n"
        "\tBurcunuzdan olan ünlüler: Cem Özer, Hülya Avşar, Cervantes, Oscar Wilde, Pavorotti, Turgut Özal, Pavorotti, Jimmy Carter\n\n",
    "\t Genel Özellikler\n\n"
        "\t Yönetici yıldızınız: Mars-Plüton\n\n"
        "\t Grubunuz: Su\n\n"
        "\t Uğurlu gününüz: Salı\n\n"
        "\t Uğurlu sayınız: 9\n\n"
        "\t Uğurlu renginiz: Kırmızı ve siyah\n\n"
        "\t Uğurlu taşlarınız: Akuamarin, Lapis Lazuli, Opal\n\n"
        "\t Uğurlu çiçekleriniz: Kırmızı karanfil, hanımeli, ateş çiçeği\n\n"
        "\t Uğurlu kokularınız: Misk, manolya\n\n"
        "\t Olumlu özelliğiniz: Kararlılık\n\n"
        "\t Olumsuz özelliğiniz: Merhametsizlik ve ihmarkarlık\n\n"
        "\t Anlaştığınız burçlar: Yengeç, Balık\n\n"
        "\t Anlaşamadığınız burçlar: Boğa, Aslan, Kova\n\n"
        "\t Başarılı olacağınız meslekler: Yöneticilik, mühendislik, komutanlık, yazarlık, müzisyenlik, gazetecilik\n\n"
        "\t Burcunuzdan olan ünlüler: Süleyman Demirel, Maradona, Pablo Picasso, Prenses Charles, Indra Gandhi, Alfred Nobel\n\n",
    "\tGenel Özellikler\n\n"
        "\t Yönetici yıldızınız: Jüpiter\n\n"
        "\t Grubunuz: Ateş\n\n"
        "\t Uğurlu gününüz: Perşembe\n\n"
        "\t Uğurlu sayınız: 3\n\n"
        "\t Uğurlu renginiz: Mor ve koyu mavi\n\n"
        "\t Uğurlu taşlarınız: Obsidyen, Krizolit, Topaz\n\n"
        "\tUğurlu çicekleriniz: Leylak, mor menekşe\n\n"
        "\t  Uğurlu kokularınız: Nergis, menekşe, zambak\n\n"
        "\t  Olumlu özelliğiniz: Girişimcilik\n\n"
        "\t  Olumsuz özelliğiniz: Başkalarını küçümsemek\n\n"
        "\t Anlaştığınız burçlar: Koç, Aslan\n\n"
        "\t Anlaşamadığınız burçlar: İkizler, Başak, Balık\n\n"
        "\t Başarılı olacağınız meslekler: Politikacılık, hukukçu, araştırmacılık, bankacılık, öğretmenlik\n\n"
        "\tBurcunuzdan olan ünlüler:  Mehmet Ali Birand, Zeki Müren, Walt Disney, Winston Churchill, Ludwig van Beethoven, Mark Twain\n\n",
    "\tGenel Özellikler\n\n"
        "\t Yönetici yıldızınız: Satürn\n\n"
        "\t Grubunuz: Toprak\n\n"
        "\t Uğurlu gününüz: Cumartesi\n\n"
        "\t  Uğurlu sayınız: 8\n\n"
        "\t Uğurlu renginiz: Koyu kahverengi ve gri\n\n"
        "\t Uğurlu taşlarınız: Kuvars, Yakut, Kehribar\n\n"
        "\t  Uğurlu çicekleriniz: Siyah gül, kadife çiçeği, kamelya\n\n"
        "\t Uğurlu kokularınız: Kamelya, cam, fulya\n\n"
        "\t  Olumlu özelliğiniz: Kararlılık ve sağlam adımlar atmak\n\n"
        "\tOlumsuz özelliğiniz: Aşırı meraklı olmak\n\n"
        "\t Anlaştığınız burçlar: Boğa, Başak\n\n"
        "\t Anlaşamadığınız burçlar: Koç, Yengeç, Terazi\n\n"
        "\t Başarılı olacağınız meslekler: Güzellik uzmanlığı, mimarlık, madencilik, doktorluk, kuyumculuk\n\n"
        "\t Burcunuzdan olan ünlüler:  Filiz Akın, Semra Özal, Benjamin Franklin, Elvis Presley, Isaac Newton\n\n",
    "\tGenel Özellikler\n\n"
        "\tYönetici yıldızınız: Uranüs\n\n"
        "\t Grubunuz: Hava\n\n"
        "\tUğurlu gününüz: Pazar\n\n"
        "\t Uğurlu sayınız: 4\n\n"
        "\t Uğurlu renginiz: Lacivert\n\n"
        "\t Uğurlu taşlarınız: Ametist, Gümüş, Grena\n\n"
        "\t Uğurlu çicekleriniz: Zerren, menekşe, kartopu, kır çiçekleri ve kuşburnu\n\n"
        "\t Uğurlu kokularınız: Sümbül, yasemin, menekşe\n\n"
        "\t Olumlu özelliğiniz: İradeli olmak\n\n"
        "\t Olumsuz özelliğiniz: İhmarkarlık\n\n"
        "\t Anlaştığınız burçlar: İkizler, Terazi\n\n"
        "\t Anlaşamadığınız burçlar: Boğa, Aslan, Akrep\n\n"
        "\t  Başarılı olacağınız meslekler: Yazarlık, editörlük, gazetecilik, sanatçılık, organizatörlük, muhasebecilik\n\n"
        "\t  Burcunuzdan olan ünlüler: Ajda Pekkan, Mozart, Ronald Reagan, Schubert, Abraham Lincoln, Kim Novak\n\n",
    "\tGenel Özellikler\n\n"
        "\t Yönetici yıldızınız: Neptün\n\n"
        "\t Grubunuz: Su\n\n"
        "\t Uğurlu gününüz: Perşembe\n\n"
        "\t Uğurlu sayınız: 7\n\n"
        "\t  Uğurlu renginiz: Turkuaz ve yeşil\n\n"
        "\t Uğurlu taşlarınız: Turkuaz, Ametist, Pembe Kuvars\n\n"
        "\t Uğurlu çicekleriniz: İnci çiçeği, zambak\n\n"
        "\t Uğurlu kokularınız: Kiraz çiçeği, zambak, limon çiçeği\n\n"
        "\t Olumlu özelliğiniz: Şefkatli ve merhametli olmak\n\n"
        "\t Olumsuz özelliğiniz: Kendinizi küçümsemek\n\n"
        "\t Anlaştığınız burçlar: Yengeç, Akrep\n\n"
        "\t Anlaşamadığınız burçlar: İkizler, Başak, Yay\n\n"
        "\t Başarılı olacağınız meslekler: Öğretmenlik, müzisyenlik, yazarlık, doktorluk\n\n"
        "\t  Burcunuzdan olan ünlüler: Beyazıt Öztürk, Hidayet Türkoğlu, Beren Saat, Yuri Gagarin, Albert Einstein, Gorbachev\n\n",
  ];
}
