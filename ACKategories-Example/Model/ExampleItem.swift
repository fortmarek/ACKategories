//
//  ExampleItem.swift
//  ACKategories-Example
//
//  Created by Jakub Olejník on 12/09/2018.
//  Copyright © 2018 Ackee, s.r.o. All rights reserved.
//

import Foundation

enum ExampleItem: CaseIterable {
    case uiControlBlocks
    case viewControllerComposition
    case mapViewController
    case present
    
    var title: String { return data.title }
    var subtitle: String { return data.subtitle }
    
    private var data: (title: String, subtitle: String) {
        switch self {
        case .uiControlBlocks:
            return ("uicontrol_blocks".localized(), "uicontrol_blocks_description".localized())
        case .viewControllerComposition:
            return ("vc_composition".localized(), "vc_composition_description".localized())
        case .mapViewController:
            return ("map".localized(), "map_description".localized())
        case .present:
            return ("present".localized(), "present_description".localized())
        }
    }
}
