import UIKit
import SnapKit

class AuthButton: LabelButton {
    private var iconView: UIImageView!
    
    init(fontSize: CGFloat, weight: UIFont.Weight, color: UIColor, iconName: String) {
        super.init(fontSize: fontSize, weight: weight, color: color)
        
        if let iconImage = UIImage(named: iconName) {
            iconView = UIImageView(image: iconImage)
            configureUI()
        }
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func configureUI() {
        guard let iconView = iconView else { return }
        
        addSubview(iconView)
        layer.cornerRadius = 22
        iconView.translatesAutoresizingMaskIntoConstraints = false
        
        iconView.snp.makeConstraints {
            $0.leading.equalToSuperview().inset(25)
            $0.width.equalTo(25)
            $0.height.equalTo(25)
            $0.centerY.equalToSuperview()
        }
    }
}
