//
//  ViewController.swift
//  L4S_05_StopWatch
//
//  Created by 鍋島 由輝 on 2019/02/05.
//  Copyright © 2019 ValJapan. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet var label: UILabel!


    var count: Float = 0.0
    var timer: Timer = Timer()

    @IBOutlet var hanteiLabel: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func start() {
        if !timer.isValid {
//            タイマーが動作していなかったら動かす
            timer = Timer.scheduledTimer(timeInterval: 0.01
                , target: self
                , selector: #selector(self.up)
                , userInfo: nil
                , repeats: true)
        }
        hanteiLabel.text = ""
    }

    @objc func up() {
        //countを0.01足す
        count = count + 0.01

        //ラベルに小数点以下2桁まで表示
        label.text = String(format: "%.2f", count)
    }

    @IBAction func stop() {
        if timer.isValid {
            //タイマーが動作したら停止する
            timer.invalidate()
        }
        //hanteiメソッドの予備さし、結果を表示する
        self.hantei()
    }

    @IBAction func reset() {
        if timer.isValid {
            //タイマーが動作していたら停止する
            timer.invalidate()
        }

        //カウントを0.0に初期化する
        count = 0.0

        //初期化したcountをlabelに表示させる
        label.text = String(format: "%.2f", count)
        hanteiLabel.text = String("")
    }

    @objc func hantei() {
        if count > 9.80 && count < 10.20 { //もし経過時間が9.80秒〜10.20美長だったら
            hanteiLabel.text = "PERFECT!" //PERFECTと表示
        } else if count > 9.70 && count < 10.30 { //もし経過時間が9.70秒〜10.30美長だったら
            hanteiLabel.text = "GREAT!" //GREAT!と表示
        } else if count > 9.50 && count < 10.50 { //もし経過時間が9.50秒〜10.50美長だったら
            hanteiLabel.text = "GOOD!" //GOOD!と表示
        } else { //もしそれ以外だったら
            hanteiLabel.text = "BAD!" //BAD!と表示
        }
    }

}

