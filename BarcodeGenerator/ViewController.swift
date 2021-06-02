//
//  ViewController.swift
//  BarcodeGenerator
//
//  Created by KaiYun Chiang on 2021/6/2.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var codeTextField: UITextField!
    @IBOutlet weak var lengthTextField: UITextField!
    @IBOutlet weak var widthTextField: UITextField!
    @IBOutlet weak var quietSpaceTextField: UITextField!
    @IBOutlet weak var barcodeImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func tappedRefreshButton(_ sender: Any) {
    }
    
}

