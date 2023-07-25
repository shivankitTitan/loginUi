//
//  ViewController.swift
//  Constraints
//
//  Created by Shreya Naik on 21/07/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var topPaddingConstraint: NSLayoutConstraint!
    @IBOutlet weak var subviewPaddingConstraint: NSLayoutConstraint!
    @IBOutlet weak var textFieldPaddingConstraint: NSLayoutConstraint!
    @IBOutlet weak var continueButtonPadding: NSLayoutConstraint!
    @IBOutlet weak var widthConstraints:NSLayoutConstraint!
    
    @IBOutlet var enterPnoneNumberLabel: UILabel!
    @IBOutlet var headerLabel: UILabel!
    @IBOutlet var letftView: UIView!
    @IBOutlet weak var continueButton: UIButton!
    
    @IBOutlet weak var myTextField: UITextField!
    @IBOutlet weak var mySubview: UIView!
    var color : UIColor?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.vi
        mySubview.layer.cornerRadius = 50
        self.letftView.frame = CGRect(x: 0, y: 0, width: 60, height: 60)
        myTextField.leftView  = self.letftView
        myTextField.leftViewMode = .always
        myTextField.layer.cornerRadius = 30
        myTextField.layer.masksToBounds = true
        color = mySubview.backgroundColor
        
        print("----topPaddingConstraint",topPaddingConstraint.constant)
        print("----subviewPaddingConstraint",subviewPaddingConstraint.constant)

        print("----textFieldPaddingConstraint",textFieldPaddingConstraint.constant)

        print("----continueButtonPadding",continueButtonPadding.constant)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        NotificationCenter.default.addObserver(self,selector: #selector(adjustForKeyboard(notification:)), name: UIResponder.keyboardWillShowNotification, object:nil)
        NotificationCenter.default.addObserver(self,selector: #selector(adjustForKeyboardHide(notification:)), name: UIResponder.keyboardWillHideNotification, object:nil)
    }
    @objc func adjustForKeyboard(notification: Notification) {
        
        let screenHeight = UIScreen.main.bounds.height
        headerLabel.isHidden = true
        enterPnoneNumberLabel.isHidden = false
        topPaddingConstraint.constant = -screenHeight * 0.128
        subviewPaddingConstraint.constant = -screenHeight * 0.1
        textFieldPaddingConstraint.constant = -(screenHeight * 0.1)/2
        continueButtonPadding.constant =  -(screenHeight * 0.15)/2
        widthConstraints.constant = -screenHeight * 0.4
        UIView.animate(withDuration: 0.25) {
            self.view.layoutIfNeeded()
        }
    }
    @objc func adjustForKeyboardHide(notification: Notification) {
        
        headerLabel.isHidden = false
        enterPnoneNumberLabel.isHidden = true
        topPaddingConstraint.constant = 0.0
        subviewPaddingConstraint.constant = 0.0
        textFieldPaddingConstraint.constant = 0.0
        continueButtonPadding.constant = 0.0
        widthConstraints.constant = 0.0
        UIView.animate(withDuration: 0.25) {
            self.view.layoutIfNeeded()
        }
    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}

//extension UIColor {
//    public convenience init?(hex: String) {
//        let r, g, b, a: CGFloat
//
//        if hex.hasPrefix("#") {
//            let start = hex.index(hex.startIndex, offsetBy: 1)
//            let hexColor = String(hex[start...])
//
//            if hexColor.count == 8 {
//                let scanner = Scanner(string: hexColor)
//                var hexNumber: UInt64 = 0
//
//                if scanner.scanHexInt64(&hexNumber) {
//                    r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
//                    g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
//                    b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
//                    a = CGFloat(hexNumber & 0x000000ff) / 255
//
//                    self.init(red: r, green: g, blue: b, alpha: a)
//                    return
//                }
//            }
//        }
//
//        return nil
//    }
//}
