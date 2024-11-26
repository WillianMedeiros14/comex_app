// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_details_by_id_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$OrderDetailsByIdStore on _OrderDetailsByIdStore, Store {
  Computed<int>? _$totalItemsComputed;

  @override
  int get totalItems =>
      (_$totalItemsComputed ??= Computed<int>(() => super.totalItems,
              name: '_OrderDetailsByIdStore.totalItems'))
          .value;

  late final _$isLoadingAtom =
      Atom(name: '_OrderDetailsByIdStore.isLoading', context: context);

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

  late final _$stateAtom =
      Atom(name: '_OrderDetailsByIdStore.state', context: context);

  @override
  OrderModel? get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(OrderModel? value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$orderItemsAtom =
      Atom(name: '_OrderDetailsByIdStore.orderItems', context: context);

  @override
  List<OrderItemModel> get orderItems {
    _$orderItemsAtom.reportRead();
    return super.orderItems;
  }

  @override
  set orderItems(List<OrderItemModel> value) {
    _$orderItemsAtom.reportWrite(value, super.orderItems, () {
      super.orderItems = value;
    });
  }

  late final _$errorAtom =
      Atom(name: '_OrderDetailsByIdStore.error', context: context);

  @override
  String get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(String value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  late final _$getOrderByIdAsyncAction =
      AsyncAction('_OrderDetailsByIdStore.getOrderById', context: context);

  @override
  Future<void> getOrderById({required int orderId}) {
    return _$getOrderByIdAsyncAction
        .run(() => super.getOrderById(orderId: orderId));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
state: ${state},
orderItems: ${orderItems},
error: ${error},
totalItems: ${totalItems}
    ''';
  }
}
