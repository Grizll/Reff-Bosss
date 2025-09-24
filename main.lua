-- Fungsi untuk menjalankan loadstring dengan error handling
local function executeLoadstring(url, name)
    local success, error = pcall(function()
        loadstring(game:HttpGet(url, true))()
    end)
    
    if not success then
        warn("Gagal menjalankan " .. name .. ": " .. error)
    else
        print("Berhasil menjalankan " .. name)
    end
end

-- Menjalankan kedua loadstring
executeLoadstring("https://raw.githubusercontent.com/noirexe/TestEsceh/refs/heads/main/Fearless.lua", "Fearless Menus")
executeLoadstring("https://raw.githubusercontent.com/noirexe/TestEsceh/refs/heads/main/mainmap926.lua", "MainMap Script")
