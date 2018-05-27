//
//  ViewController.swift
//  MYPMarkdownEditor
//
//  Created by mayuping321@163.com on 05/23/2018.
//  Copyright (c) 2018 mayuping321@163.com. All rights reserved.
//

import UIKit
import MYPMarkdownEditor

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
    @IBOutlet weak var button: UIButton!
    
    var settingController: MYPStyleSettingController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.button.tag = 0
        
        settingController = MYPStyleSettingControllerInstance
        settingController.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func change(_ sender: UIButton) {
        if self.textField.isFirstResponder {
            if sender.tag == 0 {
                self.textField.inputView = settingController.view
                self.textField.reloadInputViews()
            }
            else {
                self.textField.inputView = nil
                self.textField.reloadInputViews()
            }
            
            sender.tag = sender.tag == 0 ? 1 : 0
        }
    }
}

extension ViewController: MYPStyleSettingProtocol {
    func mypMarkdownEditor_didTap(styleType: MYPMarkdownEditorFormattingStyle, info: [String : Any]?) {
        print("Delegate didTap")
    }
    
    
}

