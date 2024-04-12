import UIKit

class ViewController: UIViewController {
    
    var tableView = UITableView()
    var students = [Student]()
    var studentNames = [String]()
    var contactsFirstLetters = [String]()
    var studentsDictionary = [String: [String]]()
    var headerView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        title = "iOS Squad"
        navigationController?.navigationBar.prefersLargeTitles = true
        headerView = createHeaderView()
        tableView.tableHeaderView = headerView
        configureTableView()
        students = fetchData()
        studentNames = fetchNames()
        contactsFirstLetters = createContactsFirstLetters()
        createContactsDictionary()
    }
    
    func createHeaderViewImage() -> UIImageView {
        let image = UIImageView()
        image.image = UIImage(named: "me")
        image.translatesAutoresizingMaskIntoConstraints = false
        image.heightAnchor.constraint(equalToConstant: 65).isActive = true
        image.widthAnchor.constraint(equalToConstant: 65).isActive = true
        
        return image
    }
    
    func createHeaderViewLabel() -> UILabel {
        let label = UILabel()
        label.text = "Tamo Kakhidze"
        label.font = UIFont.systemFont(ofSize: 22)
        label.textColor = .black
        label.translatesAutoresizingMaskIntoConstraints = false
        label.heightAnchor.constraint(equalToConstant: 28).isActive = true
        label.widthAnchor.constraint(equalToConstant: 230).isActive = true
        
        return label
    }
    
    func createHeaderView() -> UIStackView {
        let headerView = UIStackView()
        headerView.translatesAutoresizingMaskIntoConstraints = false
        headerView.heightAnchor.constraint(equalToConstant: 72).isActive = true
        headerView.widthAnchor.constraint(equalToConstant: 343).isActive = true
        headerView.axis = .horizontal
        let nextButton = UIButton()
        let image = UIImage(systemName: "chevron.right")
        nextButton.setImage(image, for: .normal)
        headerView.distribution = .equalSpacing
        headerView.addArrangedSubview(createHeaderViewImage())
        headerView.addArrangedSubview(createHeaderViewLabel())
        headerView.addArrangedSubview(nextButton)
        
        return headerView
    }
    
    func createContactsFirstLetters() -> [String] {
        for name in studentNames {
            if let firstCharacter = name.first {
                let letter = String(firstCharacter)
                contactsFirstLetters.append(letter)
            }
        }
        contactsFirstLetters = Array(Set(contactsFirstLetters))
        contactsFirstLetters.sort()
        print(contactsFirstLetters)
        return contactsFirstLetters
    }

    
    func createContactsDictionary() {
        for studentName in studentNames {
            guard let firstLetter = studentName.first else { continue }
            
            let letter = String(firstLetter)
            
            studentsDictionary[letter, default: []].append(studentName)
        }
        print(studentsDictionary)
    }
    
    func configureTableView() {
        view.addSubview(tableView)
        setDelegates()
        tableView.rowHeight = 44.5
        tableView.register(ContactCell.self, forCellReuseIdentifier: "ContactCell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 16).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -16).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -3).isActive = true
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 50).isActive = true
        
    }
    
    func setDelegates() {
        tableView.delegate = self
        tableView.dataSource = self
        
    }


}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return studentsDictionary[String(contactsFirstLetters[section])]?.count ?? 0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        contactsFirstLetters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "ContactCell") as! ContactCell
        cell.contactNameLabel.text = studentsDictionary[contactsFirstLetters[indexPath.section]]?[indexPath.row]
        //cell.contactNameLabel.text = studentNames[indexPath.row]
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let headerView = UIView()
        let titleLabel = UILabel()
        
        titleLabel.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
        titleLabel.textColor = .lightGray
        titleLabel.text = contactsFirstLetters[section]
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        headerView.addSubview(titleLabel)
        
        titleLabel.leadingAnchor.constraint(equalTo: headerView.leadingAnchor, constant: 0).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: headerView.centerYAnchor).isActive = true
        
        return headerView
    }
    
    func sectionIndexTitles(for tableView: UITableView) -> [String]? {
        contactsFirstLetters
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let studentName = studentsDictionary[contactsFirstLetters[indexPath.section]]?[indexPath.row]
        
        if let selectedStudent = students.first(where: { $0.name == studentName }) {
            let detailsVC = DetailsViewController(student: selectedStudent)
            navigationController?.pushViewController(detailsVC, animated: false)
        }
    }
    
}

struct Student {
    var name: String
    var age: Int
    var hobby: String
}

extension ViewController {
    
    func fetchData() -> [Student] {
        let students = [
            Student(name: "Akaki Titberidze", age: 28, hobby: "playing the guitar"),
            Student(name: "Aleksandre Saroiani", age: 31, hobby: "gardening and landscaping"),
            Student(name: "Ana Ioramashvili", age: 24, hobby: "cooking international cuisines"),
            Student(name: "Ana Namgaladze", age: 26, hobby: "fashion design and sewing"),
            Student(name: "Archil Menabde", age: 30, hobby: "playing basketball and coaching"),
            Student(name: "Barbare Tepnadze", age: 27, hobby: "learning to code"),
            Student(name: "Bakar Kharabadze", age: 24, hobby: "woodworking and carpentry"),
            Student(name: "Begi Kopaliani", age: 32, hobby: "cooking and baking"),
            Student(name: "Data Robakidze", age: 25, hobby: "singing and songwriting"),
            Student(name: "Elene Donadze", age: 25, hobby: "digital painting"),
            Student(name: "Gega Tatulishvili", age: 29, hobby: "rock climbing and hiking"),
            Student(name: "Gvantsa Gvagvalia", age: 24, hobby: "reading and book collecting"),
            Student(name: "Giorgi Michitashvili", age: 26, hobby: "playing soccer and coaching"),
            Student(name: "Irina Datoshvili", age: 22, hobby: "playing the piano"),
            Student(name: "Luka Gujejiani", age: 27, hobby: "traveling and photography"),
            Student(name: "Luka Kharatishvili", age: 29, hobby: "running and fitness"),
            Student(name: "Mariam Sreseli", age: 31, hobby: "gardening and landscaping"),
            Student(name: "Nika Kakhniashvili", age: 27, hobby: "reading and book collecting"),
            Student(name: "Nini Bardavelidze", age: 23, hobby: "traveling and photography"),
            Student(name: "Nodar Ghachava", age: 30, hobby: "mountain biking"),
            Student(name: "Nutsa Beriashvili", age: 30, hobby: "painting and drawing"),
            Student(name: "Raisa Badalova", age: 23, hobby: "playing the violin"),
            Student(name: "Sandro Gelashvili", age: 28, hobby: "cooking and baking"),
            Student(name: "Sandro Kupatadze", age: 26, hobby: "singing and songwriting"),
            Student(name: "Salome Topuria", age: 25, hobby: "painting and drawing"),
            Student(name: "Tamuna Kakhidze", age: 22, hobby: "writing and blogging"),
            Student(name: "Temuri Chitashvili", age: 28, hobby: "rock climbing"),
            Student(name: "Tornike Elyanishvili", age: 26, hobby: "writing poetry"),
            Student(name: "Valeri Mekhashishvili", age: 29, hobby: "playing chess"),
            Student(name: "Vano Kvakhadze", age: 22, hobby: "fashion design and sewing"),
            Student(name: "Zuka Papuashvili", age: 32, hobby: "playing the guitar")
        ]

        return students
    }
    
    func fetchNames() -> [String] {
        let students = fetchData()
        let names = students.map { $0.name }
        print(names)
        return names
    }
}

#Preview {
    ViewController()
}



