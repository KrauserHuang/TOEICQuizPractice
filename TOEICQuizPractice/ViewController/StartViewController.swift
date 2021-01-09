//
//  StartViewController.swift
//  TOEICQuizPractice
//
//  Created by Tai Chin Huang on 2021/1/7.
//

import UIKit
import SafariServices

class StartViewController: UIViewController {

    @IBOutlet weak var startQuizLabel: UIButton!
    @IBOutlet weak var mainPageLabel: UIButton!
    @IBOutlet weak var toeicImageView: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        startQuizLabel.layer.cornerRadius = 10
        mainPageLabel.layer.cornerRadius = 10
    }
    
    @IBAction func mainPagePressed(_ sender: UIButton) {
        let url = URL(string: "http://www.toeic.com.tw")
        let controller = SFSafariViewController(url: url!)
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
