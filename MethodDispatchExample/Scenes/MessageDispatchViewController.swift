//
//  MessageDispatchViewController.swift
//  MethodDispatchExample
//
//  Created by Artem Mushtakov on 30.06.2022.
//

import UIKit

// Message Dispath самый динамичный вызов функции с помощью Objective C
// Работает в RunTime
// Лежит в основе Key Value Observable (KVO)
// Так так Message Dispath работает в RunTime можно подменять реализацию методов через Method Swizzling
// Method Swizzling может подменять оригинальную исплементацию функции в RunTime.
// А также в RunTime можно менять экземпляры классов.

// Плюсы: Method Swizzling и наивысшая динамичность
// Минусы: Самая медленная скорость

final class MessageDispatchViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        exampleMessageDispath()
    }

    private func exampleMessageDispath() {

    }
}

// MARK: - Message Dispath

// Для реализации Message Dispath диспетчеризации используется префикс @objc dynamic
// или можно добавить по дефоолту @objcMembers классу, тогда все его функции станут @objc dynamic по дефолту

protocol MessageDispathProtocol {
    func getInfoMessageDispathProtocol()
}

class MessageDispath: NSObject {

    @objc dynamic func getInfoMessageDispathOne() {
        print(#function)
    }
}

class SubClassMessageDispath: MessageDispath, MessageDispathProtocol {

    // direct dispath
    private func getInfoDirectDispath() {
        print(#function)
    }

    // whitness table dispath
    func getInfoMessageDispathProtocol() {
        print(#function)
    }

    // virtual dispath
    func getInfoSubClassMessageDispath() {
        print(#function)
    }

    // Message dispath
    @objc override dynamic func getInfoMessageDispathOne() {
        print(#function)
    }
}

// В рантайме при вызове метода getInfoMessageDispathOne(), поиск будет изначально в
// саб классе SubClassMessageDispath, потом в родмтельском классе MessageDispath
// и если там не найдется то дальнейший поиск будет в NSObject, если вызов метода будет через
// view.perfomSelector (вызывает функцию в фоновом потоке) то случится краш

// MARK: - Вывод по диспетчеризации

/*
 Статическая диспетчеризация Direct Dispath используется у value типов, final class, extensions и пути нахождения функци известны
 процессору уже на уровне компиляции, плюсы быстрая скорость, минусы не соблюдение ООП (нельзя испольлзовать наследование)
 Табличная диспетчеризация Table Dispath подразделяется на Virtual table и Whitness table
 Virtual table используется для классов и его наследников, плюсы поддерживает наследование, минусы низкая
 скорость работы. Для кождого класса создается своя таблица с указанием адреса памяти.
 Whitness table используется для протоколов и классов которые его реализуют, минусы низка я скорость,
 плюсы поддержка полиморфизма.

 Динамическая диспетчеризация Message Dispath: работает в RunTime, поддерживает MethodSwizzling, реализуется через Objective-C с использованием @objc dynamic для функций либо указание @objcMembers
 для всего класса. поиск функции происходит от  саб класса до родительского, при использовании вызова функции в бэкграунд потоке через performSelector можно поймать краш в случае не удачного поиска функции
 */
