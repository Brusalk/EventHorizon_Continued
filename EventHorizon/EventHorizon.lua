local _, ns = ...
EH = ns
ns.watch_leaked_globals()

local Test = ns.NewClass("Test")

function Test:initialize()
  self:debug("initialize")
  return "test", nil, "me", false, "now"
end

local TestChild = ns.NewClass("TestChild", Test)

function TestChild:initialize()
  self:debug("initialize child")
  return super()
end

function TestChild:testing()
  self:debug("testing child")
  super()
end

local TestChildChild = ns.NewClass("TestChildChild", TestChild)

function TestChildChild:initialize()
  self:debug("initialize child child")
  self:debug("ret value", super())
end

function TestChildChild:testing()
  self:debug("testing child child")
  super()
end

local t = TestChildChild:new()
t:testing()

-- local Test = ns.NewClass("Test")

-- function Test:__class_method()
--   self:debug("__class_method")
-- end

-- function Test:instance_method()
--   self:debug("instance_method")
-- end

-- function Test:initialize(arg1)
--   self:debug("initialize", arg1)
--   self.arg1 = arg1
-- end

-- ns.Object:debug("Test:", Test)
-- local test = Test:new("testing")
-- Test:__class_method()
-- test:instance_method()
-- test.class:__class_method()

-- for i,v in pairs(Test.__instances) do
--   v:debug(i, v)
-- end

-- ns.Object:assert(test.arg1 == 'testing', function() return "Expected arg1 to equal 'testing'. Got " .. tostring(test.arg1) end)

-- local TestChild = ns.NewClass("TestChild", Test)

-- local blah = "testing_child"
-- function TestChild:initialize()
--   self:debug("initialize", super)
--   super(blah)
-- end

-- local test_child = TestChild:new()
-- TestChild:__class_method()
-- test_child:instance_method()
-- test_child.class:__class_method()

-- ns.Object:assert(test_child.arg1 == 'testing_child', function() return "Expected arg1 to equal 'testing_child'. Got " .. tostring(test_child.arg1) end)
