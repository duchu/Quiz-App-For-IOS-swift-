//
//  getDataFromFirebase.swift
//  quiz
//
//  Created by samet sahin on 6.01.2017.
//  Copyright © 2017 samet sahin. All rights reserved.
//

import Foundation
import FirebaseDatabase


class database
{
    
    static func loadQuestionToMemory()
    {
            var ref: FIRDatabaseReference!
            
            ref = FIRDatabase.database().reference()
        
        
        
 
        
            ref.observe(FIRDataEventType.value, with: { (snapshot) in
                print("inside the event")
                
                if let postDict = snapshot.value as? [String : AnyObject]
                {
                    if let sorular = postDict["sorular"] as? [String : AnyObject]
                    {
                        
                        for soru  in sorular
                        {
                            
                            let id : String = soru.0
                            if let username = sorular[id] as? [String : AnyObject]
                            {
                                if let resim = username["resim"] as? String
                                {
                                let newQuestion = question.init(soruInit: username["soru"] as! String!, aSıkkıInit: username["a"] as! String!, bSıkkıInit: username["b"] as! String!, cSıkkıInit: username["c"] as! String!, dSıkkıInit: username["d"] as! String!, dogruSıkInit: username["cevap"] as! String!, resim: resim)
                                    variables.soru.append(newQuestion)
                                }
                                else
                                {
                                let newQuestion = question.init(soruInit: username["soru"] as! String!, aSıkkıInit: username["a"] as! String!, bSıkkıInit: username["b"] as! String!, cSıkkıInit: username["c"] as! String!, dSıkkıInit: username["d"] as! String!, dogruSıkInit: username["cevap"] as! String!)
                                variables.soru.append(newQuestion)
                                }
                            }
                            
                            
                        }
                        
                        
                        
                        
                    }
                    
                    
                }
                
                
                
                
            })
        
    }
    
}
