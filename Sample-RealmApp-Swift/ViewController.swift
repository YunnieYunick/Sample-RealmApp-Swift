//
//  ViewController.swift
//  Sample-RealmApp-Swift
//
//  Created by Yunnie Yunick on 2017/01/22.
//  Copyright © 2017年 yunnieyunick. All rights reserved.
//

import UIKit
import RealmSwift

class ViewController: UIViewController,UITextFieldDelegate {
    
    var count:Int = 0

    @IBOutlet weak var nameField: UITextField!
    @IBOutlet weak var scoreField: UITextField!
    
    var SampleItems:Results<Sample>?{
        do{
            let realm = try! Realm()
            return realm.objects(Sample)
        }catch{
            print("エラー")
        }
        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.nameField.delegate = self
        self.scoreField.delegate = self
        
        let item = SampleItems?[count]
        nameField.text = item?.name
        scoreField.text = String((item?.score)!)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        nameField.resignFirstResponder()
        scoreField.resignFirstResponder()
        return true
    }

    @IBAction func edit(_ sender: Any) {

        let realm = try! Realm()
        let item = realm.objects(Sample)[count]
        try! realm.write {
            item.name = nameField.text!
            item.score = Int(scoreField.text!)!
        }
        
      self.navigationController?.popToRootViewController(animated: true)

    }

    @IBAction func del(_ sender: Any) {

        let realm = try! Realm()
        let item = realm.objects(Sample)[count]
        try! realm.write{
            realm.delete(item)
        }
        self.navigationController?.popToRootViewController(animated: true)
    }
}

