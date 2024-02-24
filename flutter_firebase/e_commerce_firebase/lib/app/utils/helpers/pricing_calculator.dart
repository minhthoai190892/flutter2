class TPricingCalculator {
  /// calculate Price based on tax and shipping
  static double calculateTotalPrice(
      {required productPrice, required String location}) {
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;
    double shippingCost = getShippingCost(location);
    double totalPrice = productPrice + taxAmount + shippingCost;
    return totalPrice;
  }

  /// calculate shipping cost
  static String calculateShippingCost(
      {required double productPrice, required String location}) {
    double shippingCost = getShippingCost(location);
    return shippingCost.toStringAsFixed(2);
  }

  /// calculate tax
  static String calculateTax(
      {required double productPrice, required String location}) {
    double taxRate = getTaxRateForLocation(location);
    double taxAmount = productPrice * taxRate;
    return taxAmount.toStringAsFixed(2);
  }

  static double getTaxRateForLocation(String location) {
    //lookup the tax rate for the given location from a tax rate database or API
    // Return the appropriate tax rate

    return 0.10; //exampt the tax rate for 10%
  }

  static double getShippingCost(String location) {
    //lookup the shipping cost for the given location using a shipping rate api
    // calculate the shipping cost based on various factors like distance, weight, etc.

    return 5.00; //exampt the tax rate for 5$
  }

  /// sum all cart values and return total amount
  // static double calculateCartTotal(CartModel cart) {
  //   return cart.i
  // }
}
