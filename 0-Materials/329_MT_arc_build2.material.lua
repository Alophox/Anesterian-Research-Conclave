return {
    id = "329_MT_arc_2_build",
    -- shader = "Shader Graphs/buildGlowShader",
    -- keywords = { "_EMISSION" },
    -- renderQueue = 4001,
    -- properties = {
    --     _Min = 1.3,
    --     _QueueControl = 1,
    --     _QueueOffset = -1,
    --     Color_4e6c69b0723b433ba7b2ddf9d9e887ce = { 0.5, 1, 1, 1 },
    --     Vector1_2edd504c70304e2f9eefa2291bb5775e = 0.5,
    --     Vector1_57479a3bbb204dd4b4d1285d181e9aff = -0.5,
    --     Vector1_b5d790f10c0541db948b46eaf179cc84 = 0.018,
    --     Vector1_f39efe0a5f1e4f228c03e1f79e29c522 = 10,
    -- },


    shader = "Shader Graphs/buildGlowShader",
    keywords = { "_EMISSION" },
    renderQueue = 3001,
    properties = {
        _Min = 1.3,
        _QueueControl = 10,
        _QueueOffset = -1,
        Color_4e6c69b0723b433ba7b2ddf9d9e887ce = { 0.75, 1, 1, 1 },
        Vector1_2edd504c70304e2f9eefa2291bb5775e = 0.5, --.5
        Vector1_57479a3bbb204dd4b4d1285d181e9aff = .9, --.15
        Vector1_b5d790f10c0541db948b46eaf179cc84 = 0.008, --.008
        Vector1_f39efe0a5f1e4f228c03e1f79e29c522 = 0, --10
    },
}