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

define a3_01
    ReportSettings
    = (report_name: "masterreport.4rp",
        preview_mode: true,
        dist_mode: false,
        viewer: "standard")

main

    open form f_select_output from "a3_form"
    display form f_select_output

    options input wrap, field order form
    
    input by name a3_01.selected_output
        attributes(unbuffered, without defaults, cancel = false, accept = false)
        on action preview
            call preview_report()

        on action quit
            exit input

    end input

    close form f_select_output

end main

function preview_report()

    define h1 om.SaxDocumentHandler

    database officestore

    let h1 =
        grw.report_settings(
            h1,
            a3_01.report_name,
            a3_01.selected_output,
            a3_01.preview_mode,
            a3_01.dist_mode,
            a3_01.viewer)

    if h1 is not null then
        call run_master_report(h1)
    else
        exit program
    end if

end function

function run_master_report(handler)

    define handler om.saxdocumenthandler

    start report master_report to xml handler handler
    output to report master_report()
    finish report master_report

end function

report master_report()

-- report definition for master report
    define orderline ordertype

    format
        on every row
            display "subreport 1"
            declare c1_order cursor for
                select orders.*,
                    account.*,
                    country.*,
                    lineitem.*,
                    product.*,
                    category.*,
                    item.*
                    from orders,
                        account,
                        lineitem,
                        product,
                        category,
                        item,
                        country
                    where orders.orderid = lineitem.orderid
                        and orders.userid = account.userid
                        and lineitem.itemid = item.itemid
                        and item.productid = product.productid
                        and product.catid = category.catid
                        and country.code = orders.billcountry
                    order by orders.userid, orders.orderid, lineitem.linenum

            start report subreport1_all_orders
            foreach c1_order into orderline.*
                output to report subreport1_all_orders(orderline.*)
                if fgl_report_geterrorstatus() then
                    display "fgl: stopping report, msg=\"",
                        fgl_report_geterrorstring(),
                        "\""
                    exit foreach
                end if
            end foreach
            finish report subreport1_all_orders
            close c1_order

            display "subreport 2"
            declare c2_order cursor for
                select orders.*,
                    account.*,
                    country.*,
                    lineitem.*,
                    product.*,
                    category.*,
                    item.*
                    from orders,
                        account,
                        lineitem,
                        product,
                        category,
                        item,
                        country
                    where orders.orderid = lineitem.orderid
                        and orders.userid = account.userid
                        and lineitem.itemid = item.itemid
                        and item.productid = product.productid
                        and product.catid = category.catid
                        and country.code = orders.billcountry
                    order by orders.userid, orders.orderid, lineitem.linenum

            start report subreport2_all_orders
            foreach c2_order into orderline.*
                output to report subreport2_all_orders(orderline.*)
                if fgl_report_geterrorstatus() then
                    display "fgl: stopping report, msg=\"",
                        fgl_report_geterrorstring(),
                        "\""
                    exit foreach
                end if
            end foreach
            finish report subreport2_all_orders
            close c2_order

end report

report subreport1_all_orders(orderline)
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
