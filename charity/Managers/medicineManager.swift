//
//  medicineManager.swift
//  charity
//
//  Created by Daniyal Hussain on 20/09/2021.
//  Copyright © 2021 Daniyal Hussain. All rights reserved.
//

import Foundation
import Alamofire

class medicineManager {
    
    static let shared = medicineManager(baseUrl: "https://api.fda.gov/drug/event.json")
//    var https://api.fda.gov/drug/event.json?search=receivedate:[20040101+TO+20081231]&limit=10
    fileprivate var baseUrl = "https://api.fda.gov/drug/event.json"
    init(baseUrl: String) {
        self.baseUrl = baseUrl
    }
    
    func  getAllMedicineNameForm(limit: Int,completion:@escaping([String])->Void){

        var arr = [String]()
        
        let params = ["api_key": "ZqcLdmkS6ye8xtZo8lxk7I6fJob6FCmpk6erzmDf", "search":"receivedate:[20040101+TO+20081231]","limit": "\(limit)"]
        AF.request(self.baseUrl+"?search=receivedate:[20040101+TO+20081231]&limit=\(limit)").responseJSON { response in
            print("Response = \(response.value)")
            let value = response.value as? [String:Any]
            let meta = value?["meta"] as? [String:Any]
            let result = value?["results"] as? [[String:Any]]
            for item in result ?? []{
            
                if let patient = item["patient"] as? [String:Any] {
                    if let drug = patient["drug"] as? [[String:Any]] {
                        for item in drug {
                            let medicinalproduct = item["medicinalproduct"] as! String
                            print(medicinalproduct)
                            arr.append(medicinalproduct)
                            completion(arr)
                        }
                    }
            
                    
                }
//                print("DrugValue = \(drug ?? [])")
            }
            

        }
//        AF.request(self.baseUrl+"?search=receivedate:[20040101+TO+20081231]&limit=10", method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil, interceptor: nil, requestModifier: nil).response { DataResponse in
//            guard let data = DataResponse.data else {return}
//            do {
//                let medicine = try JSONDecoder().decode([Medicine].self, from: data)
//
//                print("medicine == \(Medicine.self)")
//
//            } catch {
//                print("error decoding == \(error)")
//            }
//
//        }
        
    }

}
