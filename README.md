# FormattedStringEx

Swift 4 Xcode 9.n Format strings using Mutable Attributed String (NSMutableAttributedString).
Format that string for use in labels, buttons, and other controls that support attributed string types.

## Introduction:
This is a simple example of how to creatively format strings to make a multi line label for that control with different attributes per line.  Unfortunately, Swift does not provide an easy way to format text in these controls so you have to split things up then apply the attributes to the string sections then reassemble and return the new attributed string for use.  

You can extrapolate from this simple example and ad or change the number of lines, attributes, parameters, values and variables.

## How
You call the FormatAttribString function and supply your string and various format parameters to a function that will return the formatted attributed string.

This example breaks the string at a carriage return and returns two lines of attributed text.  A title line and content line are returned.

## Code

Call the function:

    @IBAction func btnUpdate(_ sender: Any) {
        txtOutput.attributedText = formatAttribString(string: txtInput.text, title_color: UIColor.gray, title_font_size: 17, title_font_weight: UIFont.Weight.bold, subtitle_color: UIColor.lightGray, subtitle_font_size: 13)
    }

Alternate using a literal string:

    @IBAction func btnUpdate(_ sender: Any) {
        txtOutput.attributedText = formatAttribString(string: “Title\nDescription of the title”, title_color: UIColor.gray, title_font_size: 17, title_font_weight: UIFont.Weight.bold, subtitle_color: UIColor.lightGray, subtitle_font_size: 13)
    }

The function:

    //  FormatAttribString.swift
    //  FormattedStringEx
    //
    //  Created by David Holeman on 12/13/17.
    //  Copyright © 2017 OpEx Networks, LLC. All rights reserved.
    //

    import Foundation
    import UIKit

    func formatAttribString(string: String, title_color: UIColor, title_font_size: CGFloat, title_font_weight: UIFont.Weight, subtitle_color: UIColor, subtitle_font_size: CGFloat) -> NSMutableAttributedString {
    
         // If receiving a string value from UITextView, as in this example, we have to force insert the carriage
         // return since it sees the "\n" as just more characters instead of denoting a carriage return (CR). This
         // is just a good cleanup step to have in place so what was intended is what is actually in the string.
         //
         let string = string.replacingOccurrences(of: "\\n", with: "\n")
    
         // Getting the range to separate the button title strings
         //
         let index = string.index(of: "\n") ?? string.endIndex
         let substring1 = String(string[..<index])
         let substring2 = String(string[index...])
    
         let titleAttributes = [
             NSAttributedStringKey.foregroundColor: title_color,
             NSAttributedStringKey.font: UIFont.systemFont(ofSize: title_font_size, weight: title_font_weight)] as [NSAttributedStringKey : Any]
    
    
         let subtitleAttributes = [
            NSAttributedStringKey.foregroundColor: subtitle_color,
            NSAttributedStringKey.font: UIFont.systemFont(ofSize: subtitle_font_size)] as [NSAttributedStringKey : Any]
    
         let formattedTitle = NSMutableAttributedString(string: substring1 as String, attributes: titleAttributes)
         let formattedSubTitle = NSMutableAttributedString(string: substring2 as String, attributes: subtitleAttributes)
    
         let combination = NSMutableAttributedString()
    
         combination.append(formattedTitle)
         combination.append(formattedSubTitle)
   
         return combination
    }

Screen shot of output:  

![image](https://github.com/OpExNetworks/FormattedStringEx/blob/master/FormatAttribString%20Screen%20Shot.png)



