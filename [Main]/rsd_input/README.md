### 🛠 Requirements


### ✅ Main Features

  - Trigger an value input & choices input standalone
  - Change color, shape and layout (if you know CSS)
  - Fully optimized
  - Application tutorial in the readme

### 🔧 Download & Installation

1. Download the latest version from your [keymaster]
2. Unzip the package and rename the file you want in [rsd_input]
    - Make sure to rename the folder with the right name !
3. Ensure the resource in your resources files like this > ensure [rsd_input]
4. Configure what you want in the [Config.lua] file
5. Start the resource and it's ready.

### 🔧 TYPE

```lua
--INPUT

title = "How many ?"
placeholder = "0"
textsubmit = "Confirm"

--CLIENT SIDE
TriggerEvent("rsd_input:Input", title, placeholder, textsubmit, function(cb)
    print(cb)
end)

--INPUT CHOICE

title = "Do you want?"
choice = {{"Yes"}, {"No"}, {"Maybe"}} -- You can put as many choices as you like 

--CLIENT SIDE
TriggerEvent("rsd_input:InputChoice", title, choice, function(cb)
    print(cb)
end)

```

### 📈 INFO.

Requirements  | 
Support	      | [Discord](https://discord.gg/UsjAnRv48u)
Store	        | [Tebex](https://script.redstartrp.fr/)
Version	      | [1.0]


### © COPYRIGHT.

Powered & Copyrighted by [©StitProd]
©REDSTART
©RS DEVELOPMENT
©RS DEV