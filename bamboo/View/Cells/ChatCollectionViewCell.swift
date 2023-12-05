import UIKit
import SnapKit

class ChatCollectionViewCell: UICollectionViewCell {
    static let reuseId = "ChatCollectionViewCell"
    
    let container = UIView()
    let bubble = UIView()
    let contentLabel = BambooLabel(fontSize: 14, weight: .medium, color: BambooColors.white)
    let createdAtLabel = BambooLabel(fontSize: 12, weight: .medium, color: BambooColors.gray)
    
    var me: User?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        me = UserViewModel.shared.getUser()
        configureDefaultUI()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setCell(message: Message) {
        guard let me = self.me else { return }
        
        contentLabel.text = message.content
        createdAtLabel.text = DateHelper.getTime(message.createdAt)
        
        
        if me.id == message.senderProfile.userId {
            configureMyMessageUI()
        } else {
            configureOpponentMessageUI()
        }
    }
    
    
    private func configureDefaultUI() {
        self.addSubview(container)
        
        [bubble, createdAtLabel].forEach { container.addSubview($0) }
        
        bubble.addSubview(contentLabel)
        bubble.layer.cornerRadius = 12
        
        container.snp.makeConstraints { make in
            make.horizontalEdges.equalToSuperview().inset(15)
            make.verticalEdges.equalToSuperview()
        }
        
        contentLabel.snp.makeConstraints { make in
            make.edges.equalToSuperview().inset(15)
        }
    }
    
    
    private func configureMyMessageUI() {
        bubble.backgroundColor = BambooColors.green
        
        
        bubble.snp.makeConstraints { make in
            make.trailing.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        createdAtLabel.snp.makeConstraints { make in
            make.trailing.equalTo(bubble.snp.leading).inset(10)
            make.bottom.equalTo(bubble.snp.bottom)
        }
    }
    
    
    private func configureOpponentMessageUI() {
        bubble.backgroundColor = BambooColors.darkGray
        
        bubble.snp.makeConstraints { make in
            make.leading.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        
        createdAtLabel.snp.makeConstraints { make in
            make.leading.equalTo(bubble.snp.leading).offset(10)
            make.bottom.equalTo(bubble.snp.bottom)
        }
    }
    
}
