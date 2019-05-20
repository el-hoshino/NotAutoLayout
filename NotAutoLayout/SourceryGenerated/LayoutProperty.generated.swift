// Generated using Sourcery 0.16.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT



extension IndividualProperty {

// MARK: - 0-element Property -

    public struct Initial {

    }

// MARK: - 1-element Property -
// MARK: - Horizontal

    public struct Left {

        let left: LayoutElement.Horizontal

    }


    public struct Center {

        let center: LayoutElement.Horizontal

    }


    public struct Right {

        let right: LayoutElement.Horizontal

    }


// MARK: - Vertical

    public struct Top {

        let top: LayoutElement.Vertical

    }


    public struct Middle {

        let middle: LayoutElement.Vertical

    }


    public struct Bottom {

        let bottom: LayoutElement.Vertical

    }


// MARK: - Length

    public struct Width {

        let width: LayoutElement.Vertical

    }


    public struct Height {

        let height: LayoutElement.Vertical

    }


// MARK: - 2-element Property -
// MARK: - HorizontalHorizontal

    public struct LeftCenter {

        let left: LayoutElement.Horizontal
        let center: LayoutElement.Horizontal

    }


    public struct LeftRight {

        let left: LayoutElement.Horizontal
        let right: LayoutElement.Horizontal

    }


    public struct CenterRight {

        let center: LayoutElement.Horizontal
        let right: LayoutElement.Horizontal

    }


// MARK: - HorizontalLength

    public struct LeftWidth {

        let left: LayoutElement.Horizontal
        let width: LayoutElement.Horizontal

    }


    public struct LeftHeight {

        let left: LayoutElement.Horizontal
        let height: LayoutElement.Horizontal

    }


    public struct CenterWidth {

        let center: LayoutElement.Horizontal
        let width: LayoutElement.Horizontal

    }


    public struct CenterHeight {

        let center: LayoutElement.Horizontal
        let height: LayoutElement.Horizontal

    }


    public struct RightWidth {

        let right: LayoutElement.Horizontal
        let width: LayoutElement.Horizontal

    }


    public struct RightHeight {

        let right: LayoutElement.Horizontal
        let height: LayoutElement.Horizontal

    }


// MARK: - VerticalVertical

    public struct TopMiddle {

        let top: LayoutElement.Vertical
        let middle: LayoutElement.Vertical

    }


    public struct TopBottom {

        let top: LayoutElement.Vertical
        let bottom: LayoutElement.Vertical

    }


    public struct MiddleBottom {

        let middle: LayoutElement.Vertical
        let bottom: LayoutElement.Vertical

    }


// MARK: - VerticalLength

    public struct TopWidth {

        let top: LayoutElement.Horizontal
        let width: LayoutElement.Vertical

    }


    public struct TopHeight {

        let top: LayoutElement.Horizontal
        let height: LayoutElement.Vertical

    }


    public struct MiddleWidth {

        let middle: LayoutElement.Horizontal
        let width: LayoutElement.Vertical

    }


    public struct MiddleHeight {

        let middle: LayoutElement.Horizontal
        let height: LayoutElement.Vertical

    }


    public struct BottomWidth {

        let bottom: LayoutElement.Horizontal
        let width: LayoutElement.Vertical

    }


    public struct BottomHeight {

        let bottom: LayoutElement.Horizontal
        let height: LayoutElement.Vertical

    }


// MARK: - HorizontalVertical

    public struct LeftTop {

        let left: LayoutElement.Horizontal
        let top: LayoutElement.Vertical

    }


    public struct LeftMiddle {

        let left: LayoutElement.Horizontal
        let middle: LayoutElement.Vertical

    }


    public struct LeftBottom {

        let left: LayoutElement.Horizontal
        let bottom: LayoutElement.Vertical

    }


    public struct CenterTop {

        let center: LayoutElement.Horizontal
        let top: LayoutElement.Vertical

    }


    public struct CenterMiddle {

        let center: LayoutElement.Horizontal
        let middle: LayoutElement.Vertical

    }


    public struct CenterBottom {

        let center: LayoutElement.Horizontal
        let bottom: LayoutElement.Vertical

    }


    public struct RightTop {

        let right: LayoutElement.Horizontal
        let top: LayoutElement.Vertical

    }


    public struct RightMiddle {

        let right: LayoutElement.Horizontal
        let middle: LayoutElement.Vertical

    }


    public struct RightBottom {

        let right: LayoutElement.Horizontal
        let bottom: LayoutElement.Vertical

    }


// MARK: - VerticalHorizontal (Point)

    public struct TopLeft {

        let topLeft: LayoutElement.Point

    }


    public struct TopCenter {

        let topCenter: LayoutElement.Point

    }


    public struct TopRight {

        let topRight: LayoutElement.Point

    }


    public struct MiddleLeft {

        let middleLeft: LayoutElement.Point

    }


    public struct MiddleCenter {

        let middleCenter: LayoutElement.Point

    }


    public struct MiddleRight {

        let middleRight: LayoutElement.Point

    }


    public struct BottomLeft {

        let bottomLeft: LayoutElement.Point

    }


    public struct BottomCenter {

        let bottomCenter: LayoutElement.Point

    }


    public struct BottomRight {

        let bottomRight: LayoutElement.Point

    }


// MARK: - WidthHeight

    public struct WidthHeight {

        let width: LayoutElement.Length
        let height: LayoutElement.Length

    }


// MARK: - Size

    public struct Size {

        let size: LayoutElement.Size

    }

// MARK: - 3-element Property -
// MARK: - HorizontalHorizontalVertical

    public struct LeftCenterTop {

        let left: LayoutElement.Horizontal
        let center: LayoutElement.Horizontal
        let top: LayoutElement.Vertical

    }


    public struct LeftCenterMiddle {

        let left: LayoutElement.Horizontal
        let center: LayoutElement.Horizontal
        let middle: LayoutElement.Vertical

    }


    public struct LeftCenterBottom {

        let left: LayoutElement.Horizontal
        let center: LayoutElement.Horizontal
        let bottom: LayoutElement.Vertical

    }


    public struct LeftRightTop {

        let left: LayoutElement.Horizontal
        let right: LayoutElement.Horizontal
        let top: LayoutElement.Vertical

    }


    public struct LeftRightMiddle {

        let left: LayoutElement.Horizontal
        let right: LayoutElement.Horizontal
        let middle: LayoutElement.Vertical

    }


    public struct LeftRightBottom {

        let left: LayoutElement.Horizontal
        let right: LayoutElement.Horizontal
        let bottom: LayoutElement.Vertical

    }


    public struct CenterRightTop {

        let center: LayoutElement.Horizontal
        let right: LayoutElement.Horizontal
        let top: LayoutElement.Vertical

    }


    public struct CenterRightMiddle {

        let center: LayoutElement.Horizontal
        let right: LayoutElement.Horizontal
        let middle: LayoutElement.Vertical

    }


    public struct CenterRightBottom {

        let center: LayoutElement.Horizontal
        let right: LayoutElement.Horizontal
        let bottom: LayoutElement.Vertical

    }


// MARK: - HorizontalHorizontalHeight

    public struct LeftCenterHeight {

        let left: LayoutElement.Horizontal
        let center: LayoutElement.Horizontal
        let height: LayoutElement.Length

    }


    public struct LeftRightHeight {

        let left: LayoutElement.Horizontal
        let right: LayoutElement.Horizontal
        let height: LayoutElement.Length

    }


    public struct CenterRightHeight {

        let center: LayoutElement.Horizontal
        let right: LayoutElement.Horizontal
        let height: LayoutElement.Length

    }


// MARK: - HorizontalVerticalVertical

    public struct LeftTopMiddle {

        let left: LayoutElement.Horizontal
        let top: LayoutElement.Vertical
        let middle: LayoutElement.Vertical

    }


    public struct LeftTopBottom {

        let left: LayoutElement.Horizontal
        let top: LayoutElement.Vertical
        let bottom: LayoutElement.Vertical

    }


    public struct LeftMiddleBottom {

        let left: LayoutElement.Horizontal
        let middle: LayoutElement.Vertical
        let bottom: LayoutElement.Vertical

    }


    public struct CenterTopMiddle {

        let center: LayoutElement.Horizontal
        let top: LayoutElement.Vertical
        let middle: LayoutElement.Vertical

    }


    public struct CenterTopBottom {

        let center: LayoutElement.Horizontal
        let top: LayoutElement.Vertical
        let bottom: LayoutElement.Vertical

    }


    public struct CenterMiddleBottom {

        let center: LayoutElement.Horizontal
        let middle: LayoutElement.Vertical
        let bottom: LayoutElement.Vertical

    }


    public struct RightTopMiddle {

        let right: LayoutElement.Horizontal
        let top: LayoutElement.Vertical
        let middle: LayoutElement.Vertical

    }


    public struct RightTopBottom {

        let right: LayoutElement.Horizontal
        let top: LayoutElement.Vertical
        let bottom: LayoutElement.Vertical

    }


    public struct RightMiddleBottom {

        let right: LayoutElement.Horizontal
        let middle: LayoutElement.Vertical
        let bottom: LayoutElement.Vertical

    }


// MARK: - HorizontalLengthLength

    public struct LeftWidthHeight {

        let left: LayoutElement.Horizontal
        let width: LayoutElement.Length
        let height: LayoutElement.Length

    }


    public struct CenterWidthHeight {

        let center: LayoutElement.Horizontal
        let width: LayoutElement.Length
        let height: LayoutElement.Length

    }


    public struct RightWidthHeight {

        let right: LayoutElement.Horizontal
        let width: LayoutElement.Length
        let height: LayoutElement.Length

    }


// MARK: - HorizontalSize

    public struct LeftSize {

        let left: LayoutElement.Horizontal
        let size: LayoutElement.Size

    }


    public struct CenterSize {

        let center: LayoutElement.Horizontal
        let size: LayoutElement.Size

    }


    public struct RightSize {

        let right: LayoutElement.Horizontal
        let size: LayoutElement.Size

    }


// MARK: - HorizontalVerticalLength

    public struct LeftTopWidth {

        let left: LayoutElement.Horizontal
        let top: LayoutElement.Vertical
        let width: LayoutElement.Length

    }


    public struct LeftTopHeight {

        let left: LayoutElement.Horizontal
        let top: LayoutElement.Vertical
        let height: LayoutElement.Length

    }


    public struct LeftMiddleWidth {

        let left: LayoutElement.Horizontal
        let middle: LayoutElement.Vertical
        let width: LayoutElement.Length

    }


    public struct LeftMiddleHeight {

        let left: LayoutElement.Horizontal
        let middle: LayoutElement.Vertical
        let height: LayoutElement.Length

    }


    public struct LeftBottomWidth {

        let left: LayoutElement.Horizontal
        let bottom: LayoutElement.Vertical
        let width: LayoutElement.Length

    }


    public struct LeftBottomHeight {

        let left: LayoutElement.Horizontal
        let bottom: LayoutElement.Vertical
        let height: LayoutElement.Length

    }


    public struct CenterTopWidth {

        let center: LayoutElement.Horizontal
        let top: LayoutElement.Vertical
        let width: LayoutElement.Length

    }


    public struct CenterTopHeight {

        let center: LayoutElement.Horizontal
        let top: LayoutElement.Vertical
        let height: LayoutElement.Length

    }


    public struct CenterMiddleWidth {

        let center: LayoutElement.Horizontal
        let middle: LayoutElement.Vertical
        let width: LayoutElement.Length

    }


    public struct CenterMiddleHeight {

        let center: LayoutElement.Horizontal
        let middle: LayoutElement.Vertical
        let height: LayoutElement.Length

    }


    public struct CenterBottomWidth {

        let center: LayoutElement.Horizontal
        let bottom: LayoutElement.Vertical
        let width: LayoutElement.Length

    }


    public struct CenterBottomHeight {

        let center: LayoutElement.Horizontal
        let bottom: LayoutElement.Vertical
        let height: LayoutElement.Length

    }


    public struct RightTopWidth {

        let right: LayoutElement.Horizontal
        let top: LayoutElement.Vertical
        let width: LayoutElement.Length

    }


    public struct RightTopHeight {

        let right: LayoutElement.Horizontal
        let top: LayoutElement.Vertical
        let height: LayoutElement.Length

    }


    public struct RightMiddleWidth {

        let right: LayoutElement.Horizontal
        let middle: LayoutElement.Vertical
        let width: LayoutElement.Length

    }


    public struct RightMiddleHeight {

        let right: LayoutElement.Horizontal
        let middle: LayoutElement.Vertical
        let height: LayoutElement.Length

    }


    public struct RightBottomWidth {

        let right: LayoutElement.Horizontal
        let bottom: LayoutElement.Vertical
        let width: LayoutElement.Length

    }


    public struct RightBottomHeight {

        let right: LayoutElement.Horizontal
        let bottom: LayoutElement.Vertical
        let height: LayoutElement.Length

    }


// MARK: - VerticalVerticalWidth

    public struct TopMiddleWidth {

        let top: LayoutElement.Vertical
        let middle: LayoutElement.Vertical
        let width: LayoutElement.Length

    }


    public struct TopBottomWidth {

        let top: LayoutElement.Vertical
        let bottom: LayoutElement.Vertical
        let width: LayoutElement.Length

    }


    public struct MiddleBottomWidth {

        let middle: LayoutElement.Vertical
        let bottom: LayoutElement.Vertical
        let width: LayoutElement.Length

    }


// MARK: - VerticalLengthLength

    public struct TopWidthHeight {

        let top: LayoutElement.Vertical
        let width: LayoutElement.Length
        let height: LayoutElement.Length

    }


    public struct MiddleWidthHeight {

        let middle: LayoutElement.Vertical
        let width: LayoutElement.Length
        let height: LayoutElement.Length

    }


    public struct BottomWidthHeight {

        let bottom: LayoutElement.Vertical
        let width: LayoutElement.Length
        let height: LayoutElement.Length

    }


// MARK: - VerticalSize

    public struct TopSize {

        let top: LayoutElement.Vertical
        let size: LayoutElement.Size

    }


    public struct MiddleSize {

        let middle: LayoutElement.Vertical
        let size: LayoutElement.Size

    }


    public struct BottomSize {

        let bottom: LayoutElement.Vertical
        let size: LayoutElement.Size

    }


// MARK: - VerticalHorizontalHorizontal (PointHorizontal)

    public struct TopLeftCenter {

        let topLeft: LayoutElement.Point
        let center: LayoutElement.Horizontal

    }


    public struct TopLeftRight {

        let topLeft: LayoutElement.Point
        let right: LayoutElement.Horizontal

    }


    public struct TopCenterLeft {

        let topCenter: LayoutElement.Point
        let left: LayoutElement.Horizontal

    }


    public struct TopCenterRight {

        let topCenter: LayoutElement.Point
        let right: LayoutElement.Horizontal

    }


    public struct TopRightLeft {

        let topRight: LayoutElement.Point
        let left: LayoutElement.Horizontal

    }


    public struct TopRightCenter {

        let topRight: LayoutElement.Point
        let center: LayoutElement.Horizontal

    }


    public struct MiddleLeftCenter {

        let middleLeft: LayoutElement.Point
        let center: LayoutElement.Horizontal

    }


    public struct MiddleLeftRight {

        let middleLeft: LayoutElement.Point
        let right: LayoutElement.Horizontal

    }


    public struct MiddleCenterLeft {

        let middleCenter: LayoutElement.Point
        let left: LayoutElement.Horizontal

    }


    public struct MiddleCenterRight {

        let middleCenter: LayoutElement.Point
        let right: LayoutElement.Horizontal

    }


    public struct MiddleRightLeft {

        let middleRight: LayoutElement.Point
        let left: LayoutElement.Horizontal

    }


    public struct MiddleRightCenter {

        let middleRight: LayoutElement.Point
        let center: LayoutElement.Horizontal

    }


    public struct BottomLeftCenter {

        let bottomLeft: LayoutElement.Point
        let center: LayoutElement.Horizontal

    }


    public struct BottomLeftRight {

        let bottomLeft: LayoutElement.Point
        let right: LayoutElement.Horizontal

    }


    public struct BottomCenterLeft {

        let bottomCenter: LayoutElement.Point
        let left: LayoutElement.Horizontal

    }


    public struct BottomCenterRight {

        let bottomCenter: LayoutElement.Point
        let right: LayoutElement.Horizontal

    }


    public struct BottomRightLeft {

        let bottomRight: LayoutElement.Point
        let left: LayoutElement.Horizontal

    }


    public struct BottomRightCenter {

        let bottomRight: LayoutElement.Point
        let center: LayoutElement.Horizontal

    }


// MARK: - VerticalHorizontalVertical (PointVertical)

    public struct TopLeftMiddle {

        let topLeft: LayoutElement.Point
        let middle: LayoutElement.Vertical

    }


    public struct TopLeftBottom {

        let topLeft: LayoutElement.Point
        let bottom: LayoutElement.Vertical

    }


    public struct TopCenterMiddle {

        let topCenter: LayoutElement.Point
        let middle: LayoutElement.Vertical

    }


    public struct TopCenterBottom {

        let topCenter: LayoutElement.Point
        let bottom: LayoutElement.Vertical

    }


    public struct TopRightMiddle {

        let topRight: LayoutElement.Point
        let middle: LayoutElement.Vertical

    }


    public struct TopRightBottom {

        let topRight: LayoutElement.Point
        let bottom: LayoutElement.Vertical

    }


    public struct MiddleLeftTop {

        let middleLeft: LayoutElement.Point
        let top: LayoutElement.Vertical

    }


    public struct MiddleLeftBottom {

        let middleLeft: LayoutElement.Point
        let bottom: LayoutElement.Vertical

    }


    public struct MiddleCenterTop {

        let middleCenter: LayoutElement.Point
        let top: LayoutElement.Vertical

    }


    public struct MiddleCenterBottom {

        let middleCenter: LayoutElement.Point
        let bottom: LayoutElement.Vertical

    }


    public struct MiddleRightTop {

        let middleRight: LayoutElement.Point
        let top: LayoutElement.Vertical

    }


    public struct MiddleRightBottom {

        let middleRight: LayoutElement.Point
        let bottom: LayoutElement.Vertical

    }


    public struct BottomLeftTop {

        let bottomLeft: LayoutElement.Point
        let top: LayoutElement.Vertical

    }


    public struct BottomLeftMiddle {

        let bottomLeft: LayoutElement.Point
        let middle: LayoutElement.Vertical

    }


    public struct BottomCenterTop {

        let bottomCenter: LayoutElement.Point
        let top: LayoutElement.Vertical

    }


    public struct BottomCenterMiddle {

        let bottomCenter: LayoutElement.Point
        let middle: LayoutElement.Vertical

    }


    public struct BottomRightTop {

        let bottomRight: LayoutElement.Point
        let top: LayoutElement.Vertical

    }


    public struct BottomRightMiddle {

        let bottomRight: LayoutElement.Point
        let middle: LayoutElement.Vertical

    }


// MARK: - VerticalHorizontalLength (PointLength)

    public struct TopLeftWidth {

        let topLeft: LayoutElement.Point
        let width: LayoutElement.Length

    }


    public struct TopLeftHeight {

        let topLeft: LayoutElement.Point
        let height: LayoutElement.Length

    }


    public struct TopCenterWidth {

        let topCenter: LayoutElement.Point
        let width: LayoutElement.Length

    }


    public struct TopCenterHeight {

        let topCenter: LayoutElement.Point
        let height: LayoutElement.Length

    }


    public struct TopRightWidth {

        let topRight: LayoutElement.Point
        let width: LayoutElement.Length

    }


    public struct TopRightHeight {

        let topRight: LayoutElement.Point
        let height: LayoutElement.Length

    }


    public struct MiddleLeftWidth {

        let middleLeft: LayoutElement.Point
        let width: LayoutElement.Length

    }


    public struct MiddleLeftHeight {

        let middleLeft: LayoutElement.Point
        let height: LayoutElement.Length

    }


    public struct MiddleCenterWidth {

        let middleCenter: LayoutElement.Point
        let width: LayoutElement.Length

    }


    public struct MiddleCenterHeight {

        let middleCenter: LayoutElement.Point
        let height: LayoutElement.Length

    }


    public struct MiddleRightWidth {

        let middleRight: LayoutElement.Point
        let width: LayoutElement.Length

    }


    public struct MiddleRightHeight {

        let middleRight: LayoutElement.Point
        let height: LayoutElement.Length

    }


    public struct BottomLeftWidth {

        let bottomLeft: LayoutElement.Point
        let width: LayoutElement.Length

    }


    public struct BottomLeftHeight {

        let bottomLeft: LayoutElement.Point
        let height: LayoutElement.Length

    }


    public struct BottomCenterWidth {

        let bottomCenter: LayoutElement.Point
        let width: LayoutElement.Length

    }


    public struct BottomCenterHeight {

        let bottomCenter: LayoutElement.Point
        let height: LayoutElement.Length

    }


    public struct BottomRightWidth {

        let bottomRight: LayoutElement.Point
        let width: LayoutElement.Length

    }


    public struct BottomRightHeight {

        let bottomRight: LayoutElement.Point
        let height: LayoutElement.Length

    }


}
