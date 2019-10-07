--import fgl common
import security

schema "officestore"

public type ReportSettings record
    report_name string,
    selected_output string,
    preview_mode boolean, -- true or false, default true
    dist_mode boolean, -- true or false, default false
    viewer string -- custom or else, default else
end record

function report_settings(
    handler, report_name, selected_output, preview_mode, dist_mode, viewer)

    define handler om.SaxDocumentHandler
    define preview_mode boolean
    define report_name string
    define selected_output string
    define dist_mode boolean
    define viewer string

    if selected_output == "ReportViewer" then
        if isgdc() then
            let selected_output = "SVG"
        else
            let selected_output = "Browser"
        end if
    end if

    if fgl_report_loadcurrentsettings(report_name) then
        call fgl_report_selectdevice(selected_output)
        call fgl_report_selectpreview(preview_mode)

        if selected_output == "Browser" then
            call viewer_settings(viewer)
        end if

        call dist_mode_settings(dist_mode)

        let handler = fgl_report_commitcurrentsettings()
    end if

    return handler

end function --report_settings

function viewer_settings(viewer)

    define viewer string
    define uuid string

    if viewer = "custom" then
        let uuid = security.randomgenerator.createuuidstring()
        call fgl_report_setbrowserdocumentdirectory(
            fgl_getenv("GRE_PUBLIC_DIR") || "/" || uuid)
        call fgl_report_setbrowserfontdirectory(fgl_getenv("GRE_PUBLIC_DIR"))
        call fgl_report_setbrowserdocumentdirectoryurl(
            fgl_getenv("GRE_PUBLIC_URL_PREFIX") || "/" || uuid)
        call fgl_report_setbrowserfontdirectoryurl(
            fgl_getenv("GRE_PUBLIC_URL_PREFIX"))
        call ui.interface.frontcall(
            "standard",
            "launchurl",
            [fgl_getenv("GRE_REPORT_VIEWER_URL_PREFIX")
                || "/myviewer.html?reportId="
                || uuid
                || "&privateUrlPrefix="
                || fgl_getenv("GRE_PUBLIC_URL_PREFIX")],
            [])
    else
        call ui.interface.frontcall(
            "standard", "launchurl", [fgl_report_getbrowserurl()], [])
    end if

end function

function dist_mode_settings(dist_mode boolean)

    if (dist_mode) then
        call fgl_report_configureDistributedProcessing("localhost", 1974)
        call fgl_report_configureDistributedEnvironment(
            null,
            null,
            "C:\\Users\\LaurentGalais\\Desktop\\WWDC2019_BO_A3_GRW\\03_Distributed_Mode\\dist_mode",
            null)
        --call fgl_report_configureDistributedURLPrefix(...)
    end if

end function
