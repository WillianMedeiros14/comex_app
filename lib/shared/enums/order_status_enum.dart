enum OrderStatusEnum {
  pendente,
  processando,
  concluido,
  cancelado,
}

extension OrderStatusEnumExtension on OrderStatusEnum {
  String get capitalized {
    return this.toString().split('.').last.capitalize();
  }
}

extension StringCapitalization on String {
  String capitalize() {
    if (this.isEmpty) {
      return this;
    }
    return '${this[0].toUpperCase()}${this.substring(1)}';
  }
}
