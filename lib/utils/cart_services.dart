import 'hive_services.dart';

int? isAddedIndex;

class CartServices {
  double getTotalPrice() {
    double totalPrice = 0;
    for (int i = 0; i < cartModelList.length; i++) {
      totalPrice = totalPrice + cartModelList[i].totalAmount;
    }
    return totalPrice;
  }

  double getGst() {
    double gstAmount = getTotalPrice() * 18 / 100;
    return gstAmount;
  }

  double getCgst() {
    double gstAmount = getTotalPrice() * 9 / 100;
    return gstAmount;
  }

  double getSubTotal() {
    double subTotal = getTotalPrice() + getGst();
    return subTotal;
  }

  bool isAdded(int id) {
    bool isAdded = false;
    for (int i = 0; i < wishListModelList.length; i++) {
      if (wishListModelList[i].id == id) {
        isAdded = true;
        isAddedIndex = i;
      }
    }
    return isAdded;
  }
}
