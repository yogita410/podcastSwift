import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var appTitleLabel: UILabel!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var enterButton: UIButton!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
        styleButton()
        nameTextField.delegate = self
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = false
    }

    private func styleButton() {
        enterButton.backgroundColor = UIColor.systemPurple
        enterButton.setTitleColor(.white, for: .normal)
        enterButton.layer.cornerRadius = 12
        enterButton.titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
    }

    @IBAction func enterTapped(_ sender: UIButton) {
        guard let name = nameTextField.text,
              !name.trimmingCharacters(in: .whitespaces).isEmpty else {
            nameTextField.layer.borderWidth = 1
            nameTextField.layer.borderColor = UIColor.systemRed.cgColor
            nameTextField.layer.cornerRadius = 8
            return
        }
        performSegue(withIdentifier: "LoginToGenre", sender: name.trimmingCharacters(in: .whitespaces))
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "LoginToGenre",
           let destination = segue.destination as? GenreSelectionViewController,
           let name = sender as? String {
            destination.userName = name
        }
    }
}

extension LoginViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        enterTapped(enterButton)
        return true
    }
}
