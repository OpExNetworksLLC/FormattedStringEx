//
//  ViewController.swift
//  FormattedStringEx
//
//  Created by David Holeman on 11/6/17.
//  Copyright © 2017 OpEx Networks, LLC. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // make text field uneditable
        txtOutput.isEditable = false
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnUpdate(_ sender: Any) {
        txtOutput.attributedText = formatLabel(string: txtInput.text, title_color: UIColor.gray, title_font_size: 17, title_font_weight: UIFont.Weight.bold, subtitle_color: UIColor.lightGray, subtitle_font_size: 13)
        txtOutput2.attributedText = formatLabel(string: "Title\nSub Title", title_color: UIColor.gray, title_font_size: 17, title_font_weight: UIFont.Weight.bold, subtitle_color: UIColor.lightGray, subtitle_font_size: 13)

    }
    
    // MARK: - controls
    @IBOutlet weak var txtInput: UITextView!
    @IBOutlet weak var txtOutput: UITextView!
    @IBOutlet weak var txtOutput2: UITextView!
    
}

