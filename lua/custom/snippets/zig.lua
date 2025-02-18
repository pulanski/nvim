local ls = require 'luasnip'
local s = ls.snippet
local sn = ls.snippet_node
local t = ls.text_node
local i = ls.insert_node
local c = ls.choice_node

return {

  ----------------------
  -- Basic Constructs --
  ----------------------

  -- Function
  s('fn', {
    t 'fn ',
    i(1, 'functionName'),
    t '(',
    i(2, 'args'),
    t ') ',
    c(3, {
      t 'void',
      i(nil, 'ReturnType'),
    }),
    t ' {',
    t { '', '\t' },
    i(0),
    t { '', '}' },
  }),

  -- Public Function
  s('pubfn', {
    t 'pub fn ',
    i(1, 'functionName'),
    t '(',
    i(2, 'args'),
    t ') ',
    c(3, {
      t 'void',
      i(nil, 'ReturnType'),
    }),
    t ' {',
    t { '', '\t' },
    i(0),
    t { '', '}' },
  }),

  -- Struct
  s('struc', {
    t { 'const ' },
    i(1, ''),
    t { ' = struct {', '\t' },
    i(2, ''),
    t { '', '};' },
  }),

  -- If/Else
  s('if', {
    t 'if ',
    i(1, 'cond'),
    t ' {',
    t { '', '\t' },
    i(2),
    t { '', '}' },
    c(3, {
      t '', -- No else-part
      sn(nil, { t ' else {', t { '', '\t' }, i(1), t { '', '}' } }),
    }),
  }),

  -- For loop
  s('for', {
    t 'for (',
    i(1, 'items'),
    t ') |',
    i(2, 'captures'),
    t '| {',
    t { '', '\t' },
    i(0),
    t { '', '}' },
  }),

  -- Test block
  s('test', {
    t 'test "',
    i(1, 'description'),
    t { '" {', '\t' },
    t 'try ',
    i(2, 'expr'),
    t { '', '}' },
  }),

  -- Comptime block
  s('comptime', {
    t 'comptime ',
    i(1, 'ident'),
    t ' {',
    t { '', '\t' },
    i(0),
    t { '', '}' },
  }),

  -- Error handling
  s('try', {
    t 'try ',
    i(1, 'expression'),
  }),

  -- Switch
  s('switch', {
    t 'switch (',
    i(1, 'expr'),
    t ') {',
    t { '', '\t' },
    t 'else => {}',
    t { '', '}' },
  }),

  --------------
  -- Patterns --
  --------------

  -- Builder Pattern
  -- TODO: this can be improved drastically
  s('builder', {
    t 'const ',
    i(1, 'Item'),
    t 'Builder = struct {',
    t { '', '\t// Private fields' },
    t { '', '\t' },
    i(2, 'field: Type,'),
    t { '', '' },
    t { '\tpub fn new() Builder {', '\t\treturn Builder{' },
    t { '', '\t\t\t' },
    i(3, 'field: defaultValue'),
    t { '', '\t\t};' },
    t { '', '\t}' },
    t { '', '' },
    t { '\tpub fn setField(self: *Builder, value: Type) *Builder {', '\t\tself.field = value;', '\t\treturn self;', '\t}' },
    t { '', '' },
    t { '\tpub fn build(self: Builder) ReturnType {', '\t\t// Validate and return final value', '\t\treturn ???;', '\t}' },
    t { '', '};' },
  }),

  -- Strategy Pattern
  -- TODO: this is a WIP
  s('strategy', {
    t 'const ConcreteStrategyA = struct {',
    t { '', '\tpub fn execute(self: ConcreteStrategyA, data: anytype) void {' },
    t { '\t\t// implementation A' },
    t { '\t\t_ = self;' },
    t { '\t\t_ = std.debug.print("{any}", .{data});' },
    t { '\t}' },
    t { '', '};', '' },
    t { '', '\tpub fn execute(self: ConcreteStrategyA, data: anytype) void {' },
    t { '\t\t// implementation A' },
    t { '\t\t_ = self;' },
    t { '\t\t_ = std.debug.print("{any}", .{data});' },
    t { '\t}' },
    t { '', '};', '' },
    t 'const Strategy = union(enum) {',
    -- t { '', '\texecute: fn(self: Strategy, data: anytype) !void {' },
    -- t { '', '\t\tswitch (self) {' },
    -- t { '', '\t\t\tinline else => |impl| return impl.execute(data);' },
    t { '', '\t};' },
    t 'const Context = struct {',
    t { '', '\tstrategy: Strategy,' },
    t { '', '\tpub fn executeStrategy(self: *Context, data: any) void {', '\t\tself.strategy.execute(data);', '\t}' },
    t { '', '};' },
  }),

  -- // TODO: should look like this
  -- const ConcreteStrategyA = struct {
  --     pub fn execute(self: ConcreteStrategyA, data: anytype) void {
  --         // implementation B
  --         _ = self;
  --         std.debug.print("{any}", .{data});
  --     }
  -- };
  --
  -- const ConcreteStrategyB = struct {
  --     pub fn execute(self: ConcreteStrategyB, data: anytype) void {
  --         // implementation B
  --         _ = self;
  --         std.debug.print("{any}", .{data});
  --     }
  -- };
  --
  -- const Strategy = union(enum) {
  --     ConcreteStrategyA: ConcreteStrategyA,
  --     ConcreteStrategyB: ConcreteStrategyB,
  --
  --     fn execute(self: Strategy, data: anytype) !void {
  --         switch (self) {
  --             inline else => |impl| return impl.execute(data),
  --         }
  --     }
  -- };
  --
  -- const Context = struct {
  --     strategy: Strategy,
  --     pub fn executeStrategy(self: *Context, data: any) void {
  --         self.strategy.execute(data);
  --     }
  -- };
}
