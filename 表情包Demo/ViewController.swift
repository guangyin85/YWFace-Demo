//
//  ViewController.swift
//  表情包Demo
//
//  Created by 姚巍 on 16/10/8.
//  Copyright © 2016年 Guangxi City Network Technology Co.,Ltd. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var testlabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        let m1 = YWEmoticonManager.shared
        // 测试表情图像
        print(m1.packageArr.last?.emoticonArr.first?.image)
        
        //测试查找表情
        print(m1.findEmoticon(string: "[笑哈哈]"))
        
        //测试直接生成表情属性文本
        let emo = YWEmoticonManager.shared.findEmoticon(string: "[马到成功]")
        testlabel.attributedText = emo?.imageText(font: testlabel.font);
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

