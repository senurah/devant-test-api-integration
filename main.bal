import ballerina/http;

listener http:Listener httpDefaultListener = http:getDefaultListener();

service /countries on httpDefaultListener {
    resource function get data() returns error|json|http:InternalServerError {
        do {
            json response = check httpClient->get("/countries");
            return response;
        } on fail error err {
            // handle error
            return error("unhandled error", err);
        }
    }
}
