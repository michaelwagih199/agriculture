class ColdFunctionResultModel{
  String? date;
  int? numberOfunit;
  ColdFunctionResultModel(this.date, this.numberOfunit);

  @override
  String toString() {
    return 'ColdFunctionModel{date: $date, numberOfunit: $numberOfunit}';
  }

  @override
  bool operator ==(Object other) {
    return (other is ColdFunctionResultModel) && other.date == date;
  }
}