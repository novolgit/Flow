//
//  ChartView.swift
//  Flow
//
//  Created by Vlad Novol on 15.01.2021.
//

import SwiftUI

extension AnyTransition {
    static var moveAndFade: AnyTransition {
        let insertion = AnyTransition.move(edge: .trailing)
            .combined(with: .opacity)
        let removal = AnyTransition.scale
            .combined(with: .opacity)
        return .asymmetric(insertion: insertion, removal: removal)
    }
}

struct ChartView: View {
    @Environment(\.colorScheme) var colorScheme
    
    var chart: Chart
    @State private var showDetail = false
    
    @State private var mouth: [String] = ["January", "February", "March", "April", "May", "June", "Jule", "August", "September", "November", "Octabre", "December"]
    
    @State private var mouth2: [String] = ["Jan", "Feb", "Mar", "Apr", "May", "June", "July", "Aug", "Sept", "Nov", "Oct", "Dec"]

    var body: some View {
        VStack {
            HStack {
                ChartGraph(chart: chart, path: \.flowers)
                    .frame(width: 50, height: 30)
                    .padding(.trailing, 15)
                    .animation(.easeIn)
                    Text(chart.name)
                        .font(.system(size: 18, weight: .medium, design: .serif))
                        .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : .offSecondaryGray)

                Spacer()

                Button(action: {
                    withAnimation {
                        self.showDetail.toggle()
                    }
                }) {
                    Image(systemName: "chevron.right.circle")
                        .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                        .imageScale(.large)
                        .rotationEffect(.degrees(showDetail ? 90*5 : 0))
                        .scaleEffect(showDetail ? 1.25 : 1)
                        .padding(8)
                        .background(
                            Group {
                                NeuButtonsView2(radius: 100, whiteColorOpacity: colorScheme == .dark ? .topShadowDark : .topShadow, blackColorOpacity: colorScheme == .dark ? .bottomShadowDark :  .bottomShadow, shadowRadius: 2, xBlack: 2, yBlack: 2, xWhite: -1, yWhite: -1)
                            }
                        )
                }
            }
            if showDetail {
                Divider()
                HStack {
                    ForEach(mouth2, id: \.self) {m in
                        Text(m)
                            .font(.system(size: 10, weight: .light, design: .serif))
                            .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : .offSecondaryGray)
                    }
                }
                VStack{}.frame(height: 40)
                ChartDetail(chart: chart)
                    .transition(.moveAndFade)
            }
        }
        .padding()
        .background(
            withAnimation(.easeOut){
                Group {
                    NeuButtonsView2(radius: 20, whiteColorOpacity: colorScheme == .dark ? .topShadowDark : .topShadow, blackColorOpacity: colorScheme == .dark ? .bottomShadowDark :  .bottomShadow, shadowRadius: 5, xBlack: 5, yBlack: 5, xWhite: -2.5, yWhite: -2.5)
                }
            }
        )
        .padding()
    }
}

struct ChartView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ChartView(chart: ModelData().charts[0])
                .padding()
            Spacer()
        }
    }
}

struct ChartDetail: View {
    @Environment(\.colorScheme) var colorScheme
    
    let chart: Chart
    @State var dataToShow = \Chart.Observation.flowers

    var buttons = [
        ("Flower Popularity", \Chart.Observation.flowers),
        ("Red Flowers", \Chart.Observation.bouquet),
        ("Yellow Flowers", \Chart.Observation.stores)
    ]

    var body: some View {
            VStack {
                ChartGraph(chart: chart, path: dataToShow)
                    .frame(height: 200)
                    .padding(.bottom, 10)
                HStack(spacing: 25) {
                    ForEach(buttons, id: \.0) { value in
                        Button(action: {
                            self.dataToShow = value.1
                        }) {
                            Text(value.0)
                                .font(.system(size: 12, weight: .light, design: .serif))
                                .foregroundColor(colorScheme == .dark ? .offSecondaryGrayDark : Color.offSecondaryGray)
                                .animation(nil)
                        }
                        .frame(width: UIScreen.main.bounds.width*0.2, height: 40)
                        .background(
                            Group {
                                if value.1 == self.dataToShow{
                                    Group {
                                        CustomTappedAccountButton6()
                                    }
                                } else{
                                    Group {
                                        CustomConfirmButtonsView6()
                                    }
                                }
                            }
                        )
                    }
                }
            }
    }
}

extension Animation {
    static func ripple(index: Int) -> Animation {
        Animation.spring(dampingFraction: 0.7)
            .speed(2.5)
            .delay(0.14 * Double(index))
    }
}

struct ChartGraph: View {
    var chart: Chart
    var path: KeyPath<Chart.Observation, Range<Double>>

    var color: Color {
        switch path {
        case \.flowers:
            return .blue
        case \.bouquet:
            return .red
        case \.stores:
            return .yellow
        default:
            return .black
        }
    }

    var body: some View {
        let data = chart.observations
        let overallRange = rangeOfRanges(data.lazy.map { $0[keyPath: path] })
        let maxMagnitude = data.map { magnitude(of: $0[keyPath: path]) }.max()!
        let heightRatio = 1 - CGFloat(maxMagnitude / magnitude(of: overallRange))

        return GeometryReader { proxy in
            HStack(alignment: .bottom, spacing: proxy.size.width / 80) {
                ForEach(Array(data.enumerated()), id: \.offset) { index, observation in
                    ChartCapsule(
                        index: index,
                        height: proxy.size.height,
                        range: observation[keyPath: path],
                        overallRange: overallRange)
                        .colorMultiply(color.opacity(0.3))
                        .transition(.slide)
                        .animation(.ripple(index: index))
                }
                .offset(x: 0, y: proxy.size.height * heightRatio)
            }
        }
    }
}

func rangeOfRanges<C: Collection>(_ ranges: C) -> Range<Double>
    where C.Element == Range<Double> {
    guard !ranges.isEmpty else { return 0..<0 }
    let low = ranges.lazy.map { $0.lowerBound }.min()!
    let high = ranges.lazy.map { $0.upperBound }.max()!
    return low..<high
}

func magnitude(of range: Range<Double>) -> Double {
    return range.upperBound - range.lowerBound
}

struct ChartCapsule: View {
    @Environment(\.colorScheme) var colorScheme
    
    var index: Int
    var height: CGFloat
    var range: Range<Double>
    var overallRange: Range<Double>

    var heightRatio: CGFloat {
        max(CGFloat(magnitude(of: range) / magnitude(of: overallRange)), 0.15)
    }

    var offsetRatio: CGFloat {
        CGFloat((range.lowerBound - overallRange.lowerBound) / magnitude(of: overallRange))
    }

    var body: some View {
        Capsule()
            .fill(LinearGradient(colorScheme == .dark ? Color.white : Color.black.opacity(0.01), colorScheme == .dark ? Color.offGrayLinearEndDark : Color.offGrayLinearEnd))
            .frame(height: height * heightRatio)
            .offset(x: 0, y: height * -offsetRatio)
    }
}


