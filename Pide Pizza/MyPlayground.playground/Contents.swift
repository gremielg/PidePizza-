import UIKit

var str = "Hello, playground"

var tamano:String

var a = 1.35555
var b = round

let formatter = NumberFormatter()
formatter.locale = Locale.current // Change this to another locale if you want to force a specific locale, otherwise this is redundant as the current locale is the default already
formatter.numberStyle = .currency
if let formattedTipAmount = formatter.string(from: tipAmount as NSNumber) {
    tipAmountLabel.text = "Tip Amount: \(formattedTipAmount)"
}
