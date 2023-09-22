import ballerinax/twitter;
import ballerinax/googleapis.sheets;
import ballerina/http;

service on new http:Listener(0) {
    // endpoint declarion
    http:Client lclHttpEp;
    // endpoint declation with access modifire
    private http:Client pvtHttpEp;
    // endpoint declation with display annotation
    @display {
        label: "Http endpoint with display annotation"
    }
    http:Client antHttpEp;
    // endpiont declation with access modifire and display annotation
    @display {
        label: "Http endpoint with display annotation and access modifier"
    }
    public http:Client publHttpEp;

    @display {
        label: "Google Sheets API"
    }
    private sheets:Client sheetsEp;

    function init() returns error? {
        self.lclHttpEp = check new (url = "");
        self.pvtHttpEp = check new (url = "");
        self.antHttpEp = check new (url = "");
        self.publHttpEp = check new (url = "");
        self.sheetsEp = check new (config = {
            auth: {
                token: ""
            }
        });
    }

    resource function get path() returns error? {
        json get = check self.lclHttpEp->get("/users");
        json pvtGet = check self.pvtHttpEp->get("/users");
        json anttGet = check self.antHttpEp->get("/users");
        json pblcGet = check self.publHttpEp->get("/users");

        check self.sheetsEp->setCell(spreadsheetId = "", sheetName = "", a1Notation = "", value = 0);
        sheets:Spreadsheet openSpreadsheetByUrlResponse = check self.sheetsEp->openSpreadsheetByUrl(url = "");
    }
}

