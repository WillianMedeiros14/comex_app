// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'create_order_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CreateOrderStore on _CreateOrderStoreBase, Store {
  late final _$isLoadingAtom =
      Atom(name: '_CreateOrderStoreBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$errorMessageAtom =
      Atom(name: '_CreateOrderStoreBase.errorMessage', context: context);

  @override
  String? get errorMessage {
    _$errorMessageAtom.reportRead();
    return super.errorMessage;
  }

  @override
  set errorMessage(String? value) {
    _$errorMessageAtom.reportWrite(value, super.errorMessage, () {
      super.errorMessage = value;
    });
  }

  late final _$orderCreatedAtom =
      Atom(name: '_CreateOrderStoreBase.orderCreated', context: context);

  @override
  bool get orderCreated {
    _$orderCreatedAtom.reportRead();
    return super.orderCreated;
  }

  @override
  set orderCreated(bool value) {
    _$orderCreatedAtom.reportWrite(value, super.orderCreated, () {
      super.orderCreated = value;
    });
  }

  late final _$createOrderAsyncAction =
      AsyncAction('_CreateOrderStoreBase.createOrder', context: context);

  @override
  Future<bool> createOrder({required List<CartItem> cartItems}) {
    return _$createOrderAsyncAction
        .run(() => super.createOrder(cartItems: cartItems));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
errorMessage: ${errorMessage},
orderCreated: ${orderCreated}
    ''';
  }
}
