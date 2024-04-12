import UIKit

class ContactCell: UITableViewCell {
    
    var contactNameLabel = UILabel()
    var nextButton = UIButton()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubview(contactNameLabel)
        addSubview(nextButton)
        configureNextButton()
        configureContactName()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureContactName() {
        contactNameLabel.font.withSize(17)
        contactNameLabel.translatesAutoresizingMaskIntoConstraints = false
        contactNameLabel.heightAnchor.constraint(equalToConstant: 22).isActive = true
        contactNameLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        contactNameLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
    }
    
    func configureNextButton() {
        let image = UIImage(systemName: "chevron.right")
        nextButton.setImage(image!.withTintColor(.gray), for: .normal)
        nextButton.translatesAutoresizingMaskIntoConstraints = false
        nextButton.heightAnchor.constraint(equalToConstant: 12.3).isActive = true
        nextButton.widthAnchor.constraint(equalToConstant: 7.16).isActive = true
        nextButton.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        nextButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -16).isActive = true
        
        
    }
    
}

#Preview {
    ViewController()
}
