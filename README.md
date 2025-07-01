# BVM (Batch Virtual Machine)

Virtual machine software written in Batch

## Adding new CPU architectures

To add a new CPU architecture, follow these steps:

* See [CONTRIBUTING.md](./CONTRIBUTING.md)
* Create a folder inside of `/cpu-archs/` with the name of the CPU architecture
* Follow the example directory structure:

```plaintext
/cpu-archs/
    <cpu name>/
        emulation.bat
        examples/
            example1.bvm
            <other examples are optional>
```

## Usage

You must clone the repository:

```batch
git clone https://github.com/benja2998/BVM.git
cd BVM
```

You should then choose a CPU architecture. For example to use bvm-cpu:

```batch
cd cpu-archs
cd bvm-cpu
.\emulation.bat
```

## FAQ

### Why is this written in Batch?

I wanted to prove Batch can do a lot more than most people think.

### Why not use a more powerful language?

No.
