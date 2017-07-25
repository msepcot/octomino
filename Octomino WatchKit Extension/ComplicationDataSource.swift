//
//  ComplicationDataSource.swift
//  Octomino WatchKit Extension
//
//  Created by Michael Sepcot on 7/24/17.
//  Copyright © 2017 Head Down Development. All rights reserved.
//

import Foundation
import ClockKit

class ComplicationDataSource: NSObject, CLKComplicationDataSource {
    func getCurrentTimelineEntry(
        for complication: CLKComplication,
        withHandler handler: @escaping (CLKComplicationTimelineEntry?) -> Void
    ) {
        if let template = getTemplate(for: complication) {
            handler(CLKComplicationTimelineEntry(date: Date(), complicationTemplate: template))
        } else {
            handler(nil)
        }
    }

    func getLocalizableSampleTemplate(
        for complication: CLKComplication,
        withHandler handler: @escaping (CLKComplicationTemplate?) -> Void
    ) {
        handler(getTemplate(for: complication))
    }

    func getPrivacyBehaviorForComplication(
        complication: CLKComplication,
        withHandler handler: (CLKComplicationPrivacyBehavior) -> Void
    ) {
        handler(.showOnLockScreen)
    }

    func getSupportedTimeTravelDirections(
        for complication: CLKComplication,
        withHandler handler: @escaping (CLKComplicationTimeTravelDirections) -> Void
    ) {
        handler([])
    }

    private func getTemplate(for complication: CLKComplication) -> CLKComplicationTemplate? {
        switch complication.family {
        case .circularSmall:
            return circularSmall()
        case .extraLarge:
            return extraLarge()
        case .modularSmall:
            return modularSmall()
        case .utilitarianSmall:
            return utilitarianSmall()
        default:
            return nil
        }
    }
}

// MARK: - Complications
fileprivate extension ComplicationDataSource {
    func circularSmall() -> CLKComplicationTemplate {
        let template = CLKComplicationTemplateCircularSmallSimpleImage()
        template.imageProvider = CLKImageProvider(onePieceImage: #imageLiteral(resourceName: "Complication/Circular"))

        return template
    }

    func extraLarge() -> CLKComplicationTemplate {
        let template = CLKComplicationTemplateExtraLargeSimpleImage()
        template.imageProvider = CLKImageProvider(onePieceImage: #imageLiteral(resourceName: "Complication/Extra Large"))

        return template
    }

    func modularSmall() -> CLKComplicationTemplate {
        let template = CLKComplicationTemplateModularSmallSimpleImage()
        template.imageProvider = CLKImageProvider(onePieceImage: #imageLiteral(resourceName: "Complication/Modular"))

        return template
    }

    func utilitarianSmall() -> CLKComplicationTemplate {
        let template = CLKComplicationTemplateUtilitarianSmallSquare()
        template.imageProvider = CLKImageProvider(onePieceImage: #imageLiteral(resourceName: "Complication/Utilitarian"))

        return template
    }
}
