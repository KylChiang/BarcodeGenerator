//
//  ViewController.swift
//  BarcodeGenerator
//
//  Created by KaiYun Chiang on 2021/6/2.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var codeTextField: UITextField!
    @IBOutlet weak var heightTextField: UITextField!
    @IBOutlet weak var widthTextField: UITextField!
    @IBOutlet weak var quietSpaceTextField: UITextField!
    @IBOutlet weak var barcodeImageView: UIImageView!
    @IBOutlet weak var barcodeImageWidthConstraint: NSLayoutConstraint!
    @IBOutlet weak var barcodeImageHeightConstraint: NSLayoutConstraint!

    override func viewDidLoad() {
        super.viewDidLoad()
        initBarcode()
    }

    @IBAction func tappedRefreshButton(_ sender: Any) {
        initBarcode()
    }
    
    func initBarcode() {
        guard let code = codeTextField.text else { return }
        guard let space = quietSpaceTextField.text, space != "" || space != "0" else { return }
        guard let width = widthTextField.text, width != "" || width != "0" else { return }
        guard let height = heightTextField.text, height != "" || height != "0" else { return }
        guard let barcodeQuietSpace = Double(space) else { return }
        
        barcodeImageWidthConstraint.constant = CGFloat(Double(width) ?? 0.0)
        barcodeImageHeightConstraint.constant = CGFloat(Double(height) ?? 0.0)
        
    }
}

