import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var stageView: UITableView!
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
       
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    //各セルの要素を設定する
    func tableView(_ table: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // セルを取得する
        let cell: UITableViewCell = stageView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath)
        //セル背景
        let cellImage = UIImageView()
        cellImage.image = UIImage(named: "renga_pattern.jpg")
        cell.backgroundView = cellImage
        //セルを押した時の背景
        let cellSelectedImage = UIImageView()
        cellSelectedImage.image = UIImage(named: "renga_pattern_selected.jpg")
        cell.selectedBackgroundView = cellSelectedImage
        
        //一番上と一番下は押させない
           // セルに表示する値を設定する
        if indexPath.row==0{
            cell.isUserInteractionEnabled = false
        }else if indexPath.row == 8{
            cell.isUserInteractionEnabled = false
        }else{
            cell.textLabel!.text = "STAGE \(8-indexPath.row)"
            cell.textLabel?.textColor = UIColor(red: 1.00, green: 0.98, blue: 0.95, alpha: 1.0);
            cell.textLabel?.font = UIFont(name: "GillSans-UltraBold", size: 22)
            cell.textLabel?.textAlignment = NSTextAlignment.center
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //セルの選択解除
        tableView.deselectRow(at: indexPath, animated: true)
    
        //ここに遷移処理を書く
        performSegue(withIdentifier: "toMapCreate",sender: nil)
        
    }
    
    // Segueで遷移時の処理
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject!) {
//        if (segue.identifier == "toMapCreate") {
//            let secondVC: SecondViewController = (segue.destinationViewController as? SecondViewController)!
//
//            // 11. SecondViewControllerのtextに選択した文字列を設定する
//            secondVC.text = selectedText
//        }
//    }



}

