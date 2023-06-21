# Electron 将棋の向けの文字なし将棋駒の SVG 画像を生成するスクリプト

const filename = "piece-large-lined-ffe680-base.svg"
# 1 px = 1 mm
# 1 尺 = 10/33 m
const shaku = 10 / 33 * 1000
const board_width_shaku = 1.1
const board_height_shaku = 1.2
const board_margin_shaku = 0.05
# const square_width = (board_width_shaku - board_margin_shaku) * shaku / 9
const square_width = (board_width_shaku - board_margin_shaku) * shaku / 9 * 93 / 104
# const square_height = (board_height_shaku - board_margin_shaku) * shaku / 9
const square_height = (board_height_shaku - board_margin_shaku) * shaku / 9 * 88 / 94.85
const piece_color = "#ffe680"
# const piece_color = "#f3d49e"
# const piece_color = "#f8c653"
const blur_opacity = 0.8
const blurstd = 0.3
const blurdx = 1
const blurdy = 1.5

# 普通サイズ
# const piece_size = Dict(
#     "王将・玉将" => Dict(
#         :A => 28.0,
#         :B => 31.0,
#     ),
#     "飛車・角行" => Dict(
#         :A => 27.0,
#         :B => 30.0,
#     ),
#     "金将・銀将" => Dict(
#         :A => 26.0,
#         :B => 29.0,
#     ),
#     "桂馬" => Dict(
#         :A => 25.0,
#         :B => 28.0,
#     ),
#     "香車" => Dict(
#         :A => 23.0,
#         :B => 28.0,
#     ),
#     "歩兵" => Dict(
#         :A => 22.0,
#         :B => 27.0,
#     ),
# )

# 大振りサイズ
const piece_size = Dict(
    "王将・玉将" => Dict(
        :A => 29.0,
        :B => 32.0,
    ),
    "飛車・角行" => Dict(
        :A => 28.0,
        :B => 31.0,
    ),
    "金将・銀将" => Dict(
        :A => 28.0,
        :B => 30.0,
    ),
    "桂馬" => Dict(
        :A => 26.0,
        :B => 29.0,
    ),
    "香車" => Dict(
        :A => 24.0,
        :B => 29.0,
    ),
    "歩兵" => Dict(
        :A => 23.0,
        :B => 28.0,
    ),
)

const es_offset_y = (square_height - piece_size["王将・玉将"][:B]) / 2

function piece_points(α, β, A, B)
    δ = α + β - π
    x = (B - A / 2 * tan(δ)) / (tan(α) - tan(δ))
    y = B - x * tan(α)
    [
        A/2 0
        x y
        0 B
        A B
        A-x y
    ]
end

function piece_points_svg(α, β, A, B)
    ret = ""
    a = piece_points(α, β, A, B)
    for i in 1:size(a)[1]
        x = a[i, 1]
        y = a[i, 2]
        ret *= "$x,$y "
    end
    ret
end

function polygon(α, β, A, B, x, y, svg_polygon_fill; indent="", rotate=false)
    offset_x = (square_width - A) / 2
    # offset_y = (square_height - B) / 2 # centered
    offset_y = es_offset_y # lined
    if rotate
        """
        $indent<polygon
        $indent  points="$(piece_points_svg(α, β, A, B))"
        $indent  fill="$svg_polygon_fill"
        $indent  transform="rotate(180) translate($(-x - square_width + offset_x),$(-y - square_height + square_height - B - offset_y))" />
        """
    else
        """
        $indent<polygon
        $indent  points="$(piece_points_svg(α, β, A, B))"
        $indent  fill="$svg_polygon_fill"
        $indent  transform="translate($(x + offset_x),$(y + square_height - B - offset_y))" />
        """
    end
end

function square(i, j)
    """<rect x="$(square_width * (i - 1) |> Float32)" y="$(square_height * (j - 1) |> Float32)" width="$(square_width |> Float32)" height="$(square_height |> Float32)" stroke="black" fill="transparent" stroke-width="1" />"""
end

function squares()
    ret = ""
    for i = 1:8, j = 1:4
        ret *= "    $(square(i, j))\n"
    end
    ret
end

function main(io::IO)
    contents = ""
    viewBoxX, viewBoxY = square_width * 8, square_height * 4
    α = 80.5π / 180
    β = 116.5π / 180

    A = piece_size["王将・玉将"][:A]
    B = piece_size["王将・玉将"][:B]
    contents *= polygon(α, β, A, B, 0square_width, 0square_height, piece_color; indent="    ")
    contents *= polygon(α, β, A, B, 0square_width, 1square_height, piece_color; indent="    ")
    contents *= polygon(α, β, A, B, 0square_width, 2square_height, piece_color; indent="    ", rotate=true)
    contents *= polygon(α, β, A, B, 0square_width, 3square_height, piece_color; indent="    ", rotate=true)

    A = piece_size["飛車・角行"][:A]
    B = piece_size["飛車・角行"][:B]
    contents *= polygon(α, β, A, B, 1square_width, 0square_height, piece_color; indent="    ")
    contents *= polygon(α, β, A, B, 1square_width, 1square_height, piece_color; indent="    ")
    contents *= polygon(α, β, A, B, 1square_width, 2square_height, piece_color; indent="    ", rotate=true)
    contents *= polygon(α, β, A, B, 1square_width, 3square_height, piece_color; indent="    ", rotate=true)
    contents *= polygon(α, β, A, B, 2square_width, 0square_height, piece_color; indent="    ")
    contents *= polygon(α, β, A, B, 2square_width, 1square_height, piece_color; indent="    ")
    contents *= polygon(α, β, A, B, 2square_width, 2square_height, piece_color; indent="    ", rotate=true)
    contents *= polygon(α, β, A, B, 2square_width, 3square_height, piece_color; indent="    ", rotate=true)

    A = piece_size["金将・銀将"][:A]
    B = piece_size["金将・銀将"][:B]
    contents *= polygon(α, β, A, B, 3square_width, 0square_height, piece_color; indent="    ")
    # contents *= polygon(α, β, A, B, 3square_width, 1square_height, piece_color; indent="    ")
    contents *= polygon(α, β, A, B, 3square_width, 2square_height, piece_color; indent="    ", rotate=true)
    # contents *= polygon(α, β, A, B, 3square_width, 3square_height, piece_color; indent="    ", rotate=true)
    contents *= polygon(α, β, A, B, 4square_width, 0square_height, piece_color; indent="    ")
    contents *= polygon(α, β, A, B, 4square_width, 1square_height, piece_color; indent="    ")
    contents *= polygon(α, β, A, B, 4square_width, 2square_height, piece_color; indent="    ", rotate=true)
    contents *= polygon(α, β, A, B, 4square_width, 3square_height, piece_color; indent="    ", rotate=true)

    A = piece_size["桂馬"][:A]
    B = piece_size["桂馬"][:B]
    contents *= polygon(α, β, A, B, 5square_width, 0square_height, piece_color; indent="    ")
    contents *= polygon(α, β, A, B, 5square_width, 1square_height, piece_color; indent="    ")
    contents *= polygon(α, β, A, B, 5square_width, 2square_height, piece_color; indent="    ", rotate=true)
    contents *= polygon(α, β, A, B, 5square_width, 3square_height, piece_color; indent="    ", rotate=true)

    A = piece_size["香車"][:A]
    B = piece_size["香車"][:B]
    contents *= polygon(α, β, A, B, 6square_width, 0square_height, piece_color; indent="    ")
    contents *= polygon(α, β, A, B, 6square_width, 1square_height, piece_color; indent="    ")
    contents *= polygon(α, β, A, B, 6square_width, 2square_height, piece_color; indent="    ", rotate=true)
    contents *= polygon(α, β, A, B, 6square_width, 3square_height, piece_color; indent="    ", rotate=true)

    A = piece_size["歩兵"][:A]
    B = piece_size["歩兵"][:B]
    contents *= polygon(α, β, A, B, 7square_width, 0square_height, piece_color; indent="    ")
    contents *= polygon(α, β, A, B, 7square_width, 1square_height, piece_color; indent="    ")
    contents *= polygon(α, β, A, B, 7square_width, 2square_height, piece_color; indent="    ", rotate=true)
    contents *= polygon(α, β, A, B, 7square_width, 3square_height, piece_color; indent="    ", rotate=true)

    text = """
    <?xml version="1.0" encoding="UTF-8" standalone="no"?>
    <svg
      version="1.1"
      viewBox="0 0 $viewBoxX $viewBoxY"
      xmlns="http://www.w3.org/2000/svg">
      <defs>
        <filter
          style="color-interpolation-filters:sRGB;"
          id="filter-piece-shadow"
          x="-0.0097442328"
          y="-0.017287411"
          width="1.0235486"
          height="1.0417779">
          <feFlood
            flood-opacity="$blur_opacity"
            flood-color="rgb(0,0,0)"
            result="flood" />
          <feComposite
            in="flood"
            in2="SourceGraphic"
            operator="in"
            result="composite1" />
          <feGaussianBlur
            in="composite1"
            stdDeviation="$blurstd"
            result="blur" />
          <feOffset
            dx="$blurdx"
            dy="$blurdy"
            result="offset" />
          <feComposite
            in="SourceGraphic"
            in2="offset"
            operator="over"
            result="composite2" />
        </filter>
      </defs>
      <g
        id="squares"
        style="display:none">
    $(squares())
      </g>
      <g
        id="pieces"
        style="filter:url(#filter-piece-shadow)">
    $contents
      </g>
    </svg>
    """
    println(io, text)
end

open(filename, "w") do io
    main(io)
end