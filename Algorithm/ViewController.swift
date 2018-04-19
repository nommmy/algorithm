import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var stageView: UITableView!
    @IBOutlet var scroll: UIScrollView!
    
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
    
     override func viewDidLayoutSubviews() {

        
    
    }
    
    
    //各セルの要素を設定する
    func tableView(_ table: UITableView,
                   cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // セルを取得する
        let cell: UITableViewCell = stageView.dequeueReusableCell(withIdentifier: "tableCell", for: indexPath)
        let cellImage = UIImageView()
        cellImage.image = UIImage(named: "renga_pattern.jpg")
       
        cell.backgroundView = cellImage
        // セルに表示する値を設定する
        cell.textLabel!.text = "stage"
        
        return cell
    }


}

