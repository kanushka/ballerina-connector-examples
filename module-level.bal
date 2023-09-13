import ballerinax/googleapis.sheets;

public function foo() returns error? {

    // with return type
    sheets:Spreadsheet openSpreadsheetByIdResponse = check sheetsEp->openSpreadsheetById(spreadsheetId = "");

    // wildcard return
    _ = check sheetsEp->openSpreadsheetById(spreadsheetId = "");

    // no response
    // no response
        check sheetsEp->clearRange(spreadsheetId = "", sheetName = "", a1Notation = "");

}

sheets:Client sheetsEp = check new (config = {
    auth: {
        token: ""
    },
    timeout: 0
});
