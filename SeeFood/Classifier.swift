//
//  Classifier.swift
//  SeeFood
//
//  Created by Leon Wei on 5/31/21.
//

import CoreML
import Vision
import CoreImage

struct AcnePro {
    
    private(set) var results: String?
    
    mutating func detect(ciImage: CIImage) {
        
        guard let model = try? VNCoreMLModel(for: Acne23SepV3Pro(configuration: MLModelConfiguration()).model)
        else {
            return
        }
        
        let request = VNCoreMLRequest(model: model)
        
        let handler = VNImageRequestHandler(ciImage: ciImage, options: [:])
        
        try? handler.perform([request])
        
        guard let results = request.results as? [VNClassificationObservation] else {
            return
        }
        
        if let firstResult = results.first {
            self.results = firstResult.identifier
        }
        
    }
    
}

struct AcneProNew {
    
    private(set) var results: String?
    
    mutating func detect(ciImage: CIImage) {
        
        guard let model = try? VNCoreMLModel(for: Acne27SepPRO(configuration: MLModelConfiguration()).model)
        else {
            return
        }
        
        let request = VNCoreMLRequest(model: model)
        
        let handler = VNImageRequestHandler(ciImage: ciImage, options: [:])
        
        try? handler.perform([request])
        
        guard let results = request.results as? [VNClassificationObservation] else {
            return
        }
        
        if let firstResult = results.first {
            self.results = firstResult.identifier
        }
        
    }
    
}

struct AcneB {
    
    private(set) var results: String?
    
    mutating func detect(ciImage: CIImage) {
        
        guard let model = try? VNCoreMLModel(for: Acne23SepV3(configuration: MLModelConfiguration()).model)
        else {
            return
        }
        
        let request = VNCoreMLRequest(model: model)
        
        let handler = VNImageRequestHandler(ciImage: ciImage, options: [:])
        
        try? handler.perform([request])
        
        guard let results = request.results as? [VNClassificationObservation] else {
            return
        }
        
        if let firstResult = results.first {
            self.results = firstResult.identifier
        }
        
    }
    
}

struct BlackFaceB {
    
    private(set) var results: String?
    
    mutating func detect(ciImage: CIImage) {
        
        guard let model = try? VNCoreMLModel(for: BlackSkinV1(configuration: MLModelConfiguration()).model)
        else {
            return
        }
        
        let request = VNCoreMLRequest(model: model)
        
        let handler = VNImageRequestHandler(ciImage: ciImage, options: [:])
        
        try? handler.perform([request])
        
        guard let results = request.results as? [VNClassificationObservation] else {
            return
        }
        
        if let firstResult = results.first {
            self.results = firstResult.identifier
        }
        
    }
    
}

struct BlackFacePro {
    
    private(set) var results: String?
    
    mutating func detect(ciImage: CIImage) {
        
        guard let model = try? VNCoreMLModel(for: BlackSkinV2PRO(configuration: MLModelConfiguration()).model)
        else {
            return
        }
        
        let request = VNCoreMLRequest(model: model)
        
        let handler = VNImageRequestHandler(ciImage: ciImage, options: [:])
        
        try? handler.perform([request])
        
        guard let results = request.results as? [VNClassificationObservation] else {
            return
        }
        
        if let firstResult = results.first {
            self.results = firstResult.identifier
        }
        
    }
    
}

struct AcneLvl {
    
    private(set) var results: String?
    
    mutating func detect(ciImage: CIImage) {
        
        guard let model = try? VNCoreMLModel(for: AcneLVL1(configuration: MLModelConfiguration()).model)
        else {
            return
        }
        
        let request = VNCoreMLRequest(model: model)
        
        let handler = VNImageRequestHandler(ciImage: ciImage, options: [:])
        
        try? handler.perform([request])
        
        guard let results = request.results as? [VNClassificationObservation] else {
            return
        }
        
        if let firstResult = results.first {
            self.results = firstResult.identifier
        }
        
    }
    
}

struct AcneLvlPro {
    
    private(set) var results: String?
    
    mutating func detect(ciImage: CIImage) {
        
        guard let model = try? VNCoreMLModel(for: AcneLVLPROV1(configuration: MLModelConfiguration()).model)
        else {
            return
        }
        
        let request = VNCoreMLRequest(model: model)
        
        let handler = VNImageRequestHandler(ciImage: ciImage, options: [:])
        
        try? handler.perform([request])
        
        guard let results = request.results as? [VNClassificationObservation] else {
            return
        }
        
        if let firstResult = results.first {
            self.results = firstResult.identifier
        }
        
    }
    
}

