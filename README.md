# BVM (Batch Virtual Machine)

Virtual machine software written in Batch

## Adding new CPU architectures

To add a new CPU architecture, follow these steps:

* See [CONTRIBUTING.md](./CONTRIBUTING.md)
* Create a folder inside of `/src/cpu-archs/` with the name of the CPU architecture
* Follow the example directory structure for the directories inside `/src/cpu-archs`:

```plaintext
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

You should then run src/bvm.bat:

```batch
cd src
bvm.bat
```

On Unix-like systems, you can run the script with:

```bash
cd src
wine cmd /c bvm.bat # Assuming you have Wine installed
# Not guaranteed to work, very likely to fail!
# Report any issues with compatibility of the Batch file to WineHQ, NOT us!
```

## FAQ

### Why is this written in Batch?

I wanted to prove Batch can do a lot more than most people think.

### Why not use a more powerful language?

No.
