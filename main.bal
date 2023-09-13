import ballerinax/salesforce;

import ballerina/http;

service on new http:Listener(0) {

    resource function get members() returns Member[]|error {

        salesforce:Client salesforceEp = check new (config = {
            baseUrl: "",
            auth: {
                refreshUrl: "",
                refreshToken: "",
                clientId: "",
                clientSecret: ""
            }
        });
    }
}

type Member record {
};
