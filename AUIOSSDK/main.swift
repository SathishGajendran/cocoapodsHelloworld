

import Foundation
import Alamofire


public class AU {
    
    public var testVar: String;
    
    public init(){
        self.testVar = "value";
    }
    
    public func sendEvent() {
        let headers: HTTPHeaders = [
            "PETRACKER-TRACKING-ID": "PE-APP-1847-2"
        ]
        
        let parameters: Parameters = [
            "data":[
                "originatingSystemCode":"petracker",
                "events":[
                [
                "messageTypeCode":"pageview",
                "messageVersion":"v4",
                "actionType":"create",
                "namespace":"gsetracker",
                "payload":[
                "url":"ASD34",
                "userID":"anonymous",
                "useragent":"Mozilla%2F5.0%20(Windows%20NT%206.1%3B%20Win64%3B%20x64)%20AppleWebKit%2F537.36%20(KHTML%2C%20like%20Gecko)%20Chrome%2F61.0.3163.100%20Safari%2F537.36"
                ]
                ]
                ]
            ]
        ];
        
        Alamofire.request("https://testapi.english.com/autobahn/collect/events", method: .post, parameters: parameters, headers:headers).responseJSON { response in
            print(response)
//            return response
        }
        
    }
}
