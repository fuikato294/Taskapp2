//
//  ViewController.swift
//  Taskapp2
//
//  Created by fumitaka katou on 2021/07/30.
//

import UIKit

// UITableViewDelegate：TableViewのユーザ操作に関するプロトコル
// UITableViewDataSource：TableViewの表示内容に関するプロトコル
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 権限をself(ViewController)に移譲する
        tableView.delegate = self
        tableView.dataSource = self
    }

    // データの数（＝セルの数）を返すメソッド
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    // 各セルの内容を返すメソッド
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 再利用可能な cell を得る
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)

        return cell
    }
    
    // 各セルを選択した時に実行されるメソッド
    // ここでは、ユーザがタップした際に、タスク入力画面へ遷移させる
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // ViewController全体からInputViewControllerへ接続しているsegueのIdentifierをcellSegueと名付けている
        performSegue(withIdentifier: "cellSegue",sender: nil)
    }
    
    // セルが編集（つまり、削除）が可能なことを伝えるメソッド
    func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath)-> UITableViewCell.EditingStyle {
        return .delete
    }
    
    // Delete ボタンが押された時に呼ばれるメソッド
    // ここでは、ローカル通知をキャンセルし、データベースからタスクを削除する
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    }
    
}

