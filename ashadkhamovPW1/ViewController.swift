//
//  ViewController.swift
//  ashadkhamovPW1
//
//  Created by Alibek Adhamov on 15/09/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var view1: UIView!
    
    @IBOutlet weak var view2: UIView!
    
    @IBOutlet weak var view3: UIView!
    @IBOutlet weak var button: UIButton!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    func getRandomUniqueColor() -> UIColor {
        let hexColor = String(format: "#%06X", arc4random_uniform(0xFFFFFF))

        if let color = UIColor(hex: hexColor) {
            return color
        }
        return UIColor.white
    }

    @IBAction func buttonWaspressed(_ sender: UIButton) {
        button.isEnabled = false
        view1.layer.cornerRadius = .random(in: 0...25)
        view2.layer.cornerRadius = .random(in: 0...25)
        view3.layer.cornerRadius = .random(in: 0...25)
        animateColor(view1,view2,view3)
    }
    func animateColor(_ view1: UIView,_ view2: UIView,_ view3: UIView ) {
            UIView.animate(withDuration: 5.0, animations: {
                view1.backgroundColor = self.getRandomUniqueColor()
                view2.backgroundColor = self.getRandomUniqueColor()
                view3.backgroundColor = self.getRandomUniqueColor()
                
            }, completion: { [weak self] _ in
                self?.button.isEnabled = true
            })
        }
    }
    
extension UIColor {
    convenience init?(hex: String) {
        var hexSanitized = hex.trimmingCharacters(in: .whitespacesAndNewlines)
        hexSanitized = hexSanitized.replacingOccurrences(of: "#", with: "")
        var rgb: UInt64 = 0
        Scanner(string: hexSanitized).scanHexInt64(&rgb)
        let red = CGFloat((rgb & 0xFF0000) >> 16) / 255.0
        let green = CGFloat((rgb & 0x00FF00) >> 8) / 255.0
        let blue = CGFloat(rgb & 0x0000FF) / 255.0
        
        self.init(red: red, green: green, blue: blue, alpha: 1.0)
    }
}
