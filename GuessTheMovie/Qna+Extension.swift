//
//  Qna+Extension.swift
//  GuessTheMovie
//
//  Created by 林佩柔 on 2021/5/27.
//
import Foundation
import UIKit
import CodableCSV

extension Questions {
    static var data: [Self] {
        var array = [Self]()
        if let data = NSDataAsset(name: "questions")?.data {
            let decoder = CSVDecoder {
                $0.headerStrategy = .firstLine
            }
            do {
                array = try decoder.decode([Self].self, from: data)
            } catch {
                print(error)
            }
        }
        return array
    }
}
