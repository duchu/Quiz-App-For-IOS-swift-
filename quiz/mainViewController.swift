//
//  mainViewController.swift
//  quiz
//
//  Created by samet sahin on 5.01.2017.
//  Copyright © 2017 samet sahin. All rights reserved.
//

import UIKit

class mainViewController: UIViewController {

    @IBOutlet weak var startQuizOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        database.loadQuestionToMemory()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    var timerKontrol = Timer()
    
    
    func checkProgress()
    {
    
        // yeniden denendiği ile ilgili bir şey söyle falan
        
        
        if variables.soru.count == 0
        {
            
            database.loadQuestionToMemory()
            
            let activityIndicator = view.viewWithTag(3) as? UIActivityIndicatorView
            activityIndicator?.removeFromSuperview()
            startQuizOutlet.isEnabled = true
            
        }
      
        timer.invalidate()
        
    
    }
    
    func checkData () -> Bool
    {
    
        
    if variables.soru.count > 0
    {
        let activityIndicator = view.viewWithTag(3) as? UIActivityIndicatorView
        activityIndicator?.removeFromSuperview()
        timer.invalidate()
        performSegue(withIdentifier: "startTheQuiz", sender: self)
        startQuizOutlet.isEnabled = true
        return true
    }
    return false
    }
    var timer = Timer()
    // ikinci kez basılmasını engelle
    
    @IBAction func startTheGame(_ sender: UIButton) {
        
        startQuizOutlet.isEnabled = false
        
        timerKontrol.invalidate()
        
        let myActivityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.whiteLarge)
        myActivityIndicator.color = UIColor.cyan
        myActivityIndicator.center = self.view.center
        myActivityIndicator.startAnimating()
        self.view.addSubview(myActivityIndicator)
        myActivityIndicator.tag = 3
        
         timer  = Timer.scheduledTimer(timeInterval: 0.35, target: self, selector: #selector(checkData), userInfo: nil, repeats: true)
        
        timerKontrol  = Timer.scheduledTimer(timeInterval: 10, target: self, selector: #selector(checkProgress), userInfo: nil, repeats: true)

        
        
        
        
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
