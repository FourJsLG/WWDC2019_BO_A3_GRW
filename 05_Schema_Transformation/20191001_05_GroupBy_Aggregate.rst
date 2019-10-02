<?xml version='1.0' encoding='UTF-8'?>
<ReportSchemaTransform gstVersion="31405" schemaRootName="report_all_orders_notordered" version="1.0" schemaFileName="05_Schema_Transformation.rdd">
    <SelectDuplicateShift>
        <Collection srcLabel="Report" src="Report" name="Report">
            <Collection srcLabel="OnEveryRow" src="OnEveryRow" name="OnEveryRow">
                <Field srcLabel="orderline.orders.orderid" src="orderline.orders.orderid" name="orderline.orders.orderid" type="INTEGER"/>
                <Field srcLabel="orderline.orders.userid" src="orderline.orders.userid" name="orderline.orders.userid" type="CHAR(80)"/>
                <Field srcLabel="orderline.orders.orderdate" src="orderline.orders.orderdate" name="orderline.orders.orderdate" type="DATE"/>
                <Field srcLabel="orderline.orders.shipfirstname" src="orderline.orders.shipfirstname" name="orderline.orders.shipfirstname" type="CHAR(80)"/>
                <Field srcLabel="orderline.orders.shiplastname" src="orderline.orders.shiplastname" name="orderline.orders.shiplastname" type="CHAR(80)"/>
                <Field srcLabel="orderline.orders.shipaddr1" src="orderline.orders.shipaddr1" name="orderline.orders.shipaddr1" type="CHAR(80)"/>
                <Field srcLabel="orderline.orders.shipaddr2" src="orderline.orders.shipaddr2" name="orderline.orders.shipaddr2" type="CHAR(80)"/>
                <Field srcLabel="orderline.orders.shipcity" src="orderline.orders.shipcity" name="orderline.orders.shipcity" type="CHAR(80)"/>
                <Field srcLabel="orderline.orders.shipstate" src="orderline.orders.shipstate" name="orderline.orders.shipstate" type="CHAR(80)"/>
                <Field srcLabel="orderline.orders.shipzip" src="orderline.orders.shipzip" name="orderline.orders.shipzip" type="CHAR(20)"/>
                <Field srcLabel="orderline.orders.billstate" src="orderline.orders.billstate" name="orderline.orders.billstate" type="CHAR(80)"/>
                <Field srcLabel="orderline.orders.shipcountry" src="orderline.orders.shipcountry" name="orderline.orders.shipcountry" type="CHAR(3)"/>
                <Field srcLabel="orderline.orders.billfirstname" src="orderline.orders.billfirstname" name="orderline.orders.billfirstname" type="CHAR(80)"/>
                <Field srcLabel="orderline.orders.billlastname" src="orderline.orders.billlastname" name="orderline.orders.billlastname" type="CHAR(80)"/>
                <Field srcLabel="orderline.orders.billaddr1" src="orderline.orders.billaddr1" name="orderline.orders.billaddr1" type="CHAR(80)"/>
                <Field srcLabel="orderline.orders.billaddr2" src="orderline.orders.billaddr2" name="orderline.orders.billaddr2" type="CHAR(80)"/>
                <Field srcLabel="orderline.orders.billcity" src="orderline.orders.billcity" name="orderline.orders.billcity" type="CHAR(80)"/>
                <Field srcLabel="orderline.orders.billzip" src="orderline.orders.billzip" name="orderline.orders.billzip" type="CHAR(20)"/>
                <Field srcLabel="orderline.orders.billcountry" src="orderline.orders.billcountry" name="orderline.orders.billcountry" type="CHAR(3)"/>
                <Field srcLabel="orderline.orders.totalprice" src="orderline.orders.totalprice" name="orderline.orders.totalprice" type="DECIMAL(10,2)"/>
                <Field srcLabel="orderline.orders.creditcard" src="orderline.orders.creditcard" name="orderline.orders.creditcard" type="CHAR(80)"/>
                <Field srcLabel="orderline.orders.exprdate" src="orderline.orders.exprdate" name="orderline.orders.exprdate" type="CHAR(7)"/>
                <Field srcLabel="orderline.orders.cardtype" src="orderline.orders.cardtype" name="orderline.orders.cardtype" type="CHAR(80)"/>
                <Field srcLabel="orderline.orders.sourceapp" src="orderline.orders.sourceapp" name="orderline.orders.sourceapp" type="CHAR(3)"/>
                <Field srcLabel="orderline.account.userid" src="orderline.account.userid" name="orderline.account.userid" type="CHAR(80)"/>
                <Field srcLabel="orderline.account.email" src="orderline.account.email" name="orderline.account.email" type="CHAR(80)"/>
                <Field srcLabel="orderline.account.firstname" src="orderline.account.firstname" name="orderline.account.firstname" type="CHAR(80)"/>
                <Field srcLabel="orderline.account.lastname" src="orderline.account.lastname" name="orderline.account.lastname" type="CHAR(80)"/>
                <Field srcLabel="orderline.account.acstatus" src="orderline.account.acstatus" name="orderline.account.acstatus" type="CHAR(2)"/>
                <Field srcLabel="orderline.account.addr1" src="orderline.account.addr1" name="orderline.account.addr1" type="CHAR(80)"/>
                <Field srcLabel="orderline.account.addr2" src="orderline.account.addr2" name="orderline.account.addr2" type="CHAR(40)"/>
                <Field srcLabel="orderline.account.city" src="orderline.account.city" name="orderline.account.city" type="CHAR(80)"/>
                <Field srcLabel="orderline.account.state" src="orderline.account.state" name="orderline.account.state" type="CHAR(80)"/>
                <Field srcLabel="orderline.account.zip" src="orderline.account.zip" name="orderline.account.zip" type="CHAR(20)"/>
                <Field srcLabel="orderline.account.country" src="orderline.account.country" name="orderline.account.country" type="CHAR(3)"/>
                <Field srcLabel="orderline.account.phone" src="orderline.account.phone" name="orderline.account.phone" type="CHAR(80)"/>
                <Field srcLabel="orderline.account.langpref" src="orderline.account.langpref" name="orderline.account.langpref" type="CHAR(80)"/>
                <Field srcLabel="orderline.account.favcategory" src="orderline.account.favcategory" name="orderline.account.favcategory" type="CHAR(10)"/>
                <Field srcLabel="orderline.account.mylistopt" src="orderline.account.mylistopt" name="orderline.account.mylistopt" type="INTEGER"/>
                <Field srcLabel="orderline.account.banneropt" src="orderline.account.banneropt" name="orderline.account.banneropt" type="INTEGER"/>
                <Field srcLabel="orderline.account.sourceapp" src="orderline.account.sourceapp" name="orderline.account.sourceapp" type="CHAR(3)"/>
                <Field srcLabel="orderline.country.code" src="orderline.country.code" name="orderline.country.code" type="CHAR(3)"/>
                <Field srcLabel="orderline.country.codedesc" src="orderline.country.codedesc" name="orderline.country.codedesc" type="CHAR(50)"/>
                <Field srcLabel="orderline.lineitem.orderid" src="orderline.lineitem.orderid" name="orderline.lineitem.orderid" type="INTEGER"/>
                <Field srcLabel="orderline.lineitem.linenum" src="orderline.lineitem.linenum" name="orderline.lineitem.linenum" type="INTEGER"/>
                <Field srcLabel="orderline.lineitem.itemid" src="orderline.lineitem.itemid" name="orderline.lineitem.itemid" type="CHAR(10)"/>
                <Field srcLabel="orderline.lineitem.quantity" src="orderline.lineitem.quantity" name="orderline.lineitem.quantity" type="INTEGER"/>
                <Field srcLabel="orderline.lineitem.unitprice" src="orderline.lineitem.unitprice" name="orderline.lineitem.unitprice" type="DECIMAL(10,2)"/>
                <Field srcLabel="orderline.product.productid" src="orderline.product.productid" name="orderline.product.productid" type="CHAR(10)"/>
                <Field srcLabel="orderline.product.catid" src="orderline.product.catid" name="orderline.product.catid" type="CHAR(10)"/>
                <Field srcLabel="orderline.product.prodname" src="orderline.product.prodname" name="orderline.product.prodname" type="CHAR(80)"/>
                <Field srcLabel="orderline.product.proddesc" src="orderline.product.proddesc" name="orderline.product.proddesc" type="CHAR(255)"/>
                <Field srcLabel="orderline.product.prodpic" src="orderline.product.prodpic" name="orderline.product.prodpic" type="CHAR(255)"/>
                <Field srcLabel="orderline.category.catid" src="orderline.category.catid" name="orderline.category.catid" type="CHAR(10)"/>
                <Field srcLabel="orderline.category.catorder" src="orderline.category.catorder" name="orderline.category.catorder" type="SMALLINT"/>
                <Field srcLabel="orderline.category.catname" src="orderline.category.catname" name="orderline.category.catname" type="CHAR(80)"/>
                <Field srcLabel="orderline.category.catdesc" src="orderline.category.catdesc" name="orderline.category.catdesc" type="CHAR(255)"/>
                <Field srcLabel="orderline.category.catpic" src="orderline.category.catpic" name="orderline.category.catpic" type="CHAR(255)"/>
                <Field srcLabel="orderline.item.itemid" src="orderline.item.itemid" name="orderline.item.itemid" type="CHAR(10)"/>
                <Field srcLabel="orderline.item.productid" src="orderline.item.productid" name="orderline.item.productid" type="CHAR(10)"/>
                <Field srcLabel="orderline.item.listprice" src="orderline.item.listprice" name="orderline.item.listprice" type="DECIMAL(10,2)"/>
                <Field srcLabel="orderline.item.unitcost" src="orderline.item.unitcost" name="orderline.item.unitcost" type="DECIMAL(10,2)"/>
                <Field srcLabel="orderline.item.supplier" src="orderline.item.supplier" name="orderline.item.supplier" type="INTEGER"/>
                <Field srcLabel="orderline.item.itstatus" src="orderline.item.itstatus" name="orderline.item.itstatus" type="CHAR(2)"/>
                <Field srcLabel="orderline.item.attr1" src="orderline.item.attr1" name="orderline.item.attr1" type="CHAR(80)"/>
                <Field srcLabel="orderline.item.attr2" src="orderline.item.attr2" name="orderline.item.attr2" type="CHAR(80)"/>
                <Field srcLabel="orderline.item.attr3" src="orderline.item.attr3" name="orderline.item.attr3" type="CHAR(80)"/>
                <Field srcLabel="orderline.item.attr4" src="orderline.item.attr4" name="orderline.item.attr4" type="CHAR(80)"/>
                <Field srcLabel="orderline.item.attr5" src="orderline.item.attr5" name="orderline.item.attr5" type="CHAR(80)"/>
            </Collection>
        </Collection>
    </SelectDuplicateShift>
    <Grouping>
        <Collection path="/Report" collectionItemName="OnEveryRow">
            <GroupBy expression="orderline.orders.userid" name="orderline.orders.userid">
                <input-variable name="orderline.orders.userid" type="FGLString" xmlns="http://www.4js.com/2004/RTL"/>
            </GroupBy>
            <GroupBy expression="orderline.orders.orderid" name="orderline.orders.orderid">
                <input-variable name="orderline.orders.orderid" type="FGLNumeric" xmlns="http://www.4js.com/2004/RTL"/>
            </GroupBy>
            <GroupBy expression="orderline.lineitem.linenum" name="orderline.lineitem.linenum">
                <input-variable name="orderline.lineitem.linenum" type="FGLNumeric" xmlns="http://www.4js.com/2004/RTL"/>
            </GroupBy>
        </Collection>
    </Grouping>
    <Aggregations/>
</ReportSchemaTransform>
