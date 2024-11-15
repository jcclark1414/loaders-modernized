-- 5 Dim New Transport
utils = require("__loaders-modernized__.scripts.utils")

if not mods["5dim_transport"] then
  return false
end

data:extend({
  {
    type = "item-subgroup",
    name = "transport-loader-mdrn",
    group = "transport",
    order = "jc"
  }
})

---@type table<string, LMLoaderTemplate>
local loader_templates = {
  ["01"] = {
    name = "mdrn-loader-01",
    underground_name = "underground-belt",
    group = "transport",
    subgroup = "transport-loader-mdrn",
    next_upgrade = "mdrn-loader-02",
    tint = util.color("ffc502d1"),
    unlocked_by = "logistics",
    recipe_data = {
      ingredients = {
        standard = {
          { type = "item", name = "inserter",           amount = 5 },
          { type = "item", name = "electronic-circuit", amount = 5 },
          { type = "item", name = "iron-gear-wheel",    amount = 5 },
          { type = "item", name = "iron-plate",         amount = 5 },
          { type = "item", name = "transport-belt",     amount = 5 }
        },
      }
    }
  },
  ["02"] = {
    name = "mdrn-loader-02",
    underground_name = "fast-underground-belt",
    group = "transport",
    subgroup = "transport-loader-mdrn",
    next_upgrade = "mdrn-loader-03",
    tint = util.color("f91c0bd1"),
    unlocked_by = "logistics-2",
    recipe_data = {
      ingredients = {
        standard = {
          {type = "item", name = "fast-transport-belt", amount = 5},
          {type = "item", name = "mdrn-loader-01", amount = 1},
        },
      }
    }
  },
  ["03"] = {
    name = "mdrn-loader-03",
    underground_name = "express-underground-belt",
    group = "transport",
    subgroup = "transport-loader-mdrn",
    next_upgrade = "mdrn-loader-04",
    tint = util.color("06c2f6d1"),
    unlocked_by = "logistics-3",
    recipe_data = {
      ingredients = {
        standard = {
          {type = "item", name = "express-transport-belt", amount = 5},
          {type = "item", name = "mdrn-loader-02", amount = 1},
        },
      }
    }
  },
  ["04"] = {
    name = "mdrn-loader-04",
    underground_name = "5d-underground-belt-04",
    group = "transport",
    subgroup = "transport-loader-mdrn",
    next_upgrade = "mdrn-loader-05",
    tint = util.color("fe9ef5d1"),
    unlocked_by = "logistics-4",
    recipe_data = {
      ingredients = {
        standard = {
          {type = "item", name = "5d-transport-belt-04", amount = 5},
          {type = "item", name = "mdrn-loader-03", amount = 1},
        },
      }
    }
  },
  ["05"] = {
    name = "mdrn-loader-05",
    underground_name = "5d-underground-belt-05",
    group = "transport",
    subgroup = "transport-loader-mdrn",
    next_upgrade = "mdrn-loader-06",
    tint = util.color("33bd2bd1"),
    unlocked_by = "logistics-5",
    recipe_data = {
      ingredients = {
        standard = {
          {type = "item", name = "5d-transport-belt-05", amount = 5},
          {type = "item", name = "mdrn-loader-04", amount = 1},
        },
      }
    }
  },
  ["06"] = {
    name = "mdrn-loader-06",
    underground_name = "5d-underground-belt-06",
    group = "transport",
    subgroup = "transport-loader-mdrn",
    next_upgrade = "mdrn-loader-07",
    tint = util.color("906242d1"),
    unlocked_by = "logistics-6",
    recipe_data = {
      ingredients = {
        standard = {
          {type = "item", name = "5d-transport-belt-06", amount = 5},
          {type = "item", name = "mdrn-loader-05", amount = 1},
        },
      }
    }
  },
  ["07"] = {
    name = "mdrn-loader-07",
    underground_name = "5d-underground-belt-07",
    group = "transport",
    subgroup = "transport-loader-mdrn",
    next_upgrade = "mdrn-loader-08",
    tint = util.color("743e9bd1"),
    unlocked_by = "logistics-7",
    recipe_data = {
      ingredients = {
        standard = {
          {type = "item", name = "5d-transport-belt-07", amount = 5},
          {type = "item", name = "mdrn-loader-06", amount = 1},
        },
      }
    }
  },
  ["08"] = {
    name = "mdrn-loader-08",
    underground_name = "5d-underground-belt-08",
    group = "transport",
    subgroup = "transport-loader-mdrn",
    next_upgrade = "mdrn-loader-09",
    tint = util.color("dddddcd1"),
    unlocked_by = "logistics-8",
    recipe_data = {
      ingredients = {
        standard = {
          {type = "item", name = "5d-transport-belt-08", amount = 5},
          {type = "item", name = "mdrn-loader-07", amount = 1},
        },
      }
    }
  },
  ["09"] = {
    name = "mdrn-loader-09",
    underground_name = "5d-underground-belt-09",
    group = "transport",
    subgroup = "transport-loader-mdrn",
    next_upgrade = "mdrn-loader-10",
    tint = util.color("f47f16d1"),
    unlocked_by = "logistics-9",
    recipe_data = {
      ingredients = {
        standard = {
          {type = "item", name = "5d-transport-belt-09", amount = 5},
          {type = "item", name = "mdrn-loader-08", amount = 1},
        },
      }
    }
  },
  ["10"] = {
    name = "mdrn-loader-10",
    underground_name = "5d-underground-belt-10",
    group = "transport",
    subgroup = "transport-loader-mdrn",
    tint = util.color("6d6dffd1"),
    unlocked_by = "logistics-10",
    recipe_data = {
      ingredients = {
        standard = {
          {type = "item", name = "5d-transport-belt-10", amount = 5},
          {type = "item", name = "mdrn-loader-09", amount = 1},
        },
      }
    }
  },
}

if settings.startup["mdrn-keep-5d-loaders"].value ~= "all" then
  for tier, loader in pairs(loader_templates) do
    local name = "5d-loader-1x1-" .. tier
    data.raw["loader-1x1"][name] = nil
    data.raw["recipe"][name] = nil
    data.raw["item"][name] = nil
    local effects = data.raw["technology"][loader.unlocked_by].effects
    utils.remove_recipe_from_effects(effects, name)
  end
  -- 5Dim Transport erroneously unlocks 5d-loader-1x1-03 in logistics-2.  It should be logistics-3
  utils.remove_recipe_from_effects(data.raw["technology"]["logistics-2"].effects, "5d-loader-1x1-03")
end

-- 5Dim's loaders are messy.  Remove the higher tier loaders here.
-- The base tier 1x2 loaders use the base game names, and 5 Dim moves them around in
-- data_final_fixes.  We have to wait to remove them until then.
if settings.startup["mdrn-keep-5d-loaders"].value == "none" then
  for tier, loader in pairs(loader_templates) do
    local name = "5d-loader-" .. tier
    data.raw["loader"][name] = nil
    data.raw["recipe"][name] = nil
    data.raw["item"][name] = nil
    local effects = data.raw["technology"][loader.unlocked_by].effects
    utils.remove_recipe_from_effects(effects, name)
  end
end

return loader_templates
