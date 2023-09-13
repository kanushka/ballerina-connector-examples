import ballerinax/googleapis.sheets;
import ballerina/http;

service / on new http:Listener(9090) {

    # A resource for generating greetings
    # + name - the input string name
    # + return - string name with hello message or error
    resource function get greeting(string name) returns string|error {

        // sample response
        sheets:Client sheetsEp = check new (config = {
            auth: {
                token: ""
            }
        });

        // with return
        sheets:Spreadsheet openSpreadsheetByIdResponse = check sheetsEp->openSpreadsheetById(spreadsheetId = "");

        // wildcard return
        _ = check sheetsEp->openSpreadsheetById(spreadsheetId = "");

        //  no return - error
        check sheetsEp->openSpreadsheetById(spreadsheetId = "");

        return "Hello, " + name;
    }

    # A resource for generating users
    # + name - the input string name
    # + return - string name with hello message or error
    resource function get users(string name) returns string|error {

        // sample response
        sheets:Client|error sheetsEp = new (config = {
            auth: {
                token: ""
            },
            httpVersion: "2.0"
        });
        if sheetsEp is error {

            return "error";
        }

        // with return type
        sheets:Spreadsheet|error openSpreadsheetByIdResponse = sheetsEp->openSpreadsheetById(spreadsheetId = "");

        // wildcard return
        _ = check sheetsEp->openSpreadsheetById(spreadsheetId = "");

        //  no return - error
        check sheetsEp->openSpreadsheetById(spreadsheetId = "");

        return "Hello, " + name;
    }
}
