//
//  ContentView.swift
//  SeeFood
//
//  Created by Leon Wei on 5/31/21.
//

import SwiftUI

struct ContentView: View {
    @State private var isPresenting: Bool = false
    @State private var imageDataArray: [ImageData] = []
    @State private var sourceType: UIImagePickerController.SourceType = .photoLibrary
    
    @ObservedObject var classifier: ImageClassifier
    
    var body: some View {
        ScrollView {
            VStack {
                HStack {
                    Spacer()
                    Image(systemName: "photo")
                        .onTapGesture {
                            isPresenting = true
                            sourceType = .photoLibrary
                        }
                    
                    Image(systemName: "camera")
                        .onTapGesture {
                            isPresenting = true
                            sourceType = .camera
                        }
                    
                    Spacer()
                    
                    Image(systemName: "trash")
                        .onTapGesture {
                            imageDataArray.removeAll()
                        }
                }
                .font(.title)
                .foregroundColor(.blue)
                
                HStack {
                    ForEach(imageDataArray, id: \.uiImage) { imageData in
                        Image(uiImage: imageData.uiImage)
                            .resizable()
                            .scaledToFit()
                            .frame(height: 200)
                            .cornerRadius(8)
                            .padding(5)
                    }
                }
                .padding()
                .background(Color.secondary.opacity(0.3))
                .cornerRadius(10)
                
                ForEach(imageDataArray.indices, id: \.self) { index in
                    VStack {
                        Text("Image \(index + 1) classification:")
                        HStack {
                            if let imageClass = imageDataArray[index].imageClassAcnePro {
                                Text("Image Acne Pro:")
                                    .font(.caption)
                                Text(imageClass)
                                    .bold()
                            } else {
                                Text("Image categories: NA")
                                    .font(.caption)
                            }
                        }
                        HStack {
                            if let imageClass2 = imageDataArray[index].imageClassAcneProNew {
                                Text("Image Acne Pro New:")
                                    .font(.caption)
                                Text(imageClass2)
                                    .bold()
                            } else {
                                Text("Image categories: NA")
                                    .font(.caption)
                            }
                        }
                        HStack {
                            if let imageClass2 = imageDataArray[index].imageClassAcneB {
                                Text("Image Acne B:")
                                    .font(.caption)
                                Text(imageClass2)
                                    .bold()
                            } else {
                                Text("Image categories: NA")
                                    .font(.caption)
                            }
                        }
                        HStack {
                            if let imageClass2 = imageDataArray[index].imageClassBlackFaceB {
                                Text("Image blackhead B:")
                                    .font(.caption)
                                Text(imageClass2)
                                    .bold()
                            } else {
                                Text("Image categories: NA")
                                    .font(.caption)
                            }
                        }
                        HStack {
                            if let imageClass2 = imageDataArray[index].imageClassBlackFacePro {
                                Text("Image blackhead pro:")
                                    .font(.caption)
                                Text(imageClass2)
                                    .bold()
                                if imageClass2.contains("comedo") {
                                    if let levelPro = imageDataArray[index].imageClassAcneLvlPro {
                                        Text("\nLevel Pro: \(levelPro)")
                                            .font(.caption)
                                    }
                                    if let levelB = imageDataArray[index].imageClassAcneLvl {
                                        Text("\nLevel B: \(levelB)")
                                            .font(.caption)
                                    }
                                }
                            } else {
                                Text("Image categories: NA")
                                    .font(.caption)
                            }
                        }
                    }
                    .font(.subheadline)
                    .padding()
                }
                
                //                Average
                //                if imageDataArray.count == 3 {
                //                    let averagePro = averageClassification(for: \.imageClass)
                //                    let averageB = averageClassification(for: \.imageClass2)
                //
                //                    VStack {
                //                        Text("Average Classifications:")
                //                            .font(.headline)
                //                            .padding()
                //
                //                        HStack {
                //                            Text("Average Pro:")
                //                            Text(averagePro)
                //                                .bold()
                //                        }
                //                        HStack {
                //                            Text("Average B:")
                //                            Text(averageB)
                //                                .bold()
                //                        }
                //                    }
                //                    .padding()
                //                    .background(Color.green.opacity(0.3))
                //                    .cornerRadius(10)
                //                }
            }
            .sheet(isPresented: $isPresenting) {
                ImagePicker(uiImage: Binding(get: {
                    imageDataArray.last?.uiImage
                }, set: { newImage in
                    if imageDataArray.count >= 3 {
                        imageDataArray.removeAll()
                    }
                    if let newImage = newImage {
                        let newImageData = ImageData(uiImage: newImage, imageClass: nil, imageClass2: nil)
                        imageDataArray.append(newImageData)
                    }
                }), isPresenting: $isPresenting, sourceType: $sourceType)
                .onDisappear {
                    if let lastImage = imageDataArray.last?.uiImage {
                        classifier.detect(uiImage: lastImage)
                        if let classifications = classifier.imageClassAcnePro {
                            imageDataArray[imageDataArray.count - 1].imageClassAcnePro = classifications
                        }
                        if let classifications2 = classifier.imageClassAcneProNew {
                            imageDataArray[imageDataArray.count - 1].imageClassAcneProNew = classifications2
                        }
                        if let classifications3 = classifier.imageClassAcneB {
                            imageDataArray[imageDataArray.count - 1].imageClassAcneB = classifications3
                        }
                        if let classifications4 = classifier.imageClassBlackFaceB {
                            imageDataArray[imageDataArray.count - 1].imageClassBlackFaceB = classifications4
                        }
                        if let classifications5 = classifier.imageClassBlackFacePro {
                            imageDataArray[imageDataArray.count - 1].imageClassBlackFacePro = classifications5
                        }
                        if let classifications6 = classifier.imageClassAcneLvl {
                            imageDataArray[imageDataArray.count - 1].imageClassAcneLvl = classifications6
                        }
                        if let classifications7 = classifier.imageClassAcneLvlPro {
                            imageDataArray[imageDataArray.count - 1].imageClassAcneLvlPro = classifications7
                        }
                    }
                }
            }
            .padding()
        }
    }
    
    private func averageClassification(for keyPath: KeyPath<ImageData, String?>) -> String {
        let values = imageDataArray.compactMap { $0[keyPath: keyPath] }
        
        
        let scores = values.map { classification in
            classification == "clear" ? 1 : 0
        }
        
        let averageScore = scores.reduce(0, +) / max(1, scores.count)
        return averageScore == 1 ? "clear" : "acne"
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(classifier: ImageClassifier())
    }
}
