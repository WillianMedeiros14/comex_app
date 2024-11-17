// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_details_store.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProductDetailsStore on _ProductDetailsStore, Store {
  late final _$isLoadingAtom =
      Atom(name: '_ProductDetailsStore.isLoading', context: context);

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
      Atom(name: '_ProductDetailsStore.state', context: context);

  @override
  ProductModel? get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(ProductModel? value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$errorAtom =
      Atom(name: '_ProductDetailsStore.error', context: context);

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

  late final _$getProductByIdAsyncAction =
      AsyncAction('_ProductDetailsStore.getProductById', context: context);

  @override
  Future<void> getProductById({required int productId}) {
    return _$getProductByIdAsyncAction
        .run(() => super.getProductById(productId: productId));
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
state: ${state},
error: ${error}
    ''';
  }
}
