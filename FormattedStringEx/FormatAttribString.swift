//
//  FormatAttribString.swift
//  FormattedStringEx
//
//  Created by David Holeman on 12/13/17.
//  Copyright © 2017 OpEx Networks, LLC. All rights reserved.
//

import Foundation
import UIKit

func formatLabel(string: String, title_color: UIColor, title_font_size: CGFloat, title_font_weight: UIFont.Weight, subtitle_color: UIColor, subtitle_font_size: CGFloat) -> NSMutableAttributedString {
    
    // If receiving a string value from UITextView, as in this example, we have to force insert the carriage
    // return since it sees the "\n" as just more characters instead of denoting a carriage return (CR). This
    // is just a good cleanup step to have in place so what was intended is what is actually in the string.
    let string = string.replacingOccurrences(of: "\\n", with: "\n")
    
    //getting the range to separate the button title strings
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
