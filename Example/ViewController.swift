//
//  ViewController.swift
//  ALTextInputBar
//
//  Created by Alex Littlejohn on 2015/04/24.
//  Copyright (c) 2015 zero. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let textInputBar = ALTextInputBar()
    let keyboardObserver = ALKeyboardObservingView()
    
    let scrollView = UIScrollView()
    
    // This is how we observe the keyboard position
    override var inputAccessoryView: UIView? {
        get {
            return keyboardObserver
        }
    }
    
    // This is also required
    override var canBecomeFirstResponder : Bool {
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureScrollView()
        configureInputBar()
        
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardFrameChanged(_:)), name: NSNotification.Name(rawValue: ALKeyboardFrameDidChangeNotification), object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillShow(_:)), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.keyboardWillHide(_:)), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        scrollView.frame = view.bounds
        textInputBar.frame.size.width = view.bounds.size.width
    }

    func configureScrollView() {
        view.addSubview(scrollView)
        
        let contentView = UIView(frame: CGRect(x: 0, y: 0, width: view.bounds.size.width, height: view.bounds.size.height * 2))
        contentView.backgroundColor = UIColor(white: 0.8, alpha: 1)
        
        scrollView.addSubview(contentView)
        scrollView.contentSize = contentView.bounds.size
        scrollView.keyboardDismissMode = UIScrollViewKeyboardDismissMode.interactive
        scrollView.backgroundColor = UIColor(white: 0.6, alpha: 1)
    }
    
    func configureInputBar() {
        let leftButton = UIButton(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
        let rightButton = UIButton(frame: CGRect(x: 0, y: 0, width: 44, height: 44))
        
        leftButton.setImage(UIImage(named: "leftIcon"), for: UIControlState())
        rightButton.setImage(UIImage(named: "rightIcon"), for: UIControlState())
        
        keyboardObserver.isUserInteractionEnabled = false
        
        textInputBar.showTextViewBorder = true
        textInputBar.leftView = leftButton
        textInputBar.rightView = rightButton
        textInputBar.frame = CGRect(x: 0, y: view.frame.size.height - textInputBar.defaultHeight, width: view.frame.size.width, height: textInputBar.defaultHeight)
        textInputBar.backgroundColor = UIColor(white: 0.95, alpha: 1)
        textInputBar.keyboardObserver = keyboardObserver
        
        view.addSubview(textInputBar)
    }

    func keyboardFrameChanged(_ notification: Notification) {
        if let userInfo = (notification as NSNotification).userInfo {
            let frame = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
            textInputBar.frame.origin.y = frame.origin.y
        }
    }
    
    func keyboardWillShow(_ notification: Notification) {
        if let userInfo = (notification as NSNotification).userInfo {
            let frame = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
            textInputBar.frame.origin.y = frame.origin.y
        }
    }
    
    func keyboardWillHide(_ notification: Notification) {
        if let userInfo = (notification as NSNotification).userInfo {
            let frame = (userInfo[UIKeyboardFrameEndUserInfoKey] as! NSValue).cgRectValue
            textInputBar.frame.origin.y = frame.origin.y
        }
    }
    
}

