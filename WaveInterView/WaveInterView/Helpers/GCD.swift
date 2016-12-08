//
//  GCD.swift
//
//  Created by ZefengQiu on 2016-05-03.
//

import Foundation


class GCD {
  
  /**
   performUIUpdatesOnMain: 
   
      Get the UI Thread which is the Main thread And update data to UI in the updates closure
   
   - parameter bar: updates closure
   
   - returns: Void
   */
  static func performUIUpdatesOnMain(_ updates: @escaping () -> Void) {
    DispatchQueue.main.async {
      updates()
    }
  }

  
}
