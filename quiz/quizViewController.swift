//
//  quizViewController.swift
//  quiz
//
//  Created by samet sahin on 5.01.2017.
//  Copyright © 2017 samet sahin. All rights reserved.
//

import UIKit
import FirebaseDatabase
import FirebaseStorage
class quizViewController: UIViewController {
    
    
    var ref: FIRDatabaseReference!
    let storage = FIRStorage.storage()
    let screenWidth = UIScreen.main.bounds.width
    
    @IBOutlet weak var timerView:UIView!
    @IBOutlet weak var questionImage : UIImageView!
    @IBOutlet weak var soruLabel :UILabel!
    @IBOutlet weak var aSıkkı: UIButton!
    @IBOutlet weak var bSıkkı: UIButton!
    @IBOutlet weak var cSıkkı: UIButton!
    @IBOutlet weak var dSIkkı: UIButton!
    
    
    
    var timer = Timer()
    var questionTimer = Timer()
    let timeConstant = 8
    var questionTime = 8
    
    var newImage : UIImage? = UIImage()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        
        
        
        for _ in 1...3
        {
            addNewQuestionToSequence()
        }
        prepareInterfaceForNextQuestion()
        beReadyForNextQuestion()
        
        ref = FIRDatabase.database().reference()
        
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func aSıkkı(_ sender: UIButton) {
        if state == true{
            answer = "a"
            afterAnswer()
        }
        
    }
    
    @IBAction func bSıkkı(_ sender: UIButton) {
        if state == true{
            answer = "b"
            afterAnswer()
        }    }
    
    @IBAction func cSıkkı(_ sender: UIButton) {
        if state == true{
            answer = "c"
            afterAnswer()
        }
    }
    
    @IBAction func dSıkkı(_ sender: UIButton) {
        if state == true{
            answer = "d"
            afterAnswer()
        }
    }
    
    func setupView()
    {
        
        
        let barHeight = UIApplication.shared.statusBarFrame.height +
            self.navigationController!.navigationBar.frame.height
        let screenHeight = UIScreen.main.bounds.height - barHeight

        let aspect = screenWidth * 9 / 16
        
        let timerHeight = screenWidth / 32
        
        let heightForLabelAndButton = (screenHeight - aspect - timerHeight) / 4
        
        timerView.frame = CGRect(x: 0, y: 0, width: screenWidth, height: timerHeight)
        
        soruLabel.frame = CGRect(x: 0, y:   timerHeight, width: screenWidth, height: heightForLabelAndButton)
        
        soruLabel.sizeToFit()
        soruLabel.textAlignment = .center
        
        
        questionImage.frame = CGRect(x: 0, y: timerHeight + heightForLabelAndButton + (heightForLabelAndButton / 2), width: screenWidth, height: aspect)
        
        
        aSıkkı.frame = CGRect(x: 0, y:  timerHeight + heightForLabelAndButton * 2 + aspect, width: screenWidth/2, height: heightForLabelAndButton)
        
        
        bSıkkı.frame = CGRect(x: screenWidth/2, y:  timerHeight + heightForLabelAndButton * 2 + aspect, width: screenWidth/2, height: heightForLabelAndButton)
        
        
        cSıkkı.frame = CGRect(x: 0, y:  timerHeight + heightForLabelAndButton * 2 + aspect + heightForLabelAndButton, width: screenWidth/2, height: heightForLabelAndButton)
        
        
        dSIkkı.frame = CGRect(x: screenWidth/2, y:  timerHeight + heightForLabelAndButton * 2  + aspect + heightForLabelAndButton, width: screenWidth/2, height: heightForLabelAndButton)
        
        
    }
    
    
    var sorular : [question] = []
    
    var answer : String = "8"
    
    var state = true
    
    
    //
    func afterAnswer()
    {
        questionTimer.invalidate()
        
        
        
        if state == true
        {
            
            
            
            //check for answer
            if answer == sorular[0].getDogruCevap()
            {
                // label.text = " " timeri sıfırlayacaksın burada
                
                
                // right answer
                sorular.removeFirst()
                questionImage.image = nil
                addNewQuestionToSequence()
                
                // checking the next question image is loaded or not
                if newImage == nil && sorular[0].getResim() != ""
                {
                    
                    state = false
                    let myActivityIndicator = UIActivityIndicatorView(activityIndicatorStyle: UIActivityIndicatorViewStyle.whiteLarge)
                    myActivityIndicator.color = UIColor.cyan
                    myActivityIndicator.center = self.view.center
                    myActivityIndicator.startAnimating()
                    self.view.addSubview(myActivityIndicator)
                    myActivityIndicator.tag = 3
                    
                    timer  = Timer.scheduledTimer(timeInterval: 0.35, target: self, selector: #selector(checkData), userInfo: nil, repeats: true)
                    
                }
                else
                {
                    
                    prepareInterfaceForNextQuestion()
                    beReadyForNextQuestion()
                }
                
                
            }
            else
            {
                // wrong answer , end the game
                gameOver()
                
                
            }
        }
    }
    
    func gameOver()
        
    {
        print("game over")
        //timeri durdur
        
    }
    
    func prepareInterfaceForNextQuestion()
    {
        timerView.frame.size.width = screenWidth
        questionTime = 8
        soruLabel.text = sorular[0].getSoru()
        
        aSıkkı.setTitle( sorular[0].getAsıkkı(), for: UIControlState.normal)
        bSıkkı.setTitle(sorular[0].getBsıkkı(), for: UIControlState.normal)
        cSıkkı.setTitle(sorular[0].getCsıkkı(), for: UIControlState.normal)
        dSIkkı.setTitle(sorular[0].getDsıkkı(), for: UIControlState.normal)
        
        aSıkkı.backgroundColor = UIColor.randomColor()
        bSıkkı.backgroundColor = UIColor.randomColor()
        cSıkkı.backgroundColor = UIColor.randomColor()
        dSIkkı.backgroundColor = UIColor.randomColor()
        
        if sorular[0].getResim() != ""
        {
            
            questionImage.image = newImage
            newImage = nil
        }
        
        // zaman ayarla
        
        
        questionTimer  = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timeLeftForAnswer), userInfo: nil, repeats: true)
        
        
        
    }
    
    
    func timeIndıcator ( width : CGFloat)
    {
        
        UIView.animate(withDuration: 1 , delay: 0, options : .curveLinear , animations :{
            self.timerView.frame.size.width = width
            self.timerView.backgroundColor = UIColor.randomColor()
        }, completion: nil)
        
        
        
    }
    
    
    
    func timeLeftForAnswer()
    {
        
        
        
        questionTime = questionTime - 1
        
        let timeLeft : CGFloat = screenWidth * CGFloat (questionTime - 1) / CGFloat(timeConstant)
        timeIndıcator(width: timeLeft)
        
        
        
        
        if questionTime == 0 {
            questionTimer.invalidate()
            state = false
            gameOver()
        }
        
        
        
    }
    
    
    
    func addNewQuestionToSequence()
    {
        
        var randomNum = Int(arc4random_uniform(UInt32(variables.soru.count)))
        
        var newSoru = variables.soru[randomNum]
        // while sorular.contains(newSoru) == false
        //  {
        randomNum = Int(arc4random_uniform(UInt32(variables.soru.count)))
        newSoru = variables.soru[randomNum]
        //    }
        sorular.append(newSoru)
        
        
    }
    
    
    
    func beReadyForNextQuestion()
        
    {
        
        
        // gettin image for next question
        
        if sorular[1].getResim() != ""
        {
            
            
         //   let storageRef = storage.reference(forURL: "YOUR FİREBASE STORAGE URL")
            
             let imageName = sorular[1].getResim()
            let islandRef = storageRef.child("images/\(imageName)")
            
            // Download in memory with a maximum allowed size of 1MB (1 * 1024 * 1024 bytes)
            islandRef.data(withMaxSize: 1 * 1024 * 1024) { data, error in
                if let error = error {
                    // Uh-oh, an error occurred!
                    print(error)
                } else {
                    // Data for "images/island.jpg" is returned
                    self.newImage = UIImage(data: data!, scale: 1)
                    
                }
            }
            
            
            
        }
        
        
        
    }
    
    func checkData ()
    {
        
        if newImage != nil
        {
            let activityIndicator = view.viewWithTag(3) as? UIActivityIndicatorView
            activityIndicator?.removeFromSuperview()
            timer.invalidate()
            
            
            // image is ready
            prepareInterfaceForNextQuestion()
            beReadyForNextQuestion()
            state = true
        }
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
