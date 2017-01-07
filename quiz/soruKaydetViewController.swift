//
//  soruKaydetViewController.swift
//  quiz
//
//  Created by samet sahin on 5.01.2017.
//  Copyright © 2017 samet sahin. All rights reserved.
//

import UIKit
import FirebaseDatabase
class soruKaydetViewController: UIViewController {

    
    var ref: FIRDatabaseReference!

    @IBOutlet weak var soru: UITextView!
    @IBOutlet weak var asıkkı: UITextField!
    
    @IBOutlet weak var bsıkkı: UITextField!
    
    @IBOutlet weak var csıkkı: UITextField!
    
    @IBOutlet weak var dsıkkı: UITextField!
    
    @IBOutlet weak var dogrusık: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ref = FIRDatabase.database().reference()


        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
 
    @IBAction func sorukaydettt(_ sender: UIButton) {
        
        ref.child("sorular").childByAutoId().setValue(["soru":soru.text , "a" : asıkkı.text , "b" : bsıkkı.text,"c" : csıkkı.text,"d" : dsıkkı.text,"cevap" : dogrusık  .text] )
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
