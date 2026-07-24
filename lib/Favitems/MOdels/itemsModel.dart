


class Itemsmodel {
final String name;
final String Descriptions;
final bool fav;

Itemsmodel({required this.Descriptions,required this.fav,required this.name})

Itemsmodel.copywith({
  this.Descriptions,
  this.fav,
  this.name,
})  {
    return Itemsmodel(
      name: name ?? this.name,
      Descriptions: Descriptions ?? this.Descriptions,
      fav: fav ?? this.fav,
    )   
}

}   