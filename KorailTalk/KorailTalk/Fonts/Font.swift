//
//  Fonts.swift
//  KorailTalk
//
//  Created by Jung peter on 11/14/22.
//

import Foundation
import UIKit

enum Font {
    case pretended(family: Family)
    
    var fontName: String {
        get {
            switch self {
            case .pretended(let family):
                return "Pretended-\(family.rawValue)"
            }
        }
    }
    
}

enum Family: String {
    case SemiBold, Bold, Medium
}

extension UIFont {
    
    static private func makePretendedFont(with family: Family, size: Int) -> UIFont {
        return UIFont(name: Font.pretended(family: family).fontName, size: CGFloat(size))!
    }
    
    static var h1: UIFont {
        return makePretendedFont(with: .SemiBold, size: 24)
    }
    
    static var h2: UIFont {
        return makePretendedFont(with: .SemiBold, size: 22)
    }
    
    static var h3: UIFont {
        return makePretendedFont(with: .Bold, size: 20)
    }
    
    static var h4 : UIFont {
        return makePretendedFont(with: .SemiBold, size: 16)
    }
    
    static var b3 : UIFont {
        return makePretendedFont(with: .SemiBold, size: 20)
    }
    
    static var b5 : UIFont {
        return makePretendedFont(with: .Bold, size: 22)
    }
    
    static var b6 : UIFont {
        return makePretendedFont(with: .SemiBold, size: 18)
    }
    
    static var b7 : UIFont {
        return makePretendedFont(with: .Medium, size: 20)
    }
    
    static var b8 : UIFont {
        return makePretendedFont(with: .Medium, size: 16)
    }
    
    static var b2 : UIFont {
        return makePretendedFont(with: .Medium, size: 14)
    }
    
    static var b1 : UIFont {
        return makePretendedFont(with: .SemiBold, size: 14)
    }
    
    static var b9 : UIFont {
        return makePretendedFont(with: .Medium, size: 12)
    }
    
    static var b10 : UIFont {
        return makePretendedFont(with: .Medium, size: 10)
    }
    
}



