defmodule BrowserWeb.LiveComponent.Figure do

  use BrowserWeb, :live_component

  def render(assigns) do
    ~H"""
    <div class="figure flex-col items-center py-4">
      <svg id="drawing"
          xmlns="http://www.w3.org/2000/svg"
          x-height="155mm"
          x-width="130mm"
          version="1.1"
          viewBox="0 0 460.9899 548.03535">

        <g transform="translate(-27.2 -220)">

          <!-- 1 -->
          <path id="rope"
                class={hide_if_left_gt(@tally.turns_left, 6)}
                style="fill: #a28d5d; stroke: #a28d5d"
                d="m392 243c0.0695 21.3-1.32
                  43.1 0.826 63.9 0.816 14.4-9.87 35.9-13.3 21.9-0.538-15.6
                  1.04-31.7-0.836-46.9-1.52-22.5 6.28-32.3 13.3-38.9z"/>
          
          <!-- 2 -->
          <path id="brace" style="fill: #c27207; stroke:  #c27207"
                d="m264 261c-8.46 10.1-15 23.2-26.4 28.4-4.63 8.07-10.4
                  14.4-15.8 21.4-3.39 1.66-7.4 13.8-10.7 10.1-2.03
                  7.56-13.3 13.4-16.3 24.1-6.12 5.6-9.68 17.5-24.6-6.21
                  8.21-9.9 16.4-20.6 26.2-27.3 3.13-13.5 13.3-16.4
                  18.2-27.4 9.05-4.29 15-16.7 23-24.6 7.56-7.78 8.4-25.1
                  26.4 1.5z"/>

          <!-- 3 -->
          <path id="topbar"
                style="fill: #c27207; stroke: #c27207;"
                d="m153 242c-2.85 7.47 15-4.18 19.9 1.77 16.8-0.55
                  33.6-0.496 50.3 0.4 17.4-4.26 35.2-5.2 53-3.1 14.7-0.0166
                  28.3-3.66 42.9-2.61 13.2-1.21 26.6-4.69 39.8-1.7
                  16.6-4.35 34-1.58 50.8-4.67 6.82 3.47 19.4-5.5 25.4-0.814
                  7.54-6.27 8.07-1.21 6.51 0.087 11.2-6.69 24-0.784
                  33.3-4.21 6.26-4.06 7.15-1.99 5.75-0.117 11.8-4.39 7.23
                  7.6-0.809 8.74-10 9.43-20.6 16.4-33.6 17.3-3.15 2.25-12.2
                  7.5-10.7-0.601-12.1 6.85-19.2-3.05-30.5 5.64-9.12
                  1.37-15.3-4.47-25.7-1.47-13.9 1.89-27.7 4.61-41.9
                  3.98-14.5 0.434-29-1.27-43.4 1.52-12.3 2.38-24.7 0.756-37
                  0.0478-17.9 0.437-36 1.92-53.2 6.96-5.15-13.5-22.8
                  2.74-32.7-2.81-14.7 4.16-31.9 2.45-45.2 2.26-5.27
                  5.56-16.3 2.32-5.49-2.97 10.9-7.8 21.7-15.8 32.7-23.7z"/>
          
          <!-- 4 -->
          <path id="post"
                style="fill: #c27207; stroke: #c27207"
                d="m192 220c2.46 52.1 9.22 104 4.99 156 3.68 33.9 4.84 68.4
                  7.03 103-1.16 15.9 6.7 56.1 0.805 60.4 5.24 23.4 1.75 76.8
                  8.97 110 0.27 34.2 8.28 72.3-24.9
                  76.8-2.52-50.9-5.76-103-4.18-153-9.74-39.9-4.41-83.3-10.5-124
                  3.21-42.1-3.39-90-4.19-136-1.11-44-16.1-83.5 22.1-93.1z"/>

          <!-- 5 -->
          <path id="ground"
                style="fill: #a28d5d; stroke: #a28d5d"
                d="m62.1 740c6.71-4.98 8.63-1.57 6.68-2.12 15.2-0.241
                  32.4-16.2 43.4-13.5 17.4-2.14 34.3-13.3 51.6-10.9 14.2-10.8
                  35.4-8.34 53.5-11 19.5-2.67 39 0.209 58.1-6.5 16.4 1.8
                  34.1-2.28 49.8 1.11 17.6-1.56 36.8-7.35 52.8-2.24 19.2-4.7
                  36.1-0.348 55-0.635 17.4 4.18 35.2 4.18 53 4.87 6.89
                  3.15-6.83 7.56-9.39 11l-18 13c-4.92-5.01-21.2
                  8.32-17.8-4.02-16.6 9.05-34.3-2.65-50.3-1.14-18.1 4.6-37.5
                  3.21-55.2-2.47-22.5 3.33-46.5 0.805-68
                  6.81-17.4-3.99-33.6-3.13-50.5 2.25-14.8-4.4-31.5 5.54-43.3
                  5.39-9.97-8.24-32.3 6.26-47.3 5.7-16.3 3.96-32.7 8.52-47.9
                  15.6 8.82-9.11-12.9 6.34-19 4.49-5.77-0.753-16.2 10.3-13.5
                  3.66-5.76 2.36-29.4 14.5-13.5 2.99 9.85-7.48 19.7-14.9
                  29.6-22.4z"/>


          <!-- 6 -->
          <path id="arm1"
                class={hide_if_left_gt(@tally.turns_left, 0)}
                style="fill: #777; stroke: #777; stroke-width:3.5;"
                d="m324 512c8.62-14.1 21.6-24.6 33.8-35.3-0.693-4.06
                  7.34-5.86 2.11-7.06 5.35-8.79 12.7-18.7 23.7-20.1
                  5.52-0.197-7.1 5.22-1.45 6.29-8.4 12.7-18 25.2-30.9
                  33.5-5.91 10.6-15.5 19-27.2 22.6z"/>

          <!-- 7 -->
          <path id="arm2"
                class={hide_if_left_gt(@tally.turns_left, 1)}
                style="fill: #777; stroke: #777; stroke-width: 3.5;"
                d="m404 441c-2.77 11 12.8 8.21 14.7 17.3 5.98 4.84 15.2 7.98
                  17 15.4 6.58 4 10.3 14.8 0.993 17.9-9.24
                  5.71-14.3-6.87-17.9-13.2-7.1-2.4-16-14.6-18.3-16.8-3.98-3.2-9.01-7.24-11.2-10.9
                  3.97-4.36 10.1-5.98 14.7-9.59z"/>

          <!-- 8 -->
          <path id="leg1"
                class={hide_if_left_gt(@tally.turns_left, 2)}
                style="fill: #777; stroke: #777; stroke-width: 3.5;"
                d="m390 567c0.232 6.64-9.96 13-13.5 19.6-3.54 7.9-10.2
                  12.3-13.7 20.2-4.05 11-5.5 25-17.1 30.9-4.53 4.61-10.3
                  1.26-5.7-4.31 5.68-12.7 10.4-26 19.1-37 5.83-7.71 11.1-16
                  18.1-22.8 3.83-3 8.35-4.96 12.9-6.48z"/>

          <!-- 9 -->
          <path id="leg2"
                class={hide_if_left_gt(@tally.turns_left, 3)}
                style="fill: #777; stroke: #777; stroke-width: 3.5;"
                d="m399 568c-3.45 8.95 2.33 17.4 3.11 26.1-2.56 8.71 2.93
                  16.9 6.7 24.5 1.69 7.91 16 17.3 4.05 23.1-6.17
                  3.54-17.5-1.07-13.1-9.18-6.86-2.85-9.21-12.5-11.1-18-1.1-11.3-3.95-22.5-5.49-33.7
                  0.64-7.97 10.3-9.48 15.9-12.9z"/>

          <!-- 10 -->
          <path id="body"
                class={hide_if_left_gt(@tally.turns_left, 4)}
                style="fill: #777; stroke: #777; stroke-width: 3.5;"
                d="m397 430c-8.22 13.8 0.942 30.2-3.8 44.8 0.446 18.4 0.722
                  36.9-1.04 55.2-0.36 13.7 3.83 28.3-2.33 41.3-5.4
                  9.94-17.8 1.96-12.2-7.45-1.23-8.65 0.92-17.8
                  0.272-26.7-0.977-9.11 0.801-18.4
                  0.338-27.6-0.679-17.8-0.0439-35.6 0.649-53.4
                  0.58-8.26-3.27-19.6 8.51-21.4 3.28-1.35 6.8-2.39
                  9.58-4.68z"/>


          <!-- 11 -->
          <path id="head"
                class={hide_if_left_gt(@tally.turns_left, 5)}
                style="fill:none; stroke: #777; stroke-width: 3.5;"
                d="m440 389c-0.665 10.8-6.11 21.3-15.1 29.3-7.12 6.41-16.2
                  11.1-26.1 13.3m13.2-15.3c-8.42 4.22-17.7 6.53-26.9
                  6.62-9.15 0.0947-17.9-1.98-25.6-6.07m4.87
                  10.2c-8.87-2.54-16.6-6.97-22.8-13-8.15-7.94-13.1-18.3-14.4-29.6m9.2
                  15.2c-2.44-5.82-3.68-12.2-3.54-18.7 0.273-12.8 5.89-25.3
                  16.2-34.3 3.72-3.24 7.98-5.95 12.7-8.02m-24.6
                  4.13c1.26-1.63 2.65-3.18 4.15-4.64 9.88-9.59 24.3-15
                  40.1-15.3 6.86-0.164 13.8 0.618 20.5 2.27m-16.8 3.21c13.2
                  0.844 26.6 5.3 37.3 12.8 5.5 3.87 10.1 8.41 13.5
                  13.4m-14.2-7.47c7.02 8.71 11.3 19.3 11.9 30.2 0.483
                  8.22-1.11 16.2-4.62 23.3m10.7-20.6c-1.44 10.3-6.91
                  20.2-15.5 28.3-5.87 5.49-13 9.97-21 13.2m9.16-3.79c-8.29
                  5.29-18.3 7.86-28.7
                  7.45-14.4-0.563-28.6-6.81-39.2-17.3-0.041-0.0409-0.082-0.0818-0.123-0.123m20.1
                  9.56c-6.36-2.1-12-5.37-16.7-9.54-9.79-8.76-14.7-21-13.8-33.3
                  0.289-3.74 1.12-7.43 2.48-11m-5.77
                  20c-0.259-2.41-0.344-4.86-0.248-7.32 0.504-13 6-25.6
                  15.8-35.1 4.1-3.96 8.86-7.27 14.1-9.78m-18 3.7c10.7-8.22
                  23.8-13.2 37.2-13.9 10-0.459 19.7 1.59 28.2 5.96m-18.6
                  1.19c10.6 2.1 20.1 7.24 27.7 14.8 9.27 9.27 15.1 21.7 17
                  35.4m-0.75-22.6c2.71 6.71 4.04 13.9 3.81 21.2-0.412
                  12.9-5.68 25.5-15.3 36.2m15.6-32.6c-1.49 10.3-7.03
                  20.2-15.8 27.9-7.38 6.47-16.7 11.1-27.1
                  13.3m14.4-2.02c-8.18 4.43-17.1 6.8-26 7.03-13.7
                  0.355-26.4-4.45-35.2-12.9-0.615-0.589-1.21-1.19-1.78-1.81m15.3
                  9.62c-5.03-2.23-9.67-5.37-13.7-9.28-9.95-9.61-15.7-23.3-15.8-37.9-0.0322-7.37
                  1.37-14.8 4.16-21.9m-5.57
                  22.6c-0.0399-0.781-0.0579-1.56-0.0542-2.34 0.0607-12.7
                  5.85-24.8 16.2-33.2 8.64-7.01 20-11 32.2-10.9m-23.1
                  0.57c8.5-4.65 18.5-7.26 28.9-7.51 12.5-0.296 24.9 2.81
                  35.6 8.82m-25.6 1.99c7.52 2.26 14.3 6 20.1 10.9 10.7 9.02
                  17.1 21.4 18.4 34 0.294 2.75 0.346 5.49 0.168
                  8.18m1.59-7.13c-0.154 12.4-5.82 24.2-15.7 32.7-8.78
                  7.49-20.3 11.9-32.7 12.1m23.4-4.39c-8.21 3.47-17.1
                  5.47-25.9 5.65-13.9
                  0.285-26.7-3.99-35.9-12.4-1.86-1.71-3.55-3.57-5.05-5.57m14.4
                  15.3c-4.25-2.31-8.16-5.2-11.6-8.61-10-9.89-15.7-23.6-15.7-38.5
                  0.006-7.72 1.52-15.6 4.47-23.1m-10.6
                  27.4c-0.009-0.232-0.0152-0.465-0.02-0.697-0.272-13.2
                  5.58-25.8 16.1-35 9.53-8.36 22.3-13.4
                  35.8-14.4m-21-2.65c8.29-3.63 17.3-5.36 26.4-4.81 14.1
                  0.859 27.2 7.19 36.8 18.4 0.326 0.381 0.647 0.767 0.963
                  1.16m-11.8-8.11c5.25 2.39 10 5.64 14.2 9.6 9.47 9.12 14.9
                  21.5 14.7 34.7m1.25-8.98c1.31 4.04 2 8.26 2.06 12.5 0.167
                  12.8-5.38 25.4-15.2 34.7-3.75 3.53-8.05 6.5-12.7
                  8.78m25.6-39.1c-1.54 11.9-7.23 22.8-16.4 30.9-5.7
                  5.01-12.6 8.75-20.2 11m11.4-3.98c-8.86 5.75-19.1
                  8.42-29.4 7.69-11.1-0.781-21.8-5.48-30.2-13.4m9.21
                  0.64c-8-2.75-15.1-6.8-20.8-12-9.86-8.92-15-20.6-14.4-32.7
                  0.208-4.31 1.15-8.59 2.78-12.7m-1.3
                  30.4c-0.638-2.79-0.957-5.65-0.957-8.55 0.001-12.6
                  6.06-25.2 16.8-34.5 4.08-3.51 8.77-6.46 13.9-8.72m-3.56
                  0.45l0.0612-0.0546c10.2-9.1 23.8-14.2 37.9-14.1 7.7
                  0.0671 15.3 1.7 22.3 4.82m-18.6-1.06c12 1.4 22.6 6.59
                  30.3 14.7 8.7 9.19 13.2 21.6 12.5 34.9m-4.44-26.2c3.28
                  6.52 5 13.7 5 21.1 0.002 13.2-5.47 26-15.4 35.6-2.87
                  2.79-6.08 5.27-9.55 7.39m29.4-41.5c-0.891 11-6.21
                  21.4-14.8 29.9-8.84 8.64-20.6 14.6-33.1 17.3m8.16
                  6.25c-7.38 3.41-15.3 5.15-23.2 5.17-13.9
                  0.0228-26.8-5.31-36-14.6-1.47-1.5-2.84-3.09-4.08-4.75m14.6-2.68c-4.22-2.39-8.03-5.15-11.4-8.24-10.3-9.51-15.7-21.7-15.4-34.4
                  0.0219-0.985 0.0778-1.97 0.168-2.95m3.63
                  22.6c-0.479-2.96-0.728-5.97-0.739-8.98-0.0498-13.3
                  4.52-26 12.7-35.7 5.58-6.64 12.5-11.5 20-14.2m-7.96
                  14.1c9.99-6.69 21.9-10.4 34.2-10.4 13.5 0.0434 26.6 4.65
                  37 13.1m-28-26.2c7.72 2.53 14.9 6.76 20.9 12.4 8.84 8.23
                  14.9 19 17.2 30.9m-2.65 2.06c2.18 5.91 3.41 12.1 3.57
                  18.2 0.347 12.9-4.08 24.8-12.4 33.2-2.27 2.29-4.8
                  4.28-7.53 5.93m-81.8-77.6 34.7-21.6m54.7 15.8 15.2
                  34.8m-44.6-50.6 34.7 21.6m-2.43 63.2-36.4 19.3m-63.1-36.3
                  2.07-37.2m41.7-30.9 41.6 7.31m-19.6-7.13 35.3 20.8m5.92
                  9.96 2.07 37.2m-37.2 34.5-42.3-2.76m28.9
                  5.07-40.3-11.8m-19.4-53.8 23.5-31.1m25
                  96.2-36.9-18.5m-13.2-31.1 12.3-35.7m69.6-15 28.5
                  27.7m-89.5-21.1 40.3-11.8m8.15 105-41.8-6.41"
                transform="translate(1.43 2.86)"/>

        </g>
      </svg>

      <p class="turns-left">
        Turns Left: <%= @tally.turns_left %>
      </p>
    </div>
    """
  end

  defp hide_if_left_gt(left, level) do
    if left > level, do: "opacity-5", else: ""
  end
end
