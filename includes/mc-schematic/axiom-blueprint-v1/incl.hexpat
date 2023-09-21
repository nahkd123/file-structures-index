// Axiom Blueprint (version 1)
namespace mc_schematic::axiom_blueprint_v1 {
    struct raw_section {
        be u32 length;
        char content[length];
    };

    struct main {
        be u32 magic [[name("Magic number"), comment("I couldn't tell the structure of it but it's present on all blueprints that I've found so far...")]];
        raw_section metadata [[name("Metadata"), comment("Blueprint metadata in Minecraft Compound NBT.")]];
        raw_section previewImage [[name("Preview PNG image"), comment("Preview image of the structure in PNG format.")]];
        raw_section gzipStructure [[name("Gzipped structure data"), comment("Gzipped structure data.")]];
    };
}