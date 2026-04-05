import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var nameTextField: UITextField!

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
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

    @IBAction func enterTapped(_ sender: Any) {
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
        enterTapped(textField)
        return true
    }
}
