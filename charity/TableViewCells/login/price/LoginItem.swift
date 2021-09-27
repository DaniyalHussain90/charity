//
//  LoginItem.swift
//  charity
//
//  Created by Daniyal Hussain on 13/09/2021.
//  Copyright © 2021 Daniyal Hussain. All rights reserved.
//

import UIKit
import FBSDKCoreKit
import FBSDKLoginKit
import FirebaseAuth
import GoogleSignIn
import Firebase


class LoginItem: UITableViewCell, LoginButtonDelegate {
  
    
    
    @IBOutlet weak var textView: UITextField!
    @IBOutlet weak var messgeView: UIImageView!
    
    @IBOutlet weak var textView2: UITextField!
    
    @IBOutlet weak var lockView: UIImageView!
    
    @IBOutlet weak var fcebokButton: FBButton!
    
    @IBOutlet weak var googleButton: UIButton!
    
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var twitterButton: UIButton!
    @IBOutlet weak var registerButton: UIButton!
    @IBOutlet weak var termsButton: UIButton!
    
    var myvc:LoginVC?

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code


}
    @IBAction func fbPressed(_ sender: Any) {
        
//        func fbPressed(_ loginButton: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
//                    if error != nil {
//                    print(error)
//                        return
//                    }
        
        myvc!.HandleCustomFblogin()
                    showEmailAddresss()
//
//                    print("successfully logged in with facebook...")
//
//                   fbPressed.delegate = self
              }
    
    
    @IBAction func googleButton(_ sender: Any) {
        
        
    
    }
    
//        showEmailAddresss()
    
    func showEmailAddresss() {
        let accessToken =  AccessToken.current
        guard let accessTokenString = accessToken?.tokenString else
        { return }
        let credentails = FacebookAuthProvider.credential(withAccessToken: accessTokenString)
        
        Auth.auth().signIn(with: credentails) { (user, error) in
             if error  != nil {
                print("something went wrong with out FB user: ", error.debugDescription ?? "")
                return
                
                print("SuccessFully logged in with our user: ", user ?? "")
            }
            GraphRequest(graphPath: "/me", parameters: ["friends" : "id, name, email"]).start { (connection,  result, error) in
                        if error != nil {
                            print("failed to start graph request:", error ?? "")
                            return
                        }
                            print(result ?? "")
                    }

        }
    }
    
//    func showEmailAddresss() {
//        let accessToken = AccessToken.current
//                 let accessTokenString = accessToken?.tokenString
//
//                let credentails = FacebookAuthProvider.credential(withAccessToken: accessTokenString ?? "")
//
//    Auth.auth().signIn(with: credentails) { (user, error) in
//    if error  != nil {
//        print("something went wrong with out FB user: ", error.debugDescription )
//                        return
//                        print("SuccessFully logged in with our user: ", user ?? "")
//                    }
//                    GraphRequest(graphPath: "/me", parameters: ["friends" : "id, name, email"]).start { (connection,  result, error) in
//                                if error != nil {
//                                    print("failed to start graph request:", error ?? "")
//                                    return
//                                }
//                                    print(result ?? "")
//                            }
//                }
//    }

    func loginButton(_ LoginItem: FBLoginButton, didCompleteWith result: LoginManagerLoginResult?, error: Error?) {
            print("successfully")
            return
        }
    
    
    func loginButtonDidLogOut(_ loginButton: FBLoginButton) {
        print("log out")
    }

    
}

