--[[
		             _                                  
	              (`  ).                   _           
	             (     ).              .:(`  )`.       
	)           _(       '`.          :(   .    )      
	        .=(`(      .   )     .--  `.  (    ) )      
	       ((    (..__.:'-'   .+(   )   ` _`  ) )                 
	`.     `(       ) )       (   .  )     (   )  ._   
	  )      ` __.:'   )     (   (   ))     `-'.-(`  ) 
	)  )  ( )       --'       `- __.'         :(      )) 
	.-'  (_.'          .')                    `(    )  ))
	                  (_  )                     ` __.:'          
	                                        
	--..,___.--,--'`,---..-.--+--.,,-,,..._.--..-._.-a:f--.

	Horizön
	3DS <-> PC Löve Bridge
	v1.0
--]]

--SYSTEM CHECK
if love.system.getOS() == "Horizon" then
	return
end

local _VERSION = 1.0

local path = ...

Enum = require(path .. ".enum")
CONFIG = require(path .. ".config")

require(path .. ".input")
require(path .. ".render")
require(path .. ".system")

love.window.setMode(400, 480, {vsync = true})
love.window.setTitle("NINTENDO 3DS :: " .. love.filesystem.getIdentity():upper())

if CONFIG.BOOT then
	require(path .. ".boot")
end

require(path .. ".objects")