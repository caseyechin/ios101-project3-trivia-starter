//
//  ViewController.swift
//  Trivia
//
//  Created by Casey Chin on 3/10/24.
//

import UIKit

class ViewController: UIViewController {
    

    
    @IBOutlet weak var QuestionCounter: UILabel!
    
    
    @IBOutlet weak var Category: UILabel!
    
    
    
    @IBOutlet weak var QuestionBox: UILabel!
    
    
    
    @IBOutlet weak var stackView: UIStackView!
    
    var orig = 0
    
    
    @IBAction func Ans1(_ sender: UIButton) {
        
        if orig == 0{
            orig = 1
            changeQuestion()
            test(sender: sender, num: 1)
        }
        var prevAns = answers[questionCount-1][0]
        var ans = answers[questionCount][0]
            sender.setTitle(String(ans), for: UIControl.State.normal)
        if prevAns == correctAns[questionCount-1] && orig == 1{
            correct += 1
            
        }
        if orig == 1{
            orig = 0
        }

    }
    
    
    @IBAction func Ans2(_ sender: UIButton) {
        
        if orig == 0{
            changeQuestion()
            orig = 2
            test(sender: sender, num: 2)
        }
        var prevAns = answers[questionCount-1][1]
        var ans = answers[questionCount][1]
        sender.setTitle(String(ans), for: UIControl.State.normal)
        if prevAns == correctAns[questionCount-1] && orig == 2{
            correct += 1
        }
        if orig == 2{
            orig = 0
        }
    }
    
    
    @IBAction func Ans3(_ sender: UIButton) {
        

        if orig == 0{
            changeQuestion()
            orig = 3
            test(sender: sender, num: 3)
        }
        var prevAns = answers[questionCount-1][2]
        var ans = answers[questionCount][2]
        sender.setTitle(String(ans), for: UIControl.State.normal)
        if prevAns == correctAns[questionCount-1] && orig == 3{
            correct += 1
        }
        if orig == 3{
            orig = 0
        }
        
    }
    
    
    @IBAction func Ans4(_ sender: UIButton) {
        

        if orig == 0{
            changeQuestion()
            orig = 4
            test(sender: sender, num: 4)
        }
        var prevAns = answers[questionCount-1][3]
        var ans = answers[questionCount][3]
        sender.setTitle(String(ans), for: UIControl.State.normal)
        if prevAns == correctAns[questionCount-1] && orig == 4{
            correct += 1
        }
        if orig == 4{
            orig = 0
        }
    }
    
    
    var questionCount = 0
    
    let questions = ["What's 1+1?", "What's 2+2?", "What's 3+3"]
    
    let answers = [["1", "2","3", "4"], ["2", "4", "8", "27"], ["6", "29","84", "3"]]
    
    let correctAns = ["2", "4", "6"]
    
    let genres = ["Math", "Arithmetic", "Maths"]
    
    var correct = 0
    
    var alert:UIAlertController = UIAlertController()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()


        config(alert: alert)

        // Do any additional setup after loading the view.
    }
    
    private func config(alert: UIAlertController) {

        QuestionBox.layer.cornerRadius = 5



        
    }
    
    private func changeQuestion() {
        
        questionCount += 1
        
        
        if questionCount >= 3 {
            
            alert = UIAlertController(title: "Game Over", message: "Final Score: " + String(correct), preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: { _ in
            NSLog("The \"OK\" alert occured.")
            }))
            self.present(alert, animated: true, completion: nil)
        } else {
            QuestionBox.text = String(questions[questionCount])
            QuestionCounter.text = "Question: " + String(questionCount + 1) + "/3"
            Category.text = genres[questionCount-1]
        }
        
    }
    
    private func test(sender: UIButton, num:Int) {
        
        switch num {
        case 1:
            Ans2(sender)
            Ans3(sender)
            Ans4(sender)
        case 2:
            Ans1(sender)
            Ans3(sender)
            Ans4(sender)
        case 3:
            Ans1(sender)
            Ans2(sender)
            Ans4(sender)
        case 4:
            Ans1(sender)
            Ans2(sender)
            Ans3(sender)
        default:
            return
        }

        
    }
    
}