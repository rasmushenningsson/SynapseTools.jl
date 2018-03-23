module SynapseTools

Pkg.installed("DISSEQT")==nothing && warn("Module DISSEQT not installed. Please refer to SynapseTools installation instructions at https://github.com/rasmushenningsson/SynapseTools.jl")
Pkg.installed("SynapseClient")==nothing && warn("Module SynapseClient not installed. Please refer to SynapseTools installation instructions at https://github.com/rasmushenningsson/SynapseTools.jl")

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