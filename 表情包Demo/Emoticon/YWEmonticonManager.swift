//
//  YWEmonticonManager.swift
//  表情包Demo
//
//  Created by 姚巍 on 16/10/15.
//  Copyright © 2016年 Guangxi City Network Technology Co.,Ltd. All rights reserved.
//

import Foundation
//表情单例：为了便于表情是复用，使用单例，只加载一次表情数据
class YWEmoticonManager {
    static let shared = YWEmoticonManager()
    
    /// 表情包懒加载数组
    lazy var packageArr = [YWEmoticonPackage]()
    
    //构造函数 如果在init之前增加private 修饰符，可以要求调用者必须通过 shared 访问对象
    // OC 要重写 allocWithZone方法
   private init() {
    loadPackages()
    }
    
}

extension YWEmoticonManager {
    
    /// 根据string [爱你] 在所有的表情符号中查找对应是表情模型
    ///
    /// - 如果找到返回表情模型
    /// - 否则 返回nil
    func findEmoticon(string:String?) -> YWEmoticon? {
        //遍历表情包 OC中过滤数组使用[谓词] swift  更简单
        for p in packageArr {
            //方法1.在表情数组中过滤 string
//            let result = p.emoticonArr.filter({ (em) -> Bool in
//                return em.chs == string
//            })
            
            //方法2.尾随闭包 - 当闭包是最后一个参数，圆括号可以提前结束
//            let result = p.emoticonArr.filter(){ (em) -> Bool in
//                return em.chs == string
//            }
            //方法3.如果闭包中只有一句，并且是返回，闭包格式可以省略【闭包格式 指的是 in之前的语句】，参数省略之后，使用$0,$1依次替代
//            let result = p.emoticonArr.filter(){
//                return $0.chs == string
//            }
            //方法4.如果闭包中只有一句，并且是返回，闭包格式可以省略【闭包格式 指的是 in之前的语句】，参数省略之后，使用$0,$1依次替代,return也可以省略
            let result = p.emoticonArr.filter(){ $0.chs == string}
            // 判断 结果数组的数量
            if result.count == 1 {
                return result[0]
            }
        }
        return nil
    }
    
}


// MARK: - 表情包数据处理
fileprivate extension YWEmoticonManager {
    
    func loadPackages() {
        //读取 emoticons.plist
        //只要按照 Bundle 默认的结构目录设定，就可以直接读取 Resources 目录的文件
        guard let path = Bundle.main.path(forResource: "HMEmoticon", ofType: "bundle"),
            let bundle = Bundle(path: path),
            let plistPath = bundle.path(forResource: "emoticons", ofType: "plist"),
            let array = NSArray(contentsOfFile: plistPath) as? [[String:String]],
            let modelArr = NSArray.yy_modelArray(with: YWEmoticonPackage.self, json: array) as? [YWEmoticonPackage] else {
                return
        }
        //设置表情包数组 使用 += 不会再次给packetArr 分配空间， 直接追加数据
        packageArr += modelArr
        
        print(packageArr)

    }
    
}
