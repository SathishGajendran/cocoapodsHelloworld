

import Foundation
import Alamofire


public class AU {
    
    public var AppId: String = "";
    public var param1: String = "";
    
    public init(_ config: NSDictionary){
        self.AppId = config.value(forKey: "AppId") as! String
        self.param1 = config.value(forKey: "param1") as! String
    }
    
    public func send(_ data: NSDictionary) {
        
//        print(data);
//        print(self.AppId)
        
        let payload = data.value(forKey: "payload")! as! NSDictionary;
        
        let headers: HTTPHeaders = [
            "AppId": self.AppId
        ]
        
//        print(data.value(forKey: "param2")!);
//        print(param2.value(forKey: "url")!)
        
        
        let parameters: Parameters = [
            "data":[
                "param1":self.param1,
                "param2":[
                            [
                                "param3":data.value(forKey: "param3")!,
                                "param4":data.value(forKey: "param4")!,
                                "param5":data.value(forKey: "param5")!,
                                "param6":data.value(forKey: "param6")!,
//                                "payload":[
//                                    "param7":payload.value(forKey: "param7")!,
//                                    "param8":payload.value(forKey: "param8")!,
//                                    "param9":payload.value(forKey: "param9")!
//                                ]
                                "payload":payload
                            ]
                        ]
            ]
        ];
        
//        print(parameters);
        
        Alamofire.request("https://example.com/data", method: .post, parameters: parameters, headers:headers).responseJSON { response in
//            let statusCode = response.response?.statusCode;
            print(response)
        }
        
    }            
    }
}
