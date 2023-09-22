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
    - `u8[metadataLength] => minecraft::nbt metadata`: [Metadata](#minecraftnbt-metadata-tree) content in Minecraft NBT format.
- Preview Image
    - `be u32 previewImgLength`: Length for preview image section.
    - `u8[previewImgLength] => image::png previewImg`: Blueprint preview PNG image.
- Structure Data
    - `be u32 structureLength`: Length for structure data section.
    - `u8[structureLength] => compress::gzip => minecraft::nbt structure`: [Structure data](#minecraftnbt-structure-tree). The data itself is gzipped.

### `minecraft::nbt`: `metadata` tree
- `compound`
    - `long Version`: Version of the blueprint. Currently `0`.
    - `string Author`: Author of this blueprint.
    - `int BlockCount`: Number of blocks in this blueprint. (used for indexing?).
    - `byte LockedThumbnail`
    - `string Name`: Name of blueprint.
    - `string[] Tags`: List of tags for this blueprint.
    - `float ThumbnailPitch`: Thumbnail pitch angle. Can be used to reconstruct thumbnail.
    - `float ThumbnailYaw`: Thumbnail yaw angle. Can be used to reconstruct thumbnail.

### `minecraft::nbt`: `structure` tree
- `compound`
    - `compound[] BlockRegion`
        - `compound BlockStates`
            - `long[] data`: (list length appears to be always 256). **Guess:** Each entry is a sequence of 16 blocks (`long` integers are 8 bytes in size), where each block is a 4-bit integer that points to a block state in palette. That means this could hold 4096 blocks, or an entire cubic chunk (16x16x16 blocks).
            - `compound[] palette`: A list of block states in a form of palette.
                - `string Name`: Namespaced IDs (eg: `minecraft:diamond_block` or `my_mod:tiny_potato`).
                - `//`: It is likely that each entry in `palette` is a block state, so there could be something else other than `Name`, like `Rotation` for example.
        - `int X`: Cubic chunk position. Multiply this by 16 and you'll get position in blueprint.
        - `int Y`: Cubic chunk position.
        - `int Z`: Cubic chunk position.