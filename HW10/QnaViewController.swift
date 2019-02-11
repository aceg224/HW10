//
//  QnaViewController.swift
//  HW10
//
//  Created by min-chia on 2019/2/9.
//  Copyright © 2019 min-chia. All rights reserved.
//

import UIKit

class QnaViewController: UIViewController {
    @IBOutlet weak var quaLabel: UILabel!
    @IBOutlet weak var ch1Button: UIButton!
    @IBOutlet weak var ch2Button: UIButton!
    @IBOutlet weak var ch3Button: UIButton!
    @IBOutlet weak var ch4Button: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var timerLabel: UILabel!
    @IBOutlet weak var backgroundColor: UIView!
    
    var number = 0
    var score = 0
    var qnas = [Qna(question:"角落小夥伴的各式各樣堆疊方式中，能營造華麗感的堆疊方式是以下哪一個？",choose1:"趴臥堆疊",choose2:"躺式堆疊",choose3:"金字塔堆疊",choose4:"背對堆疊",answer:"金字塔堆疊"),Qna(question: "角落小夥伴中，很在意體型的是？", choose1: "貓", choose2: "蜥蜴", choose3: "白熊", choose4: "粉圓", answer: "貓"),Qna(question: "炸豬排與炸蝦尾要泡甚麼才會較安心？", choose1: "炸油鍋浴", choose2: "溫泉", choose3: "浴池", choose4: "粉圓湯", answer: "炸油鍋浴"),Qna(question: "「白熊」是從哪裡逃出來的？", choose1: "東", choose2: "西", choose3: "南", choose4: "北", answer: "北"),Qna(question: "電車的角落席，對角落小夥伴而言是？", choose1: "經濟席", choose2: "一般席", choose3: "頭等席", choose4: "商務席", answer: "頭等席"),Qna(question: "是誰沖泡的咖啡傳聞是世界上最好喝？", choose1: "幽靈", choose2: "粉圓", choose3: "咖啡豆老闆", choose4: "雜草", answer: "咖啡豆老闆"),Qna(question: "角落小夥伴神社都供奉甚麼食物", choose1: "咖啡", choose2: "小黃瓜", choose3: "油炸食物", choose4: "小魚", answer: "油炸食物")].shuffled()
    var timer = Timer() // 計時器
    var counter = 10 //sec
    override func viewDidLoad() {
        super.viewDidLoad()
        initQna()
        // Do any additional setup after loading the view.
    }
    @IBAction func nextQna(_ sender: UIButton) {
        if number < qnas.count{
            if sender.title(for: .normal)?.description == qnas[number].answer.description {
                if score <= 0 {
                    score = 10
                }else{
                    score = score + 10
                }
                backgroundColor.backgroundColor = UIColor(red: CGFloat(0.99), green: CGFloat(0.99), blue: CGFloat(0.87451), alpha: CGFloat(1))
                
            }else{
                if score <= 0{
                    score = 0
                }
                backgroundColor.backgroundColor = UIColor(red: CGFloat(Float.random(in: 0...1)), green: CGFloat(Float.random(in: 0...1)), blue: CGFloat(Float.random(in: 0...1)), alpha: CGFloat(Float.random(in: 0...1)))
            }
            scoreLabel.text = "分數：" + score.description
            number = number + 1
            if number < qnas.count{
                counter = resetCounter10()
                quaLabel.text = qnas[number].question
                let chooslist = [qnas[number].choose1,qnas[number].choose2,qnas[number].choose3,qnas[number].choose4].shuffled()
                quaLabel.text = (number + 1).description + ". " + qnas[number].question
                ch1Button.setTitle(chooslist[0], for: .normal)
                ch2Button.setTitle(chooslist[1], for: .normal)
                ch3Button.setTitle(chooslist[2], for: .normal)
                ch4Button.setTitle(chooslist[3], for: .normal)
            }else if(number == qnas.count){
                totalScore()
            }
        }
    }
    @IBAction func playAgainPress(_ sender: UIButton) {
        timer.invalidate()
        initQna()
    }
    func initQna() {
        counter = resetCounter10()
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerRun), userInfo: nil, repeats: true)
        number = 0
        score = 0
        qnas.shuffle()
        quaLabel.text = qnas[number].question
        let chooslist = [qnas[number].choose1,qnas[number].choose2,qnas[number].choose3,qnas[number].choose4].shuffled()
        quaLabel.text = (number + 1).description + ". " + qnas[number].question
        ch1Button.setTitle(chooslist[0], for: .normal)
        ch2Button.setTitle(chooslist[1], for: .normal)
        ch3Button.setTitle(chooslist[2], for: .normal)
        ch4Button.setTitle(chooslist[3], for: .normal)
        scoreLabel.text = score.description
                        backgroundColor.backgroundColor = UIColor(white: 0.67, alpha: 1)
    }
    func nextQna() {
        counter = resetCounter10()
        number = number + 1
        if number < qnas.count {
            quaLabel.text = qnas[number].question
            let chooslist = [qnas[number].choose1,qnas[number].choose2,qnas[number].choose3,qnas[number].choose4].shuffled()
            quaLabel.text = (number + 1).description + ". " + qnas[number].question
            ch1Button.setTitle(chooslist[0], for: .normal)
            ch2Button.setTitle(chooslist[1], for: .normal)
            ch3Button.setTitle(chooslist[2], for: .normal)
            ch4Button.setTitle(chooslist[3], for: .normal)
            scoreLabel.text = score.description
        }else{
            totalScore()
        }
    }
    @objc func timerRun(){
        counter = counter - 1
        timerLabel.text = counter.description
        if counter == 0 && number < qnas.count{
            nextQna()
        }
    }
    func resetCounter10() -> Int {
        return 6
    }
    func totalScore() {
        scoreLabel.text = "總分：" + score.description + "(滿分70)"
        timer.invalidate()
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
