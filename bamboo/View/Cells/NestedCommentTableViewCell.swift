import UIKit
import SnapKit
import Kingfisher

class NestedCommentTableViewCell: UITableViewCell {
    static let reuseId = "NestedCommentTableViewCell"
    
    let replyIndicateIcon = UIImageView(image: UIImage(systemName: "arrow.turn.down.right"))
    let profileImageView = UIImageView()
    let usernameLabel = BambooLabel(fontSize: 12, weight: .medium, color: BambooColors.gray)
    let createdAtLabel = BambooLabel(fontSize: 10, weight: .medium, color: BambooColors.gray)
    let commentLabel = BambooLabel(fontSize: 14, weight: .regular, color: BambooColors.white)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.selectionStyle = .none
        configureUI()
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    
    func setCell(comment: Comment) {
        if let profileImage = comment.author.profile.profileImage,
           let profileImageUrl = URL(string: profileImage) {
            profileImageView.kf.setImage(with: profileImageUrl)
        }
        
        usernameLabel.text = comment.author.profile.username
        createdAtLabel.text = DateHelper.getElapsedTime(comment.createdAt)
        commentLabel.text = comment.content
    }
    
    
    private func configureUI() {
        let verticalPadding: CGFloat = 15
        let horizontalPadding: CGFloat = 20
        
        backgroundColor = BambooColors.navy
        
        [replyIndicateIcon, profileImageView, usernameLabel,
         createdAtLabel, commentLabel].forEach { addSubview($0) }
        
        replyIndicateIcon.tintColor = BambooColors.gray
        replyIndicateIcon.snp.makeConstraints { make in
            make.width.height.equalTo(15)
            make.leading.equalToSuperview().inset(horizontalPadding)
            make.top.equalToSuperview().inset(verticalPadding)
        }
        
        profileImageView.layer.cornerRadius = 10
        profileImageView.clipsToBounds = true
        profileImageView.snp.makeConstraints { make in
            make.leading.equalTo(replyIndicateIcon.snp.trailing).offset(10)
            make.top.equalToSuperview().inset(verticalPadding)
            make.width.height.equalTo(20)
        }
        
        usernameLabel.snp.makeConstraints { make in
            make.centerY.equalTo(profileImageView)
            make.leading.equalTo(profileImageView.snp.trailing).offset(10)
        }
        
        createdAtLabel.snp.makeConstraints { make in
            make.centerY.equalTo(usernameLabel)
            make.leading.equalTo(usernameLabel.snp.trailing).offset(10)
        }
        
        commentLabel.snp.makeConstraints { make in
            make.top.equalTo(profileImageView.snp.bottom).offset(10)
            make.bottom.equalToSuperview().inset(verticalPadding)
            make.leading.equalTo(profileImageView)
            make.trailing.equalToSuperview().inset(horizontalPadding)
        }
    }
    
}