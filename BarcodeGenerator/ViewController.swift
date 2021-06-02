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
        
        let barcodeHeight = CGFloat(Double(height) ?? 0.0)
        let barcodeWidth = CGFloat(Double(width) ?? 0.0)
        barcodeImageWidthConstraint.constant = barcodeWidth
        barcodeImageHeightConstraint.constant = barcodeHeight
        
        let size = CGSize(width: barcodeWidth, height: barcodeHeight)
        barcodeImageView.image = generateBarcode(from: code, quietZone: barcodeQuietSpace, size: size)
    }
    
    func generateBarcode(from string: String, quietZone: Double, size: CGSize) -> UIImage? {
        let data = string.data(using: String.Encoding.ascii, allowLossyConversion: false)

        if let filter = CIFilter(name: "CICode128BarcodeGenerator") {
            filter.setDefaults()
            filter.setValue(data, forKey: "inputMessage")
            filter.setValue(quietZone, forKey: "inputQuietSpace")
            
            guard let image = filter.outputImage else { return nil }
            
            let imageSize = image.extent.size
            
            let transform = CGAffineTransform(scaleX: size.width / imageSize.width, y: size.height / imageSize.height)
            
            let scaledImage = image.transformed(by: transform)
            return UIImage(ciImage: scaledImage)
        }

        return nil
    }
}

