class CarouselModel {
  String image;
  CarouselModel(this.image);
}

List<CarouselModel> carousels =
    carouselsData.map((item) => CarouselModel(item['image'])).toList();

var carouselsData = [
  {'image': 'https://www.rstom.kz/wp-content/themes/rahat/img/pop.png'},
  {'image': 'https://www.rstom.kz/wp-content/themes/rahat/img/febglav.png'},
  {'image': 'https://www.rstom.kz/wp-content/themes/rahat/img/dban60.jpeg'},
  {'image': 'https://www.rstom.kz/wp-content/themes/rahat/img/dban666.jpeg'},
];
