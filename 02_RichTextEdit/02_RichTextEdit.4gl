# FOURJS_START_COPYRIGHT(U,2018)
# Property of Four Js*
# (c) Copyright Four Js 2018, 2019. All Rights Reserved.
# * Trademark of Four Js Development Tools Europe Ltd
#   in the United States and elsewhere
#
# Four Js and its suppliers do not warrant or guarantee that these samples are
# accurate and suitable for your purposes.
# Their inclusion is purely for information purposes only.
# FOURJS_END_COPYRIGHT

import fgl common

main
    define
        rec record
            richtext string,
            info string,
            rightnow date
        end record,
        sax_handler om.saxdocumenthandler

    options input wrap, field order form

    open form f1 from "02_richtextedit"
    display form f1
    let rec.richtext =
        "<h1 style=\"font-size:13px;text-align:center\"><span style=\"color:#0066cc;font-size:34px\">vegan tikka masala</span></h1><p style=\"font-size:13px;text-align:center\"><br/></p><p style=\"font-size:13px;text-align:center\"><br/></p><p style=\"font-size:13px;text-align:center\"><br/></p><p style=\"font-size:13px;text-align:center\"><img class=\"ql-image\" src=\"201909171437\"/></p><p style=\"font-size:13px;text-align:center\"><br/></p><p style=\"font-size:13px;text-align:center\"><br/></p><p><br/><strong style=\"font-size:20px\"><u>prep time:</u></strong><span style=\"font-size:20px\"> 15 minutes????????</span><strong style=\"font-size:20px\"><u>cook time:</u></strong><span style=\"font-size:20px\"> 4 hours????????</span><strong style=\"font-size:20px\"><u>total time:</u></strong><span style=\"font-size:20px\"> 4 hours 15 minutes</span><br/><strong style=\"font-size:20px\"><u>yield:</u></strong><span style=\"font-size:20px\">????4-6 servings????????????</span><strong style=\"font-size:20px\"><u>cuisine:</u></strong><span style=\"font-size:20px\"> indian inspired, vegan, american, gluten-free</span><br/></p><h2 style=\"font-size:13px\"><br/><span style=\"font-size:24px\">description</span></h2><p><br/><span style=\"font-size:16px\">slow cooker?vegan tikka masala! this?slow cooker?meal is so good and perfect for healthy weeknight dinners. if you love indian food, then you?ll love this simple chickpea tikka masala. chickpeas and tofu in a fragrant tomato-coconut sauce.</span><br/></p><h2 style=\"font-size:13px\"><span style=\"font-size:24px\">ingredients</span></h2><p></p><ul><li style=\"font-size:13px\"><span style=\"font-size:16px\">1 large onion, finely chopped</span></li><li style=\"font-size:13px\"><span style=\"font-size:16px\">4 garlic cloves, minced</span></li><li style=\"font-size:13px\"><span style=\"font-size:16px\">2 tablespoons freshly grated ginger</span></li><li style=\"font-size:13px\"><span style=\"font-size:16px\">1 (15 oz) can tomato sauce</span></li><li style=\"font-size:13px\"><span style=\"font-size:16px\">2 tablespoons olive oil</span></li><li style=\"font-size:13px\"><span style=\"font-size:16px\">1 tablespoon garam masala</span></li><li style=\"font-size:13px\"><span style=\"font-size:16px\">2 teaspoons ground cumin</span></li><li style=\"font-size:13px\"><span style=\"font-size:16px\">1 teaspoon ground coriander</span></li><li style=\"font-size:13px\"><span style=\"font-size:16px\">2 teaspoons smoked paprika</span></li><li style=\"font-size:13px\"><span style=\"font-size:16px\">1 teaspoon ground turmeric</span></li><li style=\"font-size:13px\"><span style=\"font-size:16px\">1&#x2f;4 teaspoon ground cinnamon</span></li><li style=\"font-size:13px\"><span style=\"font-size:16px\">1&#x2f;2 teaspoon ground cayenne pepper</span></li><li style=\"font-size:13px\"><span style=\"font-size:16px\">1&#x2f;2 teaspoon ground black pepper</span></li><li style=\"font-size:13px\"><span style=\"font-size:16px\">1 teaspoon salt</span></li><li style=\"font-size:13px\"><span style=\"font-size:16px\">1 (14 oz) package firm tofu, drained and pressed and cubed</span></li><li style=\"font-size:13px\"><span style=\"font-size:16px\">1 (15 oz) can garbanzo beans, drained and rinsed</span></li><li style=\"font-size:13px\"><span style=\"font-size:16px\">1 bay leaf</span></li><li style=\"font-size:13px\"><span style=\"font-size:16px\">1 cup full-fat canned coconut milk</span></li><li style=\"font-size:13px\"><span style=\"font-size:16px\">2 tablespoons corn starch</span></li><li style=\"font-size:13px\"><span style=\"font-size:16px\">1&#x2f;2 large lemon, juiced</span></li><li style=\"font-size:13px\"><span style=\"font-size:16px\">cooked rice, for serving</span></li></ul><p></p><h2 style=\"font-size:13px\"><span style=\"font-size:24px\">instructions</span></h2><p></p><ol><li style=\"font-size:13px\"><span style=\"font-size:16px\">lightly grease the inside of your slow cooker?with a bit of olive oil or spray and set aside.</span></li><li style=\"font-size:13px\"><span style=\"font-size:16px\">combine all ingredients from onion to salt together until well-combined.</span></li><li style=\"font-size:13px\"><span style=\"font-size:16px\">place the tofu and chickpeas in the base of the slow cooker?and pour the sauce on top. gently mix together until everything is combined, making sure the tofu and chickpeas are well coated.</span></li><li style=\"font-size:13px\"><span style=\"font-size:16px\">place the bay leaf on top and cover, cooking for 4 hours on high (or 8 hours on low)</span></li><li style=\"font-size:13px\"><span style=\"font-size:16px\">when done, in a small bowl combine the coconut milk, cornstarch and gently stir into the mixture. cook for an additional 20-30 minutes until thickened. (i use this time to cook the rice&#x2f;naan!)</span></li><li style=\"font-size:13px\"><span style=\"font-size:16px\">add in the lemon juice and stir once more before serving. i love this on steamed rice, some naan and maybe a little extra chopped cilantro!</span></li></ol><p></p><h2 style=\"font-size:13px\"><span style=\"font-size:24px\">notes</span></h2><p><br/><span style=\"font-size:16px\">this makes 4 large servings or 6 normal servings, especially if you are serving with rice and naan. but! leftovers can be stored in an airtight container in the fridge for up to 5 days, and the leftovers are so good for lunch.</span><br/><br/></p><p style=\"font-size:13px;text-align:center\"><br/></p>"

    input by name rec.richtext, rec.info
        attributes(unbuffered, without defaults)
        on action get_cont attributes(text = "get content")
            let rec.info = rec.richtext
        on action clear attributes(text = "clear")
            let rec.richtext = null
            let rec.info = "text cleared."
        on action printreport attributes(text = "print report")
            if not fgl_report_loadcurrentsettings("02_richtextedit.4rp") then
                exit program
            end if
            let rec.rightnow = today
            if isgdc() then
                call fgl_report_selectdevice("svg")
            else
                call fgl_report_selectdevice("browser")
                call ui.interface.frontcall(
                    "standard", "launchurl", [fgl_report_getbrowserurl()], [])
            end if
            let sax_handler = fgl_report_commitcurrentsettings()
            start report richtextreport to xml handler sax_handler
            output to report richtextreport(rec.richtext, rec.rightnow)
            finish report richtextreport
    end input

end main

report richtextreport(richtext, rightnow)
    define richtext string
    define rightnow date
    format
        on every row
            print richtext, rightnow
end report
