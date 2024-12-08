class Item {
  final String _name;
  final double _weight;
  int _quantity;

  Item(
    this._name,
    this._weight,
    this._quantity,
  );

  get name => _name;
  get weight => _weight;
  get quantity => _quantity;

  Map toJson() => {
    'name': _name,
    'weight': _weight,
    'quantity': _quantity,
  };

  factory Item.fromJson(Map json) {
    return Item(
      json['name'],
      json['weight'],
      json['quantity'],
    );
  }
}