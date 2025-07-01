# BVM

Virtual machine software written in Batch

## Supported CPU

It currently only supports a basic custom CPU architecture.

## Adding new CPU architectures

To add a new CPU architecture, follow these steps:

* See [CONTRIBUTING.md](./CONTRIBUTING.md)
* Create a folder inside of `/cpu-archs/` with the name of the CPU architecture
* Follow the example directory structure:

```markdown
/cpu-archs/
    <cpu name>/
        emulation.bat
        examples/
            example1.bvm
            <other examples are optional>
```

## FAQ

### Why is this written in Batch?

I wanted to prove Batch can do a lot more than most people think.

### Why not use a more powerful language?

No.
