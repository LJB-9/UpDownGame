//
//  CreditViewController.swift
//  UpDownGame
//
//  Created by 이준범 on 2022/07/03.
//

import UIKit

class CreditViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func touchUpDismissButton(_ slider: UIButton) {
        dismiss(animated: true,
                completion: nil)
    }
}
