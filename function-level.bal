import ballerina/http;
import ballerinax/googleapis.sheets;

public function boo() returns error? {
    sheets:Client sheetsEp = check new (config = {
        auth: {
            token: ""
        },
        timeout: 0
    });

    // with return type
    sheets:Spreadsheet openSpreadsheetByIdResponse = check sheetsEp->openSpreadsheetById(spreadsheetId = "");

    // wildcard return
    _ = check sheetsEp->openSpreadsheetById(spreadsheetId = "");

    // no return
    check sheetsEp->clearRange(spreadsheetId = "", sheetName = "", a1Notation = "");
}

public function woo() returns error? {

    sheets:Client|error sheetsEp = new (config = {
        auth: {
            token: ""
        }
    });

    if sheetsEp is error {
        http:Client httpEp = check new (url = "", config = {
            httpVersion: "2.0"
        });
        return;
    }

    // with return type
    error? removeSheetByName = sheetsEp->removeSheetByName(spreadsheetId = "", sheetName = "");

    // wildcard return
    _ = check sheetsEp->removeSheetByName(spreadsheetId = "", sheetName = "");

    if removeSheetByName is error {

    }
}
