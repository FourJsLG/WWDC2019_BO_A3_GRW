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

type VoteType record
    cand_info_id smallint,
    cand_info_fname varchar(100),
    cand_info_lname varchar(100),
    cand_votes_id smallint,
    cand_votes_selection smallint
end record

define a3_06
    ReportSettings
    = (report_name: "06_Templates.4rp",
    --= (report_name: NULL,
        preview_mode: true,
        dist_mode: false,
        viewer: "standard")

main

    open form f_select_output from "a3_form"
    display form f_select_output

    options input wrap, field order form

    input by name a3_06.selected_output
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

    let h1 =
        grw.report_settings(
            h1,
            a3_06.report_name,
            a3_06.selected_output,
            a3_06.preview_mode,
            a3_06.dist_mode,
            a3_06.viewer)

    if h1 is not null then
        call run_candidates_report(h1)
    else
        exit program
    end if

end function

function run_candidates_report(handler)

    define handler om.saxdocumenthandler
    define r_votes VoteType

    connect to ":memory:+driver='dbmsqt'"

    call create_tables()

    declare c_votes cursor for
        select  cand_info.*,
                cand_votes.*
            from cand_info, cand_votes
            where cand_info.cand_info_id = cand_votes.cand_votes_selection
        order by cand_info.cand_info_id, cand_votes.cand_votes_id

    start report report_candidates to xml handler handler
    foreach c_votes into r_votes.*
        output to report report_candidates(r_votes.*)
        if fgl_report_geterrorstatus() then
            display "fgl: stopping report, msg=\"",
                fgl_report_geterrorstring(),
                "\""
            exit foreach
        end if
    end foreach
    finish report report_candidates

    close c_votes

end function

report report_candidates(ballot)

    define ballot VoteType
    define total_votes_per_candidates, grand_total, has_voted smallint

    order external by ballot.cand_info_id, ballot.cand_votes_id
       
    format

        first page header
            let grand_total = 0

        before group of ballot.cand_info_id
            display "Candidate: " || ballot.cand_info_fname || ", " || ballot.cand_info_lname
            let total_votes_per_candidates = 0
        
        on every row
            let has_voted = 1
            let grand_total = grand_total + 1
            let total_votes_per_candidates = total_votes_per_candidates + 1
            print ballot.*, total_votes_per_candidates, grand_total, has_voted

end report

function create_tables()

    define i, v smallint

    display "creating tables..."

    whenever error continue
    drop table cand_info
    drop table cand_votes
    whenever error stop

    display "table cand_info"

    create table cand_info(
        cand_info_id smallint not null primary key,
        cand_info_fname varchar(100),
        cand_info_lname varchar(100))

    display "table cand_votes"
    create table cand_votes(
        cand_votes_id smallint not null primary key,
        cand_votes_selection smallint)

    whenever error continue
    execute immediate "alter table table cand_votes add contraint foreign key (cand_votes_selection) references cand_info (cand_info_id)"
    whenever error stop

    insert into cand_info values(0, 'Blank', 'Vote')
    insert into cand_info values(1, 'Steve', 'Jobs')
    insert into cand_info values(2, 'Bill', 'Gates')
    insert into cand_info values(3, 'Mark', 'Zuckerberg')
    insert into cand_info values(4, 'Jeff', 'Bezos')

    call util.Math.srand()
    
    for i = 1 to 1000
        let v = util.Math.rand(5)
        insert into cand_votes values(i, v)
    end for

end function
