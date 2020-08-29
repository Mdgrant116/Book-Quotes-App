//
//  QuotesViewModel.swift
//  Book Quotes App
//
//  Created by Michael Grant on 8/28/20.
//  Copyright © 2020 Michael Grant. All rights reserved.
//

import Foundation
import UIKit

struct QuotesViewModel {
    
    var quotes = [Quote]()
       
       
    mutating func createQuotes() {
        quotes.append(Quote(author: "Stephen King", quote: "Monsters are real, and ghosts are real too. They live inside us, and sometimes, they win.", image: UIImage(named: "StephenKing") ?? UIImage()))
        quotes.append(Quote(author: "Neil Gaiman", quote: "What power would Hell have if those imprisoned there were not able to dream of Heaven?", image: UIImage(named: "NeilGaiman") ?? UIImage()))
         quotes.append(Quote(author: "James Baldwin", quote: "It is certain, in any case, that ignorance, allied with power, is the most ferocious enemy justice can have.", image: UIImage(named: "JamesBaldwin") ?? UIImage()))
         quotes.append(Quote(author: "Sylvia Plath", quote: "Dying is an art, like everything else. I do it exceptionally well. I do it so it feels like hell. I do it so it feels real. I guess you could say I've a call.", image: UIImage(named: "SylviaPlath") ?? UIImage()))
         quotes.append(Quote(author: "Kiese Laymon", quote: "I will wonder if the memories that remain with age are heavier than the ones we forget because they mean more to us, or if our bodies, like our nation, eventually purge memories we never wanted to be true.", image: UIImage(named: "KieseLaymon") ?? UIImage()))
         quotes.append(Quote(author: "Matthew Quick", quote: "The bullies are always popular. Why? People love power.", image: UIImage(named: "MatthewQuick") ?? UIImage()))
    }
}
