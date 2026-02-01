return {
    id = "1_arc_build",
    -- shader = "Shader Graphs/buildGlowShader",
    -- keywords = { "_EMISSION" },
    -- renderQueue = 4001,
    -- properties = {
    --     _Min = 1.3,
    --     _QueueControl = 1,
    --     _QueueOffset = -1,
    --     Color_4e6c69b0723b433ba7b2ddf9d9e887ce = { 0.5, 1, 1, 1 },
    --     Vector1_2edd504c70304e2f9eefa2291bb5775e = 0.5,
    --     Vector1_57479a3bbb204dd4b4d1285d181e9aff = 0.5,
    --     Vector1_b5d790f10c0541db948b46eaf179cc84 = 0.018,
    --     Vector1_f39efe0a5f1e4f228c03e1f79e29c522 = 10,
    -- },

    shader = "Shader Graphs/shieldShader",
    keywords = { "_EMISSION" },
    properties = {
        _QueueControl = 0,
        _QueueOffset = 0,
        Color_4e6c69b0723b433ba7b2ddf9d9e887ce = { 1, 1, 1, 0 },
        Vector1_57479a3bbb204dd4b4d1285d181e9aff = 0.005,
        Vector1_625f6af73f0c44b193c89e9923953e4e = 0.5,
        Vector1_bbd52e2809834c3faafdb261d1a58c6a = 1,
        Vector1_f39efe0a5f1e4f228c03e1f79e29c522 = 100000,
    },
}