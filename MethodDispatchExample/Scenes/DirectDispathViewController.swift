//
//  DirectDispathViewController.swift
//  MethodDispatchExample
//
//  Created by Artem Mushtakov on 29.06.2022.
//

// Как происходит вызов функции: Вызов - Диспетчеризация - Обработка функции
// Диспетчерезация - это инструкции пути до ячейки памяти где находится данная функция
import UIKit

final class DirectDispathViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray

        exampleDirectDispath()
    }

    // Вызов для примера Direct Dispath
    private func exampleDirectDispath() {
        // Example 2
        let directDispathExample = DirectDispathExample()
        print(directDispathExample.getInfo())

        // Example 3
        let directDispathExtension = DirectDispathExtension()
        directDispathExtension.getInfoDirectDispathExtension()

    }
}

// MARK: Direct Dispatch - Статическая диспетчеризация

// Плюсы: Самая быстрая из типов деспетчеризаций. Используется у всех Value-type
// Минусы: Теряется смысл ООП, а точнее наследование, тк это Value-type

// Example 1 Direct Dispatch

final class ExampleDirectDispath {

    func getInfo() {
        print(#function)
    }
}

// Добавление final запрещает наследовать данный класс, соответственно метод нельзя переопределить
// В данном примере будет использоватся Статическая деспетчеризация
// Указывая final для класса мы улучшаем скорость работы программы, тк статическая диспетчеризация самая
// быстрая

// Example 2 Direct Dispatch

protocol DirectDispathProtocol {
    func getInfo()
}

extension DirectDispathProtocol {

    func getInfo() {
        print(#function)
    }
}

// При реализации метода протокола через extension этого протокола, то диспетчеризация этого метода
// меняется с Table Dispath(табличной) на Direct Dispath(статическую).

class DirectDispathExample: DirectDispathProtocol {
    // ...
}

// Example 3 Direct Dispatch

class DirectDispathExtension {
    // ...
}

extension DirectDispathExtension {

    func getInfoDirectDispathExtension() {
        print(#function)
    }
}

// При реализации функции в extension класс его нельзя будет переопределить, соответственно в данном слечае
// у нас будет Direct Dispath(статическая диспетчеризация.)

// Example 4 Direct Dispatch

class DirectDispathPrivateExample {

    private func getInfoDirectDispathPrivate() {
        print(#function)
    }
}

// private функции не могут переопределятся, соответственно они будут иметь Direct Dispath.
