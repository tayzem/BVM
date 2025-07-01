# BVM

Virtual machine software written in Batch

## Supported CPU

It currently only supports a basic custom CPU architecture.

## Adding new CPU architectures

To add a new CPU architecture, you need to create a new folder in the `cpu-archs` directory. Inside this folder, you should create a folder called the name of the CPU architecture. Inside this folder, you should create a file called `emulation.bat` that contains the emulation logic for the new architecture. You should also create a folder called `examples` that contains example programs for the new architecture.
Example directory structure:

```markdown
cpu-archs/
    bvm-cpu/
        emulation.bat
        examples/
            example1.bvm
            example2.bvm
```

## FAQ

### Why is this written in Batch?

I wanted to prove Batch can do a lot more than most people think.

### Why not use a more powerful language?

No.
