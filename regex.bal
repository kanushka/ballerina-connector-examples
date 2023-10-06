import ballerina/io;

public function main() returns error? {
    var regexr = re `^test all\s*(?:resources?|endpoints?|paths?)?.?$`;
    string str1 = "test all resource";
    string str2 = "test all endpoints.";
    string str3 = "test all paths?";
    string str4 = "test all";
    string str5 = "test all resources and endpoints";
    string str6 = "test all paths and resources";

    io:println(str1.matches(regexr)); // true
    io:println(str2.matches(regexr)); // true
    io:println(str3.matches(regexr)); // true
    io:println(str4.matches(regexr)); // true
    io:println(str5.matches(regexr)); // false
    io:println(str6.matches(regexr)); // false

}
