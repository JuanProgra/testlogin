//
//  SubViewController.swift
//  testloginfb
//
//  Created by Juan Lopez on 4/03/18.
//  Copyright © 2018 Juan Lopez. All rights reserved.
//

import UIKit

class SubViewController: UIViewController, UITextFieldDelegate {
    var item = UserModel()

    let colorPrimary = UIColor(r: 204, g: 153, b: 102, a: 1)
    let colorBlack = UIColor(r: 32, g: 32, b: 32, a: 1)

    let inputContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(r: 255, g: 255, b: 255, a: 0)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let buttonContainerView: UIView = {
        let view = UIView()
        view.backgroundColor = UIColor(r: 255, g: 255, b: 255, a: 1)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    let nameTextField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.attributedPlaceholder = NSAttributedString(string: "Nombres", attributes: [NSAttributedStringKey.foregroundColor: UIColor(r: 104, g: 106, b: 106, a: 1)])
        tf.keyboardType = .alphabet
        tf.autocorrectionType = .no
        tf.autocapitalizationType = .none
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()

    let lastNameTextField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.attributedPlaceholder = NSAttributedString(string: "Apellidos", attributes: [NSAttributedStringKey.foregroundColor: UIColor(r: 104, g: 106, b: 106, a: 1)])
        tf.keyboardType = .alphabet
        tf.autocorrectionType = .no
        tf.autocapitalizationType = .none
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()


    let yearTextField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.attributedPlaceholder = NSAttributedString(string: "Edad", attributes: [NSAttributedStringKey.foregroundColor: UIColor(r: 104, g: 106, b: 106, a: 1)])
        tf.keyboardType = .numberPad
        tf.autocorrectionType = .no
        tf.autocapitalizationType = .none
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()

    let phoneTextField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.attributedPlaceholder = NSAttributedString(string: "Teléfono", attributes: [NSAttributedStringKey.foregroundColor: UIColor(r: 104, g: 106, b: 106, a: 1)])
        tf.keyboardType = .phonePad
        tf.autocorrectionType = .no
        tf.autocapitalizationType = .none
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()

    let positionTextField: UITextField = {
        let tf = UITextField()
        tf.borderStyle = .roundedRect
        tf.attributedPlaceholder = NSAttributedString(string: "Ubicación", attributes: [NSAttributedStringKey.foregroundColor: UIColor(r: 104, g: 106, b: 106, a: 1)])
        tf.keyboardType = .default
        tf.autocorrectionType = .no
        tf.isEnabled = false
        tf.autocapitalizationType = .none
        tf.translatesAutoresizingMaskIntoConstraints = false
        return tf
    }()
    
    let saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.borderWidth = 1;
        button.setTitle("Guardar", for: .normal)
        button.titleColor(for: .normal)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.tintColor = UIColor(r: 167, g: 170, b: 172, a: 1)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let cancelButton: UIButton = {
        let button = UIButton(type: .system)
        button.layer.borderWidth = 1;
        button.setTitle("Cancelar", for: .normal)
        button.titleColor(for: .normal)
        button.titleLabel?.adjustsFontSizeToFitWidth = true
        button.tintColor = UIColor(r: 167, g: 170, b: 172, a: 1)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        navigationItem.title = "Usuario"

        self.navigationController?.navigationBar.tintColor = colorPrimary
        self.navigationController?.navigationBar.barTintColor = UIColor.black
        self.navigationController?.navigationBar.titleTextAttributes =
                [NSAttributedStringKey.foregroundColor: colorPrimary]

        view.backgroundColor = UIColor(r: 255, g: 255, b: 255, a: 1)

        view.addSubview(inputContainerView)

        setupInputsContainerView()

        self.nameTextField.delegate = self
        self.lastNameTextField.delegate = self
        self.yearTextField.delegate = self
        self.phoneTextField.delegate = self

        if item != nil {
            setValuesItems(item: item)
        }
    }

    func setValuesItems(item: UserModel) {
        self.nameTextField.text = item.name
        self.lastNameTextField.text = item.lastName
        self.yearTextField.text = item.year
        self.phoneTextField.text = item.phone
    }

    func setupInputsContainerView() {
        inputContainerView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        inputContainerView.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: 24).isActive = true
        inputContainerView.widthAnchor.constraint(equalTo: view.widthAnchor, constant: -24).isActive = true
        inputContainerView.heightAnchor.constraint(equalTo: view.heightAnchor, constant: -140).isActive = true

        inputContainerView.addSubview(nameTextField)
        inputContainerView.addSubview(lastNameTextField)
        inputContainerView.addSubview(yearTextField)
        inputContainerView.addSubview(phoneTextField)
        inputContainerView.addSubview(positionTextField)
        inputContainerView.addSubview(buttonContainerView)

        nameTextField.leftAnchor.constraint(equalTo: inputContainerView.leftAnchor, constant: 12).isActive = true
        nameTextField.topAnchor.constraint(equalTo: inputContainerView.topAnchor).isActive = true
        nameTextField.widthAnchor.constraint(equalTo: inputContainerView.widthAnchor, constant: -24).isActive = true

        lastNameTextField.leftAnchor.constraint(equalTo: inputContainerView.leftAnchor, constant: 12).isActive = true
        lastNameTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 24).isActive = true
        lastNameTextField.widthAnchor.constraint(equalTo: nameTextField.widthAnchor).isActive = true

        yearTextField.leftAnchor.constraint(equalTo: inputContainerView.leftAnchor, constant: 12).isActive = true
        yearTextField.topAnchor.constraint(equalTo: lastNameTextField.bottomAnchor, constant: 24).isActive = true
        yearTextField.widthAnchor.constraint(equalTo: lastNameTextField.widthAnchor).isActive = true

        phoneTextField.leftAnchor.constraint(equalTo: inputContainerView.leftAnchor, constant: 12).isActive = true
        phoneTextField.topAnchor.constraint(equalTo: yearTextField.bottomAnchor, constant: 24).isActive = true
        phoneTextField.widthAnchor.constraint(equalTo: yearTextField.widthAnchor).isActive = true

        positionTextField.leftAnchor.constraint(equalTo: inputContainerView.leftAnchor, constant: 12).isActive = true
        positionTextField.topAnchor.constraint(equalTo: phoneTextField.bottomAnchor, constant: 24).isActive = true
        positionTextField.widthAnchor.constraint(equalTo: phoneTextField.widthAnchor).isActive = true
        
        buttonContainerView.leftAnchor.constraint(equalTo: inputContainerView.leftAnchor, constant: 12).isActive = true
        buttonContainerView.topAnchor.constraint(equalTo: positionTextField.bottomAnchor, constant: 30).isActive = true
        buttonContainerView.widthAnchor.constraint(equalTo: positionTextField.widthAnchor).isActive = true
        buttonContainerView.heightAnchor.constraint(equalTo: inputContainerView.heightAnchor, multiplier: 1 / 7).isActive = true
        
        setupButtonsContainerView()
    }
    
    func setupButtonsContainerView(){
        
        buttonContainerView.addSubview(cancelButton)
        buttonContainerView.addSubview(saveButton)
        
        cancelButton.leftAnchor.constraint(equalTo: buttonContainerView.leftAnchor, constant: 12).isActive = true
        cancelButton.topAnchor.constraint(equalTo: buttonContainerView.topAnchor).isActive = true
        cancelButton.widthAnchor.constraint(equalTo: buttonContainerView.widthAnchor , multiplier: 1 / 3).isActive = true
        
        saveButton.rightAnchor.constraint(equalTo: buttonContainerView.rightAnchor, constant: -12).isActive = true
        saveButton.topAnchor.constraint(equalTo: buttonContainerView.topAnchor).isActive = true
        saveButton.widthAnchor.constraint(equalTo: cancelButton.widthAnchor).isActive = true
    }

    // Lifting the view up
    func animateViewMoving(up: Bool, moveValue: CGFloat) {
        let movementDuration: TimeInterval = 0.3
        let movement: CGFloat = (up ? -moveValue : moveValue)
        UIView.beginAnimations("animateView", context: nil)
        UIView.setAnimationBeginsFromCurrentState(true)
        UIView.setAnimationDuration(movementDuration)
        self.view.frame = self.view.frame.offsetBy(dx: 0, dy: movement)
        UIView.commitAnimations()
    }

    // UITextField Delegates
    func textFieldDidBeginEditing(_ textField: UITextField) {
        //animateViewMoving(up: true, moveValue: 10)
    }

    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        return true;
    }

    func textFieldShouldClear(_ textField: UITextField) -> Bool {
        return true;
    }

    func textFieldShouldEndEditing(_ textField: UITextField) -> Bool {
        return true;
    }

    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return true;
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder();
        return true;
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
}
