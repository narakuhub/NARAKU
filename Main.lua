-- MAIN LOADER NARAKU HUB
-- URL diperbaiki ke format RAW agar executor bisa membaca file.lua

local BaseURL = "https://raw.githubusercontent.com/narakuhub/NARAKU/refs/heads/main/UI/UI.lua"

-- Fungsi untuk meload file dari GitHub
local function LoadModule(name)
    local url = BaseURL .. name .. ".lua"
    local success, content = pcall(function()
        return game:HttpGet(url)
    end)
    
    if success and content then
        -- Cek apakah konten yang didapat adalah error 404 (bukan kode lua)
        if content:find("404: Not Found") or content:find("<!DOCTYPE html>") then
            warn("NARAKU: File tidak ditemukan atau link salah: " .. url)
            return nil
        end
        
        local func, err = loadstring(content)
        if func then
            return func()
        else
            warn("NARAKU: Gagal mengompilasi modul " .. name .. ": " .. tostring(err))
            return nil
        end
    else
        warn("NARAKU: Gagal mengakses URL: " .. url)
        return nil
    end
end

-- Load semua modul
local UI_Elements = LoadModule("UI")
local MainPanel = LoadModule("Mainpanel")

-- Inisialisasi Sistem
if UI_Elements and MainPanel then
    MainPanel.Init(UI_Elements)
    print("NARAKU HUB: System Loaded Successfully!")
else
    warn("NARAKU HUB: Terjadi kesalahan saat inisialisasi modul.")
end
