//
//  MultiValueSlider.swift
//
//  Created by Yonat Sharon on 16/09/2019.
//

#if canImport(SwiftUI)

import SweeterSwift
import SwiftUI

/// Slider clone with multiple thumbs and values, range highlight, optional snap intervals, optional value labels.
@available(iOS 13.0, *) public struct MultiValueSlider: UIViewRepresentable {
    public typealias UIViewType = MultiSlider
    private let uiView = MultiSlider()

    @Binding var value: [CGFloat]
    @State var minimumValue: CGFloat?
    @State var maximumValue: CGFloat?

    public init(
        value: Binding<[CGFloat]>,
        minimumValue: CGFloat? = nil,
        maximumValue: CGFloat? = nil,
        isContinuous: Bool? = nil,
        snapStepSize: CGFloat? = nil,
        isHapticSnap: Bool? = nil,
        valueLabelPosition: NSLayoutConstraint.Attribute? = nil,
        isValueLabelRelative: Bool? = nil,
        orientation: NSLayoutConstraint.Axis? = nil,
        outerTrackColor: UIColor? = nil,
        valueLabelColor: UIColor? = nil,
        valueLabelFont: UIFont? = nil,
        thumbImage: UIImage? = nil,
        showsThumbImageShadow: Bool? = nil,
        minimumImage: UIImage? = nil,
        maximumImage: UIImage? = nil,
        trackWidth: CGFloat? = nil,
        hasRoundTrackEnds: Bool? = nil,
        distanceBetweenThumbs: CGFloat? = nil,
        keepsDistanceBetweenThumbs: Bool? = nil,
        valueLabelFormatter: NumberFormatter? = nil
    ) {
        _value = value
        self.minimumValue = minimumValue
        self.maximumValue = maximumValue

        uiView.minimumValue =? minimumValue
        uiView.maximumValue =? maximumValue
        uiView.isContinuous =? isContinuous
        uiView.snapStepSize =? snapStepSize
        uiView.isHapticSnap =? isHapticSnap
        uiView.valueLabelPosition =? valueLabelPosition
        uiView.isValueLabelRelative =? isValueLabelRelative
        uiView.orientation =? orientation
        uiView.outerTrackColor =? outerTrackColor
        uiView.valueLabelColor =? valueLabelColor
        uiView.valueLabelFont =? valueLabelFont
        uiView.thumbImage =? thumbImage
        uiView.showsThumbImageShadow =? showsThumbImageShadow
        uiView.minimumImage =? minimumImage
        uiView.maximumImage =? maximumImage
        uiView.trackWidth =? trackWidth
        uiView.hasRoundTrackEnds =? hasRoundTrackEnds
        uiView.distanceBetweenThumbs =? distanceBetweenThumbs
        uiView.keepsDistanceBetweenThumbs =? keepsDistanceBetweenThumbs
        uiView.valueLabelFormatter =? valueLabelFormatter
    }

    public func makeUIView(context: UIViewRepresentableContext<MultiValueSlider>) -> MultiSlider {
        uiView.addTarget(context.coordinator, action: #selector(Coordinator.valueChanged), for: .valueChanged)
        return uiView
    }

    public func updateUIView(_ uiView: MultiSlider, context: UIViewRepresentableContext<MultiValueSlider>) {
        uiView.value = value
        uiView.minimumValue = minimumValue
        uiView.maximumValue = maximumValue
    }

    public func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }

    public class Coordinator: NSObject {
        let parent: MultiValueSlider

        init(_ parent: MultiValueSlider) {
            self.parent = parent
        }

        @objc func valueChanged(_ sender: MultiSlider) {
            parent.value = sender.value
        }
    }
}

#endif
