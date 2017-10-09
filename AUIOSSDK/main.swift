

import Foundation
import Alamofire


public class AU {
    
    public var trackerId: String = "";
    public var originatingSystemCode: String = "";
    
    public init(_ config: NSDictionary){
        self.trackerId = config.value(forKey: "trackerId") as! String
        self.originatingSystemCode = config.value(forKey: "originatingSystemCode") as! String
    }
    
    public func sendEvent(_ data: NSDictionary) {
        
//        print(data);
//        print(self.trackerId)
        
        let payload = data.value(forKey: "payload")! as! NSDictionary;
        
        let headers: HTTPHeaders = [
            "PETRACKER-TRACKING-ID": self.trackerId
        ]
        
//        print(data.value(forKey: "actionType")!);
//        print(payload.value(forKey: "url")!)
        
        
        let parameters: Parameters = [
            "data":[
                "originatingSystemCode":self.originatingSystemCode,
                "events":[
                            [
                                "messageTypeCode":data.value(forKey: "messageTypeCode")!,
                                "messageVersion":data.value(forKey: "messageVersion")!,
                                "actionType":data.value(forKey: "actionType")!,
                                "namespace":data.value(forKey: "namespace")!,
//                                "payload":[
//                                    "url":payload.value(forKey: "url")!,
//                                    "userID":payload.value(forKey: "userID")!,
//                                    "useragent":payload.value(forKey: "useragent")!
//                                ]
                                "payload":payload
                            ]
                        ]
            ]
        ];
        
//        print(parameters);
        
        Alamofire.request("https://testapi.english.com/autobahn/collect/events", method: .post, parameters: parameters, headers:headers).responseJSON { response in
//            let statusCode = response.response?.statusCode;
            print(response)
        }
        
    }
    
    public func sendActivity(_ data: NSDictionary) {
        
        //        print(data);
        //        print(self.trackerId)
        
        let payload = data.value(forKey: "payload")! as! NSDictionary;
        
        let headers: HTTPHeaders = [
            "PETRACKER-TRACKING-ID": self.trackerId
        ]
        
        //        print(data.value(forKey: "actionType")!);
        //        print(payload.value(forKey: "url")!)
        
        
        let parameters: Parameters = [
            "data":[
                "originatingSystemCode":self.originatingSystemCode,
                "activities":[
                    [
                        "messageTypeCode":data.value(forKey: "messageTypeCode")!,
                        "messageVersion":data.value(forKey: "messageVersion")!,
                        "namespace":data.value(forKey: "namespace")!,
                        "payload":payload
                    ]
                ]
            ]
        ];
        
//        print(parameters);
        
        Alamofire.request("https://testapi.english.com/autobahn/collect/activities", method: .post, parameters: parameters, headers:headers).responseJSON { response in
            //            let statusCode = response.response?.statusCode;
            print(response)
        }
        
    }
}
