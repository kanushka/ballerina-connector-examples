import ballerina/http;

service on new http:Listener(0) {

    function init() returns error? {
        self.userEp = check new (url = "/users");
    }

    resource function get members() returns json|error? {
        // function level endpoint
        // http:Client payEp = check new (url = "/pay");
        // json getResponse = check userEp->/;
        // json getResponse1 = check self.contactEp->/;
        // function level endpoint
                // http:Client payEp = check new (url = "/pay");
                // json getResponse = check userEp->/;
                // json getResponse1 = check self.contactEp->/;
                json postResponse = check self.userEp->/.post(message = ());
    }

    // service level endpoint
    http:Client userEp;
}

