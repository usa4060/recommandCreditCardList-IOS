import UIKit
import Kingfisher
import FirebaseDatabase
class CardListViewController : UITableViewController {
    var ref : DatabaseReference! // Firebase Realtime Database를 가져올 수 있는 레퍼런스 값
    
    var creditCardList : [CreditCard] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // UITableView Cell Register
        let nibname = UINib(nibName: "CardListCell", bundle: nil)
        tableView.register(nibname, forCellReuseIdentifier: "CardListCell")
        
        // Firebase가 우리의 Database를 잡아내고, Firebase의 Realtime Database와 주고 받게 된다.
        ref = Database.database().reference()
        
        // observe를 통해 Realtime Database의 값을 가져오게 되는데 snapshot이라는 변수로 가져오게 된다.
        ref.observe(.value) { snapshot in
            // 가져오는 value는 Dictionary의 형태로 가져오게 된다 -> as? [ : [ : ]]
            guard let value = snapshot.value as? [String : [String: Any]] else {return}
            
            // 가져욘 value를 JSONDecoding 하게 되는데, 이는 try문의 형태로 주어진다.
            do {
                // Database의 자료를 JSON형식으로 변환
                let jsonData = try JSONSerialization.data(withJSONObject: value)
                // JSON형식으로 변환된 Data를 [String : CreditCard]의 형식으로 변환
                let cardData = try JSONDecoder().decode([String : CreditCard].self, from: jsonData)
                // 각 cardData의 값들을 Array형식으로 변환 및 정렬
                let cardList = try Array(cardData.values)
                self.creditCardList = cardList.sorted{$0.rank < $1.rank}
                
                // UI는 메인 쓰레드에서 그려야하기 때문에 DispatchQueue를 사용
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
            catch let error{
                print("ERROR JSON parsing \(error.localizedDescription)")
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return creditCardList.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "CardListCell", for: indexPath) as? CardListCell else {return UITableViewCell()}
        
        cell.rankLabel.text = "\(creditCardList[indexPath.row].rank)"
        cell.promotionLabel.text = "\(creditCardList[indexPath.row].promotionDetail.amount)만원 증정"
        cell.cardNameLabel.text = "\(creditCardList[indexPath.row].name)"
        
        let imageURL = URL(string: creditCardList[indexPath.row].cardImageURL)
        cell.cardImageView.kf.setImage(with: imageURL)
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //상세화면 전달
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let detailViewController = storyboard.instantiateViewController(identifier: "CardDetailViewController") as? CardDetailViewController else {return}
                
        
        detailViewController.promotionDetail = creditCardList[indexPath.row].promotionDetail
        self.show(detailViewController, sender: nil)
        
        // option1
        let cardID = creditCardList[indexPath.row].id
        ref.child("Item\(cardID)/isSelected").setValue(true)
        
        // option2
        // 특정 key의 값이 cardID값과 같은 객체를 찾아서 snapshot으로 찍어서 해당 값을 '쓰기' 하는 방식
        // 처음에는 id의 값이 특정되어 있지 않아서, 해당 객체를 직접 찾을 수는 없지만 객체 내부의 값을 검색하여 찾는 방식이다.
        ref.queryOrdered(byChild: "id").queryEqual(toValue: cardID).observe(.value){ [weak self]snapshot in
            guard let self = self,
                  let value = snapshot.value as? [String : [String : Any]],
                  let key = value.keys.first else {return}
            
            self.ref.child("\(key)/isSelected").setValue(true)
        }
    }
}
