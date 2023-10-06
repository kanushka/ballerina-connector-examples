import ballerina/http;
import ballerinax/googleapis.sheets;

service on new http:Listener(0) {

    sheets:Client sheetsEpLcl;

    @display {label: "Google Sheets API"}
    private sheets:Client sheetsEp;

    function init() returns error? {
        self.sheetsEpLcl = check new (config = {auth: {token: ""}});
        self.sheetsEp = check new (config = {auth: {token: ""}});
    }

    resource function get path() returns error? {
        check self.sheetsEpLcl->setCell(spreadsheetId = "", sheetName = "", a1Notation = "", value = 0);

        check self.sheetsEp->setCell(spreadsheetId = "", sheetName = "", a1Notation = "", value = 0);
        sheets:Spreadsheet openSpreadsheetByUrlResponse = check self.sheetsEp->openSpreadsheetByUrl(url = "");
    }
}
