//
//  LoginViewController.swift
//  Login
//
//  Created by Paige Plander on 4/5/17.
//  Copyright © 2017 Paige Plander. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    // Constants used in the LoginViewController
    struct Constants {
        static let backgroundColor: UIColor = UIColor(hue: 0.5389, saturation: 1, brightness: 0.92, alpha: 1.0)
        static let invalidEmailTitle = "Invalid username or password"
        static let invalidEmailMessage = "Please try again"
        //static
    }

    // TODO: instantiate the views needed for your project
    let bigTitle = UILabel(frame: CGRect(x: 50, y: 100, width: 200, height: 100))
    let loginButton = UIButton()//frame: CGRect(x: 50, y: 200, width: Int(screenWidth), height: 50))
    //let userframe = CGRect(x: 0.0, y: 0.0, width: 100.0, height: 30.0)
    let userText = UITextField()//frame: CGRect(x: 50, y: 300, width: screenWidth, height: 50))
    let passText = UITextField()//frame: CGRect(x: 50, y: 250, width: screenWidth, height: 50))
    //let passText = UITextfield()
     
    
    
    let loginWindow = UIView()//(frame: CGRect(x: 50, y: 300, width: 200, height: 150))//(frame: CGRect(x: 50, y: 200, width: Int(screenWidth * 0.9), height: 100))
        
    //}
    
    let screenWidth = 0.9 * UIScreen.main.bounds.size.width
    let buffer = 0.05 * UIScreen.main.bounds.size.width
    let screencenterx = UIScreen.main.bounds.midX
    let screencentery = UIScreen.main.bounds.midY
    // returns the center y coordinate of the user's screen (CGFloat)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Constants.backgroundColor
        
        // TODO: Add your views either as subviews of `view` or subviews of each other using `addSubview`
        
        view.addSubview(bigTitle)
        view.addSubview(loginWindow)
        
        bigTitle.text = "Login View Controller"
        bigTitle.textColor = UIColor.white
        
        loginWindow.widthAnchor.constraint(equalToConstant: screenWidth).isActive = true
        loginWindow.heightAnchor.constraint(equalToConstant: 150).isActive = true
        loginWindow.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        loginWindow.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        loginWindow.translatesAutoresizingMaskIntoConstraints = false
        loginWindow.backgroundColor = UIColor.white
        
        //loginWindow.wi
        
        
        //loginWindow.frame = CGRect(x: 0, y: 0, width: (screenWidth * 0.9), height: 100)
        //loginWindow.center = view.center
        
        //loginWindow.addSubview(loginButton)
        //loginWindow.addSubview(userText)
        loginWindow.addSubview(passText)
        
        loginButton.widthAnchor.constraint(equalToConstant: screenWidth).isActive = true
        loginButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        
        userText.widthAnchor.constraint(equalToConstant: screenWidth).isActive = true
        userText.heightAnchor.constraint(equalToConstant: 50).isActive = true
        userText.centerXAnchor.constraint(equalTo: passText.centerXAnchor).isActive = true
        userText.centerYAnchor.constraint(equalTo: passText.centerYAnchor, constant: -50.0).isActive = true
        passText.borderStyle = UITextBorderStyle.roundedRect
        userText.translatesAutoresizingMaskIntoConstraints = false
        
        passText.widthAnchor.constraint(equalToConstant: screenWidth).isActive = true
        passText.heightAnchor.constraint(equalToConstant: 50).isActive = true
        passText.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        passText.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        passText.borderStyle = UITextBorderStyle.roundedRect
        passText.translatesAutoresizingMaskIntoConstraints = false
        
        
        // TODO: layout your views using frames or AutoLayout
    }
    
    // TODO: create an IBAction for your login button
    
    
    
    
    
    /// YOU DO NOT NEED TO MODIFY ANY OF THE CODE BELOW (but you will want to use `authenticateUser` at some point)
    
    // Model class to handle checking if username/password combinations are valid.
    // Usernames and passwords can be found in the Lab6Names.csv file
    let loginModel = LoginModel(filename: "Lab6Names")

    /// Imageview for login success image (do not need to modify)
    let loginSuccessView = UIImageView(image: UIImage(named: "oski"))
    
    /// If the provided username/password combination is valid, displays an
    /// image (in the "loginSuccessView" imageview). If invalid, displays an alert
    /// telling the user that the login was unsucessful.
    /// You do not need to edit this function, but you will want to use it for the lab.
    ///
    /// - Parameters:
    ///   - username: the user's berkeley.edu address
    ///   - password: the user's first name (what a great password!)
    func authenticateUser(username: String?, password: String?) {
        
        // if username / password combination is invalid, present an alert
        if !loginModel.authenticate(username: username, password: password) {
            loginSuccessView.isHidden = true
            let alert = UIAlertController(title: Constants.invalidEmailTitle, message: Constants.invalidEmailMessage, preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "Dismiss", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
            
        // If username / password combination is valid, display success image
        else {
            if !loginSuccessView.isDescendant(of: view) {
                view.addSubview(loginSuccessView)
                loginSuccessView.contentMode = .scaleAspectFill
            }
            
            loginSuccessView.isHidden = false
            
            // Constraints for the login success view
            loginSuccessView.translatesAutoresizingMaskIntoConstraints = false
            loginSuccessView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
            loginSuccessView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
            loginSuccessView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
            loginSuccessView.heightAnchor.constraint(equalToConstant: view.frame.height/4).isActive = true
        }
    }
}
