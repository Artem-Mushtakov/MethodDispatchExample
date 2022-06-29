//
//  TableDispatchViewController.swift
//  MethodDispatchExample
//
//  Created by Artem Mushtakov on 29.06.2022.
//

import UIKit

// Table Dispath подразделяется на Virtual Table и Witness Table
// Table Dispath более динамична чем Direct Dispath

final class TableDispatchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray

        exampleTableDispath()
    }

    private func exampleTableDispath() {

    }
}

// MARK: - Table Dispath / Virtual Table

// Virtual Table используется в наследовании.
// Плюсы: Соответствует принципам ООП
// Минусы: скорость существенно ниже чем у статической диспетчеризации
// Принцип работы: для каждого класса и его наследника создается виртуальная таблица которая дает инструкции
// нахождения функции процессору

// Example 1 Virtual Table

class VirtualTableExample {

    func getInfo() {
        print(#function)
    }
}

class VirtualTable: VirtualTableExample {

    override func getInfo() {
        print(#function)
    }

    func getInfoVirtualTable() {
        print(#function)
    }
}

// Создается класс и его саб класс, для каждого из них создается отдельная виртуальная таблица
/*
 ______________________________         ______________________________
 |   VirtualTableExample      |         |   VirtualTable             |
 |____________________________|         |____________________________|
 |VirtualTableExample | 0xx5B0|         |VirtualTableExample | 0xx5B0|
 |getInfo             | 0xx370|         |getInfo             | 0xx370|
 |____________________|_______|         |getInfoVirtualTable | 0xx444|
                                        |____________________|_______|
 */

// MARK: - Table Dispath / Witness Table

// Witness table используется для реализации протоколов и используется для классов которые реализуют
// данный протокол. Процессор также находит путь до функции через таблицу
// Плюсы: использование Полиморфизма
// Минусы: низкая скорость, аналогична Virtual Table. Отсутствует наследование.

// Example Witness Table

protocol WitnessTableExampleProtocol {
    func getInfoWitnessTableProtocol()
}

class WitnessTableExampleClass: WitnessTableExampleProtocol {

    func getInfoWitnessTableProtocol() {
        print(#function)
    }
}

class WitnessTableExampleTwoClass: WitnessTableExampleProtocol {

    func getInfoWitnessTableProtocol() {
        print(#function)
    }
}

/*
 ______________________________________         ______________________________________
 |       WitnessTableExampleClass     |         |     WitnessTableExampleTwoClass    |
 |____________________________________|         |____________________________________|
 |WitnessTableExampleProtocol | 0xx3C0|         |WitnessTableExampleProtocol | 0xx5B0|
 |getInfoWitnessTableProtocol | 0xx370|         |getInfoWitnessTableProtocol | 0xx370|
 |____________________________|_______|         |____________________________|_______|

 */
