schema "officestore"

public type OrderType record
    orders record like orders.*,
    account record like account.*,
    country record like country.*,
    lineitem record like lineitem.*,
    product record like product.*,
    category record like category.*,
    item record like item.*
end record