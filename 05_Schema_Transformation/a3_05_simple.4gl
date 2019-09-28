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

import util
import fgl common
import fgl grw

type SimpleType record
    simple_key smallint,
    simple_id smallint,
    simple_value int
end record

define a3_06
    ReportSettings
    = (report_name: "a3_05_simple.4rp",
        selected_output: "Transformed XML",
        preview_mode: true,
        dist_mode: false,
        viewer: "standard")

main

   menu "a3_05_simple"
   
        on action preview
            call preview_report()

        on action quit
            exit input

    end menu

end main

function preview_report()

    define h1 om.SaxDocumentHandler

    let h1 =
        grw.report_settings(
            h1,
            a3_06.report_name,
            a3_06.selected_output,
            a3_06.preview_mode,
            a3_06.dist_mode,
            a3_06.viewer)

    if h1 is not null then
        call run_simple_report(h1)
    else
        exit program
    end if

end function

function run_simple_report(handler)

    define handler om.saxdocumenthandler
    define r_simple SimpleType

    connect to ":memory:+driver='dbmsqt'"

    call create_tables()

    declare c_simple cursor for
        select  cand_info.*,
                cand_votes.*
            from cand_info, cand_votes
            where cand_info.cand_info_id = cand_votes.cand_votes_selection
        order by cand_info.cand_info_id, cand_votes.cand_votes_id

    start report report_candidates to xml handler handler
    foreach c_simple into r_simple.*
        output to report report_candidates(r_simple.*)
        if fgl_report_geterrorstatus() then
            display "fgl: stopping report, msg=\"",
                fgl_report_geterrorstring(),
                "\""
            exit foreach
        end if
    end foreach
    finish report report_candidates

    close c_simple

end function

report report_candidates(simple)

    define simple SimpleType
       
    format
    
        on every row
            print simple.*

end report

function create_tables()

    define i, v smallint

    display "creating tables..."

    whenever error continue
    drop table tb_simple
    whenever error stop

    display "table tb_simple"

    create table tb_simple(
        simple_key smallint not null primary key,
        simple_id smallint,
        simple_value int)

    insert into cand_info values(1, 1, 50)
    insert into cand_info values(2, 1, 150)
    insert into cand_info values(3, 1, 100)
    insert into cand_info values(4, 1, 50)
    insert into cand_info values(5, 1, 100)
    insert into cand_info values(5, 1, 150)
    insert into cand_info values(5, 1, 100)
    insert into cand_info values(5, 1, 100)
    insert into cand_info values(5, 1, 100) 
    insert into cand_info values(5, 1, 100)

end function
