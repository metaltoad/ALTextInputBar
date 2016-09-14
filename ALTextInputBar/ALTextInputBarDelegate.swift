//
//  ALTextInputBarDelegate.swift
//  ALTextInputBar
//
//  Created by Alex Littlejohn on 2015/05/14.
//  Copyright (c) 2015 zero. All rights reserved.
//

import UIKit

@objc
public protocol ALTextInputBarDelegate: NSObjectProtocol {
    @objc optional func textViewShouldBeginEditing(_ textView: ALTextView) -> Bool
    @objc optional func textViewShouldEndEditing(_ textView: ALTextView) -> Bool
    
    @objc optional func textViewDidBeginEditing(_ textView: ALTextView)
    @objc optional func textViewDidEndEditing(_ textView: ALTextView)
    
    @objc optional func textViewDidChange(_ textView: ALTextView)
    @objc optional func textViewDidChangeSelection(_ textView: ALTextView)
    
    @objc optional func textView(_ textView: ALTextView, shouldChangeTextInRange range: NSRange, replacementText text: String) -> Bool
    
    @objc optional func inputBarDidChangeHeight(_ height: CGFloat)
}
