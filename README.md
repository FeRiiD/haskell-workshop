# haskell-workshop
Haskell Workshop for use at the ESD Module in Informatics course at Fontys Venlo.
## Preparation
In order to be actively involved in our workshop we ask you to install the Glasgow Haskell Compiler (ghc) and preferably a [Haskell-aware text editor](https://wiki.haskell.org/Editors) in advance.
### Install ghc
The following sections describe the most common steps to install ghc on different platforms. If you need more assistance you can go to [the official Haskell site](https://www.haskell.org/platform/) or simply ask us directly.
#### Linux
In all major distributions ghc is included and can be installed using the native package manager.
For Debian based systems like Ubuntu or Mint this would be:
```
sudo apt-get install ghc
```
#### Windows
Download and install the [core package](https://haskell.org/platform/download/8.4.3/HaskellPlatform-8.4.3-core-x86_64-setup.exe). Afterwards you should be able to invoke ghc from command prompt:
```
C:\>ghc --version
The Glorious Glasgow Haskell Compilation System, version 8.4.3

```
#### MacOS
Download and install the [core package](https://haskell.org/platform/download/8.6.3/Haskell%20Platform%208.6.3%20Core%2064bit-signed.pkg).

### First Steps
This section describes how to create a simple "Hello World!" example to make sure you are ready to go. For convenience those steps are appropriate for any unix-like system, if you are using something inferior you will need to adjust the steps accordingly.
1.  Create a file named hello.hs containing the programm code:
    ```
    echo "hello=print(\"Hello ${USER}, thank you for your good preparation.\")" > hello.hs
    ```
2.  Open up the interactive complier:
    ```
    gchi
    ```
3.  Load the hello.hs file. (Tip: you can use autocompletion just as you do in your shell.)
    ```
    :l hello.hs
    ```
4.  Call the method by typing ```hello```. If you can see the message, get yourself some reward (grab a beer or something). We look forward to work with you.

### Some Nice Videos on Haskell

About Infinite datastructures:
https://www.youtube.com/watch?v=bnRNiE_OVWA
