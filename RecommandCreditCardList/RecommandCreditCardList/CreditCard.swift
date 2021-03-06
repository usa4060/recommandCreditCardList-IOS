import Foundation

struct CreditCard : Codable{
    let cardImageURL : String
    let id : Int
    let rank : Int
    let name : String
    let promotionDetail : PromotionDetail
    let isSelected : Bool?
}


struct PromotionDetail : Codable{
    let companyName : String
    let amount : Int
    let period : String
    let benefitDate : String
    let benefitDetail : String
    let benefitCondition : String
    let condition : String
}
