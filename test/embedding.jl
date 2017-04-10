# test that the embedding example runs without error
let
    if is_windows()
        embedding_bin = joinpath(JULIA_HOME,Base.LIBEXECDIR,"embedding.exe")
    else
        embedding_bin = joinpath(JULIA_HOME,Base.LIBEXECDIR,"embedding")
    end
    lines = readlines(pipeline(`$(embedding_bin)`,
                               stderr=DevNull))
    @test length(lines) == (is_windows() ? 6 : 5)
    @test parse(Float64, lines[1]) ≈ sqrt(2)
end
