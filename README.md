# nahkd's File structures index
## Index
- Minecraft Schematics
    - Axiom Blueprint: [v1](includes/mc-schematic/axiom-blueprint-v1/index.md)

> Read further to learn how to install ImHex patterns and read my Markdown docs.

## Install
### ImHex
0. Clone this repository: `git clone https://github.com/nahkd123/file-structures-index.git`
0. Add path to `file-structures-index` repository to ImHex: `Extras > Settings > Folders > Add new folder` then put the path to repository.
0. Enjoy!

## Syntax in Markdown
### General
- `@<address>`: Jump to specified address
    - Eg: `@0x00`, `@addressField`

### Data types
- `uN`: Unsigned N-bit integer
- `sN`: Signed N-bit integer
- `namespace::type`: Namespaced type reference
- `unknown`: Need to be documented
    - No more field declarations after this type

### Endianness
- `le`: Little endian (default endianness for all types)
- `be`: Big endian

### Conversion
- `typeA => typeB`: Convert from `typeA` to `typeB` (assuming you can convert it)
    - Eg: `u8[256] sector => bios::boot_sector`
    - Mainly used to give information on how to skip the section if you don't need it

## License
All contents in this repository are licensed under CC0 1.0. See [LICENSE](./LICENSE) for more info.