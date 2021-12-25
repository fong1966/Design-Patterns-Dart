import '../example.dart';

class Burger {
  late double _size;
  late bool _cheese;
  late bool _beef;
  late bool _lettuce;
  late bool _tomato;

  // Not good:  Burger(this._size, this._cheese, this._beef, this._lettuce, this._tomato);
  // 把所有的属性都挤在了构造参数里

  //good： 将实例复杂属性配置下放到builder中，由builder来处理
  Burger(BurgerBuilder builder) {
    _size = builder._size;
    _cheese = builder._cheese;
    _beef = builder._beef;
    _lettuce = builder._lettuce;
    _tomato = builder._tomato;
  }

  String content() => """
  Your Burger size: $_size,
  Cheese: $_cheese,
  Beef: $_beef,
  Lettuce: $_lettuce,
  Tomato: $_tomato.
  """;
}

// 利用 Builder 中方法來多步配置实例，并通过 build 方法构建目标实体
// 配置方法返回 builder 本身（this）来连续配置属性
// BurgerBuilder().addCheese().addBeef().build();
class BurgerBuilder {
  late double _size;
  bool _cheese = false;
  bool _beef = false;
  bool _lettuce = false;
  bool _tomato = false;

  BurgerBuilder(this._size);

  BurgerBuilder addCheese() {
    _cheese = true;
    return this;
  }

  BurgerBuilder addBeef() {
    _beef = true;
    return this;
  }

  BurgerBuilder addLettuce() {
    _lettuce = true;
    return this;
  }

  BurgerBuilder addTomato() {
    _tomato = true;
    return this;
  }

  Burger build() => Burger(this);
}

class Builder extends Example {
  Builder([String filePath = "src/Creational/Builder.dart"]) : super(filePath);

  @override
  String testRun() {
    var noLettuceBurger =
        BurgerBuilder(15).addBeef().addCheese().addTomato().build();

    return noLettuceBurger.content();

    // Builder👇👇👇
    // Your Burger size: 15.0,
    // Cheese: true,
    // Beef: true,
    // Lettuce: false,
    // Tomato: true.
  }
}
