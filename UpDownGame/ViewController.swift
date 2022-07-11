import UIKit

class ViewController: UIViewController {
    // 스토리보드와 연결
    var randomValue: Int = 0
    var tryCount: Int = 0
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var tryCountLabel: UILabel!
    @IBOutlet weak var sliderValueLabel: UILabel!
    @IBOutlet weak var minimumValueLabel: UILabel!
    @IBOutlet weak var maximumValueLable: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // 슬라이더 이미지 변경
        slider.setThumbImage(#imageLiteral(resourceName: "slider_thumb"), for: .normal)
        reset()
    }
    // 슬라이더ㅇ
    @IBAction func sliderValueChanged(_ sender: UISlider) {
        print(sender.value)
        let integerValue: Int = Int(sender.value)
        sliderValueLabel.text = String(integerValue)
    }
    // 알림창을 보여주는 함수
    func showAlert(message: String) {
        
        let alert = UIAlertController(title: nil,
                                      message: message, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK",
                                     style: .default) { (action) in
                                        self.reset()
        }
        
        alert.addAction(okAction)
        present(alert,
                animated: true,
                completion: nil)
    }
    // 버튼을 눌렀을 경우를 위한 함수
    @IBAction func touchUpHitButton(_ sender: UIButton) {
        print(slider.value)
        let hitValue: Int = Int(slider.value)
        slider.value = Float(hitValue)
        
        tryCount = tryCount + 1
        tryCountLabel.text = "\(tryCount) / 5"
        
        if randomValue == hitValue {
            showAlert(message: "You HIT!!")
            reset()
        } else if tryCount >= 5 {
            showAlert(message: "You lose...")
            reset()
        } else if randomValue > hitValue {
            slider.minimumValue = Float(hitValue)
            minimumValueLabel.text = String(hitValue)
        } else {
            slider.maximumValue = Float(hitValue)
            maximumValueLable.text = String(hitValue)
        }
    }
    
    // reset 버튼
    @IBAction func touchUpResetButton(_ sender: UIButton) {
        print("touch up reset button")
        reset()
    }
    // reset 시켜주는 함수
    func reset() {
        print("reset!")
        // 0부터 30까지 랜덤변수 생성
        randomValue = Int.random(in: 0...30)
        print(randomValue)
        tryCount =  0
        tryCountLabel.text = "0 / 5"
        slider.minimumValue = 0
        slider.maximumValue = 30
        slider.value = 15
        minimumValueLabel.text = "0"
        maximumValueLable.text = "30"
        sliderValueLabel.text = "15"
    }
}

