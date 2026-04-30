import SwiftUI

struct EqualWidthHStack: Layout {
    var spacing: CGFloat = 12

    func makeCache(subviews: Subviews) -> CGFloat {
        0
    }

    func sizeThatFits(
        proposal: ProposedViewSize,
        subviews: Subviews,
        cache: inout CGFloat
    ) -> CGSize {
        let maxWidth = subviews
            .map { $0.sizeThatFits(.unspecified).width }
            .max() ?? 0

        cache = maxWidth

        let heights = subviews.map {
            $0.sizeThatFits(.init(width: maxWidth, height: proposal.height)).height
        }

        let totalWidth = maxWidth * CGFloat(subviews.count)
            + spacing * CGFloat(max(subviews.count - 1, 0))
        let maxHeight = heights.max() ?? 0

        return CGSize(width: totalWidth, height: maxHeight)
    }

    func placeSubviews(
        in bounds: CGRect,
        proposal: ProposedViewSize,
        subviews: Subviews,
        cache: inout CGFloat
    ) {
        let maxWidth = cache
        var x = bounds.minX

        for subview in subviews {
            let size = subview.sizeThatFits(.init(width: maxWidth, height: proposal.height))
            subview.place(
                at: CGPoint(x: x, y: bounds.minY),
                anchor: .topLeading,
                proposal: .init(width: maxWidth, height: size.height)
            )
            x += maxWidth + spacing
        }
    }
}
