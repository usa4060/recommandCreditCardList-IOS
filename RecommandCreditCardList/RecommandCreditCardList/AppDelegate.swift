
import UIKit
import Firebase
import FirebaseFirestoreSwift

@main
class AppDelegate: UIResponder, UIApplicationDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        //firebase 등록
        FirebaseApp.configure()
        
        let db = Firestore.firestore()
        
        // 처음 실행할 때, document가 존재하는지 확인하기 위해 .getDocuments를 이용해서 snapshot을 가져온다.
        db.collection("creditCardList").getDocuments { snapshot, _ in
            guard snapshot?.isEmpty == true else {return}
            let batch = db.batch()
            
            // creditCardList라는 collection에 card0라는 경로를 만들어 준 것이다.
            // 동일하게 10개 만들기
            let card0Ref = db.collection("creditCardList").document("card0")
            let card1Ref = db.collection("creditCardList").document("card1")
            let card2Ref = db.collection("creditCardList").document("card2")
            let card3Ref = db.collection("creditCardList").document("card3")
            let card4Ref = db.collection("creditCardList").document("card4")
            let card5Ref = db.collection("creditCardList").document("card5")
            let card6Ref = db.collection("creditCardList").document("card6")
            let card7Ref = db.collection("creditCardList").document("card7")
            let card8Ref = db.collection("creditCardList").document("card8")
            let card9Ref = db.collection("creditCardList").document("card9")
            
            // batch에 넣는 setData라는 함수가 throw함수 이기때문에 do ~ catch 문으로 작성
            do{
                try batch.setData(from: CreditCardDummy.card0, forDocument: card0Ref)
                try batch.setData(from: CreditCardDummy.card1, forDocument: card1Ref)
                try batch.setData(from: CreditCardDummy.card2, forDocument: card2Ref)
                try batch.setData(from: CreditCardDummy.card3, forDocument: card3Ref)
                try batch.setData(from: CreditCardDummy.card4, forDocument: card4Ref)
                try batch.setData(from: CreditCardDummy.card5, forDocument: card5Ref)
                try batch.setData(from: CreditCardDummy.card6, forDocument: card6Ref)
                try batch.setData(from: CreditCardDummy.card7, forDocument: card7Ref)
                try batch.setData(from: CreditCardDummy.card8, forDocument: card8Ref)
                try batch.setData(from: CreditCardDummy.card9, forDocument: card9Ref)
            }
            catch let error{
                print("ERROR writing card to firebase \(error.localizedDescription)")
            }
            
            // 반드시 batch.commit을 해 주어야 데이터가 추가가 된다.
            batch.commit()
        }
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
    }


}

