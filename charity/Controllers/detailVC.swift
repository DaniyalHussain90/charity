//
//  detailVC.swift
//  charity
//
//  Created by Daniyal Hussain on 27/08/2021.
//  Copyright © 2021 Daniyal Hussain. All rights reserved.
//

import UIKit
import GoogleMaps
import FittedSheets
import SquareInAppPaymentsSDK
class detailVC: UIViewController, UITableViewDataSource, UITableViewDelegate, SQIPCardEntryViewControllerDelegate, PKPaymentAuthorizationViewControllerDelegate{
    
  var locationName = ""
    var price:String? = ""

    
    @IBOutlet weak var tableView2: UITableView!
    
    
    var buttonAction : (() -> ())?
    


    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        NotificationCenter.default.addObserver(self, selector: #selector(self.showSpinningWheel(_:)), name: NSNotification.Name(rawValue: "notificationName"), object: nil)

            tableView2.delegate = self
            tableView2.dataSource = self
            
                  let nibcell=UINib(nibName: "billingDetailitem", bundle: nil)
        tableView2.register(nibcell, forCellReuseIdentifier: "billingDetailitem")


    } 

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
                                let cell = tableView.dequeueReusableCell(withIdentifier: "billingDetailitem") as? billingDetailitem
        cell?.arrowButton.addTarget(self, action: #selector(back(sender:)), for: .touchUpInside)
        cell?.checkButton.addTarget(self, action: #selector(checkButton), for: .touchUpInside)
cell?.selectionStyle = .none
        cell?.priceButton2.text =  UserDefaults.standard.string(forKey: "price")
        cell?.editButton.addTarget(self, action: #selector(editButton), for: .touchUpInside)
        cell?.creditButton.addTarget(self, action: #selector(creditButton(sender:)), for: .touchUpInside)
        cell?.appleButton.addTarget(self, action: #selector(appleButton(sender:)), for: .touchUpInside)
        cell?.locationName.text = locationName
 
        return cell!
}
    
    
    
    @objc func back(sender: UIButton){
        self.navigationController?.popViewController(animated: true)
      }
    
    @objc func checkButton (sender: UIButton){
  //      let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
//let myvc = paymentSheetVC()
     //   self.navigationController?.pushViewController(myvc, animated: true)

        

        
     let controller = paymentSheetVC()
       let option = SheetOptions(
            pullBarHeight: 30)
        let sheet = SheetViewController(controller: controller, sizes: [.percent(0.60), .intrinsic], options: option)

        self.present(sheet, animated: true, completion: nil)
    }
    
//    @objc func appleButton (sender: UIButton){
//
//        requestApplePayAuthorization()
//
//    }

    
    @objc func nextVC(sender: UIButton){
        if sender.tag == 1{
            UserDefaults.standard.set("$12", forKey: "price") //setObject
        }else{
            UserDefaults.standard.set("$18", forKey: "price") //setObject
        }
        buttonAction?()
        
       }

    
    @objc func editButton (sender: UIButton){
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let myvc = storyBoard.instantiateViewController(withIdentifier: "mapVC") as! mapVC
        self.navigationController?.pushViewController(myvc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let cell = tableView.dequeueReusableCell(withIdentifier: "billingDetailitem") as? billingDetailitem

        if cell!.creditButton.isSelected == true {
            print("credit")
        }
        

    }
    
    @objc func creditButton (sender: UIButton){
       

    }
    func cardEntryViewController(_ cardEntryViewController: SQIPCardEntryViewController, didObtain cardDetails: SQIPCardDetails, completionHandler: @escaping (Error?) -> Void) {
        
    }
    
    func cardEntryViewController(_ cardEntryViewController: SQIPCardEntryViewController, didCompleteWith status: SQIPCardEntryCompletionStatus) {
        
    }
    
}
extension  detailVC {

    
    func paymentAuthorizationViewControllerDidFinish(_ controller: PKPaymentAuthorizationViewController) {
        
    }

    @objc func appleButton (sender: UIButton){

      requestApplePayAuthorization()
        
}
    
    func requestApplePayAuthorization() {
           guard SQIPInAppPaymentsSDK.canUseApplePay else {
               return requestApplePayAuthorization()
           }
           let paymentRequest = PKPaymentRequest.squarePaymentRequest(
               // Set to your Apple merchant ID
               merchantIdentifier: "nil",
               countryCode: "US",
               currencyCode: "USD"
           )

           // Payment summary information will be displayed on the Apple Pay sheet.
           paymentRequest.paymentSummaryItems = [
            PKPaymentSummaryItem(label: "test", amount: 22.0),
           ]

           let paymentAuthorizationViewController =
               PKPaymentAuthorizationViewController(paymentRequest: paymentRequest)

           paymentAuthorizationViewController!.delegate = self

           present(paymentAuthorizationViewController!, animated: true, completion: nil)
        
        func paymentAuthorizationViewController(
            _: PKPaymentAuthorizationViewController,
            didAuthorizePayment _: PKPayment,
            handler _: @escaping (
                PKPaymentAuthorizationResult) -> Void
        ) {
            // TODO: Add payment->nonce exchange logic. See Step 5: Request a Square
            // nonce
        }

        func paymentAuthorizationViewControllerDidFinish(
            _: PKPaymentAuthorizationViewController
        ) {
            dismiss(animated: true, completion: nil)
        }
    }
    
    func paymentAuthorizationViewController(
        _: PKPaymentAuthorizationViewController,
        didAuthorizePayment payment: PKPayment,
        handler completion: @escaping (
            PKPaymentAuthorizationResult) -> Void
    ) {
        // Exchange the authorized PKPayment for a nonce.
        let nonceRequest = SQIPApplePayNonceRequest(payment: payment)
        nonceRequest.perform { cardDetails, error in
            if cardDetails != nil {
                // Send the card nonce to your server to charge the card or store
                // the card on file.

                /*
                 MyAPIClient.shared.chargeCard(withNonce: cardDetails.nonce) {
                     transaction, chargeEerror in

                     if let chargeError = chargeError {
                         completion(PKPaymentAuthorizationResult(status: .failure,
                         errors: [chargeError]))
                     }
                     else {
                         completion(PKPaymentAuthorizationResult(status: .success,
                         errors: nil))
                     }
                 }
                 */

                completion(PKPaymentAuthorizationResult(status: .success, errors: nil))
            } else if let error = error {
                print(error)
                completion(PKPaymentAuthorizationResult(status: .failure, errors: [error]))
            }
        }
    }
    
    
    
}
extension detailVC : UINavigationControllerDelegate {
   func navigationControllerSupportedInterfaceOrientations(
       _: UINavigationController
   ) -> UIInterfaceOrientationMask {
       return .portrait
   }
    @objc func showSpinningWheel(_ notification: NSNotification) {

     if let name = notification.userInfo?["text"] as? String {
        locationName = name
        tableView2.reloadData()
}
    }
}
