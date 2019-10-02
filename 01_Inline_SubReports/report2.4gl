# FOURJS_START_COPYRIGHT(U,2003)
# Property of Four Js*
# (c) Copyright Four Js 2003, 2019. All Rights Reserved.
# * Trademark of Four Js Development Tools Europe Ltd
#   in the United States and elsewhere
#
# Four Js and its suppliers do not warrant or guarantee that these samples are
# accurate and suitable for your purposes.
# Their inclusion is purely for information purposes only.
# FOURJS_END_COPYRIGHT

import fgl common
import fgl globals
import fgl grw

schema "officestore"

report subreport2_all_orders(orderline)
    define
        orderline ordertype,
        lineitemprice like lineitem.unitprice,
        overalltotal like orders.totalprice,
        usertotal like orders.totalprice,
        ordertotal like orders.totalprice

    order external by orderline.orders.userid,
        orderline.orders.orderid,
        orderline.lineitem.linenum

    format
        first page header
            let overalltotal = 0

        before group of orderline.orders.userid
            display "user " || orderline.orders.userid
            let usertotal = 0

        before group of orderline.orders.orderid
            display "    order " || orderline.orders.orderid
            let ordertotal = 0

        on every row
            display "        every row " || orderline.lineitem.linenum
            let lineitemprice =
                orderline.lineitem.unitprice * orderline.lineitem.quantity
            let overalltotal = overalltotal + lineitemprice
            let usertotal = usertotal + lineitemprice
            let ordertotal = ordertotal + lineitemprice
            print orderline.*,
                lineitemprice,
                overalltotal,
                usertotal,
                ordertotal

end report