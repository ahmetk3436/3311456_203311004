class MovieList {
  final int movieId;
  final String movieName;
  final double imdbPoint;
  final String movieExplanation;
  final int outDate;
  final String? imgUrl;
  bool? isFavourite;
  final int categoryId;
  MovieList({
    this.isFavourite,
    required this.categoryId,
    required this.imgUrl,
    required this.movieId,
    required this.movieName,
    required this.imdbPoint,
    required this.movieExplanation,
    required this.outDate,
  });
}

class MovieCategory {
  final String categoryName;
  final String categoryImageUrl;
  final List<MovieList> movieList;
  MovieCategory({
    required this.categoryName,
    required this.categoryImageUrl,
    required this.movieList,
  });
}

List<MovieCategory> movieCategory = [
  MovieCategory(
      categoryName: "Komedi",
      categoryImageUrl:
          "https://cdn.dsmcdn.com/ty75/product/media/images/20210222/18/65929619/144764113/1/1_org_zoom.jpg",
      movieList: comediMovies),
  MovieCategory(
      categoryName: "Aksiyon",
      categoryImageUrl:
          "https://listelist.com/wp-content/uploads/2019/03/action-movies.jpg",
      movieList: actionMovies),
  MovieCategory(
      categoryName: "Korku",
      categoryImageUrl:
          "https://i20.haber7.net/resize/1240x720//haber/haber7/photos/2019/44/korku_filmi_izlemenin_vucuda_faydalari_aciklandi_fazladan_kalori_yaktiriyor_1572521157_058.jpg",
      movieList: fearMovies),
  MovieCategory(
      categoryName: "Aşk",
      categoryImageUrl:
          "https://img-s1.onedio.com/id-56b11f21a2e198ff7be7b303/rev-0/w-620/f-jpg/s-35131025000b4fde6e375dc50aacda467bde03fd.jpg",
      movieList: loveMovies),
  MovieCategory(
      categoryName: "Bilim Kurgu",
      categoryImageUrl:
          "https://iasbh.tmgrup.com.tr/bd7999/1200/627/0/43/432/268?u=https://isbh.tmgrup.com.tr/sb/album/2019/09/02/mutlaka-izlemeniz-gereken-en-iyi-100-bilim-kurgu-filmi-nelerdir-iste-en-iyi-100-bilim-kurgu-filmi-1567406445531.jpg",
      movieList: scienceFictionMovies),
  MovieCategory(
      categoryName: "Macera",
      categoryImageUrl: "https://www.neoldu.com/d/other/1-644.webp",
      movieList: adventureMovies),
];

List<MovieList> comediMovies = [
  MovieList(
      movieId: 0,
      movieName: "Para Avcısı",
      imdbPoint: 8.2,
      movieExplanation:
          "Based on the true story of Jordan Belfort, from his rise to a wealthy stock-broker living the high life to his fall involving crime, corruption and the federal government.",
      outDate: 2013,
      isFavourite: false,
      categoryId: 0,
      imgUrl:
          'https://i4.hurimg.com/i/hurriyet/75/750x422/55eaae4cf018fbb8f88fea63.jpg'),
  MovieList(
      movieId: 1,
      movieName: "Geleceğe Dönüş",
      imdbPoint: 8.6,
      movieExplanation:
          "Marty McFly, a 17-year-old high school student, is accidentally sent thirty years into the past in a time-traveling DeLorean invented by his close friend, the eccentric scientist Doc Brown.",
      outDate: 1985,
      isFavourite: false,
      categoryId: 0,
      imgUrl:
          'https://www.kulturservisi.com/wp-content/uploads/2020/05/gelecege-donus2.jpg'),
  MovieList(
      movieId: 2,
      movieName: "Galaksinin Koruyucuları",
      imdbPoint: 8.1,
      movieExplanation:
          "A group of intergalactic criminals must pull together to stop a fanatical warrior with plans to purge the universe.",
      outDate: 2014,
      isFavourite: false,
      categoryId: 0,
      imgUrl:
          'https://tr.web.img3.acsta.net/newsv7/20/03/10/09/06/2169382.jpg'),
  MovieList(
      movieId: 3,
      movieName: "Truman Show",
      imdbPoint: 8.2,
      movieExplanation:
          "An insurance salesman discovers his whole life is actually a reality TV show.",
      outDate: 1998,
      isFavourite: false,
      categoryId: 0,
      imgUrl:
          'https://images-na.ssl-images-amazon.com/images/S/pv-target-images/1372b1f835edc8dc24851b9f5c749dfcba767dc1e009f23605cd357fb2fb32c4._RI_V_TTW_.jpg'),
  MovieList(
      movieId: 4,
      movieName: "Kayıp Balık Nemo",
      imdbPoint: 8.2,
      movieExplanation:
          "After his son is captured in the Great Barrier Reef and taken to Sydney, a timid clownfish sets out on a journey to bring him home.",
      outDate: 2003,
      isFavourite: false,
      categoryId: 0,
      imgUrl:
          'https://i0.wp.com/dialmformovie.net/wp-content/uploads/2020/05/Nemo-007.jpg?resize=863%2C685&ssl=1'),
];
List<MovieList> actionMovies = [
  MovieList(
      categoryId: 1,
      imgUrl:
          "https://www.cepkolik.com/wp-content/uploads/2021/12/En-Iyi-Keskin-Nisanci-Filmleri.jpg",
      movieId: 0,
      movieName: "Keskin Nişancı",
      imdbPoint: 7.3,
      movieExplanation:
          "Navy S.E.A.L. sniper Chris Kyle's pinpoint accuracy saves countless lives on the battlefield and turns him into a legend. Back home with his family after four tours of duty, however, Chris finds that it is the war he can't leave behind.",
      outDate: 2014),
  MovieList(
      categoryId: 1,
      imgUrl:
          "https://i1.wp.com/filmloverss.com/wp-content/uploads/looper-poster-quad.jpg?resize=759%2C500&ssl=1",
      movieId: 1,
      movieName: "Tetikçiler",
      imdbPoint: 7.4,
      movieExplanation:
          "In 2074, when the mob wants to get rid of someone, the target is sent into the past, where a hired gun awaits - someone like Joe - who one day learns the mob wants to 'close the loop' by sending back Joe's future self for assassination.",
      outDate: 2012),
  MovieList(
      categoryId: 1,
      imgUrl:
          "https://i2.wp.com/filmloverss.com/wp-content/uploads/edge-of-tomorrow-filmloverss.jpg?resize=759%2C500&ssl=1",
      movieId: 2,
      movieName: "Yarının Sınırında",
      imdbPoint: 7.9,
      movieExplanation:
          "A soldier fighting aliens gets to relive the same day over and over again, the day restarting every time he dies.",
      outDate: 2014),
  MovieList(
      categoryId: 1,
      imgUrl:
          "https://tr.web.img4.acsta.net/r_1280_720/medias/nmedia/18/63/18/01/18779138.jpg",
      movieId: 3,
      movieName: "Ben Efsaneyim",
      imdbPoint: 7.2,
      movieExplanation:
          "Years after a plague kills most of humanity and transforms the rest into monsters, the sole survivor in New York City struggles valiantly to find a cure.",
      outDate: 2007),
  MovieList(
      categoryId: 1,
      imgUrl:
          "https://iasbh.tmgrup.com.tr/8b059b/650/344/0/0/1920/1006?u=https://isbh.tmgrup.com.tr/sbh/2021/10/02/elysium-yeni-cennet-filmi-konusu-nedir-oyunculari-kimler-iste-elysium-yeni-cennet-filmi-oyunculari-ve-konusu-1633184323023.jpg",
      movieId: 4,
      movieName: "Elysium : Yeni Cennet",
      imdbPoint: 6.6,
      movieExplanation:
          "In the year 2154, the very wealthy live on a man-made space station while the rest of the population resides on a ruined Earth. A man takes on a mission that could bring equality to the polarized worlds.",
      outDate: 2013)
];
List<MovieList> fearMovies = [
  MovieList(
      categoryId: 2,
      imgUrl:
          "https://tr.web.img4.acsta.net/pictures/19/05/23/08/38/1189753.jpg",
      movieId: 0,
      movieName: "Cinnet",
      imdbPoint: 8.4,
      movieExplanation:
          "A family heads to an isolated hotel for the winter where a sinister presence influences the father into violence, while his psychic son sees horrific forebodings from both past and future.",
      outDate: 1980),
  MovieList(
      categoryId: 2,
      imgUrl:
          "https://foto.haberler.com/haber/2021/05/07/rituel-ne-demek-rituel-gunah-mi-rituel-nasil-14117421_2544_amp.jpg",
      movieId: 1,
      movieName: "Ritüel",
      imdbPoint: 7.1,
      movieExplanation:
          "A couple travels to Northern Europe to visit a rural hometown's fabled Swedish mid-summer festival. What begins as an idyllic retreat quickly devolves into an increasingly violent and bizarre competition at the hands of a pagan cult.",
      outDate: 2019),
  MovieList(
      categoryId: 2,
      imgUrl:
          "https://media.cinemaximum.com.tr/255//files/movie_posters/HO00002997_636632893871900690_ayin.png",
      movieId: 2,
      movieName: "Ayin",
      imdbPoint: 7.3,
      movieExplanation:
          "A grieving family is haunted by tragic and disturbing occurrences.",
      outDate: 2018),
  MovieList(
      categoryId: 2,
      imgUrl:
          "https://foto.haberler.com/haber/2022/01/18/ruyada-seytan-gormek-ne-anlama-gelir-ruyada-14673847_6651_amp.jpg",
      movieId: 3,
      movieName: "Şeytan",
      imdbPoint: 8.1,
      movieExplanation:
          "When a 12-year-old girl is possessed by a mysterious entity, her mother seeks the help of two priests to save her.",
      outDate: 1973),
  MovieList(
      categoryId: 2,
      imgUrl:
          "https://upload.wikimedia.org/wikipedia/tr/2/2a/Blair_Witch_2016_poster.png",
      movieId: 4,
      movieName: "Blair Cadısı",
      imdbPoint: 6.5,
      movieExplanation:
          "Three film students vanish after traveling into a Maryland forest to film a documentary on the local Blair Witch legend, leaving only their footage behind.",
      outDate: 1999),
];
List<MovieList> loveMovies = [
  MovieList(
      categoryId: 3,
      imgUrl:
          "https://i4.hurimg.com/i/hurriyet/75/750x422/61ee70354e3fe1028c40d775.jpg",
      movieId: 0,
      movieName: "Titanik",
      imdbPoint: 7.9,
      movieExplanation:
          "A seventeen-year-old aristocrat falls in love with a kind but poor artist aboard the luxurious, ill-fated R.M.S. Titanic.",
      outDate: 1997),
  MovieList(
      categoryId: 3,
      imgUrl:
          "https://iasbh.tmgrup.com.tr/1a9812/1200/627/0/0/1000/522?u=https://isbh.tmgrup.com.tr/sbh/2019/04/01/sil-bastan-filminin-konusu-ve-oyunculari-1554121070202.jpg",
      movieId: 1,
      movieName: "Sil Baştan",
      imdbPoint: 8.3,
      movieExplanation:
          "When their relationship turns sour, a couple undergoes a medical procedure to have each other erased from their memories.",
      outDate: 2004),
  MovieList(
      categoryId: 3,
      imgUrl:
          "https://iasbh.tmgrup.com.tr/64fb3f/800/420/0/0/640/336?u=https://isbh.tmgrup.com.tr/sbh/2019/02/14/umut-isigim-filmi-konusu-ne-umut-isigim-oyunculari-kimler-1550137706317.jpg",
      movieId: 2,
      movieName: "Umut Işığım",
      imdbPoint: 7.7,
      movieExplanation:
          "After a stint in a mental institution, former teacher Pat Solitano moves back in with his parents and tries to reconcile with his ex-wife. Things get more challenging when Pat meets Tiffany, a mysterious girl with problems of her own.",
      outDate: 2012),
  MovieList(
      categoryId: 3,
      imgUrl:
          "https://www.indyturk.com/sites/default/files/styles/1368x911/public/article/main_image/2019/05/08/86141-258807451.jpg?itok=xKabgGs7",
      movieId: 3,
      movieName: "Amelie",
      imdbPoint: 8.3,
      movieExplanation:
          "Amélie is an innocent and naive girl in Paris with her own sense of justice. She decides to help those around her and, along the way, discovers love.",
      outDate: 2001),
  MovieList(
      categoryId: 3,
      imgUrl:
          "https://i.haberglobal.com.tr/storage/haber/2021/09/03/dunya-bunu-konusuyor-benjamin-button-gercek-oldu_1630660252.jpg",
      movieId: 4,
      movieName: "Benjamin Button'ın Tuhaf Hikayesi",
      imdbPoint: 7.8,
      movieExplanation:
          "Tells the story of Benjamin Button, a man who starts aging backwards with consequences.",
      outDate: 2008),
];
List<MovieList> scienceFictionMovies = [
  MovieList(
      categoryId: 4,
      imgUrl: "https://tr.web.img4.acsta.net/pictures/bzp/01/15753.jpg",
      movieId: 0,
      movieName: "Mesaj",
      imdbPoint: 7.5,
      movieExplanation:
          "Dr. Ellie Arroway, after years of searching, finds conclusive radio proof of extraterrestrial intelligence, sending plans for a mysterious machine.",
      outDate: 1997),
  MovieList(
      categoryId: 4,
      imgUrl: "https://upload.wikimedia.org/wikipedia/tr/9/97/2001-PF2125.jpg",
      movieId: 1,
      movieName: "2001:Uzay Yolu Macerası",
      imdbPoint: 8.3,
      movieExplanation:
          "The Monoliths push humanity to reach for the stars; after their discovery in Africa generations ago, the mysterious objects lead mankind on an awesome journey to Jupiter, with the help of H.A.L. 9000: the world's greatest supercomputer.",
      outDate: 1968),
  MovieList(
      categoryId: 4,
      imgUrl: "https://tr.web.img4.acsta.net/pictures/bzp/01/29280.jpg",
      movieId: 2,
      movieName: "Yapay Zeka",
      imdbPoint: 7.2,
      movieExplanation:
          "A highly advanced robotic boy longs to become real so that he can regain the love of his human mother.",
      outDate: 2001),
  MovieList(
      categoryId: 4,
      imgUrl:
          "https://tr.web.img3.acsta.net/pictures/15/01/23/17/36/467751.jpg",
      movieId: 3,
      movieName: "Ex Machina",
      imdbPoint: 7.7,
      movieExplanation:
          "A young programmer is selected to participate in a ground-breaking experiment in synthetic intelligence by evaluating the human qualities of a highly advanced humanoid A.I.",
      outDate: 2014),
  MovieList(
      categoryId: 4,
      imgUrl:
          "https://cocuklasinema.com/assets/admin/images/movie/olnrarrival_logolu.jpg",
      movieId: 4,
      movieName: "Geliş",
      imdbPoint: 7.9,
      movieExplanation:
          "A linguist works with the military to communicate with alien lifeforms after twelve mysterious spacecraft appear around the world.",
      outDate: 2016),
];
List<MovieList> adventureMovies = [
  MovieList(
      categoryId: 5,
      imgUrl: "https://mcdn01.gittigidiyor.net/73251/732511913_0.jpg",
      movieId: 0,
      movieName: "Kutsal Hazine Avcıları",
      imdbPoint: 8.4,
      movieExplanation:
          "In 1936, archaeologist and adventurer Indiana Jones is hired by the U.S. government to find the Ark of the Covenant before Adolf Hitler's Nazis can obtain its awesome powers.",
      outDate: 1981),
  MovieList(
      categoryId: 5,
      imgUrl:
          "https://www.sinematopya.com/wp-content/uploads/2013/06/4427357248_5e364869bb_z.jpg",
      movieId: 1,
      movieName: "Soysuzlar Çetesi",
      imdbPoint: 8.3,
      movieExplanation:
          "In Nazi-occupied France during World War II, a plan to assassinate Nazi leaders by a group of Jewish U.S. soldiers coincides with a theatre owner's vengeful plans for the same.",
      outDate: 2009),
  MovieList(
      categoryId: 5,
      imgUrl: "https://tr.web.img2.acsta.net/pictures/bzp/01/29276.jpg",
      movieId: 2,
      movieName: "Harry Potterve Felsefe Taşı",
      imdbPoint: 7.6,
      movieExplanation:
          "An orphaned boy enrolls in a school of wizardry, where he learns the truth about himself, his family and the terrible evil that haunts the magical world.",
      outDate: 0),
  MovieList(
      categoryId: 5,
      imgUrl:
          "https://tr.web.img3.acsta.net/pictures/20/08/24/14/07/3006684.jpg",
      movieId: 3,
      movieName: "Düşüş",
      imdbPoint: 7.8,
      movieExplanation:
          "In a hospital on the outskirts of 1920s Los Angeles, an injured stuntman begins to tell a fellow patient, a little girl with a broken arm, a fantastic story of five mythical heroes. Thanks to his fractured state of mind and her vivid imagination, the line between fiction and reality blurs as the tale advances.",
      outDate: 0),
  MovieList(
      categoryId: 5,
      imgUrl:
          "https://upload.wikimedia.org/wikipedia/tr/4/45/B%C3%BCy%C3%BCk_Bal%C4%B1k_poster.jpg",
      movieId: 4,
      movieName: "Büyük Balık",
      imdbPoint: 8,
      movieExplanation:
          "A frustrated son tries to determine the fact from fiction in his dying father's life.",
      outDate: 0),
];

List<String> buttonNames = [
  "Film Listesi",
  "Favori Filmlerim",
  "Biz Kimiz ?",
  "Editörün Seçimleri"
];

List<String> buttonRouters = [
  "/movieList",
  "/favouriteList",
  "/whoWeAre",
  "/editorChoices"
];
List<MovieList> favouriteMovies = [];
