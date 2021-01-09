//
//  ResultViewController.swift
//  TOEICQuizPractice
//
//  Created by Tai Chin Huang on 2021/1/7.
//

import UIKit

class ResultViewController: UIViewController {
    
    var score: Double = 0
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var retestLabel: UIButton!
    @IBOutlet weak var shareLabel: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        scoreLabel.layer.cornerRadius = 10
        retestLabel.layer.cornerRadius = 10
        shareLabel.layer.cornerRadius = 10
        showScore()
    }
    func showScore() {
        scoreLabel.text = "\(score)"
    }
    @IBAction func retest(_ sender: UIButton) {
//        dismiss(animated: true, completion: nil)
        var rootVC = self.presentingViewController
        while let parent = rootVC?.presentingViewController {
            rootVC = parent
        }
        rootVC?.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func share(_ sender: UIButton) {
        let controller = UIActivityViewController(activityItems: ["I have got \(score), give it a try!"], applicationActivities: nil)
        present(controller, animated: true, completion: nil)
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
