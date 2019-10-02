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
            paragraph string,
            rightnow date
        end record,
        sax_handler om.saxdocumenthandler

         if not fgl_report_loadcurrentsettings("07_Paragraph.4rp") then
                exit program
        end if
            
        let rec.paragraph = "Paragraphs are the building blocks of papers. Many students define paragraphs in terms of length: a paragraph is a group of at least five sentences, a paragraph is half a page long, etc. In reality, though, the unity and coherence of ideas among sentences is what constitutes a paragraph. A paragraph is defined as “a group of sentences or a single sentence that forms a unit” (Lunsford and Connors 116). Length and appearance do not determine whether a section in a paper is a paragraph. For instance, in some styles of writing, particularly journalistic styles, a paragraph can be just one sentence long. Ultimately, a paragraph is a sentence or group of sentences that support one main idea. In this handout, we will refer to this as the “controlling idea,” because it controls what happens in the rest of the paragraph."
        let rec.rightnow = today

        call fgl_report_selectdevice("PDF")

        let sax_handler = fgl_report_commitcurrentsettings()
        start report paragraphreport to xml handler sax_handler
        output to report paragraphreport(rec.paragraph, rec.rightnow)
        finish report paragraphreport

end main

report paragraphreport(paragraph, rightnow)

    define paragraph string
    define rightnow date
    format
        on every row
            print paragraph, rightnow
            
end report
