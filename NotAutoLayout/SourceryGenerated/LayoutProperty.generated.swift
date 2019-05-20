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

}
