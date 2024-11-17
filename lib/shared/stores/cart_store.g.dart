// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CartStore on _CartStore, Store {
  Computed<int>? _$quantityItemComputed;

  @override
  int get quantityItem =>
      (_$quantityItemComputed ??= Computed<int>(() => super.quantityItem,
              name: '_CartStore.quantityItem'))
          .value;
  Computed<bool>? _$isEmptyListComputed;

  @override
  bool get isEmptyList =>
      (_$isEmptyListComputed ??= Computed<bool>(() => super.isEmptyList,
              name: '_CartStore.isEmptyList'))
          .value;
  Computed<int>? _$totalItemsComputed;

  @override
  int get totalItems => (_$totalItemsComputed ??=
          Computed<int>(() => super.totalItems, name: '_CartStore.totalItems'))
      .value;

  late final _$listItemAtom =
      Atom(name: '_CartStore.listItem', context: context);

  @override
  List<CartItem> get listItem {
    _$listItemAtom.reportRead();
    return super.listItem;
  }

  @override
  set listItem(List<CartItem> value) {
    _$listItemAtom.reportWrite(value, super.listItem, () {
      super.listItem = value;
    });
  }

  late final _$totalPurchaseAtom =
      Atom(name: '_CartStore.totalPurchase', context: context);

  @override
  double get totalPurchase {
    _$totalPurchaseAtom.reportRead();
    return super.totalPurchase;
  }

  @override
  set totalPurchase(double value) {
    _$totalPurchaseAtom.reportWrite(value, super.totalPurchase, () {
      super.totalPurchase = value;
    });
  }

  late final _$_CartStoreActionController =
      ActionController(name: '_CartStore', context: context);

  @override
  void addCart(ProductModel item) {
    final _$actionInfo =
        _$_CartStoreActionController.startAction(name: '_CartStore.addCart');
    try {
      return super.addCart(item);
    } finally {
      _$_CartStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeCart(ProductModel item) {
    final _$actionInfo =
        _$_CartStoreActionController.startAction(name: '_CartStore.removeCart');
    try {
      return super.removeCart(item);
    } finally {
      _$_CartStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateTotalPurchase() {
    final _$actionInfo = _$_CartStoreActionController.startAction(
        name: '_CartStore.updateTotalPurchase');
    try {
      return super.updateTotalPurchase();
    } finally {
      _$_CartStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void updateListItems(CartItem item) {
    final _$actionInfo = _$_CartStoreActionController.startAction(
        name: '_CartStore.updateListItems');
    try {
      return super.updateListItems(item);
    } finally {
      _$_CartStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void increaseAmount(ProductModel item) {
    final _$actionInfo = _$_CartStoreActionController.startAction(
        name: '_CartStore.increaseAmount');
    try {
      return super.increaseAmount(item);
    } finally {
      _$_CartStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decreaseAmount(ProductModel item) {
    final _$actionInfo = _$_CartStoreActionController.startAction(
        name: '_CartStore.decreaseAmount');
    try {
      return super.decreaseAmount(item);
    } finally {
      _$_CartStoreActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
listItem: ${listItem},
totalPurchase: ${totalPurchase},
quantityItem: ${quantityItem},
isEmptyList: ${isEmptyList},
totalItems: ${totalItems}
    ''';
  }
}
