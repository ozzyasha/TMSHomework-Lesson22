//
//  ViewController.swift
//  TMSHomework-Lesson22
//
//  Created by Наталья Мазур on 7.02.24.
//

import UIKit

class ViewController: UIViewController {
    let showMessageButton = UIButton()
    let alertController = UIAlertController(title: "Важное сообщение", message: "Спасибо, что выбрали наше приложение!", preferredStyle: .alert)
    let citiesArray = ["Москва", "Нью-Йорк", "Лондон", "Париж"]
    let citiesPicker = UIPickerView()
    let cityLabel = UILabel()
    var selectedCityIndex: Int?

    override func viewDidLoad() {
        super.viewDidLoad()
        setupShowMessageButton()
        setupAlertController()
        setupCitiesPicker()
        setupCityLabel()
    }

    private func setupShowMessageButton() {
        let buttonHeight: CGFloat = 50
        
        showMessageButton.backgroundColor = .systemBlue
        showMessageButton.setTitle("Показать сообщение", for: .normal)
        showMessageButton.setTitleColor(.white, for: .normal)
        showMessageButton.layer.cornerRadius = buttonHeight / 2
        
        view.addSubview(showMessageButton)
        
        showMessageButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            showMessageButton.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            showMessageButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            showMessageButton.widthAnchor.constraint(equalToConstant: buttonHeight * 4.5),
            showMessageButton.heightAnchor.constraint(equalToConstant: buttonHeight)
        ])
    
        showMessageButton.addTarget(self, action: #selector(showMessageButtonTapped), for: .touchUpInside)
    }
    
    private func setupAlertController() {
        let cancelAction = UIAlertAction(title: "Отмена", style: .destructive)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: { action in
            let thanksAlert = UIAlertController(title: "Спасибо!", message: nil, preferredStyle: .alert)
            self.present(thanksAlert, animated: true)
        
            DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                thanksAlert.dismiss(animated: true)
            }
        })
        alertController.addAction(cancelAction)
        alertController.addAction(okAction)
    }
    
    private func setupCitiesPicker() {
        citiesPicker.delegate = self
        citiesPicker.dataSource = self
        
        view.addSubview(citiesPicker)
        
        citiesPicker.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            citiesPicker.bottomAnchor.constraint(equalTo: showMessageButton.topAnchor, constant: -10),
            citiesPicker.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func setupCityLabel() {
        cityLabel.textColor = .black
        
        view.addSubview(cityLabel)
        
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            cityLabel.bottomAnchor.constraint(equalTo: citiesPicker.topAnchor, constant: -10),
            cityLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    private func updateCityLabelText() {
        if let selectedCityIndex = selectedCityIndex {
            cityLabel.text = citiesArray[selectedCityIndex]
        }
    }
    
    @objc func showMessageButtonTapped() {
        self.present(alertController, animated: true)
    }

}

extension ViewController: UIPickerViewDelegate, UIPickerViewDataSource {
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return citiesArray.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        let city = citiesArray[row]
        selectedCityIndex = row
        updateCityLabelText()
        return city
    }
    
}

//Домашнее задание:
//
//Добавьте на главный экран (UIViewController) кнопку с надписью "Показать сообщение".+
//
//При нажатии на кнопку, открывайте UIAlertController с заголовком и текстом (например, "Важное сообщение" и "Спасибо, что выбрали наше приложение!").+
//UIAlertController должен содержать две кнопки: "OK" и "Отмена". При нажатии на "OK", выведите на экран сообщение "Спасибо!". При нажатии на "Отмена", закройте UIAlertController.+

//Добавьте на главный экран UIPickerView с компонентами для выбора города. Вы можете использовать список городов, например: "Москва", "Нью-Йорк", "Лондон", "Париж". +
//
//Добавьте UILabel для отображения выбранного города. +
//При выборе города в UIPickerView, отобразите выбранный город в UILabel. +

//Добавьте на главный экран ещё одну кнопку с надписью "Загрузить изображение".
//
//При нажатии на кнопку, открывайте UIImagePickerController, который позволит пользователю выбрать изображение из фотоальбома устройства.
//После выбора изображения, отображайте его на экране (например, в UIImageView).

