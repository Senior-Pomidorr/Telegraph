//
//  Extensions.swift
//  Telegraph
//
//  Created by Daniil Kulikovskiy on 31.05.2023.
//

import UIKit

extension UITextField {
    func indent(size:CGFloat) {
        self.leftView = UIView(frame: CGRect(x: self.frame.minX, y: self.frame.minY, width: size, height: self.frame.height))
        self.leftViewMode = .always
    }
}
