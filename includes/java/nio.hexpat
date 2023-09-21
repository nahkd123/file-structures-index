namespace Java {
    // All integers in Java DataInput/DataOutput are in big endian.
    using byte = be s8;
    using short = be s16;
    using int = be s32;
    using long = be s64;

    struct String {
        short length;
        char value[length];
    };
}