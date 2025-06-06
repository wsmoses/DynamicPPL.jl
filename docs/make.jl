using Documenter
using DynamicPPL
using DynamicPPL: AbstractPPL
# NOTE: This is necessary to ensure that if we print something from
# Distributions.jl in a doctest, then the shown value will not include
# a qualifier; that is, we don't want `Distributions.Normal{Float64}`
# but rather `Normal{Float64}`. The latter is what will then be printed
# in the doctest as run in `test/runtests.jl`, and so we need to stay
# consistent with that.
using Distributions
using DocumenterMermaid
# load MCMCChains package extension to make `predict` available
using MCMCChains

# Doctest setup
DocMeta.setdocmeta!(
    DynamicPPL, :DocTestSetup, :(using DynamicPPL, MCMCChains); recursive=true
)

makedocs(;
    sitename="DynamicPPL",
    # The API index.html page is fairly large, and violates the default HTML page size
    # threshold of 200KiB, so we double that.
    format=Documenter.HTML(; size_threshold=2^10 * 400),
    modules=[DynamicPPL, Base.get_extension(DynamicPPL, :DynamicPPLMCMCChainsExt)],
    pages=[
        "Home" => "index.md",
        "API" => "api.md",
        "Internals" => ["internals/varinfo.md", "internals/submodel_condition.md"],
    ],
    checkdocs=:exports,
    doctest=false,
)
