//
//  ImageClassification.swift
//  SeeFood
//
//  Created by Leon Wei on 5/31/21.
//

import SwiftUI

class ImageClassifier: ObservableObject {
    
    @Published private var classifierAcnePro = AcnePro()
    @Published private var classifierAcneProNew = AcneProNew()
    @Published private var classifierAcneB = AcneB()
    @Published private var classifieBlackFaceB = BlackFaceB()
    @Published private var classifierBlackFacePro = BlackFacePro()
    @Published private var classifierAcneLvl = AcneLvl()
    @Published private var classifierAcneLvlPro = AcneLvlPro()
    
    var imageClassAcnePro: String? {
        classifierAcnePro.results
    }
    var imageClassAcneProNew: String? {
        classifierAcneProNew.results
    }
    var imageClassAcneB: String? {
        classifierAcneB.results
    }
    var imageClassBlackFaceB: String? {
        classifieBlackFaceB.results
    }
    var imageClassBlackFacePro: String? {
        classifierBlackFacePro.results
    }
    var imageClassAcneLvl: String? {
        classifierAcneLvl.results
    }
    var imageClassAcneLvlPro: String? {
        classifierAcneLvlPro.results
    }
        
    // MARK: Intent(s)
    func detect(uiImage: UIImage) {
        guard let ciImage = CIImage (image: uiImage) else { return }
        classifierAcnePro.detect(ciImage: ciImage)
        classifierAcneProNew.detect(ciImage: ciImage)
        classifierAcneB.detect(ciImage: ciImage)
        classifieBlackFaceB.detect(ciImage: ciImage)
        classifierBlackFacePro.detect(ciImage: ciImage)
        classifierAcneLvl.detect(ciImage: ciImage)
        classifierAcneLvlPro.detect(ciImage: ciImage)
        
    }
        
}
