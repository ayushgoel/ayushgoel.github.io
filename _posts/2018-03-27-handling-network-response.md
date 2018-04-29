---
tags: code
---

Network query-responses are an integral part of software these days. We rely for configurations, user data, updates etc etc on data from network. 

Aim for code that handles a response (success or failure) should be:

1. It should handle error cases which include:
    1. Status code not 200 OK
        
       ```
       if (HTTPResponse.statusCode != 200) { // Add more acceptable status codes
         NSLog(@"Got non 200 status for request %@", URL);
         [self handleNonOkStatusForResponse:HTTPResponse];
         return;
       }
       ```
       
    2. Response type is not what was expected for eg receiving XML when JSON was expected
        
       ```
       if (![response.MIMEType isEqualToString:@"application/json"]) { // Replace with acceptable content type
         NSLog(@"Response type is not what was expected %@", response.MIMEType);
         [self handleIncorrectMIMEForResponse:response];
         return;
       }
       ```
       
    3. Can/could not be parsed
    4. Response contains error data
    5. Essential data in response missing
        
       ```
       NSDictionary *responseObject = [self parsedObjectFromData:data];
       if (responseObject == nil) {
         NSLog(@"Response data could not be parsed from data: %@", data);
         return;
       }
       ```
2. Readability should not be compromised, given a lot of error cases need to be handled.

Note: `parsedObjectFromData:` would handle the combined responsibility of validating and parsing the data. The two operations could be split into two functions but would mean repeated statements. Think of this function as an initialiser. If the input is valid, the response object is initialised and returned, otherwise nil is returned.

The complete function can be seen in the gist {% gist https://gist.github.com/ayushgoel/852ce7ee5c969521efa0039623fbc635 %}
