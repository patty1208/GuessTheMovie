//
//  QuestionsViewController.swift
//  GuessTheMovie
//
//  Created by 林佩柔 on 2021/5/27.
//

// UIFont(name: "MLingWaiMedium-TC", size: 30)
// PostScript MLingWaiMedium-TC
// family 凌慧體-繁
//
// UIFont(name: "STLibianTC-Regular", size: 30)
// 程式 PostScript STLibianTC-Regular
// Storyboard family 隸變-繁



import UIKit

class QuestionsViewController: UIViewController {

    @IBOutlet weak var showQuestionLabel: UILabel!
    @IBOutlet var choices: [UIButton]!
    @IBOutlet weak var questionNumberLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    @IBOutlet weak var replayButton: UIButton!
    var index = 0 //index=題號-1
    var questions = Questions.data
    var score = 0
    var correct = 0
    
    // 更新題目和選項文字
    func showQuestion(){
        var level = ""
        switch questions[index].score {
        case 10:
            level = "【簡單】"
        case 20:
            level = "【適中】"
        case 30:
            level = "【困難】"
        default:
            break
        }
        showQuestionLabel.text = "\(level)\n\(questions[index].question)"
        
        // 隨機安排選項
        var choiceArray = [
            questions[index].choice1,
            questions[index].choice2,
            questions[index].choice3,
            questions[index].choice4]
        choiceArray.shuffle()
        
        choices[0].setTitle(choiceArray[0], for: .normal)
        choices[1].setTitle(choiceArray[1], for: .normal)
        choices[2].setTitle(choiceArray[2], for: .normal)
        choices[3].setTitle(choiceArray[3], for: .normal)
    }
    // 初始化
    func initial(){
        // 值和題目
        index = 0
        score = 0
        correct = 0
        questions.shuffle()// 隨機出題

        
        // 畫面
        scoreLabel.text = "Score: \(score)"
        questionNumberLabel.text = "Question \(index+1)"
        
        showQuestionLabel.font = UIFont(name: "STLibianTC-Regular", size: 20)
        for i in choices {
            i.titleLabel?.font = UIFont(name: "STLibianTC-Regular", size: 20)
//            i.titleLabel?.lineBreakMode = .byWordWrapping
            i.titleLabel?.numberOfLines = 0
        }
        replayButton.titleLabel?.font = UIFont(name: "STLibianTC-Regular", size: 20)
    }
    func buttonType(){
//        showQuestionLabel.layer.cornerRadius = 40
//        showQuestionLabel.layer.borderColor = UIColor.lightGray.cgColor
//        showQuestionLabel.layer.borderWidth = 2
//        showQuestionLabel.alpha = 0.5
        for i in choices {
            i.layer.cornerRadius = 15
            i.layer.borderColor = UIColor.lightGray.cgColor
            i.backgroundColor = UIColor.white
            i.layer.backgroundColor = UIColor.white.withAlphaComponent(0.6).cgColor
            i.layer.borderWidth = 1
        }
        
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backgroundImage = UIImage(named: "background")
        let imageView = UIImageView(frame: view.bounds)
        imageView.image = backgroundImage
        view.insertSubview(imageView, at: 0)
        imageView.alpha = 0.8
//        choices[0].backgroundColor = UIColor.white
//        imageView.layer.mask = choices[0].layer
        initial()
        showQuestion()
        buttonType()
    }
    
    @IBAction func chooseAnswerButton(_ sender: UIButton) {
        print("\(index) \(questions[index].question)\(questions[index].answer)")
        if sender.currentTitle == questions[index].answer {
            // 分數
            score += questions[index].score
            scoreLabel.text = "Score: \(score)"
            correct += 1
        } else if sender.currentTitle != questions[index].answer {
        }
        // 題號
        if index == questions.count - 1{
            index = 0
            for i in choices{ i.isHidden = true }
            var level = ""
            switch correct {
            case 0...4:
                level = "對吉卜力不怎麼熟齁～"
            case 5...8:
                level = "童年的回憶應該忘了不少吧"
            case 9...11:
                level = "對吉卜力滿熟的嘛～"
            case 12...14:
                level = "哇，你是吉卜力迷一個呢!"
            case 15:
                level = "吉卜力已經在你的心中占有不可動搖的地位了"
            default:
                break
            }
            showQuestionLabel.text = "問答結束\n\n答對 \(correct) 題\n獲得 \(score) 分 (p.s.滿分是250分)\n\n\(level)"
            questionNumberLabel.text = ""
        } else {
            index += 1
            questionNumberLabel.text = "Question \(index+1)"
            showQuestion()
        }
        
    }
    
    @IBAction func replayButton(_ sender: UIButton) {
        initial()
        showQuestion()
        for i in choices{ i.isHidden = false }
        
    }
    

}
