//
//  ConverterUtil.swift
//  Form
//
//  Created by 崎原邦達 on 2021/01/17.
//

import Foundation

//ファイナルをつけると継承できなくなる
final class ConverterUtil {
  //初期化ができなくなる
  //privateは外部からアクセスできなくなる
  private init() {
  }
  //staticはメモリの確保
  static func getAge(year: Int, month: Int, dayOfMonth: Int) -> Int {
    var age = 0
        let today = Date()
        let birthday = Calendar(identifier: .gregorian).date(from: DateComponents(year: year, month: month, day: dayOfMonth))!
        age = Calendar(identifier: .gregorian).dateComponents([.year, .month, .day], from: birthday, to: today).year!
        return age

  }
}





