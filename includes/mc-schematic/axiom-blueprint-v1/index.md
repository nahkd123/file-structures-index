# Axiom Blueprint (version 1)
## ImHex include
```hexpat
// Use pattern for entire file
#include <mc-schematic/axiom-blueprint-v1.hexpat>

// Use pattern for part of your file
#include <mc-schematic/axiom-blueprint-v1/incl.hexpat>
mc_schematic::axiom_blueprint_v1::main file @ 0x00;
```

## Structure
- `u8[4] = {0x0A, 0xE5, 0xBB, 0x36}`: Magic number. Is it being used to identify blueprint version?
- Metadata
    - `be u32 metadataLength`: Length for metadata section.
    - `u8[metadataLength] => minecraft::nbt metadata`: Metadata content in Minecraft NBT format.
- Preview Image
    - `be u32 previewImgLength`: Length for preview image section.
    - `u8[previewImgLength] => image::png previewImg`: Blueprint preview PNG image.
- Structure Data
    - `be u32 structureLength`: Length for structure data section.
    - `u8[structureLength] => compress::gzip => unknown structure`: Structure data. The data itself is gzipped.