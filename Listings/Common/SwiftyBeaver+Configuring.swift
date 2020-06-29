//
//  SwiftyBeaver+Configuring.swift
//  Listings
//
//  Created by Steven Wu on 2020-06-27.
//  Copyright © 2020 Steven Wu. All rights reserved.
//

import Foundation
import SwiftyBeaver
let log = SwiftyBeaver.self

extension SwiftyBeaver {

    static func setupLogging() {
        let console = ConsoleDestination()
        console.format = "$Dyyyy-MM-dd HH:mm:ss.SSS$d $T [$L] $T $N.$F:$l $T $M $X"

        log.addDestination(console)
        log.addDestination(FileDestination())
    }

}
