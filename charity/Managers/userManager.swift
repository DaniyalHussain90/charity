//
//  userManager.swift
//  charity
//
//  Created by Daniyal Hussain on 13/09/2021.
//  Copyright © 2021 Daniyal Hussain. All rights reserved.
//

import Foundation
import Firebase
import FirebaseAuth

class userManager {

    static let shared = userManager()
    
    func createUser(user:User?,completion:@escaping(User?,String?)->Void){
            
        Auth.auth().createUser(withEmail: user?.name ?? "", password: user?.password ?? "") { authResult, error in
                
                if error == nil {
                    completion(user, nil)
                }else {
                    let authError = error?.localizedDescription
                    completion(nil,authError)
                }
            }
        }
    
        
    func socialLogin(credential:AuthCredential, provider: String,completion:@escaping(Bool?,String?)->Void){
        
        
        Auth.auth().signIn(with: credential) { [self] (authResult, error) in
            if error == nil {
//                let dataDic:[String:Any] = [
//                    "email"  : "\(authResult?.user.email ?? "")",
//                    "name"   : "\(authResult?.user.displayName ?? "")",
//                    "provider": "\(provider)",
//                    "imageURL" : "https://firebasestorage.googleapis.com/v0/b/trav-80401.appspot.com/o/no-image.png?alt=media&token=d5a0a91e-1396-4c7a-ad0b-049cae0ca778"
//                ]
                
                
                
//                self.db.collection("Users").addSnapshotListener { snap, error in
//                    if  error != nil {
//                        completion(nil, error?.localizedDescription)
//                    }else{
//                        for document in snap!.documents {
//
//                            if document.documentID == authResult?.user.uid ?? "" {
//                                print("user already exists")
//                                completion(true,nil)
//                            }else {
//                                self.db.collection("Users").document(authResult?.user.uid ?? "").setData(dataDic) {
//                                    err in
//                                    if let err = err
//                                    {
//                                        print("Error : \(err.localizedDescription)")
//                                        completion(false,err.localizedDescription)
//                                    }
//                                    else
//                                    {
//                                        print("Created")
//                                        completion(true,nil)
//                                    }
//                                }
//                            }
//
//                        }
//                    }
//                }
            }else{
                completion(false,error?.localizedDescription)
            }
        }
        
        
    }

    }
    
