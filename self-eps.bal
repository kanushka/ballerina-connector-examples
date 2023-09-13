import ballerinax/googleapis.sheets;
import ballerina/http;

service on new http:Listener(0) {
    sheets:Client sheetsEp;

    function init() returns error? {
        self.sheetsEp = check new (config = {
            auth: {
                token: ""
            }
        });
    }

    resource function get path() returns error? {
        check self.sheetsEp->setCell(spreadsheetId = "", sheetName = "", a1Notation = "", value = 0);
        check self.sheetsEp->setRange(spreadsheetId = "", sheetName = "", range = {
            a1Notation: "",
            values: []
        });
    sheets:Spreadsheet openSpreadsheetByUrlResponse = check self.sheetsEp->openSpreadsheetByUrl(url = "");
    }
}

