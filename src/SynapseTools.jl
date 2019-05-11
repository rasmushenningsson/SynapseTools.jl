module SynapseTools

using Pkg

if !haskey(Pkg.installed(),"DISSEQT")
    warn("Module DISSEQT not installed. Please refer to SynapseTools installation instructions at https://github.com/rasmushenningsson/SynapseTools.jl")
elseif !haskey(Pkg.installed(),"SynapseClient")
    warn("Module SynapseClient not installed. Please refer to SynapseTools installation instructions at https://github.com/rasmushenningsson/SynapseTools.jl")
else

    synapseInstalled = try
        dummy = pyimport("synapseclient")
        true
    catch e
        @warn "Please install the pyton package \"synapseclient\"."
        false
    end

    if synapseInstalled
        using SynapseClient
        using DISSEQT

        import SynapseClient: AbstractEntity, Entity, File, Folder, Project, Activity


        export
            retrystore,
            getchildbyname,
            childpath,
            createchildfolder,
            uploadiflocal,
            listfiles,
            localpath,
            UploadList,
            markforupload!,
            uploadfiles,
            listaligned,
            referencefromlog,
            wrongreferencefromlog,
            getreferencegenomes,
            metadatatemplate,
            filtermetadata,
            getsamplemetadata,
            appendsynapseids!,
            appendswarmids!,
            appendalignedids!,
            downloadbymeta!,
            downloadswarms!,
            downloadconsensuses!,
            downloadbams!,
            downloadbais!,
            downloadaligned!,
            getsamplefitness,
            appendfitness!


        include("pattern.jl")
        include("paths.jl")
        include("samples.jl")
        include("referencegenomes.jl")
        include("metadata.jl")
        include("fitness.jl")
    end
end

end