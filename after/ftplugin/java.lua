local on_attach = require('setup.lsp_onattach')

local config = {
	cmd = { '/home/maciej/.config/nvim/packages/jdtls/bin/jdtls' },
	root_dir = vim.fs.dirname(vim.fs.find({ 'gradlew', '.git', 'mvnw' }, { upward = true })[1]),
	settings = {
		java = {
			format = {
				enabled = true,
				insertSpaces = true,
			},
		}
	},
	on_attach = on_attach,
}
require('jdtls').start_or_attach(config)



local cmd = 'javac "%"; java "%"'
local head = vim.fn.expand("%:h")

local function exec_java(term)
	term = term or false
	local pom = vim.fn.filereadable("./pom.xml")
	local makefile = vim.fn.filereadable("./Makefile")
	if pom == 1 then
		if term==false then
			vim.cmd("!mvnd exec:exec")
		else
			vim.cmd("term mvnd exec:exec")
		end
	else
		if makefile == 1 then
			vim.cmd("!make test")
		else
			if term==false then
				vim.cmd("!" .. cmd)
			else
				vim.cmd("term " .. cmd)
			end
			vim.print("no pom.xml or makefile")
		end
	end
end

-- build with mvn if pom exists
-- pamiętaj aby dodać rzeczy dot Mojohaus i wtyczki exec
-- na dole przykład
vim.keymap.set({ 'n', 'i', 'v' }, '<F5>',
	function()
		vim.cmd("write")
		exec_java()
	end,
	{ buffer = 0 }
)

--save, run script, open in new terminal in split window
vim.keymap.set({ 'n', 'i', 'v' }, '<F6>',
	function()
		vim.cmd("write")
		exec_java(true)
	end
)


-- <plugins>
--       <plugin>
--         <groupId>org.codehaus.mojo</groupId>
--         <artifactId>exec-maven-plugin</artifactId>
--         <version>3.6.3</version>
--         <executions>
--           <execution>
--             <goals>
--               <goal>exec</goal>
--             </goals>
--           </execution>
--         </executions>
--         <configuration>
--           <executable>java</executable>
--           <arguments>
--             <argument>-classpath</argument>
--             <classpath />
--             <argument>org.glinski.Main</argument>
--           </arguments>
--           <environmentVariables>
--             <LANG>pl_PL</LANG>
--           </environmentVariables>
--         </configuration>
--       </plugin>
--     </plugins>
