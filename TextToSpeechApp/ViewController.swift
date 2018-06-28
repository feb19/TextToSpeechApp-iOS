//
//  ViewController.swift
//  TextToSpeechApp
//
//  Created by Nobuhiro Takahashi on 2018/06/28.
//  Copyright © 2018年 Nobuhiro Takahashi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func goButtonWasTapped(_ sender: Any) {
        
        if textField.text != nil {
            SpeechManager.sharedInstance.append(text: textField.text!)
        }
    }
    
}

