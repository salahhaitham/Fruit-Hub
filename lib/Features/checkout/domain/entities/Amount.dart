  import 'package:ecommerce_app/Features/Home_Feature/domain/entites/CartEntity.dart';

  import 'Details.dart';

  class Amount {
    Amount({
        this.total,
        this.currency,
        this.details,});


    String? total;
    String? currency;
    Details? details;


    factory Amount.fromEntity(CartEntity entity){
      return Amount(
        total: entity.getTotalPriceAfterShippingAndShippingdiscount().toString(),
      currency:"USD",
        details:Details.fromEntity(entity)
      );
    }

    Map<String, dynamic> toJson() {
      final map = <String, dynamic>{};
      map['total'] = total;
      map['currency'] = currency;
      if (details != null) {
        map['details'] = details?.toJson();
      }
      return map;
    }

  }