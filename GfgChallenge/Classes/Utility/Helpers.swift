//
//  Helpers.swift
//  GfgChallenge
//
//  Created by Flexnest on 26/01/22.
//

import UIKit

class Helpers {
    class func formattedDate(string: String, isTop: Bool) -> NSAttributedString {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        let date = dateFormatter.date(from: string) ?? Date()
         
        let padFontSize: CGFloat = isTop ? 26 : 22
        let phoneFontSize: CGFloat = isTop ? 14 : 12
        let fontSize: CGFloat = UIDevice.current.userInterfaceIdiom == .pad ? padFontSize : phoneFontSize
        let attrs1 = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: fontSize), NSAttributedString.Key.foregroundColor : UIColor.gray]
        let attrs2 = [NSAttributedString.Key.font : UIFont.boldSystemFont(ofSize: fontSize), NSAttributedString.Key.foregroundColor : UIColor.lightGray]
        let attributedString1 = NSMutableAttributedString(string:"\(date.monthAsString[..<String.Index(encodedOffset: 3)].capitalized) \(date.day), \(date.year)  ", attributes:attrs1 as [NSAttributedString.Key : Any])
        let attributedString2 = NSMutableAttributedString(string: "\(String(format: "%02d", date.hour)):\(String(format: "%02d", date.minute)) \(date.hour >= 12 ? "PM" : "AM")", attributes:attrs2 as [NSAttributedString.Key : Any])
        attributedString1.append(attributedString2)
        return attributedString1
    }
}
