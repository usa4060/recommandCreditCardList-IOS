import UIKit
import Lottie
class CardDetailViewController : UIViewController {
    var promotionDetail : PromotionDetail?
    
    @IBOutlet weak var lottieView: AnimationView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var periodLabel: UILabel!
    @IBOutlet weak var conditionLabel: UILabel!
    @IBOutlet weak var benefitConditionLabel: UILabel!
    @IBOutlet weak var benefitDetailLabel: UILabel!
    @IBOutlet weak var benefitDateLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // lottie 라이브러리를 활용한 움짤 효과 -> AnimationView를 종속
        let animationView = AnimationView(name: "money")
        lottieView.contentMode = .scaleAspectFit
        lottieView.addSubview(animationView)
        animationView.frame = lottieView.bounds
        animationView.loopMode = .loop
        animationView.play()
    }
        // viewWillAppear에 작성하는 이유는, 최초 view가 생성되었을 때 뿐만 아니라, view가 뒤로가기 등과 같이 다시 재생산 했을 경우에도 결과를 보여주기 위함
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        guard let detail = promotionDetail else {return}
        
        titleLabel.text = """
        \(detail.companyName)카드 쓰면
        \(detail.amount)만원을 드려요
        """
        periodLabel.text = detail.period
        conditionLabel.text = detail.condition
        benefitConditionLabel.text = detail.benefitCondition
        benefitDateLabel.text = detail.benefitDate
        benefitDetailLabel.text = detail.benefitDetail
    }
}
