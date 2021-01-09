//
//  QuizViewController.swift
//  TOEICQuizPractice
//
//  Created by Tai Chin Huang on 2021/1/7.
//

import UIKit

class QuizViewController: UIViewController {
    
    var questionIndex = 0
    var newQandA = QandAArray.shuffled()
    var scoreNumber: Double = 0
    var selectedAnswer = ""
    
    @IBOutlet weak var numberOfQuestion: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var optionA: UIButton!
    @IBOutlet weak var optionB: UIButton!
    @IBOutlet weak var optionC: UIButton!
    @IBOutlet weak var optionD: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        optionA.layer.cornerRadius = 10
        optionB.layer.cornerRadius = 10
        optionC.layer.cornerRadius = 10
        optionD.layer.cornerRadius = 10
        showQandA()
    }
    
    @objc func showQandA() {
        numberOfQuestion.text = "Question \(questionIndex+1)"
        questionLabel.text = newQandA[questionIndex].question
        optionA.setTitle(newQandA[questionIndex].optionA, for: .normal)
        optionB.setTitle(newQandA[questionIndex].optionB, for: .normal)
        optionC.setTitle(newQandA[questionIndex].optionC, for: .normal)
        optionD.setTitle(newQandA[questionIndex].optionD, for: .normal)
        optionA.backgroundColor = #colorLiteral(red: 0.01954602264, green: 0.266705811, blue: 0.2860710323, alpha: 1)
        optionB.backgroundColor = #colorLiteral(red: 0.01954602264, green: 0.266705811, blue: 0.2860710323, alpha: 1)
        optionC.backgroundColor = #colorLiteral(red: 0.01954602264, green: 0.266705811, blue: 0.2860710323, alpha: 1)
        optionD.backgroundColor = #colorLiteral(red: 0.01954602264, green: 0.266705811, blue: 0.2860710323, alpha: 1)
//        optionA.tag = 1
//        optionB.tag = 2
//        optionC.tag = 3
//        optionD.tag = 4
    }
    @IBAction func chooseAnswer(_ sender: UIButton) {
        let selectedAnswer = sender.currentTitle!
//        switch sender.tag {
//        case 1:
//            selectedAnswer = newQandA[questionIndex].optionA
//        case 2:
//            selectedAnswer = newQandA[questionIndex].optionB
//        case 3:
//            selectedAnswer = newQandA[questionIndex].optionC
//        case 4:
//            selectedAnswer = newQandA[questionIndex].optionD
//        default:
//            break
//        }
        if checkAnswer(userAnswer: selectedAnswer) {
            sender.backgroundColor = #colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1)
        } else {
            sender.backgroundColor = #colorLiteral(red: 0.8078431487, green: 0.02745098062, blue: 0.3333333433, alpha: 1)
        }
        nextQuestion()
        Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(showQandA), userInfo: nil, repeats: false)
        /*
        Timer.scheduledTimer參數說明
        timeInterval:每間隔幾秒執行一次
        target:執行的對象(通常設定為自己)
        selector:執行哪一個function
        userInfo:傳入nil即可
        repeats:是否重複執行
        */  
    }
    
    func checkAnswer(userAnswer: String) -> Bool {
        if userAnswer == newQandA[questionIndex].answer {
            scoreNumber += 1
            return true
        } else {
            return false
        }
    }
    
    func nextQuestion() {
        if  questionIndex + 1 < newQandA.count {
            questionIndex += 1
        } else {
            performSegue(withIdentifier: "showResult", sender: ResultViewController.self)
        }
    }

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "showResult" {
            let controller = segue.destination as? ResultViewController
            controller?.score = scoreNumber * 49.5
        }
    }

    @IBAction func dismissedPressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }    
}
