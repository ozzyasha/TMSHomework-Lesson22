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

    override func viewDidLoad() {
        super.viewDidLoad()
        setupShowMessageButton()
        setupAlertController()
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
    
    @objc func showMessageButtonTapped() {
        self.present(alertController, animated: true)
    }

}

//Домашнее задание:
//
//Добавьте на главный экран (UIViewController) кнопку с надписью "Показать сообщение".+
//
//При нажатии на кнопку, открывайте UIAlertController с заголовком и текстом (например, "Важное сообщение" и "Спасибо, что выбрали наше приложение!").+
//UIAlertController должен содержать две кнопки: "OK" и "Отмена". При нажатии на "OK", выведите на экран сообщение "Спасибо!". При нажатии на "Отмена", закройте UIAlertController.+

//Добавьте на главный экран UIPickerView с компонентами для выбора города. Вы можете использовать список городов, например: "Москва", "Нью-Йорк", "Лондон", "Париж".
//
//Добавьте UILabel для отображения выбранного города.
//При выборе города в UIPickerView, отобразите выбранный город в UILabel.
//Добавьте на главный экран ещё одну кнопку с надписью "Загрузить изображение".
//
//При нажатии на кнопку, открывайте UIImagePickerController, который позволит пользователю выбрать изображение из фотоальбома устройства.
//После выбора изображения, отображайте его на экране (например, в UIImageView).

