import UIKit

class DetailsViewController: UIViewController {
    
    var student: Student?
    
    init(student: Student) {
        self.student = student
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        if let student = self.student {
            let age = student.age
            let hobby = student.hobby
        }
        createMainStackView()
    }
    
    func createMainStackView() {
        let mainStackView = UIStackView()
        let ageLabel = UILabel()
        let hobbyLabel = UILabel()
        view.addSubview(mainStackView)
        mainStackView.axis = .vertical
        mainStackView.alignment = .center
        mainStackView.spacing = 20
        mainStackView.translatesAutoresizingMaskIntoConstraints  = false
        mainStackView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor, constant: 18).isActive = true
        mainStackView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor, constant: -18).isActive = true
        mainStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 300).isActive = true
        mainStackView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -200).isActive = true
        mainStackView.addArrangedSubview(createStudentNameLabel())
        ageLabel.text = String(student!.age)
        hobbyLabel.text = student!.hobby
        mainStackView.addArrangedSubview(ageLabel)
        mainStackView.addArrangedSubview(hobbyLabel)
        
    }
    
    
    func createStudentNameLabel() -> UILabel {
        let studentLabel = UILabel()
        studentLabel.text = student!.name
        studentLabel.textColor = .black
        return studentLabel
    }
}
