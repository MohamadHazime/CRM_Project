import 'package:crm_project/trade.dart';
import 'package:flutter/material.dart';
import 'package:crm_project/trade_item.dart';

class Listing extends StatelessWidget {
  final listTrades;
  final count;

  Listing(this.listTrades, this.count);

  @override
  Widget build(BuildContext context) {
    return listTrades.length == 0
        ? Container(
            child: Center(
              child: Text('No Trades available...'),
            ),
          )
        : GridView.builder(
            padding: const EdgeInsets.all(10.0),
            itemCount: count > listTrades.length ? listTrades.length : count,
            itemBuilder: (ctx, i) {
              var trade = Trade(
                ticket: listTrades[i]['TICKET'],
                symbol: listTrades[i]['SYMBOL'],
                cmd: listTrades[i]['CMD'],
                volume: listTrades[i]['VOLUME'],
                openTime: listTrades[i]['OPEN_TIME'],
                openPrice: listTrades[i]['OPEN_PRICE'],
                closeTime: listTrades[i]['CLOSE_TIME'],
                closePrice: listTrades[i]['CLOSE_PRICE'],
                profit: listTrades[i]['PROFIT'],
              );
              return TradeItem(trade);
            },
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 1,
              childAspectRatio: 3,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
            ),
          );
  }
}
