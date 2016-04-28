//
//  ViewController.swift
//  CassiniScrollView
//
//  Created by Abiodun Shuaib on 22/04/2016.
//  Copyright © 2016 Abiodun Shuaib. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let vc = segue.destinationViewController as? ImageViewController{
            if let identifier = segue.identifier{
                switch identifier{
                    case "saturn":
                        vc.title = "Saturn"
                        vc.imageURL = DemoUrl.Nasa.saturn
                    case "earth":
                        vc.title = "Earth"
                        vc.imageURL = DemoUrl.Nasa.earth
                    case "cassini":
                        vc.title = "Cassini"
                        vc.imageURL = DemoUrl.Nasa.cassini
                default:
                    break
                }
            }
        }
    }
}

