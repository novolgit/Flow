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
    var chart: Chart
    @State private var showDetail = false
    
    @State private var mouth: [String] = ["January", "February", "March", "April", "May", "June", "Jule", "August", "September", "November", "Octabre", "December"]
    
    @State private var mouth2: [String] = ["Jan", "Feb", "Mar", "Apr", "May", "June", "July", "Aug", "Sept", "Nov", "Oct", "Dec"]

    var body: some View {
        VStack {
            HStack {
                ChartGraph(chart: chart, path: \.flowers)
                    .frame(width: 50, height: 30)
//                    .animation(.easeIn)

                VStack(alignment: .leading) {
                    Text(chart.name)
                        .font(.headline)
                        .foregroundColor(.gray)
                }

                Spacer()

                Button(action: {
                    withAnimation {
                        self.showDetail.toggle()
                    }
                }) {
                    Image(systemName: "chevron.right.circle")
                        .foregroundColor(showDetail ? .gray : Color.pink.opacity(0.4))
                        .imageScale(.large)
                        .rotationEffect(.degrees(showDetail ? 90*5 : 0))
                        .scaleEffect(showDetail ? 1.5 : 1)
                        .padding()
                        .background(
                            Group {
                                NeuButtonsView2(radius: 100, whiteColorOpacity: Color.white.opacity(0.7), blackColorOpacity: Color.black.opacity(0.2), shadowRadius: 2, xBlack: 2, yBlack: 2, xWhite: -1, yWhite: -1)
                            }
                        )
                }
            }
            if showDetail {
                Divider()
                HStack {
                    ForEach(mouth2, id: \.self) {m in
                        Text(m)
                            .font(.system(size: 10))
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
                NeuButtonsView2(radius: 25, whiteColorOpacity: Color.white.opacity(0.7), blackColorOpacity: Color.black.opacity(0.2), shadowRadius: 5, xBlack: 10, yBlack: 10, xWhite: -5, yWhite: -5)
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
                HStack(spacing: 25) {
                    ForEach(buttons, id: \.0) { value in
                        Button(action: {
                            self.dataToShow = value.1
                        }) {
                            Text(value.0)
                                .font(.system(size: 15))
                                .foregroundColor(value.1 == self.dataToShow
                                    ? Color.gray
                                    : Color.accentColor)
                                .animation(nil)
                        }
                        .frame(width: UIScreen.main.bounds.width*0.2, height: 40)
                        .contentShape(RoundedRectangle(cornerRadius: 15.0))
                        .background(
                            Group {
                                if value.1 == self.dataToShow{
                                    Group {
                                        CustomTappedAccountButton4()
                                    }
                                } else{
                                    Group {
                                        CustomConfirmButtonsView4()
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
            return .white
        case \.bouquet:
            return .gray
        case \.stores:
            return .black
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
                        .colorMultiply(color)
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
            .fill(Color.pink.opacity(0.4))
            .frame(height: height * heightRatio)
            .offset(x: 0, y: height * -offsetRatio)
    }
}


