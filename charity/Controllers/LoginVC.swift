//
//  LoginVC.swift
//  charity
//
//  Created by Daniyal Hussain on 10/09/2021.
//  Copyright © 2021 Daniyal Hussain. All rights reserved.
//
import FBSDKCoreKit
import FBSDKLoginKit
import FirebaseAuth
import GoogleSignIn
import Firebase
import CryptoKit
import UIKit
import AuthenticationServices
import Toast_Swift

class LoginVC: UIViewController, UITableViewDelegate, UITableViewDataSource, ASAuthorizationControllerDelegate, ASAuthorizationControllerPresentationContextProviding {

    @IBOutlet weak var tableView5: UITableView!
    
    fileprivate var currentNonce: String?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView5.delegate = self
        tableView5.dataSource = self
        
        
        
        let nibcell=UINib(nibName: "LoginItem", bundle: nil)
        tableView5.register(nibcell, forCellReuseIdentifier: "LoginItem")
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView5.dequeueReusableCell(withIdentifier: "LoginItem") as? LoginItem
        cell?.selectionStyle = .none
        cell?.separatorInset = .zero
        cell?.googleButton.addTarget(self, action: #selector(googlePressed(sender:)), for: .touchUpInside)
        cell?.twitterButton.addTarget(self, action: #selector(appleButton(sender:)), for: .touchUpInside)

        cell?.loginButton.addTarget(self, action: #selector(loginButton(sender:)), for: .touchUpInside)
        cell?.myvc = self
        return cell!
        
    }
    @objc func FBbutton  (sender: UIButton){
        let cell = tableView5.cellForRow(at: IndexPath(row: 0, section: 0)) as! LoginItem
        let user = User(name: cell.textView.text, password: cell.textLabel?.text, UId: "")
        userManager.shared.createUser(user: user) { user, err in
            if err != nil {
                
            }
            
            
        }
    }
    @objc func loginButton (sender: UIButton){
        let cell = tableView5.cellForRow(at: IndexPath(row: 0, section: 0)) as! LoginItem
        if cell.textView.text != "" && cell.textView2.text != ""{
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let myvc = storyBoard.instantiateViewController(withIdentifier: "welcomeVC") as! welcomeVC
            self.navigationController?.pushViewController(myvc, animated: true)
       
            
        }
        else{
            self.view.makeToast("Please Enter Email/Password")

        }
        

    }
    
    @objc func HandleCustomFblogin(){
               
               LoginManager().logIn(permissions: ["email", "public_profile"], from: self)
               { (Result,Error) in
                   if Error != nil {
                       print("Custom FB Login failed", Error)
                       return
                   }
                   self.showEmailAddresss()
                   
               }
           }
    
    func showEmailAddresss() {
        let accessToken =  AccessToken.current
        guard let accessTokenString = accessToken?.tokenString else
        { return }
        let credentails = FacebookAuthProvider.credential(withAccessToken: accessTokenString)
        
        Auth.auth().signIn(with: credentails) { (user, error) in
             if error  != nil {
//                print("something went wrong with out FB user: ", error.debugDescription )
             }
              
            let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
            let myvc = storyBoard.instantiateViewController(withIdentifier: "welcomeVC") as! welcomeVC
            self.navigationController?.pushViewController(myvc, animated: true)
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
    
//    google code
    
    @objc func googlePressed  (sender: UIButton){
        let cell = tableView5.cellForRow(at: IndexPath(row: 0, section: 0)) as! LoginItem
        let user = User(name: cell.textView.text, password: cell.textLabel?.text, UId: "")
        userManager.shared.createUser(user: user) { user, err in
            if err != nil {
                guard let clientID = FirebaseApp.app()?.options.clientID  else { return }

                // Create Google Sign In configuration object.
                let config = GIDConfiguration(clientID: clientID)

                // Start the sign in flow!
                GIDSignIn.sharedInstance.signIn(with: config, presenting: self) { [unowned self] user, error in

                    if error != nil {
                    // ...
                    return
                  }

                  guard
                    let authentication = user?.authentication,
                    let idToken = authentication.idToken
                  else {
                    return
                  }

                  let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                                 accessToken: authentication.accessToken)

                    
                    userManager.shared.socialLogin(credential: credential, provider: "google") { success, error in
                        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                        let myvc = storyBoard.instantiateViewController(withIdentifier: "welcomeVC") as! welcomeVC
                        self.navigationController?.pushViewController(myvc, animated: true)
                         print("SuccessFully logged in with our user: ", user ?? "")
                    }
                    Auth.auth().signIn(with: credential) { authResult, error in
                        if let error = error {
                          let authError = error as NSError
//                          if isMFAEnabled, authError.code == AuthErrorCode.secondFactorRequired.rawValue {
                            // The user is a multi-factor user. Second factor challenge is required.
//                            let resolver = authError
//                              .userInfo[AuthErrorUserInfoMultiFactorResolverKey] as! MultiFactorResolver
//                            var displayNameString = ""
//                            for tmpFactorInfo in resolver.hints {
//                              displayNameString += tmpFactorInfo.displayName ?? ""
//                              displayNameString += " "
//                            }
//
                          } else {
//                            self.showMessagePrompt(error.localizedDescription)
                            return
                          }
                          // ...
                          return
                        }
                     

                        // User is signed in
                        // ...
                    }
                }
                

            }

                
            }
//     apple code
     private func randomNonceString(length: Int = 32) -> String {
         precondition(length > 0)
         let charset: Array<Character> =
             Array("0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._")
         var result = ""
         var remainingLength = length
         
         while remainingLength > 0 {
             let randoms: [UInt8] = (0 ..< 16).map { _ in
                 var random: UInt8 = 0
                 let errorCode = SecRandomCopyBytes(kSecRandomDefault, 1, &random)
                 if errorCode != errSecSuccess {
                     fatalError("Unable to generate nonce. SecRandomCopyBytes failed with OSStatus \(errorCode)")
                 }
                 return random
             }
             
             randoms.forEach { random in
                 if remainingLength == 0 {
                     return
                 }
                 
                 if random < charset.count {
                     result.append(charset[Int(random)])
                     remainingLength -= 1
                 }
             }
         }
         
         return result
     }
     
     @available(iOS 13, *)
     private func sha256(_ input: String) -> String {
         let inputData = Data(input.utf8)
         let hashedData = SHA256.hash(data: inputData)
         let hashString = hashedData.compactMap {
             return String(format: "%02x", $0)
         }.joined()
         
         return hashString
     }
     
     func startSignInWithAppleFlow() {
         let nonce = randomNonceString()
         currentNonce = nonce
         let appleIDProvider = ASAuthorizationAppleIDProvider()
         let request = appleIDProvider.createRequest()
         request.requestedScopes = [.fullName, .email]
         request.nonce = sha256(nonce)
         
         let authorizationController = ASAuthorizationController(authorizationRequests: [request])
         authorizationController.delegate = self
         authorizationController.presentationContextProvider = self
         authorizationController.performRequests()
     }
     
    @objc(presentationAnchorForAuthorizationController:) func presentationAnchor(for controller: ASAuthorizationController) -> ASPresentationAnchor {
         return ASPresentationAnchor()
     }
     
     
     func authorizationController(controller: ASAuthorizationController, didCompleteWithAuthorization authorization: ASAuthorization) {
         if let appleIDCredential = authorization.credential as? ASAuthorizationAppleIDCredential {
             guard let nonce = currentNonce else {
                 fatalError("Invalid state: A login callback was received, but no login request was sent.")
             }
             guard let appleIDToken = appleIDCredential.identityToken else {
                 print("Unable to fetch identity token")
                 return
             }
             guard let idTokenString = String(data: appleIDToken, encoding: .utf8) else {
                 print("Unable to serialize token string from data: \(appleIDToken.debugDescription)")
                 return
             }
             // Initialize a Firebase credential.
             let credential = OAuthProvider.credential(withProviderID: "apple.com",
                                                       idToken: idTokenString,
                                                       rawNonce: nonce)
             
             userManager.shared.socialLogin(credential: credential, provider: "Apple") { (success, error) in
                 if error != nil {
//                     self.view.makeToast(error)
                 }else {
                    let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
                    let myvc = storyBoard.instantiateViewController(withIdentifier: "welcomeVC") as! welcomeVC
                    self.navigationController?.pushViewController(myvc, animated: true)
                

                    
                 }
             }
         }
     }
     
     func authorizationController(controller: ASAuthorizationController, didCompleteWithError error: Error) {
         // Handle error.
         print("Sign in with Apple errored: \(error)")
     }


    @objc func appleButton (sender: UIButton){
      startSignInWithAppleFlow()
                }
}
