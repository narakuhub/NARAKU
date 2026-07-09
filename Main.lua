-- MAIN LOADER NARAKU HUB
-- Jalankan script ini di executor Anda

local BaseURL = "https://github.com/narakuhub/NARAKU/tree/main/UI"

-- Fungsi untuk meload file dari GitHub
local function LoadModule(name)
    local success, content = pcall(function()
        return game:HttpGet(BaseURL .. name .. ".lua")
    end)
    
    if success and content then
        local module = loadstring(content)()
        return module
    else
        warn("NARAKU Gagal meload modul: " .. name)
        return nil
    end
end

-- Load semua modul
local UI_Elements = LoadModule("UI")
local MainPanel = LoadModule("Mainpanel")
-- local Toggle = LoadModule("Toggle")
-- local Button = LoadModule("Button")

-- Inisialisasi Sistem
if UI_Elements and MainPanel then
    MainPanel.Init(UI_Elements)
    
    -- Jika sudah ada modul Toggle/Button, tambahkan di bawah:
    -- if Toggle then Toggle.Init(UI_Elements) end
    -- if Button then Button.Init(UI_Elements) end
    
    print("NARAKU HUB: System Loaded Successfully!")
else
    warn("NARAKU HUB: Terjadi kesalahan saat inisialisasi.")
end
