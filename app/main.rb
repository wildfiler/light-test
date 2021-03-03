MAP = [
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
  [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
]

class Shadow
  def draw_override(ffi_draw)
    30.times do |x|
      20.times do |y|
        ffi_draw.draw_sprite_2(x * 32, y * 32, 96, 96, "sprites/shadow.png", 0, 255 - $gtk.args.state.shadow[x][y].cap_min_max(0, 255))
      end
    end
  end
end

class Game
  attr_gtk

  ALL_DIRS = [[0, 1], [1, 1], [1, 0], [1, -1], [0, -1], [-1, -1], [-1, 0], [-1, 1]]
  DIRS = ALL_DIRS.cycle.each_cons(3).take(8).map { |dirs| [dirs[1], dirs] }.to_h.merge([0, 0] => ALL_DIRS)

  def initialize(w, h)
    @w = w
    @h = h
  end

  def calc_light_node(light_map, nodes)
    candidtes = {}
    count = 0

    until nodes.empty?
      count += 1
      node = nodes.shift
      node_x, node_y, value, dir = node

      next if value <= 0
      map_lightness = light_map[node_x][node_y]

      next if map_lightness >= value && dir != [0, 0]

      next if MAP[node_x][node_y].positive?

      light_map[node_x][node_y] = value
      candidtes[@w * node_x + node_y] = nil

      DIRS[dir].each do |(dx, dy)|
        new_x = node_x + dx
        new_y = node_y + dy
        next if new_x < 0 || new_x >= @w || new_y < 0 || new_y >= @h

        dv = 25
        dv -= 8 if dx.zero? || dy.zero?

        new_value = value - dv
        candidate = candidtes[@w * new_x + new_y]

        if candidate
          if candidate[2] < new_value
            candidate[2] = new_value
          end
        else
          if light_map[new_x][new_y] >= new_value
            next
          end

          new_node = [new_x, new_y, new_value, dir]
          candidtes[@w * new_x + new_y] = new_node
          nodes.push(new_node)
        end
      end
    end

    state.count = count
  end

  def calc_shadow
    if args.state.static_lights_map.nil?
      light_map = Array.new(@w) { Array.new(@h) { 0 } }

      static_sources = [
        [20, 2, 200, [0, 1]],
        [5, 15, 300, [0, 0]],
      ]

      calc_light_node(light_map, static_sources.dup)

      args.state.static_lights_map = light_map
    end

    light_map = args.state.static_lights_map.map { |line| line.dup }

    sources = [
      [args.state.player.x, args.state.player.y, 255, [0, 0]],
    ]

    nodes = sources.dup

    calc_light_node(light_map, nodes)

    light_map
  end

  def tick
    if args.state.tick_count.zero?
      args.state.player.x = 5
      args.state.player.y = 5
      args.state.shadow = calc_shadow
      args.state.shadow_sprite = Shadow.new
      render_shadow
    end

    if args.inputs.keyboard.key_down.left
      args.state.player.x -= 1
      args.state.shadow = calc_shadow
      render_shadow
    end
    if args.inputs.keyboard.key_down.right
      args.state.player.x += 1
      args.state.shadow = calc_shadow
      render_shadow
    end
    if args.inputs.keyboard.key_down.up
      args.state.player.y += 1
      args.state.shadow = calc_shadow
      render_shadow
    end
    if args.inputs.keyboard.key_down.down
      args.state.player.y -= 1
      args.state.shadow = calc_shadow
      render_shadow
    end

    args.outputs.sprites << [0, 0, 32 * 30, 32 * 20, "sprites/map.png"]
    args.outputs.sprites << {
      x: 0,
      y: 0,
      w: 32 * 30,
      h: 32 * 20,
      path: :shadow,
      source_x: 0,
      source_y: 0,
      source_w: 32 * 30,
      source_h: 32 * 20,
      r: 100,
      g: 100,
      b: 80,
    }
    args.outputs.labels << [20, $args.grid.top - 20, "FPS: " + $gtk.current_framerate.to_s]
    args.outputs.labels << [20, 40.from_top, "count: #{state.count}"]
  end

  def render_shadow
    args.render_target(:shadow).sprites << args.state.shadow_sprite
  end
end

$game = Game.new(30, 20)

def tick(args)
  # trace! $game
  $game.args = args
  $game.tick
end
