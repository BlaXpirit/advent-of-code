inp = File.read "input.txt"


macro spell(name, mana)
  def {{name.id}}
    if @mana >= {{mana}}
      @mana -= {{mana}}
      @spent_mana += {{mana}}
      {{yield}}
    end
  end
end

macro apply(name, duration)
  @{{name.id}} = {{duration}} if @{{name.id}} == 0
end

macro effect(name)
  if @{{name.id}} > 0
    @{{name.id}} -= 1
    {{yield}}
  end
end

struct State
  def initialize(@boss_hp, @boss_dmg, @hp=50, @mana=500, @armor=0, @shield=0, @poison=0, @recharge=0)
    @spent_mana = 0
  end

  spell missile, 53 do
    @boss_hp -= 4
  end
  spell drain, 73 do
    @boss_hp -= 2
    @hp += 2
  end
  spell shield, 113 do
    apply shield, 6
  end
  spell poison, 173 do
    apply poison, 6
  end
  spell recharge, 229 do
    apply recharge, 5
  end

  def effects
    @armor = 0
    effect shield do
      @armor = 7
    end
    effect poison do
      @boss_hp -= 3
    end
    effect recharge do
      @mana += 101
    end
    true
  end

  def boss_turn
    @hp -= {@boss_dmg - @armor, 1}.max
    @hp > 0
  end

  def won
    @boss_hp <= 0
  end
  getter spent_mana

  def step
    effects
    return if won
    return unless yield
    return if won
    effects
    return if won
    return unless boss_turn
    true
  end
end

inp = inp.scan(/(\d+)/).map { |m| m[0].to_i }

stack = [State.new(inp[0], inp[1])]

min_spent = Int32::MAX


until stack.empty?
  state = stack.pop

  next if state.spent_mana > min_spent
  {% for spell in [:missile, :drain, :shield, :poison, :recharge] %}
    try = state.clone
    if try.step { try.{{spell.id}} }
      stack.push try
    elsif try.won
      min_spent = try.spent_mana
    end
  {% end %}
end

p min_spent
