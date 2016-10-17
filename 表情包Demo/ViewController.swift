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
        let string = "我[爱你]啊！！ [笑哈哈],我想[泪]了，[马上有对象]是骗人的，这是马上面有对象[哼]"
        testlabel.attributedText = YWEmoticonManager.shared.emoticonString(string: string, font: testlabel.font)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

